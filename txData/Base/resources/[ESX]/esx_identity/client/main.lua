local loadingScreenFinished = false
local guiEnabled = false
local timecycleModifier = "hud_def_blur"

RegisterNetEvent('esx_identity:alreadyRegistered', function()
    while not loadingScreenFinished do Wait(100) end
    TriggerEvent('esx_skin:playerRegistered')
end)

RegisterNetEvent('esx_identity:setPlayerData', function(data)
    SetTimeout(1, function()
        ESX.SetPlayerData("name", ('%s %s'):format(data.firstName, data.lastName))
        ESX.SetPlayerData('firstName', data.firstName)
        ESX.SetPlayerData('lastName', data.lastName)
        ESX.SetPlayerData('dateofbirth', data.dateOfBirth)
        ESX.SetPlayerData('sex', data.sex)
        ESX.SetPlayerData('height', data.height)
    end)
end)

AddEventHandler('esx:loadingScreenOff', function()
    loadingScreenFinished = true
end)

RegisterNUICallback("invaliddate", function(data, cb)
    ESX.ShowNotification("Invalid date of birth")
    cb(1)
end)

function EnableGui(state)
    guiEnabled = state

    if state then
        SetTimecycleModifier(timecycleModifier)
    else
        ClearTimecycleModifier()
    end

    SendNUIMessage({ type = "enableui", enable = state })
    SetNuiFocus(state, state)
end

RegisterNetEvent('esx_identity:showRegisterIdentity', function()
    TriggerEvent('esx_skin:resetFirstSpawn')

    if not ESX.PlayerData.dead then EnableGui(true) end
end)

RegisterNUICallback('register', function(data, cb)
    ESX.TriggerServerCallback('esx_identity:registerIdentity', function(callback)
        if callback then
            ESX.ShowNotification("REGISTO", TranslateCap('thank_you_for_registering'), 2000, 'success')
            EnableGui(false)
            TriggerEvent('esx_skin:playerRegistered')
        end
    end, data)
end)