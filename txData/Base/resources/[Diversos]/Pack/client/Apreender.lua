RegisterCommand("apreender", function(source, args, rawCommand)
    if ESX.PlayerData.job.name == 'police' then
        local vehicle = ESX.Game.GetVehicleInDirection()
        if DoesEntityExist(vehicle) then
            local PlayerPed = PlayerPedId()
            local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
            TaskStartScenarioInPlace(PlayerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
            Citizen.Wait(10000)
            ClearPedTasks(PlayerPed)
            ESX.Game.DeleteVehicle(vehicle)
            ESX.ShowNotification("DPLS", "Veículo apreendido com sucesso", 2000, "success")
        else
            ESX.ShowNotification("DPLS", "Não há veículos por perto", 2000, "warning")
        end
    end
end)