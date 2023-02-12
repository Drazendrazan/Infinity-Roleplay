BanList = {}

ValidWeapons = {}
RegisterServerEvent('InfinityAC:AddWeapon', function(weaponhash)
    local hashWeapon = tonumber(weaponhash)
    if ValidWeapons[source] == nil then
        ValidWeapons[source] = {}
    end
    if not InTable(ValidWeapons[source], hashWeapon) then
        table.insert(ValidWeapons[source], hashWeapon)
    end
end)

RegisterServerEvent('InfinityAC:ClearWeapons', function()
    ValidWeapons[source] = {}
end)

RegisterServerEvent('InfinityAC:RemoveWeapon', function(weaponhash)
    local hashWeapon = tonumber(weaponhash)
    if hashWeapon == nil then
        return
    end
    if ValidWeapons[source] == nil then
        ValidWeapons[source] = {}
    end
    for i, v in ipairs(ValidWeapons[source]) do
        if v == hashWeapon then
            table.remove(ValidWeapons[source], i)
        end
    end
end)

RegisterServerEvent('InfinityAC:VerifyWeapon', function(listWeapons)
    local _source = source
    if ValidWeapons[_source] == nil then
        ValidWeapons[_source] = {}
        return
    end
    if listWeapons == nil then
        return
    end
    local valid = TableCompare(ValidWeapons[_source], listWeapons)
    if not valid then
        TriggerEvent("InfinityAC:ban", "Spawn de armas detetado", _source)
    end
end)

RegisterNetEvent('InfinityAC:ClearVehicles', function()
    for _, v in pairs(GetAllVehicles()) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
end)

RegisterNetEvent('InfinityAC:ClearPeds', function()
    for _, v in pairs(GetAllPeds()) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
end)

RegisterNetEvent('InfinityAC:ClearObjects', function()
    for _, v in pairs(GetAllObjects()) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
end)

CreateThread(function()
    LoadBans()
end)

CreateThread(function()
    while true do
        Citizen.Wait(60 * 1000)
        LoadBans()
    end
end)

function LoadBans()
    MySQL.Async.fetchAll('SELECT * FROM InfinityAC', {}, function(identifiers)
        BanList = {}
        for i = 1, #identifiers, 1 do
            table.insert(BanList, {
                license = identifiers[i].license,
                license2 = identifiers[i].license2,
                steam = identifiers[i].steam,
                ip = identifiers[i].ip,
                discord = identifiers[i].discord,
                hwid = identifiers[i].hwid,
                fivem = identifiers[i].fivem,
                xbl = identifiers[i].xbl,
                liveid = identifiers[i].liveid,
                name = identifiers[i].name,
                date = identifiers[i].date,
                reason = identifiers[i].reason
            })
        end
    end)
end

MySQL.ready(function()
    LoadBans()
end)

function OnPlayerConnecting(playerName, setKickReason, deferrals)
    local _source = source
    deferrals.defer()
    Wait(0)
    deferrals.update(string.format("Bem-vindo %s. A verificar a sua identificação...", playerName))
    local identifiers = ExtractIdentifiers(_source)
    Wait(1500)
    for i = 1, #BanList, 1 do
        if (tostring(BanList[i].license)) == tostring(identifiers.license) or
            (tostring(BanList[i].license2)) == tostring(identifiers.license2) or
            (tostring(BanList[i].ip)) == tostring(identifiers.ip) or
            (tostring(BanList[i].discord)) == tostring(identifiers.discordid) or
            (tostring(BanList[i].xbl)) == tostring(identifiers.xbl) or
            (tostring(BanList[i].liveid)) == tostring(identifiers.live) or
            (tostring(BanList[i].fivem)) == tostring(identifiers.fivem) or
            (tostring(BanList[i].hwid)) == tostring(GetPlayerToken(_source, 0)) or
            (tostring(BanList[i].steam)) == tostring(identifiers.steam) then
            deferrals.done(string.format("Você foi banido permanentemente do servidor pelo Anticheat.\n\nMotivo: %s", BanList[i].reason))
        end
    end
    local playerIp = identifiers.ip
    if playerIp == nil then playerIp = GetPlayerEndpoint(_source) else playerIp = playerIp:gsub("ip:", "") end
    if not playerIp then deferrals.done("IP não encontrado. Reinicie o seu FiveM e tente novamente.") end
    PerformHttpRequest("http://ip-api.com/json/" .. playerIp .. "?fields=66846719", function(ERROR, DATA, RESULT)
        if DATA ~= nil then
            local jsonData = json.decode(DATA)
            if jsonData ~= nil then
                Proxy = jsonData["proxy"]
                Host = jsonData["hosting"]
                if Proxy or Host then
                    if InTable(Table["ProxyWhitelist"], identifiers.license) then
                        LogToDiscord(_source, "Connecting")
                        deferrals.done()
                    else
                        LogToDiscord(_source, "VPN")
                        deferrals.done("VPN detetada! Desligue a VPN e tente novamente. Em caso de erro ou necessidade de utilização de VPN abra ticket para ter o acesso autorizado. IP: "..playerIp)
                    end
                else
                    local playerHWID = GetPlayerToken(_source, 0)
                    if playerHWID == nil then
                        deferrals.done("HWID não encontrado. Reinicie o seu FiveM e tente novamente.")
                    else
                        LogToDiscord(_source, "Connecting")
                        deferrals.done()
                    end
                end
            else
                deferrals.done("Ocorreu um erro ao tentar verificar o seu IP. Tente novamente mais tarde.")
            end
        else
            deferrals.done("Ocorreu um erro ao tentar verificar o seu IP. Tente novamente mais tarde.")
        end
    end)
end

AddEventHandler('playerConnecting', OnPlayerConnecting)
