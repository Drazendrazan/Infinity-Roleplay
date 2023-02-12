local comida = {
    {prop = "prop_sandwich_01", name = "bread", type = "hunger", value = 200000},
    {prop = "ba_prop_club_water_bottle", name = "water", type = "thirst", value = 150000},
    {prop = "prop_sandwich_01", name = "sandes", type = "hunger", value = 250000},
    {prop = "prop_ecola_can", name = "sumo", type = "thirst", value = 250000},
    {prop = "prop_ecola_can", name = "cola", type = "thirst", value = 375000},
    {prop = "prop_ecola_can", name = "fanta", type = "thirst", value = 310000},
    {prop = "prop_ecola_can", name = "icetea", type = "thirst", value = 250000},
    {prop = "prop_sandwich_01", name = "chocolate", type = "hunger", value = 120000},
    {prop = "prop_sandwich_01", name = "pizza", type = "hunger", value = 350000},
    {prop = "prop_cs_burger_01", name = "burger", type = "hunger", value = 300000},
    {prop = "prop_ecola_can", name = "compal", type = "thirst", value = 250000},
}

for k, v in pairs(comida) do
    ESX.RegisterUsableItem(v.name, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(v.name, 1)
        TriggerClientEvent('esx_status:add', source, v.type, v.value)
        TriggerClientEvent('esx_basicneeds:onEat', source, v.prop)
    end)
end

local stress = {
    {name = "cigarro", type = "stress", value = 100000},
    {name = "cigarrodeenrolar", type = "stress", value = 150000},
    {name = "ganza", type = "stress", value = 250000},
}

for k, v in pairs(stress) do
    ESX.RegisterUsableItem(v.name, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem("isqueiro").count > 0 then
            xPlayer.removeInventoryItem(v.name, 1)
            TriggerClientEvent('esx_status:remove', source, v.type, v.value)
            TriggerClientEvent('esx_basicneeds:onEat', source)
        else
            TriggerClientEvent('esx:showNotification', source, 'Não tens isqueiro')
        end
    end)
end

ESX.RegisterUsableItem('folhadetabaco', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasItem("mortalha") and xPlayer.hasItem("filtro") then
        xPlayer.removeInventoryItem('folhadetabaco', 1)
        xPlayer.removeInventoryItem('filtro', 1)
        xPlayer.removeInventoryItem('mortalha', 1)
        xPlayer.addInventoryItem("cigarrodeenrolar", 1)
    else
        TriggerClientEvent('esx:showNotification', source, "CIGARRO", 'Não tens o necessário para enrolar um cigarro', 2000, 'warning')
    end
end)

ESX.RegisterUsableItem('onca', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("folhadetabaco", 10)
    TriggerClientEvent('esx:showNotification', source, "ONÇA", 'Recebeste 10 folhas de tabaco', 2000, 'success')
end)

ESX.RegisterUsableItem('mortalha', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasItem("mortalha") and xPlayer.hasItem("filtro") then
        xPlayer.removeInventoryItem('bagofdope', 1)
        xPlayer.removeInventoryItem('filtro', 1)
        xPlayer.removeInventoryItem('mortalha', 1)
        xPlayer.addInventoryItem("ganza", 1)
    else
        TriggerClientEvent('esx:showNotification', source, "GANZA", 'Não tens o necessário para enrolar uma ganza', 2000, 'warning')
    end
end)

ESX.RegisterUsableItem('cigarro', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasItem("isqueiro") then
        xPlayer.removeInventoryItem('cigarro', 1)
        TriggerClientEvent('esx_basicneeds:onSmoke:Cigarro', source)
    else
        TriggerClientEvent('esx:showNotification', source, "CIGARRO", 'Não tens isqueiro', 2000, 'warning')
    end
end)

ESX.RegisterUsableItem('cigarrodeenrolar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasItem("isqueiro") then
        xPlayer.removeInventoryItem('cigarrodeenrolar', 1)
        TriggerClientEvent('esx_basicneeds:onSmoke:Cigarro', source)
    else
        TriggerClientEvent('esx:showNotification', source, "CIGARRO", 'Não tens isqueiro', 2000, 'warning')
    end
end)

ESX.RegisterUsableItem('ganza', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.hasItem("isqueiro") then
        xPlayer.removeInventoryItem('ganza', 1)
        TriggerClientEvent('esx_basicneeds:onSmoke:Ganza', source)
    else
        TriggerClientEvent('esx:showNotification', source, "GANZA", 'Não tens isqueiro', 2000, 'warning')
    end
end)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
	if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
		return
	end

	TriggerClientEvent('esx_basicneeds:healPlayer', eventData.id)
end)