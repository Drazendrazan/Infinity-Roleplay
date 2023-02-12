ESX = nil
hunger = 0
thirst = 0
stress = 0
voice = 2
talkingRadio = false

AddEventHandler("pma-voice:radioActive", function(radioTalking) talkingRadio = radioTalking end)

RegisterNetEvent("pma-voice:setTalkingMode")
AddEventHandler("pma-voice:setTalkingMode", function(mode)
    voice = mode
end)

RegisterNetEvent("esx_status:onTick")
AddEventHandler("esx_status:onTick", function()
    TriggerEvent("esx_status:getStatus", 'hunger', function(status)
        hunger = status.val / 10000
    end)
    TriggerEvent("esx_status:getStatus", 'thirst', function(status)
        thirst = status.val / 10000
    end)
    TriggerEvent("esx_status:getStatus", 'stress', function(status)
        stress = status.val / 10000
    end)
end)

Citizen.CreateThread(function()
    local ped
    while true do
        ped = PlayerPedId()
        SendNUIMessage({
            setHud = true,
            health = (GetEntityHealth(ped) - 100),
            armour = GetPedArmour(ped),
            hunger = hunger,
            thirst = thirst,
            stress = stress,
            stamina = (100 - GetPlayerSprintStaminaRemaining(PlayerId())),
            voice = voice,
            radioOn = LocalPlayer.state.radioChannel,
            isTalking = NetworkIsPlayerTalking(PlayerId()),
            talkingRadio = talkingRadio
        })
        Citizen.Wait(300)
    end
end)

Citizen.CreateThread(function()
    local ped
    local vehicle
    local radar = true
    while true do
        ped = PlayerPedId()
        vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle and (GetPedInVehicleSeat(vehicle, -1) == ped or GetPedInVehicleSeat(vehicle, 0) == ped) then
            carRPM                    = GetVehicleCurrentRpm(vehicle)
            carSpeed                  = GetEntitySpeed(vehicle)
            carGear                   = GetVehicleCurrentGear(vehicle)
            carIL                     = GetVehicleIndicatorLights(vehicle)
            carLS_r, carLS_o, carLS_h = GetVehicleLightsState(vehicle)

            SendNUIMessage({
                ShowHud             = true,
                CurrentCarRPM       = carRPM,
                CurrentCarGear      = carGear,
                CurrentCarSpeed     = carSpeed,
                CurrentCarKmh       = math.ceil(carSpeed * 3.6),
                CurrentCarMph       = math.ceil(carSpeed * 2.236936),
                CurrentCarIL        = carIL,
                CurrentCarLS_r      = carLS_r,
                CurrentCarLS_o      = carLS_o,
                CurrentCarLS_h      = carLS_h,
                CurrentCarHandbrake = GetVehicleHandbrake(vehicle),
                CurrentCarBrake     = (GetVehicleWheelSpeed(vehicle, 0) == 0.0) and (carSpeed > 0.0),
                PlayerID            = GetPlayerServerId(GetPlayerIndex()),
                CurrentCarFuel      = GetVehicleFuelLevel(vehicle)
            })
            if not radar then
                DisplayRadar(true)
                radar = true
            end
        else
            if radar then
                DisplayRadar(false)
                radar = false
            end
            SendNUIMessage({ HideHud = true })
            Citizen.Wait(1000)
        end
        Citizen.Wait(50)
    end
end)
