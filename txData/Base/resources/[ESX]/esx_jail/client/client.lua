PlayerData = {}

local jailTime = 0

Citizen.CreateThread(function()
	PlayerData = ESX.GetPlayerData()

	LoadTeleporters()
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(25000)

	ESX.TriggerServerCallback("jail:retrieveJailTime", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			JailLogin()
		end
	end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
	PlayerData["job"] = response
end)

RegisterNetEvent("jail:openJailMenu")
AddEventHandler("jail:openJailMenu", function()
	OpenJailMenu()
end)

RegisterNetEvent("jail:jailPlayer")
AddEventHandler("jail:jailPlayer", function(newJailTime)
	jailTime = newJailTime

	Cutscene()
end)

RegisterNetEvent("jail:unJailPlayer")
AddEventHandler("jail:unJailPlayer", function()
	jailTime = 0

	UnJail()
end)

function JailLogin()
	local JailPosition = Config.JailPositions["Cell"]
	SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)

	ESX.ShowNotification("PRISÃO", "Quando saiste estavas preso então voltaste para a tua cela.", 2000, "info")

	InJail()
end

function UnJail()
	InJail()

	ESX.Game.Teleport(PlayerPedId(), Config.Teleports["Boiling Broke"])

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	ESX.ShowNotification("PRISÃO", "Foste solto da prisão", 2000, "success")
end

function InJail()

	--Jail Timer--

	Citizen.CreateThread(function()

		while jailTime > 0 do

			jailTime = jailTime - 1

			ESX.ShowNotification("PRISÃO", "Você tem " .. jailTime .. " minutos restantes de sua sentença.", 2000, "info")

			TriggerServerEvent("jail:updateJailTime", jailTime)

			if jailTime == 0 then
				UnJail()

				TriggerServerEvent("jail:updateJailTime", 0)
			end

			Citizen.Wait(60000)
		end

	end)

	--Jail Timer--

	--Prison Work--

	Citizen.CreateThread(function()
		while jailTime > 0 do

			local sleepThread = 500

			local Packages = Config.PrisonWork["Packages"]

			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)

			for posId, v in pairs(Packages) do

				local DistanceCheck = GetDistanceBetweenCoords(PedCoords, v["x"], v["y"], v["z"], true)

				if DistanceCheck <= 10.0 then

					sleepThread = 5

					local PackageText = "Pack"

					if not v["state"] then
						PackageText = "Already Taken"
					end

					ESX.Game.Utils.DrawText3D(v, "[E] " .. PackageText, 0.4)

					if DistanceCheck <= 1.5 then

						if IsControlJustPressed(0, 38) then

							if v["state"] then
								PackPackage(posId)
							else
								ESX.ShowNotification("You've already taken this package!")
							end

						end

					end

				end

			end

			Citizen.Wait(sleepThread)

		end
	end)

	--Prison Work--

end

function LoadTeleporters()
	Citizen.CreateThread(function()
		while true do

			local sleepThread = 500

			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)

			for p, v in pairs(Config.Teleports) do

				local DistanceCheck = GetDistanceBetweenCoords(PedCoords, v["x"], v["y"], v["z"], true)

				if DistanceCheck <= 7.5 then

					sleepThread = 5

					ESX.Game.Utils.DrawText3D(v, "[E] Open Door", 0.4)

					if DistanceCheck <= 1.0 then
						if IsControlJustPressed(0, 38) then
							TeleportPlayer(v)
						end
					end
				end
			end

			Citizen.Wait(sleepThread)

		end
	end)
end

function PackPackage(packageId)
	local Package = Config.PrisonWork["Packages"][packageId]

	LoadModel("prop_cs_cardbox_01")

	local PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), Package["x"], Package["y"], Package["z"], true)

	PlaceObjectOnGroundProperly(PackageObject)

	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)

	local Packaging = true
	local StartTime = GetGameTimer()

	while Packaging do

		Citizen.Wait(1)

		local TimeToTake = 60000 * 1.20 -- Minutes
		local PackPercent = (GetGameTimer() - StartTime) / TimeToTake * 100

		if not IsPedUsingScenario(PlayerPedId(), "PROP_HUMAN_BUM_BIN") then
			DeleteEntity(PackageObject)

			ESX.ShowNotification("Canceled!")

			Packaging = false
		end

		if PackPercent >= 100 then

			Packaging = false

			DeliverPackage(PackageObject)

			Package["state"] = false
		else
			ESX.Game.Utils.DrawText3D(Package, "Packaging... " .. math.ceil(tonumber(PackPercent)) .. "%", 0.4)
		end

	end
end

function DeliverPackage(packageId)
	if DoesEntityExist(packageId) then
		AttachEntityToEntity(packageId, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1
			, 1, 0, 1, 0, 1)

		ClearPedTasks(PlayerPedId())
	else
		return
	end

	local Packaging = true

	LoadAnim("anim@heists@box_carry@")

	while Packaging do

		Citizen.Wait(5)

		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
			TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
		end

		if not IsEntityAttachedToEntity(packageId, PlayerPedId()) then
			Packaging = false
			DeleteEntity(packageId)
		else
			local DeliverPosition = Config.PrisonWork["DeliverPackage"]
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = GetDistanceBetweenCoords(PedPosition, DeliverPosition["x"], DeliverPosition["y"],
				DeliverPosition["z"], true)

			ESX.Game.Utils.DrawText3D(DeliverPosition, "[E] Leave Package", 0.4)

			if DistanceCheck <= 2.0 then
				if IsControlJustPressed(0, 38) then
					DeleteEntity(packageId)
					ClearPedTasksImmediately(PlayerPedId())
					Packaging = false

					TriggerServerEvent("jail:prisonWorkReward")
				end
			end
		end

	end

end

function OpenJailMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'jail_prison_menu',
		{
			title    = "Menu de prisão",
			align    = 'center',
			elements = {
				{ label = "Prender Cidadão", value = "jail_closest_player" },
				{ label = "Soltar Cidadão", value = "unjail_player" }
			}
		},
		function(data, menu)

			local action = data.current.value

			if action == "jail_closest_player" then

				menu.close()

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
					{
						title = "Tempo (em minutos)"
					},
					function(data2, menu2)

						local jailTime = tonumber(data2.value)

						if jailTime == nil then
							ESX.ShowNotification("PRISÃO", "Tempo inválido", 2000, "warning")
						else
							menu2.close()

							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification("PRISÃO", "Nenhum jogador por perto", 2000, "warning")
							else
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
									{
										title = "Motivo"
									},
									function(data3, menu3)

										local reason = data3.value

										if reason == nil then
											ESX.ShowNotification("PRISÃO", "Motivo inválido", 2000, "warning")
										else
											menu3.close()

											local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

											if closestPlayer == -1 or closestDistance > 3.0 then
												ESX.ShowNotification("PRISÃO", "Nenhum jogador por perto", 2000, "warning")
											else
												TriggerServerEvent("jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason)
											end

										end

									end, function(data3, menu3)
									menu3.close()
								end)
							end

						end

					end, function(data2, menu2)
					menu2.close()
				end)
			elseif action == "unjail_player" then

				local elements = {}

				ESX.TriggerServerCallback("jail:retrieveJailedPlayers", function(playerArray)

					if #playerArray == 0 then
						ESX.ShowNotification("PRISÃO", "Nenhum cidadão preso", 2000, "warning")
						return
					end

					for i = 1, #playerArray, 1 do
						table.insert(elements,
							{ label = "Prisioneiro: " .. playerArray[i].name .. " | Tempo: " .. playerArray[i].jailTime .. " minutos",
								value = playerArray[i].identifier })
					end

					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'jail_unjail_menu',
						{
							title = "Soltar Cidadão",
							align = "center",
							elements = elements
						},
						function(data2, menu2)

							local action = data2.current.value

							TriggerServerEvent("jail:unJailPlayer", action)

							menu2.close()

						end, function(data2, menu2)
						menu2.close()
					end)
				end)

			end

		end, function(data, menu)
		menu.close()
	end)
end
