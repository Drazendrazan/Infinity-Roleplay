local show = false

RegisterCommand("online", function(source, args, rawCommand)
    show = not show
    ESX.TriggerServerCallback('Playerlist:getJobPlayers', function(police, ambulance, total, inService)
        SendNUIMessage({
            show = show,
            police = police,
            ambulance = ambulance,
            total = total,
            inService = inService
        })
    end)
end)