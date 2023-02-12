local webhook = "https://discord.com/api/webhooks/1039684654686543905/26Dh64g0JBLXPa8yl0_cotbCjEfwZ33T-m6TOCbOM_ejKj4NZP34YQ9nNXIuNx4EYxvQ"

RegisterNetEvent("esx:onPlayerDeath")
AddEventHandler("esx:onPlayerDeath", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local name = GetPlayerName(_source)
    local xinventory = xPlayer.getInventory()
    local inventory = {}
    local weapons = {}
    for i = 1, #xinventory, 1 do
        if xinventory[i].amount > 0 then
            table.insert(inventory, {
                name = xinventory[i].name,
                count = xinventory[i].amount,
                info = xinventory[i].info
            })
        end
    end
    MySQL.insert('INSERT INTO inventorysaver (identifier, name, inventory, loadout) VALUES (?, ?, ?, ?) ',
        { identifier, name, json.encode(inventory), json.encode(weapons) }, function(id)
        local log = "**Info:**\n\tAção: Salvo\n\tID do inventário restaurado: "..id.."\n\n```Inventário```"
        for k, v in pairs(inventory) do
            if v.info then
                log = log .. "\n\tItem: " .. v.name .. " | Quantidade: " .. v.count .. " | Informações: " .. v.info
            else
                log = log .. "\n\tItem: " .. v.name .. " | Quantidade: " .. v.count
            end
        end
        exports["Pack"]:LogToDiscord(_source, webhook
            , "InventorySaver", log)
    end)
end)

RegisterCommand("rinventory", function(source, args, raw)
    if not args[1] or not tonumber(args[1]) then return end
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "headadmin" or xPlayer.getGroup() == "owner" then
        MySQL.single('SELECT * FROM inventorysaver WHERE ID = ?', { args[1] }, function(result)
            if result then
                local xTarget = ESX.GetPlayerFromIdentifier(result.identifier)
                if xTarget then
                    local inventory = json.decode(result.inventory)
                    for i = 1, #inventory, 1 do
                        if inventory[i].count > 0 then
                            xTarget.addInventoryItem(inventory[i].name, inventory[i].count)
                        end
                    end
                    TriggerClientEvent('esx:showNotification', xTarget.source, "INVENTORY SAVER",
                        "O inventário com o ID #" .. args[1] .. " foi restaurado com sucesso.", 2000, "success")
                    local log = "**Info:**\n\tAção: Restaurado\n\tID do inventário restaurado: "..args[1].."\n\tRestaurado por: " .. GetPlayerName(_source)
                    exports["Pack"]:LogToDiscord(xTarget.source, webhook
                        , "InventorySaver", log)
                else
                    TriggerClientEvent('esx:showNotification', _source, "INVENTORY SAVER", "O jogador não está online."
                        , 2000, "error")
                end
            else
                xPlayer.showNotification("INVENTORY SAVER", "ID não encontrado", 2500, "error")
            end
        end)
    end
end)
