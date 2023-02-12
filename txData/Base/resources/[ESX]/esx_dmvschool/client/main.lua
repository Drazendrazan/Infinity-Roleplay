local CurrentAction                  = nil
local CurrentActionMsg               = nil
local CurrentActionData              = nil
local Licenses                       = {}
local CurrentTest                    = nil
local CurrentTestType                = nil
local CurrentVehicle                 = nil
local CurrentCheckPoint, DriveErrors = 0, 0
local LastCheckPoint                 = -1
local CurrentBlip                    = nil
local CurrentZoneType                = nil
local IsAboveSpeedLimit              = false
local LastVehicleHealth              = nil

function DrawMissionText(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, true)
end

function StartTheoryTest()
	CurrentTest = 'theory'

	SendNUIMessage({
		openQuestion = true
	})

	ESX.SetTimeout(200, function()
		SetNuiFocus(true, true)
	end)


end

function StopTheoryTest(success)
	CurrentTest = nil

	SendNUIMessage({
		openQuestion = false
	})

	SetNuiFocus(false)

	if success then
		TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
		ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('passed_test'), 2000, "success")
	else
		ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('failed_test'), 2000, "error")
	end
end

function StartDriveTest(type)
	ESX.Game.SpawnVehicle(Config.VehicleModels[type],
		vector3(Config.Zones.VehicleSpawnPoint.Pos.x, Config.Zones.VehicleSpawnPoint.Pos.y,
			Config.Zones.VehicleSpawnPoint.Pos.z), Config.Zones.VehicleSpawnPoint.Pos.h, function(vehicle)
		CurrentTest       = 'drive'
		CurrentTestType   = type
		CurrentCheckPoint = 0
		LastCheckPoint    = -1
		CurrentZoneType   = 'residence'
		DriveErrors       = 0
		IsAboveSpeedLimit = false
		CurrentVehicle    = vehicle
		LastVehicleHealth = GetEntityHealth(vehicle)

		local playerPed = PlayerPedId()
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		SetVehicleFuelLevel(vehicle, 100.0)
		DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
	end)
end

function StopDriveTest(success)
	if success then
		TriggerServerEvent('esx_dmvschool:addLicense', CurrentTestType)
		ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('passed_test'), 2000, "success")
	else
		ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('failed_test'), 2000, "error")
	end

	CurrentTest     = nil
	CurrentTestType = nil
end

function SetCurrentZoneType(type)
	CurrentZoneType = type
end

function OpenDMVSchoolMenu()
	local ownedLicenses = {}

	for i = 1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end

	local elements = {}

	if not ownedLicenses['dmv'] then
		elements[#elements + 1] = {
			label = (
				('%s: <span style="color:green;">%s</span>'):format(TranslateCap('theory_test'),
					TranslateCap('school_item', ESX.Math.GroupDigits(Config.Prices['dmv'])))),
			value = "theory_test"
		}
	end

	if ownedLicenses['dmv'] then
		if not ownedLicenses['drive'] then
			elements[#elements + 1] = {
				label = (
					('%s: <span style="color:green;">%s</span>'):format(TranslateCap('road_test_car'),
						TranslateCap('school_item', ESX.Math.GroupDigits(Config.Prices['drive'])))),
				value = "drive_test",
				type = "drive"
			}
		end

		if not ownedLicenses['drive_bike'] then
			elements[#elements + 1] = {
				label = (
					('%s: <span style="color:green;">%s</span>'):format(TranslateCap('road_test_bike'),
						TranslateCap('school_item', ESX.Math.GroupDigits(Config.Prices['drive_bike'])))),
				value = "drive_test",
				type = "drive_bike"
			}
		end

		if not ownedLicenses['drive_truck'] then
			elements[#elements + 1] = {
				label = (
					('%s: <span style="color:green;">%s</span>'):format(TranslateCap('road_test_truck'),
						TranslateCap('school_item', ESX.Math.GroupDigits(Config.Prices['drive_truck'])))),
				value = "drive_test",
				type = "drive_truck"
			}
		end
	end

	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "dmvschool", { title = "Escola de Condução", elements = elements, align = "center" }
		, function(data, menu)
			if data.current.value == "theory_test" then
				ESX.TriggerServerCallback('esx_dmvschool:canYouPay', function(haveMoney)
					if haveMoney then
						menu.close()
						StartTheoryTest()
					else
						menu.close()
						ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('not_enough_money'), 2000, "error")
					end
				end, 'dmv')
			elseif data.current.value == "drive_test" then
				ESX.TriggerServerCallback('esx_dmvschool:canYouPay', function(haveMoney)
					if haveMoney then
						menu.close()
						StartDriveTest(data.current.type)
					else
						menu.close()
						ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('not_enough_money'), 2000, "error")
					end
				end, data.current.type)
			end
		end, function(data, menu)
			menu.close()
	end)
end

RegisterNUICallback('question', function(data, cb)
	SendNUIMessage({
		openSection = 'question'
	})

	cb()
end)

RegisterNUICallback('close', function(data, cb)
	StopTheoryTest(true)
	cb()
end)

RegisterNUICallback('kick', function(data, cb)
	StopTheoryTest(false)
	cb()
end)

AddEventHandler('esx_dmvschool:hasEnteredMarker', function(zone)
	if zone == 'DMVSchool' then
		CurrentAction     = 'dmvschool_menu'
		CurrentActionMsg  = TranslateCap('press_open_menu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_dmvschool:hasExitedMarker', function(zone)
	CurrentAction = nil
	exports["okokTextUI"]:Close()
end)

RegisterNetEvent('esx_dmvschool:loadLicenses')
AddEventHandler('esx_dmvschool:loadLicenses', function(licenses)
	Licenses = licenses
end)

-- Create Blips
CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.DMVSchool.Pos.x, Config.Zones.DMVSchool.Pos.y, Config.Zones.DMVSchool.Pos.z)

	SetBlipSprite(blip, 408)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(TranslateCap('driving_school_blip'))
	EndTextCommandSetBlipName(blip)
end)

-- Display markers
shown = false
CreateThread(function()
	while true do
		local sleep = 1500
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		for k, v in pairs(Config.Zones) do
			local Pos = vector3(v.Pos.x, v.Pos.y, v.Pos.z)
			if (v.Type ~= -1 and #(coords - Pos) < Config.DrawDistance) then
				sleep = 0
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r,
					v.Color.g, v.Color.b, 180, false, true, 2, false, false, false, false)
			end
		end

		if CurrentTest == 'theory' then

			sleep = 0
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisablePlayerFiring(playerPed, true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end

		if CurrentTest == 'drive' then
			sleep = 0
			local nextCheckPoint = CurrentCheckPoint + 1

			if Config.CheckPoints[nextCheckPoint] == nil then
				if DoesBlipExist(CurrentBlip) then
					RemoveBlip(CurrentBlip)
				end

				CurrentTest = nil

				ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('driving_test_complete'), 2000, "success")

				if DriveErrors < Config.MaxErrors then
					StopDriveTest(true)
				else
					StopDriveTest(false)
				end
			else
				if CurrentCheckPoint ~= LastCheckPoint then
					if DoesBlipExist(CurrentBlip) then
						RemoveBlip(CurrentBlip)
					end

					CurrentBlip = AddBlipForCoord(Config.CheckPoints[nextCheckPoint].Pos.x, Config.CheckPoints[nextCheckPoint].Pos.y,
						Config.CheckPoints[nextCheckPoint].Pos.z)
					SetBlipRoute(CurrentBlip, 1)

					LastCheckPoint = CurrentCheckPoint
				end

				local Pos = vector3(Config.CheckPoints[nextCheckPoint].Pos.x, Config.CheckPoints[nextCheckPoint].Pos.y,
					Config.CheckPoints[nextCheckPoint].Pos.z)
				local distance = #(coords - Pos)

				if distance <= Config.DrawDistance then
					DrawMarker(20, Config.CheckPoints[nextCheckPoint].Pos.x, Config.CheckPoints[nextCheckPoint].Pos.y,
						Config.CheckPoints[nextCheckPoint].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 150, false,
						true, 2, false, false, false, false)
				end

				if distance <= 3.0 then
					Config.CheckPoints[nextCheckPoint].Action(playerPed, CurrentVehicle, SetCurrentZoneType)
					CurrentCheckPoint = CurrentCheckPoint + 1
				end
			end
		end

		if CurrentAction then
			sleep = 0
			if not shown then
				shown = true
				exports["okokTextUI"]:Open(CurrentActionMsg, "darkblue", "right")
			end

			if (IsControlJustReleased(0, 38)) and (CurrentAction == 'dmvschool_menu') then
				OpenDMVSchoolMenu()
			end
		end

		local isInMarker  = false
		local currentZone = nil

		for k, v in pairs(Config.Zones) do
			local Pos = vector3(v.Pos.x, v.Pos.y, v.Pos.z)
			if (#(coords - Pos) < 1.5) then
				sleep       = 0
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_dmvschool:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_dmvschool:hasExitedMarker', LastZone)
			shown = false
			exports["okokTextUI"]:Close()
		end
		Wait(sleep)
	end
end)

-- Speed / Damage control
CreateThread(function()
	while true do
		local sleep = 1500

		if CurrentTest == 'drive' then
			sleep = 0
			local playerPed = PlayerPedId()

			if IsPedInAnyVehicle(playerPed, false) then

				local vehicle      = GetVehiclePedIsIn(playerPed, false)
				local speed        = GetEntitySpeed(vehicle) * Config.SpeedMultiplier
				local tooMuchSpeed = false

				for k, v in pairs(Config.SpeedLimits) do
					if CurrentZoneType == k and speed > v then
						tooMuchSpeed = true

						if not IsAboveSpeedLimit then
							DriveErrors       = DriveErrors + 1
							IsAboveSpeedLimit = true

							ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('driving_too_fast', v), 2000, "warning")
							ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('errors', DriveErrors, Config.MaxErrors), 2000, "info")
						end
					end
				end

				if not tooMuchSpeed then
					IsAboveSpeedLimit = false
				end

				local health = GetEntityHealth(vehicle)
				if health < LastVehicleHealth then

					DriveErrors = DriveErrors + 1

					ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('you_damaged_veh'), 2000, "warning")
					ESX.ShowNotification("ESCOLA DE CONDUÇÃO", TranslateCap('errors', DriveErrors, Config.MaxErrors), 2000, "info")

					-- avoid stacking faults
					LastVehicleHealth = health
					Wait(1500)
				end
			end
		end
		Wait(sleep)
	end
end)
