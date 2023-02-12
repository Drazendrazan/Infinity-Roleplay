function table.copy(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

ESX.RegisterServerCallback("radial:GetLicensesPlayerDoesntHave", function(source, cb, playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local tableToSend = {}
    if xPlayer == nil then
        cb(nil, nil)
    else
        local identifier = xPlayer.identifier
        MySQL.Async.fetchAll("SELECT licenses.type, licenses.label FROM licenses", {}, function(result)
            MySQL.Async.fetchAll("SELECT user_licenses.type FROM user_licenses WHERE user_licenses.owner = ?", {
                identifier
            }, function(result2)
                tableToSend = table.copy(result)
                for k, v in pairs(tableToSend) do
                    if v["type"] == "dmv" then
                        table.remove(tableToSend, k)
                    end
                end
                for k, v in pairs(tableToSend) do
                    if v["type"] == "drive" then
                        table.remove(tableToSend, k)
                    end
                end
                for k, v in pairs(tableToSend) do
                    if v["type"] == "drive_bike" then
                        table.remove(tableToSend, k)
                    end
                end
                for k, v in pairs(tableToSend) do
                    if v["type"] == "drive_truck" then
                        table.remove(tableToSend, k)
                    end
                end
                for i = 1, #result2 do
                    for j = 1, #result do
                        if result2[i]["type"] == result[j]["type"] then
                            for k, v in pairs(tableToSend) do
                                if v["type"] == result[j]["type"] then
                                    table.remove(tableToSend, k)
                                end
                            end
                        end
                    end
                end
                cb(tableToSend)
            end)
        end)
    end
end)

ESX.RegisterServerCallback("radial:getName", function(source, cb, playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer == nil then
        cb(nil)
    else
        local identifier = xPlayer.identifier
        MySQL.query("SELECT firstname, lastname FROM users WHERE identifier = ?", {
            identifier
        }, function(result)
            cb(result[1]["firstname"] .. " " .. result[1]["lastname"])
        end)
    end
end)