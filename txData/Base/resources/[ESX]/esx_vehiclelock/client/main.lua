RegisterNetEvent('esx_vehiclelock:use')
AddEventHandler('esx_vehiclelock:use', function(bool)
    ToggleVehicleLock(bool)
end)

RegisterKeyMapping("trancar", "Trancar/Destrancar o veículo", "keyboard", "U")

RegisterCommand("trancar", function ()
    ToggleVehicleLock()
end)

function ToggleVehicleLock(bool)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle

    if IsPedInAnyVehicle(playerPed, false) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
    end

    if not DoesEntityExist(vehicle) then
        return
    end

    ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

        if isOwnedVehicle then
            if bool ~= nil then
                if bool then
                    SetVehicleDoorsLocked(vehicle, 2)
                    PlayVehicleDoorCloseSound(vehicle, 1)
                    exports['mythic_progbar']:Progress({
                        name = "trancarcarro",
                        duration = 1000,
                        label = "A trancar o veículo...",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {},
                        prop = {},
                    }, function(wasCancelled)
                        ESX.ShowNotification("VEÍCULO", "Veículo trancado", 2000, 'success')
                    end)
                else
                    SetVehicleDoorsLocked(vehicle, 1)
                    PlayVehicleDoorOpenSound(vehicle, 0)
                    exports['mythic_progbar']:Progress({
                        name = "destrancarcarro",
                        duration = 1000,
                        label = "A destrancar o veículo...",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {},
                        prop = {},
                    }, function(wasCancelled)
                        ESX.ShowNotification("VEÍCULO", "Veículo destrancado", 2000, 'success')
                    end)

                end
            else
                local lockStatus = GetVehicleDoorLockStatus(vehicle)

                if lockStatus == 1 then -- unlocked
                    SetVehicleDoorsLocked(vehicle, 2)
                    PlayVehicleDoorCloseSound(vehicle, 1)
                    exports['mythic_progbar']:Progress({
                        name = "trancarcarro",
                        duration = 1000,
                        label = "A trancar o veículo...",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {},
                        prop = {},
                    }, function(wasCancelled)
                        ESX.ShowNotification("VEÍCULO", "Veículo trancado", 2000, 'success')
                    end)

                    ESX.ShowNotification("VEÍCULO", "Veículo trancado", 2000, 'success')
                elseif lockStatus == 2 then -- locked
                    SetVehicleDoorsLocked(vehicle, 1)
                    PlayVehicleDoorOpenSound(vehicle, 0)
                    exports['mythic_progbar']:Progress({
                        name = "destrancarcarro",
                        duration = 1000,
                        label = "A destrancar o veículo...",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {},
                        prop = {},
                    }, function(wasCancelled)
                        ESX.ShowNotification("VEÍCULO", "Veículo destrancado", 2000, 'success')
                    end)
                end
            end
        end

    end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end
