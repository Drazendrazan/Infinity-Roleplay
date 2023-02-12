RegisterServerEvent('qs-shops:deleteCustomShop')
AddEventHandler('qs-shops:deleteCustomShop', function(shopname, sourceA)
    local src = sourceA or source
    local Player
    if ESX then 
        Player = ESX.GetPlayerFromId(src)
        identifier = Player.identifier
    else 
        Player = QBCore.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    end

    local coords = (GetEntityCoords(GetPlayerPed(src)))
    local closestShop = nil
    local closestShopData = {}
    for k,v in pairs(Config.Locations) do 
        local loc = v['coords']
        if #(coords - vector3(loc.x, loc.y, loc.z)) < 5 then 
            closestShop = k
            closestShopData = v
            break
        end
    end

    if closestShop then 
        if Config.Locations[closestShop]['cid'] == identifier then

            MySQL.Sync.execute('DELETE FROM qs_customshops WHERE shopname = ?', { closestShop })
            
            for k,v in pairs(Config.Locations[closestShop]["products"]) do 
                if Config.Locations[closestShop]["products"][k].amount > 0 then 
                    Player.addInventoryItem(Config.Locations[closestShop]["products"][k].name, Config.Locations[closestShop]["products"][k].amount)
                end
            end

            Config.Locations[closestShop] = nil
            TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_DELETE") ..closestShop, 'success')
            TriggerClientEvent('qs-shops:SyncOnClient', -1, Config.Locations)
        else
            if Player.getJob().name == 'police' then
                MySQL.Sync.execute('DELETE FROM qs_customshops WHERE shopname = ?', { closestShop })
            
                for k,v in pairs(Config.Locations[closestShop]["products"]) do 
                    if Config.Locations[closestShop]["products"][k].amount > 0 then 
                        Player.addInventoryItem(Config.Locations[closestShop]["products"][k].name, Config.Locations[closestShop]["products"][k].amount)
                    end
                end
    
                Config.Locations[closestShop] = nil
                TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_SEIZED"), 'success')
                TriggerClientEvent('qs-shops:SyncOnClient', -1, Config.Locations)
                
            else
                TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NOT_OWNER"), 'success')
            end
        end
    else
        TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NO_SHOPS"), 'success')
    end
end)


-- Create custom shop

RegisterServerEvent('qs-shops:createCustomShop')
AddEventHandler('qs-shops:createCustomShop', function(shopname, sourceA)
    local src = sourceA or source
    local identifier
    local Player
    if ESX then 
        Player = ESX.GetPlayerFromId(src)
        identifier = Player.identifier
    else 
        Player = QBCore.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    end

    if Player and identifier then
        local name = GetFirstLastName(identifier)
        if shopname then
            local shopname = shopname
    
            local ped = GetPlayerPed(src)
            local coords = GetEntityCoords(ped)

            local shopData = {
                ['cid'] = identifier,
                ['ownerName'] = ''..name[1]..' '..name[2]..'',
                ['shopname'] = shopname,
                ['coords'] = coords,
                ['heading'] = GetEntityHeading(ped),
                ['products'] = {}
            }
    
            if Config.Locations[shopname] == nil then
                local closestShop = nil
                for k,v in pairs(Config.Locations) do 
                    local loc = v['coords']
                    if #(coords - vector3(loc.x, loc.y, loc.z)) < Config.MinimumDistance then 
                        closestShop = k
                        break
                    end
                end
    
                if not closestShop then
                    Config.Locations[shopname] = shopData
    
                    MySQL.Sync.execute('INSERT INTO qs_customshops (cid, shopname, shopdata) VALUES (?, ?, ?)', {
                        identifier,
                        shopname,
                        json.encode(shopData)
                    })
    
                    TriggerClientEvent('qs-shops:NewShopBlip', -1, shopData)
                    TriggerClientEvent('qs-shops:SyncOnClient', -1, Config.Locations)
    
                else
                    TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_ANOTHER_SHOP"), 'error')
                end
            else
                TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NAME_ALREADY"), 'error')
            end
        else 
            TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NAME_NEEDED"), 'error')
        end
    else 
        print('qs-shops: Error getting xPlayer or Player')
    end
end)

-- Add item to shop

RegisterServerEvent('qs-shops:addItemToCustomShop')
AddEventHandler('qs-shops:addItemToCustomShop', function(name, amount, price, sourceA)
    local src = sourceA or source
    local Player
    if ESX then 
        Player = ESX.GetPlayerFromId(src)
        identifier = Player.identifier
    else 
        Player = QBCore.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    end

    local itemName = name
    local itemAmount = tonumber(amount)
    local itemPrice = tonumber(price)

    local coords = (GetEntityCoords(GetPlayerPed(src)))
    local closestShop = nil
    for k,v in pairs(Config.Locations) do 
        local loc = v['coords']
        if #(coords - vector3(loc.x, loc.y, loc.z)) < 5 then 
            closestShop = k
            break
        end
    end

    if Config.Framework == 'ESX' then 
        if Config.EnableSellWeapons == false and QS.Shared.Items[itemName].type == 'weapon' then 
            TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NO_WEAPONS"), 'error')
        else
            if closestShop ~= nil then 
                if Config.Locations[closestShop]['cid'] == identifier then
                    local item = Player.getInventoryItem(itemName)
                    if item.count >= itemAmount then
                        Player.removeInventoryItem(itemName, itemAmount)                    
                        local isExisting = false
                        for k,v in pairs(Config.Locations[closestShop]["products"]) do 
                            if v.name == itemName then 
                                Config.Locations[closestShop]["products"][k].price = itemPrice
                                Config.Locations[closestShop]["products"][k].amount = v.amount + itemAmount
                                isExisting = true
                                break
                            end
                        end
    
                        if not isExisting then 
                            local prodCount = #Config.Locations[closestShop]["products"]+1
                            Config.Locations[closestShop]["products"][prodCount] = {
                                name = itemName,
                                price = itemPrice,
                                amount = itemAmount,
                                info = {},
                                type = "item",
                                slot = prodCount,
                            }
                        end
    
                        MySQL.Sync.execute('UPDATE qs_customshops SET shopdata = ? WHERE shopname = ?', { json.encode(Config.Locations[closestShop]), closestShop })
                    
                        TriggerClientEvent('qs-shops:SetShopItems', -1, closestShop, Config.Locations[closestShop]["products"])
    
                        TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_ADDED").." "..itemAmount.." "..itemName.." "..Lang("PLAYERSHOP_TO").." "..closestShop.." "..Lang("PLAYERSHOP_FOR").." "..itemPrice.." "..Lang("PLAYERSHOP_EACH"), 'success')
                    else
                        -- DOES NOT HAVE ITEM
                        TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_REQUIRED_ITEM"), 'error')
                    end
                else
                    TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NOT_OWNER"), 'error')
                end
            else
                TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NO_SHOPS"), 'error')
            end
        end
    elseif Config.Framework == 'QBCore' then 
        if Config.EnableSellWeapons == false and QBCore.Shared.Items[itemName].type == 'weapon' then 
            TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NO_WEAPONS"), 'error')
        else
            if closestShop ~= nil then 
                if Config.Locations[closestShop]['cid'] == identifier then
                    local item = Player.Functions.GetItemByName(itemName)
                    if item.amount >= itemAmount then
                        Player.Functions.RemoveItem(itemName, itemAmount)                 
                        local isExisting = false
                        for k,v in pairs(Config.Locations[closestShop]["products"]) do 
                            if v.name == itemName then 
                                Config.Locations[closestShop]["products"][k].price = itemPrice
                                Config.Locations[closestShop]["products"][k].amount = v.amount + itemAmount
                                isExisting = true
                                break
                            end
                        end
    
                        if not isExisting then 
                            local prodCount = #Config.Locations[closestShop]["products"]+1
                            Config.Locations[closestShop]["products"][prodCount] = {
                                name = itemName,
                                price = itemPrice,
                                amount = itemAmount,
                                info = {},
                                type = "item",
                                slot = prodCount,
                            }
                        end
    
                        MySQL.Sync.execute('UPDATE qs_customshops SET shopdata = ? WHERE shopname = ?', { json.encode(Config.Locations[closestShop]), closestShop })
                    
                        TriggerClientEvent('qs-shops:SetShopItems', -1, closestShop, Config.Locations[closestShop]["products"])
    
                        TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_ADDED").." "..itemAmount.." "..itemName.." "..Lang("PLAYERSHOP_TO").." "..closestShop.." "..Lang("PLAYERSHOP_FOR").." "..itemPrice.." "..Lang("PLAYERSHOP_EACH"), 'success')
                    else
                        -- DOES NOT HAVE ITEM
                        TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_REQUIRED_ITEM"), 'error')
                    end
                else
                    TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NOT_OWNER"), 'error')
                end
            else
                TriggerClientEvent("qs-shops:sendMessage", src, Lang("PLAYERSHOP_NO_SHOPS"), 'error')
            end
        end
    end
end)