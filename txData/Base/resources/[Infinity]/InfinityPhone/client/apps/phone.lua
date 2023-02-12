Call = {}

function IsInCall()
    return (Call.number ~= nil and Call.status == 1) or (Call.number ~= nil and Call.status == 0 and Call.initiator)
end

RegisterNetEvent('InfinityPhone:client:CreateCall')
AddEventHandler('InfinityPhone:client:CreateCall', function(number)
    Call.number = number
    Call.status = 0
    Call.initiator = true

    PhonePlayCall(false)

    SetNuiFocus(false, false)

    Citizen.CreateThread(function()
        while Call.status == 0 do
            TriggerEvent('InteractSound_CL:PlayOnAll', 'outgoing-call', 0.2)
            Citizen.Wait(5000)
        end
    end)

    local count = 0
    Citizen.CreateThread(function()
        while Call.status == 0 do
            if count >= 30 then
                TriggerServerEvent('InfinityPhone:server:EndCall')

                if isPhoneOpen then
                    PhoneCallToText()
                else
                    PhonePlayOut()
                end

                Call = {}
            else
                count = count + 1
            end
            Citizen.Wait(1000)
        end
    end)
end)

RegisterNetEvent('InfinityPhone:client:AcceptCall')
AddEventHandler('InfinityPhone:client:AcceptCall', function(channel, initiator)
    if Call.number ~= nil and Call.status == 0 then
        Call.status = 1
        Call.channel = channel
        Call.initiator = initiator
        
        exports['pma-voice']:addPlayerToCall(tonumber(Call.channel))

        if initiator then
            SendNUIMessage({
                action = 'acceptCallSender',
                number = Call.number
            })
        else
            PhonePlayCall(false)
            SendNUIMessage({
                action = 'acceptCallReceiver',
                number = Call.number
            })
        end
    end
end)

RegisterNetEvent('InfinityPhone:client:EndCall')
AddEventHandler('InfinityPhone:client:EndCall', function()
    SendNUIMessage({
        action = 'endCall'
    })
    
    exports['pma-voice']:removePlayerFromCall(tonumber(Call.channel))
    
    Call = {}
    
    if isPhoneOpen then
        PhoneCallToText()
        SetNuiFocus(true, true)
    else
        PhonePlayOut()
    end
end)

RegisterNetEvent('InfinityPhone:client:ReceiveCall')
AddEventHandler('InfinityPhone:client:ReceiveCall', function(number)
    ESX.TriggerServerCallback('InfinityPhone:getItemAmount', function(qtty)
        if qtty > 0 then
            Call.number = number
            Call.status = 0
            Call.initiator = false

            SendNUIMessage({
                action = 'receiveCall',
                number = number
            })
            

            Citizen.CreateThread(function()
                while Call.status == 0 do
                    if not muted then
                        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'IphoneRingTone', 0.1)
                    end
                    Citizen.Wait(3450)
                end
            end)


            local count = 0
            Citizen.CreateThread(function()
                while Call.status == 0 do
                    if count >= 30 then
                        TriggerServerEvent('InfinityPhone:server:EndCall')
                        Call = {}
                    else
                        count = count + 1
                    end
                    Citizen.Wait(1000)
                end
            end)

        end
    end, 'phone')
end)

RegisterNUICallback('CreateCall', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:CreateCall', function(callback)
        cb(callback)
    end, data)
end)

RegisterNUICallback('AcceptCall', function(data, cb)
    TriggerServerEvent('InfinityPhone:server:AcceptCall')
end)

RegisterNUICallback('EndCall', function(data, cb)
	TriggerServerEvent('InfinityPhone:server:EndCall', Call)
end)

RegisterNUICallback('DeleteCallRecord', function(data, cb)
    ESX.TriggerServerCallback('InfinityPhone:server:DeleteCallRecord', function(callback)
        cb(callback)
    end, data)
end)

RegisterNetEvent('InfinityPhone:client:AddToHistory')
AddEventHandler('InfinityPhone:client:AddToHistory', function(sender, receiver, status, anon)
     local data = {
        sender = sender,
        receiver = receiver,
        status = status,
        anon = anon
    } 
    
    SendNUIMessage({
        action = 'updateHistory',
        data = data
    })
end)
 