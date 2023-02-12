local pickups = {}
local PlayerBank, PlayerMoney = 0, 0
CreateThread(function()
	while not Config.Multichar do
		Wait(0)
		if NetworkIsPlayerActive(PlayerId()) then
			exports.spawnmanager:setAutoSpawn(false)
			DoScreenFadeOut(0)
			Wait(500)
			TriggerServerEvent('esx:onPlayerJoined')
			break
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew, skin)
	ESX.PlayerData = xPlayer

	if Config.Multichar then
		Wait(3000)
	else
		exports.spawnmanager:spawnPlayer({
			x = ESX.PlayerData.coords.x,
			y = ESX.PlayerData.coords.y,
			z = ESX.PlayerData.coords.z + 0.25,
			heading = ESX.PlayerData.coords.heading,
			model = `mp_m_freemode_01`,
			skipFade = false
		}, function()
			TriggerServerEvent('esx:onPlayerSpawn')
			TriggerEvent('esx:onPlayerSpawn')
			TriggerEvent('esx:restoreLoadout')

			if isNew then
				TriggerEvent('skinchanger:loadDefaultModel', skin.sex == 0)
			elseif skin then
				TriggerEvent('skinchanger:loadSkin', skin)
			end

			TriggerEvent('esx:loadingScreenOff')
			ShutdownLoadingScreen()
			ShutdownLoadingScreenNui()
		end)
	end

	ESX.PlayerLoaded = true

	while ESX.PlayerData.ped == nil do Wait(20) end

	-- enable PVP
	if Config.EnablePVP then
		SetCanAttackFriendly(ESX.PlayerData.ped, true, false)
		NetworkSetFriendlyFireOption(true)
	end

	CreateThread(function()
		local SetPlayerHealthRechargeMultiplier = SetPlayerHealthRechargeMultiplier
		local DisablePlayerVehicleRewards = DisablePlayerVehicleRewards
		local RemoveAllPickupsOfType = RemoveAllPickupsOfType
		--local HideHudComponentThisFrame = HideHudComponentThisFrame
		local PlayerId = PlayerId()
		--local DisabledComps = {}
		--for i = 1, #(Config.RemoveHudCommonents) do
		--	if Config.RemoveHudCommonents[i] then
		--		DisabledComps[#DisabledComps + 1] = i
		--	end
		--end
		while true do
			--local Sleep = true

			--if Config.DisableHealthRegeneration then
			--Sleep = false
			SetPlayerHealthRechargeMultiplier(PlayerId, 0.0)
			--end

			--if Config.DisableVehicleRewards then
			--Sleep = false
			DisablePlayerVehicleRewards(PlayerId)
			--end

			--if Config.DisableNPCDrops then
			--Sleep = false
			RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
			RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
			RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
			--end

			--if #DisabledComps > 0 then
			--	Sleep = false
			--	for i = 1, #(DisabledComps) do
			--		HideHudComponentThisFrame(DisabledComps[i])
			--	end
			--end

			--Wait(Sleep and 1500 or 0)
			Wait(1)
		end
	end)

	SetDefaultVehicleNumberPlateTextPattern(-1, Config.CustomAIPlates)
	StartServerSyncLoops()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	if Config.EnableHud then ESX.UI.HUD.Reset() end
end)

RegisterNetEvent('esx:setMaxWeight')
AddEventHandler('esx:setMaxWeight', function(newMaxWeight) ESX.SetPlayerData("maxWeight", newMaxWeight) end)

local function onPlayerSpawn()
	ESX.SetPlayerData('ped', PlayerPedId())
	ESX.SetPlayerData('dead', false)
end

AddEventHandler('playerSpawned', onPlayerSpawn)
AddEventHandler('esx:onPlayerSpawn', onPlayerSpawn)

AddEventHandler('esx:onPlayerDeath', function()
	ESX.SetPlayerData('ped', PlayerPedId())
	ESX.SetPlayerData('dead', true)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Wait(100)
	end
	TriggerEvent('esx:restoreLoadout')
end)

AddEventHandler('esx:restoreLoadout', function()
	ESX.SetPlayerData('ped', PlayerPedId())

	if not Config.OxInventory then
		local ammoTypes = {}
		RemoveAllPedWeapons(ESX.PlayerData.ped, true)

		for k, v in ipairs(ESX.PlayerData.loadout) do
			local weaponName = v.name
			local weaponHash = joaat(weaponName)

			GiveWeaponToPed(ESX.PlayerData.ped, weaponHash, 0, false, false)
			SetPedWeaponTintIndex(ESX.PlayerData.ped, weaponHash, v.tintIndex)

			local ammoType = GetPedAmmoTypeFromWeapon(ESX.PlayerData.ped, weaponHash)

			for k2, v2 in ipairs(v.components) do
				local componentHash = ESX.GetWeaponComponent(weaponName, v2).hash
				GiveWeaponComponentToPed(ESX.PlayerData.ped, weaponHash, componentHash)
			end

			if not ammoTypes[ammoType] then
				AddAmmoToPed(ESX.PlayerData.ped, weaponHash, v.ammo)
				ammoTypes[ammoType] = true
			end
		end
	end
end)

AddStateBagChangeHandler('VehicleProperties', nil, function(bagName, key, value)
	if value then
		Wait(0)
		local NetId = value.NetId
		local Vehicle = NetworkGetEntityFromNetworkId(NetId)
		local Tries = 0
		while not DoesEntityExist(Vehicle) do
			local Vehicle = NetworkGetEntityFromNetworkId(NetId)
			Wait(100)
			Tries = Tries + 1
			if Tries > 300 then
				break
			end
		end
		if NetworkGetEntityOwner(Vehicle) == PlayerId() then
			ESX.Game.SetVehicleProperties(Vehicle, value)
		end
	end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i = 1, #(ESX.PlayerData.accounts) do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end

	ESX.SetPlayerData('accounts', ESX.PlayerData.accounts)
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
	for k, v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count, showNotification)
	for k, v in ipairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.PlayerData.inventory[k].count = count
			break
		end
	end
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weapon, ammo)
	print("[^1ERROR^7] event ^5'esx:addWeapon'^7 Has Been Removed. Please use ^5xPlayer.addWeapon^7 Instead!")
end)

RegisterNetEvent('esx:addWeaponComponent')
AddEventHandler('esx:addWeaponComponent', function(weapon, weaponComponent)
	print("[^1ERROR^7] event ^5'esx:addWeaponComponent'^7 Has Been Removed. Please use ^5xPlayer.addWeaponComponent^7 Instead!")
end)

RegisterNetEvent('esx:setWeaponAmmo')
AddEventHandler('esx:setWeaponAmmo', function(weapon, weaponAmmo)
	print("[^1ERROR^7] event ^5'esx:setWeaponAmmo'^7 Has Been Removed. Please use ^5xPlayer.addWeaponAmmo^7 Instead!")
end)

RegisterNetEvent('esx:setWeaponTint')
AddEventHandler('esx:setWeaponTint', function(weapon, weaponTintIndex)
	SetPedWeaponTintIndex(ESX.PlayerData.ped, joaat(weapon), weaponTintIndex)

end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weapon)
	local playerPed = ESX.PlayerData.ped
	RemoveWeaponFromPed(ESX.PlayerData.ped, joaat(weapon))
	SetPedAmmo(ESX.PlayerData.ped, joaat(weapon), 0)
end)

RegisterNetEvent('esx:removeWeaponComponent')
AddEventHandler('esx:removeWeaponComponent', function(weapon, weaponComponent)
	local componentHash = ESX.GetWeaponComponent(weapon, weaponComponent).hash
	RemoveWeaponComponentFromPed(ESX.PlayerData.ped, joaat(weapon), componentHash)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(Job)
	if Config.EnableHud then
		local gradeLabel = Job.grade_label ~= Job.label and Job.grade_label or ''
		if gradeLabel ~= '' then gradeLabel = ' - ' .. gradeLabel end
		ESX.UI.HUD.UpdateElement('job', {
			job_label = Job.label,
			grade_label = gradeLabel
		})
	end
	ESX.SetPlayerData('job', Job)
end)

RegisterNetEvent('esx:registerSuggestions')
AddEventHandler('esx:registerSuggestions', function(registeredCommands)
	for name, command in pairs(registeredCommands) do
		if command.suggestion then
			TriggerEvent('chat:addSuggestion', ('/%s'):format(name), command.suggestion.help, command.suggestion.arguments)
		end
	end
end)

function StartServerSyncLoops()
	if not Config.OxInventory then
		-- keep track of ammo

		CreateThread(function()
			local currentWeapon = { Ammo = 0 }
			while ESX.PlayerLoaded do
				local sleep = 1500
				if GetSelectedPedWeapon(ESX.PlayerData.ped) ~= -1569615261 then
					sleep = 1000
					local _, weaponHash = GetCurrentPedWeapon(ESX.PlayerData.ped, true)
					local weapon = ESX.GetWeaponFromHash(weaponHash)
					if weapon then
						local ammoCount = GetAmmoInPedWeapon(ESX.PlayerData.ped, weaponHash)
						if weapon.name ~= currentWeapon.name then
							currentWeapon.Ammo = ammoCount
							currentWeapon.name = weapon.name
						else
							if ammoCount ~= currentWeapon.Ammo then
								currentWeapon.Ammo = ammoCount
								TriggerServerEvent('esx:updateWeaponAmmo', weapon.name, ammoCount)
							end
						end
					end
				end
				Wait(sleep)
			end
		end)
	end

	-- sync current player coords with server
	CreateThread(function()
		local previousCoords = vector3(ESX.PlayerData.coords.x, ESX.PlayerData.coords.y, ESX.PlayerData.coords.z)

		while ESX.PlayerLoaded do
			local playerPed = PlayerPedId()
			if ESX.PlayerData.ped ~= playerPed then ESX.SetPlayerData('ped', playerPed) end

			if DoesEntityExist(ESX.PlayerData.ped) then
				local playerCoords = GetEntityCoords(ESX.PlayerData.ped)
				local distance = #(playerCoords - previousCoords)

				if distance > 1 then
					previousCoords = playerCoords
					TriggerServerEvent('esx:updateCoords')
				end
			end
			Wait(1500)
		end
	end)
end

-- disable wanted level
if not Config.EnableWantedLevel then
	ClearPlayerWantedLevel(PlayerId())
	SetMaxWantedLevel(0)
end

RegisterNetEvent("esx:freezePlayer")
AddEventHandler("esx:freezePlayer", function(input)
	local player = PlayerId()
	if input == 'freeze' then
		SetEntityCollision(ESX.PlayerData.ped, false)
		FreezeEntityPosition(ESX.PlayerData.ped, true)
		SetPlayerInvincible(player, true)
	elseif input == 'unfreeze' then
		SetEntityCollision(ESX.PlayerData.ped, true)
		FreezeEntityPosition(ESX.PlayerData.ped, false)
		SetPlayerInvincible(player, false)
	end
end)

RegisterNetEvent("esx:GetVehicleType", function(Model, Request)
	local Model = Model
	local VehicleType = GetVehicleClassFromName(Model)
	local type = "automobile"
	if VehicleType == 15 then
		type = "heli"
	elseif VehicleType == 16 then
		type = "plane"
	elseif VehicleType == 14 then
		type = "boat"
	elseif VehicleType == 11 then
		type = "trailer"
	elseif VehicleType == 21 then
		type = "train"
	elseif VehicleType == 13 or VehicleType == 8 then
		type = "bike"
	end
	if Model == `submersible` or Model == `submersible2` then
		type = "submarine"
	end
	TriggerServerEvent("esx:ReturnVehicleType", type, Request)
end)


local DoNotUse = {
	'essentialmode',
	'es_admin2',
	'basic-gamemode',
	'mapmanager',
	'fivem-map-skater',
	'fivem-map-hipster',
	'qb-core',
	'default_spawnpoint',
}

for i = 1, #DoNotUse do
	if GetResourceState(DoNotUse[i]) == 'started' or GetResourceState(DoNotUse[i]) == 'starting' then
		print("[^1ERROR^7] YOU ARE USING A RESOURCE THAT WILL BREAK ^1ESX^7, PLEASE REMOVE ^5" .. DoNotUse[i] .. "^7")
	end
end

RegisterNetEvent('qs-core:setPlayerData')
AddEventHandler('qs-core:setPlayerData', function(data)
    local Inventory = data.items
    for _, slot in pairs(Inventory) do
        Inventory[_].count = Inventory[_].amount
    end
    ESX.PlayerData.inventory = Inventory
end)