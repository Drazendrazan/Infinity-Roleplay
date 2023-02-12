Citizen.CreateThread(function()
    local clawItems = { "claw2", "claw3", "claw4", "claw5", "claw6", "claw7", "claw8", "claw9" }
    for k, v in pairs(clawItems) do 
        ESX.RegisterUsableItem(v, function(source)
            TriggerClientEvent('consumables:client:UseClawToy', source, v)
        end)
    end
end)
