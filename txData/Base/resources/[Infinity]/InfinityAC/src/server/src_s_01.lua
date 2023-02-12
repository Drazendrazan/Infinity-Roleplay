Table = {}
Webhooks = {
    ["Screenshots"] = "https://discord.com/api/webhooks/1039629624235282624/3bgW4zXH9CtLppqoCxvdxR2HoK7bVwYRkjFRwmWiNlTnCkfML37ntqHx_DtvvP4C-G-c",
    ["Explosion"] = "https://discord.com/api/webhooks/1039629704166117376/JJ2D5O8tUmrglCA0r3FRtH9JGB1JsJWBcnz0EKlGuQalrnIY8RkO_yQsOzb8vqBCP0uC",
    ["Ban"] = "https://discord.com/api/webhooks/1039629789822197791/xye58exZoDv4AgTtHNISrDYLpXntJHt_eSPlSi62dW70oogxQBviZFOUpSVBanb1Uia1",
    ["Event"] = "https://discord.com/api/webhooks/1039629837360451644/tQpo1a899jqDZ_dF_gDj3P7b4HXkTbX0CWEFMtOY3XvPLwtI53ofqLAfkBrOFctYkh6z",
    ["Connecting"] = "https://discord.com/api/webhooks/1039629896613376121/lUcY2joyqVVfgOsJk45WlIr97a23-adzlSkVW-nRnW_g2mUu7OLX1H_Dv2mdmmsJozuw",
    ["VPN"] = "https://discord.com/api/webhooks/1039653503255203910/IifjiklgQLwBN-LrMVHXXyx24jVKs2Rf8roTXjixeB7ZatMmtZdzmkxiG5TpyUJOVuL9"
}

Citizen.CreateThread(function()
    print("^7[^2InfinityAC^7] Anticheat iniciado.")
end)

ESX.RegisterServerCallback('InfinityAC:isAdmin', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    while not xPlayer do
        xPlayer = ESX.GetPlayerFromId(src)
        Citizen.Wait(100)
    end
    cb(xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin")
end)

RegisterServerEvent("InfinityAC:ban")
AddEventHandler("InfinityAC:ban", function(reason, target)
    local _source
    if (source == "" or source == nil) and not target then
        return
    else
        if (source ~= "" and source ~= nil) then
            _source = source
        else
            _source = target
        end
    end
    local identifiers = ExtractIdentifiers(_source)
    local xPlayer
    if not xPlayer or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "support" or xPlayer.getGroup() == "headadmin" or xPlayer.getGroup() == "owner" then
        return
    end
    MySQL.query("INSERT INTO infinityac (name, steam, license, license2, discord, ip, xbl, liveid, fivem, hwid, reason) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        , {
        GetPlayerName(_source),
        identifiers.steam,
        identifiers.license,
        identifiers.license2,
        identifiers.discordid,
        identifiers.ip,
        identifiers.xbl,
        identifiers.live,
        identifiers.fivem,
        GetPlayerToken(_source, 0),
        reason
    })
    LogToDiscord(_source, "Ban", reason)
    DropPlayer(_source, "InfinityAC\n\nVocê foi banido permamentemente do servidor.\nMotivo: " .. reason)
end)

local playersExplosion = {}
AddEventHandler("explosionEvent", function(sender, ev)
    if tonumber(sender) then
        local playerHWID = GetPlayerToken(sender, 0)
        if ev ~= nil then
            local explosionType = Table["Explosions"][ev.explosionType]
            if explosionType ~= nil then
                local explosionName = explosionType.Name
                if explosionType.Ban then
                    TriggerEvent("InfinityAC:ban", "Explosão detetada: " .. explosionName, sender)
                    LogToDiscord(sender, "Explosion",
                        "Tipo: " .. explosionName .. " | Coordenadas: " .. ev.posX .. ", " .. ev.posY .. ", " .. ev.posZ)
                    CancelEvent()
                end
            end
            if playersExplosion[playerHWID] ~= nil then
                playersExplosion[playerHWID].count = playersExplosion[playerHWID].count + 1
                if os.time() - playersExplosion[playerHWID].time <= 10 then
                    playersExplosion[playerHWID] = nil
                else
                    if playersExplosion[playerHWID].count >= 10 then
                        TriggerEvent("InfinityAC:ban", "Explosões em massa detetado", sender)
                        CancelEvent()
                    end
                end
            else
                playersExplosion[playerHWID] = {
                    count = 1,
                    time  = os.time()
                }
            end
        else
            CancelEvent()
        end
    else
        CancelEvent()
    end
end)

RegisterServerEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerId)
    TriggerClientEvent("InfinityAC:LoadTables", playerId, Table)
end)

function ScreenshotPlayer()
    local _src = source
    local result = TriggerClientCallback {
        source = _src,
        eventName = 'InfinityAC:Screenshot'
    }
    return result
end

function LogToDiscord(source, category, reason)
    if not source or source == "" then return end
    local playerName = GetPlayerName(source)
    local playerHWID = GetPlayerToken(source, 0)
    local identifiers = ExtractIdentifiers(source)
    local playerIp = identifiers.ip
    if playerIp == nil then playerIp = GetPlayerEndpoint(source) else playerIp = playerIp:gsub("ip:", "") end
    if not playerIp then return end
    local embed = {
        {
            footer = {
                text = "InfinityAC | " .. os.date("%Y/%m/%d | %X") .. "",
            },
            title = "InfinityAC Logs - " .. category,
            description =
            "**Player Name:** " ..
                playerName ..
                "\n**Player HWID:** " ..
                playerHWID ..
                "\n**Steam Hex:** " ..
                identifiers.steam ..
                "\n**Discord ID:** " ..
                identifiers.discordid ..
                "\n**Discord Name:** " ..
                identifiers.discord ..
                "\n**License:** " ..
                identifiers.license ..
                "\n**License2:** " ..
                identifiers.license2 ..
                "\n**Live:** " ..
                identifiers.live ..
                "\n**Xbox:** " ..
                identifiers.xbl ..
                "\n**FiveM:** " ..
                identifiers.fivem ..
                "\n**IP:** " .. playerIp,
            color = 1769216
        }
    }
    if category == "Explosion" then
        embed[1].description = embed[1].description .. "\n**Explosão:** " .. reason .. ""
    elseif category == "Ban" then
        embed[1].description = embed[1].description .. "\n**Motivo:** " .. reason .. ""
    elseif category == "Event" then
        embed[1].description = embed[1].description .. "\n**Evento:** " .. reason .. ""
    elseif category == "Connecting" then
        embed[1].color = 65280
    end
    PerformHttpRequest(Webhooks[category], function(ERROR, DATA, RESULT)
    end, "POST", json.encode({
        embeds = embed,
        username = "InfinityAC Logs - " .. category
    }), {
        ["Content-Type"] = "application/json"
    })
end

AddEventHandler("giveWeaponEvent", function(sender, data)
    TriggerEvent("InfinityAC:ban", "Evento giveWeaponEvent acionado", sender)
    CancelEvent()
end)

AddEventHandler('removeWeaponEvent', function(sender, data)
    TriggerEvent("InfinityAC:ban", "Evento removeWeaponEvent acionado", sender)
    CancelEvent()
end)

AddEventHandler("clearPedTasksEvent", function(sender, data)
    TriggerEvent("InfinityAC:ban", "Evento clearPedTasksEvent acionado", sender)
    CancelEvent()
end)

AddEventHandler('ptFxEvent', function(sender, data)
    local model = tonumber(data.effectHash)
    for k, v in pairs(Table["ptFx"]) do
        if model == GetHashKey(v) then
            TriggerEvent("InfinityAC:ban", "Spawn de particulas detetado: " .. v, sender)
            CancelEvent()
        end
    end
end)

Citizen.CreateThread(function()
    for _, trigger in pairs(Table["Events"]) do
        RegisterServerEvent(trigger)
        AddEventHandler(trigger, function()
            local _source = source
            TriggerEvent("InfinityAC:ban", "Evento na blacklist acionado: " .. trigger, tonumber(_source))
            LogToDiscord(source, "Event", trigger)
        end)
    end
end)

local playersVehicles = {}
local playersPeds = {}
local playersObjects = {}
AddEventHandler("entityCreated", function(entity)
    if DoesEntityExist(entity) then
        local type = GetEntityType(entity)
        local owner = NetworkGetFirstEntityOwner(entity)
        local model = GetEntityModel(entity)
        local playerHWID = GetPlayerToken(owner, 0)
        if not playerHWID then return end
        if type == 3 then
            for _, value in ipairs(Table["Props"]) do
                if model == GetHashKey(value) then
                    if DoesEntityExist(entity) then
                        DeleteEntity(entity)
                        Wait(1000)
                        TriggerEvent("InfinityAC:ban", "Spawn de prop na blacklist detetado: " .. value, owner)
                    end
                end
            end
            if playersObjects[playerHWID] ~= nil then
                playersObjects[playerHWID].count = playersObjects[playerHWID].count + 1
                if os.time() - playersObjects[playerHWID].time >= 10 then
                    playersObjects[playerHWID] = nil
                else
                    if playersObjects[playerHWID].count >= 15 then
                        for _, objects in ipairs(GetAllObjects()) do
                            local entityOwner = NetworkGetFirstEntityOwner(objects)
                            if entityOwner == owner then
                                if DoesEntityExist(objects) then
                                    DeleteEntity(objects)
                                end
                            end
                        end
                        TriggerEvent("InfinityAC:ban", "Spawn de props em massa detetado", owner)
                    end
                end
            else
                playersObjects[playerHWID] = {
                    count = 1,
                    time  = os.time()
                }
            end
        end
        --if type == 1 then
        --for _, value in ipairs(Table["Peds"]) do
        --    if model == GetHashKey(value) then
        --        if DoesEntityExist(entity) then
        --            DeleteEntity(entity)
        --            Wait(1000)
        --            TriggerEvent("InfinityAC:ban", "Spawn de ped na blacklist detetado: ".. value, owner)
        --        end
        --    end
        --end
        --if playersPeds[playerHWID] ~= nil then
        --    playersPeds[playerHWID].count = playersPeds[playerHWID].count + 1
        --    if os.time() - playersPeds[playerHWID].time >= 10 then
        --        playersPeds[playerHWID] = nil
        --    else
        --        for _, peds in ipairs(GetAllPeds()) do
        --            local entityOwner = NetworkGetFirstEntityOwner(peds)
        --            if entityOwner == owner then
        --                if DoesEntityExist(peds) then
        --                    DeleteEntity(peds)
        --                end
        --            end
        --        end
        --        if playersPeds[playerHWID].count >= 4 then
        --            TriggerEvent("InfinityAC:ban", "Spawn de peds em massa detetado", owner)
        --        end
        --    end
        --else
        --    playersPeds[playerHWID] = {
        --        count = 1,
        --        time  = os.time()
        --    }
        --end
        --end
        if type == 2 then
            for _, value in ipairs(Table["Vehicles"]) do
                if model == GetHashKey(value) then
                    if DoesEntityExist(entity) then
                        DeleteEntity(entity)
                        Wait(1000)
                        TriggerEvent("InfinityAC:ban", "Spawn de veículo na blacklist detetado: " .. value, owner)
                    end
                end
            end
            --if playersVehicles[playerHWID] ~= nil then
            --    playersVehicles[playerHWID].count = playersVehicles[playerHWID].count + 1
            --    if os.time() - playersVehicles[playerHWID].time >= 10 then
            --        playersVehicles[playerHWID] = nil
            --    else
            --        if playersVehicles[playerHWID].count >= 10 then
            --            for _, vehicle in ipairs(GetAllVehicles()) do
            --                local entityOwner = NetworkGetFirstEntityOwner(vehicle)
            --                if entityOwner == owner then
            --                    if DoesEntityExist(vehicle) then
            --                        DeleteEntity(vehicle)
            --                    end
            --                end
            --            end
            --            TriggerEvent("InfinityAC:ban", "Spawn de veículos em massa detetado", owner)
            --        end
            --    end
            --else
            --    playersVehicles[playerHWID] = {
            --        count = 1,
            --        time  = os.time()
            --    }
            --end
        end
    end
end)

function ExtractIdentifiers(src)

    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        discordid = "",
        license = "",
        license2 = "",
        xbl = "",
        live = "",
        fivem = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam:") then
            identifiers.steam = id
        elseif string.find(id, "ip:") then
            identifiers.ip = id
        elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
            identifiers.discordid = string.sub(id, 9)
            identifiers.discord = "<@" .. identifiers.discordid .. ">"
        elseif string.find(id, "license:") then
            identifiers.license = id
        elseif string.find(id, "license2:") then
            identifiers.license2 = id
        elseif string.find(id, "xbl:") then
            identifiers.xbl = id
        elseif string.find(id, "live:") then
            identifiers.live = id
        elseif string.find(id, "fivem:") then
            identifiers.fivem = id
        end
    end

    return identifiers
end
