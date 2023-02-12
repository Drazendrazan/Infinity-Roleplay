Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(1035266661328093276)
        local id = GetPlayerServerId(PlayerId())
        ESX.TriggerServerCallback('discord:getData', function(numPlayers, playerName)
            SetRichPresence(playerName .. " | " .. numPlayers .. "/64 | ID: " .. id)

            SetDiscordRichPresenceAsset("infinityroleplay")
            SetDiscordRichPresenceAssetText(playerName)
        end)
        Citizen.Wait(60 * 1000)
    end
end)
