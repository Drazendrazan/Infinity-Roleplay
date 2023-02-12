RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType)
    local playerPed = PlayerPedId()
    local maxHealth = GetEntityMaxHealth(playerPed)

    if healType == 'small' then
        local health = GetEntityHealth(playerPed)
        local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
        SetEntityHealth(playerPed, newHealth)
    elseif healType == 'big' then
        SetEntityHealth(playerPed, maxHealth)
    end

    ESX.ShowNotification("SEM", TranslateCap('healed'), 2000, 'success')
end)

RegisterNetEvent('esx_ambulancejob:revive_1')
AddEventHandler('esx_ambulancejob:revive_1', function(source)
    Revive()
end)

function Revive()
    local playerPed = GetPlayerPed(-1)

    Citizen.CreateThread(function()
        RequestAnimSet("move_m@drunk@slightlydrunk")
        while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
            Citizen.Wait(0)
        end
        SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
        StartScreenEffect('DrugsMichaelAliensFightOut', 0, true)
        Citizen.Wait(10000)
        StartScreenEffect('DrugsMichaelAliensFightIn', 0, true)
    end)
end

RegisterNetEvent('esx_ambulancejob:Bandage')
AddEventHandler('esx_ambulancejob:Bandage', function(source)
    Bandage()
end)

function Bandage()
    local playerPed = GetPlayerPed(-1)

    Citizen.CreateThread(function()
        StopAllScreenEffects(GetPlayerPed(-1))
        ResetPedMovementClipset(playerPed, 0)
    end)
end
