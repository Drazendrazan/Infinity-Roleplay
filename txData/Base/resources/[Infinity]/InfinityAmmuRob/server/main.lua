local min_police = 5
local timeout = 600 * 1000

local robbableItemsVeryCommon= { -- tudo oq for peças de armas
    [1] = {chance = 1, id = 'armacao_pistola', name = 'Prego', quantity = math.random(4, 6)},
    [2] = {chance = 2, id = 'colete', name = 'Prego', quantity = 1},
    [3] = {chance = 3, id = 'cao_arma', name = 'Faca de Pesca', quantity = math.random(2, 4)},
    [4] = {chance = 4, id = 'percursor', name = 'Faca de Pesca', quantity = math.random(1, 2)},
    [5] = {chance = 5, id = 'arma_gatilho', name = 'Saco de Erva', quantity = math.random(1, 3)},
    [6] = {chance = 6, id = 'cano_arma', name = 'Saco de Erva', quantity = 1},
    [7] = {chance = 7, id = 'arma_mola', name = 'Saco de Erva', quantity = math.random(1, 3)},
    [8] = {chance = 8, id = 'Pentrite', name = 'Saco de Erva', quantity = math.random(2, 4)},
    [9] = {chance = 9, id = 'polvora', name = 'Saco de Erva', quantity = math.random(3, 6)},

}

local robbableItemsCommon= { --  sns
    [1] = {chance = 1, id = 'pistola_sns', name = 'Prego', quantity = 1},
    [2] = {chance = 2, id = 'kevlar', name = 'Prego', quantity = math.random(1, 4)},
    [3] = {chance = 3, id = 'recipe_pistol_ammo', name = 'Faca de Pesca', quantity = 1},
    [4] = {chance = 4, id = 'recipe_smg_ammo', name = 'Faca de Pesca', quantity = 1},
    [5] = {chance = 5, id = 'recipe_rifle_ammo', name = 'Saco de Erva', quantity = 1},
	[6] = {chance = 6, id = 'recipe_pentrite', name = 'Saco de Erva', quantity = 1},

}

local robbableItemsSuperRare= { -- 9mm, heavy
	[1] = {chance = 1, id = 'pistola', name = 'Punhal', quantity = 1},
    [2] = {chance = 2, id = 'heavy_pistol', name = 'Punhal', quantity = 1},
    [3] = {chance = 3, id = 'recipe_colete', name = 'Receita Vaso', quantity = 1},
    [4] = {chance = 4, id = 'recipe_weapon_switchblade', name = 'Saco de Erva', quantity = 1},
    [5] = {chance = 5, id = 'pistol_suppressor', name = 'Saco de Erva', quantity = 1},
    [6] = {chance = 6, id = 'recipe_pistol_suppressor', name = 'Saco de Erva', quantity = 1},
    [7] = {chance = 7, id = 'switchblade', name = 'Saco de Erva', quantity = 1},
}

local robbableItemsUltraRare= {  -- bps
	[1] = {chance = 1, id = 'recipe_weapon_pistolsns', name = 'Munição para Pistola', quantity = 1},
    [2] = {chance = 2, id = 'recipe_weapon_pistol', name = 'Munição para Pistola', quantity = 1},
	[3] = {chance = 3, id = 'recipe_weapon_heavypistol', name = 'Munição para Pistola', quantity = 1},
    [4] = {chance = 4, id = 'bzgas', name = 'Granada de Gás', quantity = math.random(1, 2)},
}

ESX.RegisterServerCallback('Infinity:getJobsOnline', function(source, cb)
    local extendedplayers = ESX.GetExtendedPlayers("job", "police")
    cb(#extendedplayers)
end)

RegisterServerEvent('InfinityAmmuRob:start')
AddEventHandler('InfinityAmmuRob:start', function(copsOnDuty, store)
    exports["Pack"]:LogToDiscord(source, "https://discord.com/api/webhooks/1043265334439850095/Oj3Bd8Tj-n8n9nKVFHDITam2CUHXYkcTEfDTRX8T4MP7Mu6K6u_R6bFoKQ8ordhzA78G", "Assaltos a Ammunation", "O jogador "..GetPlayerName(source).." assaltou uma ammunation")
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
    if Config.AmmuStores[store].canRob then
         if copsOnDuty >= min_police then
            TriggerClientEvent("InfinityAmmuRob:start", _source, store)
            Config.AmmuStores[store].canRob = false
            --Restart(_source)
         else
            xPlayer.showNotification("Assalto Ammunation", "Policia Insuficiente", 2000, "error")
        end
    else
        xPlayer.showNotification("Assalto Ammunation", "A loja foi assaltada recentemente!", 2000, "error")
    end

    

end)

--[[function Restart(_source)
    canRob = false
    Wait(timeout)
    TriggerClientEvent("InfinityAmmuRob:reset", _source)
    canRob = true
end]]

RegisterServerEvent('InfinityAmmuRob:giveMoney')
AddEventHandler('InfinityAmmuRob:giveMoney', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local cash = math.random(2500, 2500)
    xPlayer.addMoney(cash)
    Wait(2000)
end)

RegisterServerEvent('InfinityAmmuRob:giveItem')
AddEventHandler('InfinityAmmuRob:giveItem', function()
 local source = tonumber(source)
 local item = {}
 local xPlayer = ESX.GetPlayerFromId(source)
 local itemchance = math.random(1,100)
    if itemchance <= 5 then
        item = robbableItemsUltraRare[math.random(1, #robbableItemsUltraRare)]     --item[32]
        xPlayer.addInventoryItem(item.id, item.quantity)
    elseif itemchance <= 20 then
        item = robbableItemsSuperRare[math.random(1, #robbableItemsSuperRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
    elseif itemchance <= 50 then
        item = robbableItemsCommon[math.random(1, #robbableItemsCommon)]
        xPlayer.addInventoryItem(item.id, item.quantity)
    else
        item = robbableItemsVeryCommon[math.random(1, #robbableItemsVeryCommon)]
        xPlayer.addInventoryItem(item.id, item.quantity)
    end
end)
