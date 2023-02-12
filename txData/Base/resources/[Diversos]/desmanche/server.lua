RegisterServerEvent("desmanche:sync")
AddEventHandler("desmanche:sync", function (vehicle, state)
    TriggerClientEvent("desmanche:sync", -1, vehicle, state)
end)

RegisterServerEvent("desmanche:porta")
AddEventHandler("desmanche:porta", function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("arma_mola", math.random(2, 4))
    xPlayer.addInventoryItem("aluminio", math.random(5, 15))
    xPlayer.addInventoryItem("screw", math.random(10, 20))
end)

RegisterServerEvent("desmanche:roda")
AddEventHandler("desmanche:roda", function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("screw", math.random(2, 5))
    xPlayer.addInventoryItem("aluminio", math.random(2, 4))
end)

RegisterServerEvent("desmanche:other")
AddEventHandler("desmanche:other", function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("lithium", math.random(2, 4))
    xPlayer.addInventoryItem("acetone", math.random(2, 4))
    xPlayer.addInventoryItem("screw", math.random(10, 15))
    xPlayer.addInventoryItem("nail", math.random(5, 15))
end)
