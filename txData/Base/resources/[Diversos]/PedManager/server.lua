function Startup(source, xPlayer)
    MySQL.query('SELECT peds FROM pedmanager WHERE identifier = ?', {
        xPlayer.identifier
    }, function(result)
        if result[1] then
            TriggerClientEvent('pedmanager:setup', source, json.decode(result[1].peds))
        else
            MySQL.query('INSERT INTO pedmanager (identifier, peds) VALUES (?, ?)', { xPlayer.identifier, "{}" })
        end
    end)
end

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    Startup(source, xPlayer)
end)

RegisterCommand("manualped", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    Startup(source, xPlayer)
end)

RegisterCommand('addped', function(source, args, rawCommand)
    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") and args[1] and tonumber(args[1]) and args[2] and args[3] then
        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
        MySQL.query('SELECT peds FROM pedmanager WHERE identifier = ?', {
            xTarget.identifier
        }, function(result)
            if result[1] then
                local data = json.decode(result[1].peds)
                for k, v in pairs(data) do
                    if v.model == args[2] then
                        xPlayer.showNotification("PED", "Esse membro já tem esse ped", 2000, "warning")
                        return
                    end
                end
                table.insert(data, { label = args[3], model = args[2] })
                MySQL.query('UPDATE pedmanager SET peds = ? WHERE identifier = ?',
                    { json.encode(data), xTarget.identifier })
                xPlayer.showNotification("PED", "Ped adicionado com sucesso", 2000, "success")
                TriggerClientEvent('pedmanager:setup', xTarget.source, data)
            else
                xPlayer.showNotification("PED", "O jogador em questão tem o valor indefinido", 2000, "warning")
            end
        end)
    end
end)

RegisterCommand('removeped', function(source, args, rawCommand)
    if exports["StaffManagement"]:isAllowedTo(source, "headadmin") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
        MySQL.query('SELECT peds FROM pedmanager WHERE identifier = ?', {
            xTarget.identifier
        }, function(result)
            if result[1] then
                local data = json.decode(result[1].peds)
                for k, v in pairs(data) do
                    if v.model == args[2] then
                        table.remove(data, k)
                        MySQL.query('UPDATE pedmanager SET peds = ? WHERE identifier = ?',
                            { json.encode(data), xTarget.identifier })
                        xPlayer.showNotification("PED", "Ped removido com sucesso", 2000, "success")
                        TriggerClientEvent('pedmanager:setup', xTarget.source, data)
                        return
                    end
                end
                xPlayer.showNotification("PED", "Esse membro não tem esse ped", 2000, "warning")
            else
                xPlayer.showNotification("PED", "O jogador em questão tem o valor indefinido", 2000, "warning")
            end
        end)
    end
end)
