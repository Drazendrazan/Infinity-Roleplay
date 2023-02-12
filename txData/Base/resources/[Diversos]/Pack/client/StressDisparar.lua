Citizen.CreateThread(function ()
    local sleep
    local ped
    while true do
        sleep = 1000
        ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            if IsPedShooting(ped) then
                if IsPedCurrentWeaponSilenced(ped) then
                    TriggerEvent('esx_status:add', 'stress', 500)
                else
                    TriggerEvent('esx_status:add', 'stress', 2500)
                end
            end
            sleep = 5
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function ()
    while true do
        ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            TriggerEvent('esx_status:add', 'stress', 50)
        end
        Citizen.Wait(5000)
    end
end)