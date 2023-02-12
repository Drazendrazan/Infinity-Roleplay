Citizen.CreateThread(function()
    ESX.RegisterServerCallback("chames_ambulance_medic:requiredAmount", function(source, callback)
        local character = ESX.GetPlayerFromId(source)

        if not character then return callback(false) end

        local playersInJob = GetPlayersWithJob("ambulance")

        callback(playersInJob <= 1)
    end)
end)