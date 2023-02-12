local robbableItemsCommon = { -- MATERIAIS E COISAS BANAIS DE CRIME QUE VALEM POUCO - ACTUALIZADO 28/05/2020
    [1] = { chance = 1, id = 'cigarrodeenrolar', quantity = math.random(1, 2) },
    [2] = { chance = 2, id = 'ganza', quantity = math.random(1, 2) },
    [3] = { chance = 3, id = 'blowtorch', quantity = 1 },
    [4] = { chance = 4, id = 'bagofdope', quantity = math.random(10, 20) },
    [5] = { chance = 5, id = 'bagofmeth', quantity = math.random(5, 10) },
    [6] = { chance = 6, id = 'chocolate', quantity = math.random(1, 3) },
    [7] = { chance = 7, id = 'onca', quantity = 1 },
    [8] = { chance = 8, id = 'mortalha', quantity = math.random(1, 2) },
    [9] = { chance = 9, id = 'filtro', quantity = math.random(1, 2) },
    [10] = { chance = 3, id = 'fishingknife', quantity = math.random(1, 3) },
    [11] = { chance = 10, id = 'icetea', quantity = 2 },
}

local robbableItemsRare = { -- MATERIAIS DE CRAFT DO CRIME - ACTUALIZADO 28/05/2020
    [1] = { chance = 1, id = 'seringa', quantity = math.random(1, 3) },
    [2] = { chance = 2, id = 'screw', quantity = math.random(1, 10) },
    [3] = { chance = 3, id = 'nail', quantity = math.random(1, 10) },
    [4] = { chance = 4, id = 'vidro', quantity = math.random(1, 5) },
    [5] = { chance = 5, id = 'plastico', quantity = math.random(1, 6) },
    [6] = { chance = 6, id = 'scrap', quantity = math.random(1, 4) },
    [7] = { chance = 7, id = 'pizza', quantity = 1 },
    [8] = { chance = 8, id = 'sandes', quantity = 1 },
    [9] = { chance = 8, id = 'polvora', quantity = 1 },
    [10] = { chance = 9, id = 'lithium', quantity = math.random(1, 3) },
    [11] = { chance = 10, id = 'acetone', quantity = math.random(1, 3) },
}

local robbableItemsSuperRare = { -- ARMAS DE CORPO A CORPO, ALGUMAS COISAS DO CRIME
    [1] = { chance = 1, id = 'bandage', quantity = math.random(1, 4) },
    [2] = { chance = 2, id = 'key', quantity = 1 },
    [3] = { chance = 3, id = 'cuff', quantity = 3 },
    [4] = { chance = 4, id = 'fixkit', quantity = math.random(1, 3) },
    [5] = { chance = 5, id = 'anel', quantity = math.random(1, 3) },
    [5] = { chance = 5, id = 'gold_chain', quantity = math.random(1, 3) },
    [6] = { chance = 6, id = 'rolex', quantity = math.random(1, 2) },
    [7] = { chance = 7, id = 'diamond', quantity = 1 },
    [8] = { chance = 8, id = 'lockpick', quantity = 1 },
    [9] = { chance = 9, id = 'cartucho', quantity = math.random(1, 2) },
    [10] = { chance = 9, id = 'Pentrite', quantity = math.random(1, 2) },
    [11] = { chance = 10, id = 'advancedlockpick', quantity = 1 },
    [12] = { chance = 10, id = 'cao_arma', quantity = 1},
    [13] = { chance = 10, id = 'tambor_arma', quantity = 1},
    [14] = { chance = 10, id = 'cano_arma', quantity = 1},
    [15] = { chance = 10, id = 'gatilho', quantity = 1},
    [16] = { chance = 10, id = 'armacao_pistola', quantity = math.random(1, 4)},
    [17] = { chance = 10, id = 'arma_mola', quantity = math.random(1, 3)},
    [18] = { chance = 10, id = 'percursor', quantity = 1},
    [19] = { chance = 10, id = 'semente_femea', quantity = 1},
}

local robbableItemsUltraRare = { -- BLUEPRINTS DE ARMAS; COISAS MUITO RARAS OU QUE VALEM MUITO - RODAR 15 a 15 dias
    [1] = { chance = 1, id = 'cutter', quantity = 1 }, --RODAR SE QUISER MUITO
    [2] = { chance = 2, id = 'recipe_pistol_ammo', quantity = 1 }, --RODAR SE QUISER MUITO
    [3] = { chance = 3, id = 'recipe_smg_ammo', quantity = 1 },
    [4] = { chance = 4, id = 'recipe_lockpick', quantity = 1 },
    [5] = { chance = 5, id = 'recipe_pentrite', quantity = 1 },
    [6] = { chance = 6, id = 'recipe_advancedlockpick', quantity = 1 }, --
    [7] = { chance = 7, id = 'semente_macho', quantity = 1 },
    [8] = { chance = 7, id = 'pistola', quantity = 1 },
    [9] = { chance = 8, id = 'recipe_weapon_pistolsns', quantity = 1 },
    [10] = { chance = 9, id = 'recipe_methlab', quantity = 1 },
    [11] = { chance = 10, id = 'cpu', quantity = 1 }, -- --
}

ESX.RegisterServerCallback('Infinity:getJobsOnline', function(source, cb)
    local extendedplayers = ESX.GetExtendedPlayers("job", "police")
    cb(#extendedplayers)
end)

ESX.RegisterUsableItem('advancedlockpick', function(source)
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then
        xPlayer.showNotification('ASSALTO', 'A tentar assaltar uma casa sendo da DPLS?', 2000, 'error')
    else
        TriggerClientEvent('InfinityHouseRobberies:attempt', source, xPlayer.getInventoryItem('advancedlockpick').count)
    end
end)

RegisterServerEvent("Infinity:log")
AddEventHandler("Infinity:log", function (houseId)
    exports["Pack"]:LogToDiscord(source, "https://discord.com/api/webhooks/1043180589890682900/8JcCPWOsA_sLv1FeHMwCxnheHcLGWOFtFOiMwPRbFIMw3Mf-aoSQyTgMHkSeEZ9IOOUN", "Assaltos a Casas", "O jogador "..GetPlayerName(source).." assaltou a casa " .. houseId)
end)

RegisterCommand('arrombar', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then
        TriggerClientEvent('InfinityHouseRobberies:policeattempt', source)
    end
end)


RegisterServerEvent('InfinityHouseRobberies:removeLockpick')
AddEventHandler('InfinityHouseRobberies:removeLockpick', function()
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('advancedlockpick', 1)
    --TriggerClientEvent('chatMessage', source, '^1Your lockpick has bent out of shape')
    --TriggerClientEvent('notification', source, 'Teu lockpick esta torto.', 2)
end)

RegisterServerEvent('InfinityHouseRobberies:giveMoney')
AddEventHandler('InfinityHouseRobberies:giveMoney', function()
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = math.random(2300, 4000)
    xPlayer.addMoney(cash)
    --TriggerClientEvent('chatMessage', source, '^4You have found $'..cash)
    --TriggerClientEvent('notification', source, 'You found $'..cash)
end)

RegisterServerEvent('InfinityHouseRobberies:server:search')
AddEventHandler('InfinityHouseRobberies:server:search', function(id, table)
    TriggerClientEvent('InfinityHouseRobberies:client:search', -1, id, table)
end)

RegisterServerEvent('InfinityHouseRobberies:searchItem')
AddEventHandler('InfinityHouseRobberies:searchItem', function(id)
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}
    local itemchance = math.random(1, 100)
    if itemchance == 10 then
        item = robbableItemsUltraRare[math.random(1, #robbableItemsUltraRare)] --item[32]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Assalto','Encontras-te ' .. item.quantity..'x ' ..item.id, 2000, "success")
    elseif itemchance <= 30 then
        item = robbableItemsSuperRare[math.random(1, #robbableItemsSuperRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Assalto','Encontras-te ' .. item.quantity..'x ' ..item.id, 2000, "success")
    elseif itemchance <= 60 then
        item = robbableItemsRare[math.random(1, #robbableItemsRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Assalto','Encontras-te ' .. item.quantity..'x ' ..item.id, 2000, "success")
    else 
        item = robbableItemsCommon[math.random(1, #robbableItemsCommon)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Assalto','Encontras-te ' .. item.quantity..'x ' ..item.id, 2000, "success")
    end
end)
