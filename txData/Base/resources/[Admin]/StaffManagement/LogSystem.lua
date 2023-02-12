local webhook = "https://discord.com/api/webhooks/1039632419248148550/A1X_qFXGuBUslAkZQ72x0UJ9X9TiybQAcLivznek2tHsq1oWEj5GYdUQZc7C2M9OQ4aH"

RegisterServerEvent("staffmanagement:LogSystem")
AddEventHandler("staffmanagement:LogSystem", function(commandExecuted, playerId)
    if playerId == 0 then return end
    --PerformHttpRequest(webhook, function(err, text, headers) end, "POST", json.encode({content = "[MODO ADMIN COMMANDS]\nName: "..GetPlayerName(playerId).."\nCommand: "..commandExecuted, tts = false}), { ["Content-Type"] = "application/json" })
    local log = "**Info:**\n\tComando: " .. commandExecuted
    exports["Pack"]:LogToDiscord(playerId, webhook
        , "Comandos Staff", log)
end)
