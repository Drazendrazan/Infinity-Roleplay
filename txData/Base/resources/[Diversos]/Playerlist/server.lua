ESX.RegisterServerCallback('Playerlist:getJobPlayers', function(source, cb)
    local ambulance = 0
    local police = 0
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job.name == 'police' and exports["jobs_creator"]:isPlayerOnDuty(xPlayer.source) then
            police = police + 1
        elseif xPlayer.job.name == 'ambulance' and exports["jobs_creator"]:isPlayerOnDuty(xPlayer.source) then
            ambulance = ambulance + 1
        end
    end

    cb(police, ambulance, #xPlayers, exports["jobs_creator"]:isPlayerOnDuty(source))
end)