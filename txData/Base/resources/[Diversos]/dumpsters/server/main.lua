local robbableItemsCommon = {
    [1] = { chance = 10, id = 'aluminio', quantity = math.random(1, 3) },
    [2] = { chance = 9, id = 'plastico', quantity = math.random(1, 10) },
    [3] = { chance = 8, id = 'vidro', quantity = math.random(1, 5) },
    [4] = { chance = 7, id = 'chocolate', quantity = 1 },
    [5] = { chance = 6, id = 'ducttape', quantity = math.random(1, 5) },
    [6] = { chance = 5, id = 'ganza', quantity = 1 },
    [7] = { chance = 4, id = 'bread', quantity = 1 },
    [8] = { chance = 3, id = 'water', quantity = 1 },
    [9] = { chance = 3, id = 'fishingknife', quantity = math.random(1, 3) },
    [10] = { chance = 2, id = 'cigarrodeenrolar',quantity = 1 },
    [11] = { chance = 1, id = 'screwdriver', quantity = 1 },
}

local robbableItemsRare = {
    [1] = { chance = 10, id = 'cabomadeira', quantity = 1 },
    [2] = { chance = 8, id = 'blowtorch', quantity = 1 },
    [3] = { chance = 5, id = 'cuff', quantity = 1 },
    [4] = { chance = 3, id = 'key', quantity = 1 },
}

local robbableItemsSuperRare = {
    [1] = { chance = 10, id = 'lockpick', quantity = 1 },
}

local robbableItemsUltraRare = {
    [1] = { chance = 10, id = 'recipe_advancedlockpick', quantity = 1 },
    [2] = { chance = 7, id = 'recipe_lockpick', quantity = 1 },
    [3] = { chance = 8, id = 'advancedlockpick', quantity = 1 },
}

ESX.RegisterServerCallback(GetCurrentResourceName(), function(source, cb)
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}
    local itemchance = math.random(1, 100)
    if itemchance <= 5 then
        item = robbableItemsUltraRare[math.random(1, #robbableItemsUltraRare)] --item[32]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification("Lixos", 'Recebeste '  ..item.quantity.. 'x ' ..ESX.GetItemLabel(item.id), 2000, 'success')
    elseif itemchance <= 20 then
        item = robbableItemsSuperRare[math.random(1, #robbableItemsSuperRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        
        xPlayer.showNotification("Lixos", 'Recebeste '  ..item.quantity.. 'x ' ..ESX.GetItemLabel(item.id), 2000, 'success')
    elseif itemchance <= 50 then
        item = robbableItemsRare[math.random(1, #robbableItemsRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        
        xPlayer.showNotification("Lixos", 'Recebeste '  ..item.quantity.. 'x ' ..ESX.GetItemLabel(item.id), 2000, 'success')
    else 
        item = robbableItemsCommon[math.random(1, #robbableItemsCommon)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification("Lixos", 'Recebeste '  ..item.quantity.. 'x ' ..ESX.GetItemLabel(item.id), 2000, 'success')
    end
end)
