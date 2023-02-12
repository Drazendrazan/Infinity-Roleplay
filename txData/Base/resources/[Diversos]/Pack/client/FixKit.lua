local CurrentAction = nil

RegisterNetEvent('esx_repairkit:onUse')
AddEventHandler('esx_repairkit:onUse', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			TriggerServerEvent('esx_repairkit:removeKit')
			TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
			Citizen.Wait(15000)
			SetVehicleEngineHealth(vehicle, 1000.0)
			SetVehicleEngineOn(vehicle, true, true)
			ClearPedTasksImmediately(playerPed)

			ESX.ShowNotification("KIT DE REPARAÇÃO", "Carro arranjado", 2000, 'success')
		end
	else
		ESX.ShowNotification("KIT DE REPARAÇÃO", "Não há veículos por perto", 2000, "warning")
	end
end)
