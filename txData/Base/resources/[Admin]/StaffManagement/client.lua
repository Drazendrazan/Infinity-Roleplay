RegisterNetEvent("staffmanagement:slayplayer")
AddEventHandler("staffmanagement:slayplayer", function()
    SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent("staffmanagement:tpm")
AddEventHandler("staffmanagement:tpm", function()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                break
            end
            Citizen.Wait(5)
        end
    end
end)

RegisterNetEvent('staffmanagement:spawnVehicle')
AddEventHandler('staffmanagement:spawnVehicle', function(vehicle)

	if IsModelInCdimage(GetHashKey(vehicle)) then
		local playerCoords, playerHeading = GetEntityCoords(ESX.PlayerData.ped), GetEntityHeading(ESX.PlayerData.ped)

		ESX.Game.SpawnVehicle(vehicle, playerCoords, playerHeading, function(vehicle)
			TaskWarpPedIntoVehicle(ESX.PlayerData.ped, vehicle, -1)
		end)
	else
		ESX.ShowNotification("ADMIN", "Veículo não encontrado", 2000, "error")
	end
end)

RegisterNetEvent("staffmanagement:GiveVipMenu")
AddEventHandler("staffmanagement:GiveVipMenu", function (target, carTable)
    local elements = {}
    for i = 1, #carTable, 1 do
        table.insert(elements, {label = carTable[i].CarLabel, value = carTable[i].CarID})
    end
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "GiveVipMenu", {
        title = "Give VIP",
        align = "top-left",
        elements = elements
    }, function(data, menu)
        ESX.Game.SpawnVehicle(data.current.value, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), function(vehicle)
            TriggerServerEvent("staffmanagement:GiveVip", target, ESX.Game.GetVehicleProperties(vehicle), data.current.label)
            ESX.Game.DeleteVehicle(vehicle)
        end, true)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)