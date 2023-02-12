AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetInvokingResource() then
        VerifyResStop(resourceName)
    end
end)

AddEventHandler('onClientResourceStop', function(resourceName)
    if resourceName == GetInvokingResource() then
        VerifyResStop(resourceName)
    end
end)

_G.AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetInvokingResource() then
        VerifyResStop(resourceName)
    end
end)

_G.AddEventHandler('onClientResourceStop', function(resourceName)
    if resourceName == GetInvokingResource() then
        VerifyResStop(resourceName)
    end
end)

function VerifyResStop(resourceName)
    TriggerServerEvent("InfinityAC:ban", "Tentativa de manipulação de recursos do servidor: ", resourceName)
    return CancelEvent()
end

local DarArma = GiveWeaponToPed
GiveWeaponToPed = function(ped, weaponhash, ...)
    TriggerServerEvent('InfinityAC:AddWeapon', weaponhash)
    return DarArma(ped, weaponhash, ...)
end

local RemoveArma = RemoveWeaponFromPed
RemoveWeaponFromPed = function(ped, weaponhash, ...)
    TriggerServerEvent('InfinityAC:RemoveWeapon', weaponhash)
    return RemoveArma(ped, weaponhash, ...)
end

local RemoveAllArma = RemoveAllPedWeapons
RemoveAllPedWeapons = function(ped, ...)
    TriggerServerEvent('InfinityAC:ClearWeapons')
    return RemoveAllArma(ped, ...)
end
