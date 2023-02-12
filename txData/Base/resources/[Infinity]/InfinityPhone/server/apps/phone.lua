Calls = {}

function CreateCallRecord(sender, receiver, state)

end

AddEventHandler('playerDropped', function()
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local myData = getIdentity(src)

    local mPlayer = player.identifier
    if mPlayer ~= nil and myData ~= nil then
        if Calls[myData.phone_number] ~= nil then
            local tPlayer = (Calls[myData.phone_number].number)
            if tPlayer ~= nil then
                TriggerClientEvent('InfinityPhone:client:EndCall', src)
            else
                Calls[Calls[myData.phone_number].number] = nil
            end
            Calls[myData.phone_number] = nil
        end
    end
end)

RegisterServerEvent('InfinityPhone:server:SetUpHistory')
AddEventHandler('InfinityPhone:server:SetUpHistory', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    local MyNumber = getNumberPhone(identifier)
    Citizen.CreateThread(function()
        MySQL.Async.fetchAll('SELECT * FROM phone_calls WHERE (sender = @number AND sender_deleted = 0) OR (receiver = @number AND receiver_deleted = 0) LIMIT 50'
            , { ['@number'] = MyNumber }
            , function(result)
            TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'history', data = result } })
        end)
    end)
end)


ESX.RegisterServerCallback('InfinityPhone:server:CreateCall', function(source, cb, data)
    local src = source
    local player = ESX.GetPlayerFromId(source)
    local myData = getIdentity(src)
    data.number = tonumber(data.number)
    myData.phone_number = tonumber(myData.phone_number)
    local numbersid = getIdentifierByPhoneNumber(data.number)
    local otherplayer
    local playerFromIdentifier = ESX.GetPlayerFromIdentifier(numbersid)
    if numbersid ~= nil and playerFromIdentifier then
        otherplayer = playerFromIdentifier.source
    else
        otherplayer = nil
        return
    end

    Citizen.Wait(500)
    local tPlayer = numbersid
    if tPlayer ~= nil then
        if data.number ~= myData.phone_number then
            if Calls[data.number] ~= nil then
                cb(-3)
                MySQL.query('SELECT * FROM phone_contacts WHERE number = @number AND identifier = @identifier',
                    { ['@number'] = myData.phone_number, ['@identifier'] = numbersid }, function(contact)
                    if contact ~= nil then
                        TriggerClientEvent('esx:showNotification', otherplayer, "Telemóvel",
                            contact[1].name .. ' tentou te ligar', 2000, 'info')
                    elseif not contact ~= nil then
                        TriggerClientEvent('esx:showNotification', otherplayer, "Telemóvel",
                            myData.phone_number .. ' tentou te ligar', 2000, 'info')
                    end
                end)
            else
                local contact = MySQL.query.await('SELECT * FROM phone_contacts WHERE number = ? AND identifier = ?'
                    ,
                    { data.number, myData.identifier })
                MySQL.insert('INSERT INTO phone_calls (sender, receiver, status, anon) VALUES(@sender, @receiver, @status, @anon)'
                    , {
                        ['@sender'] = myData.phone_number,
                        ['@receiver'] = data.number,
                        ['@status'] = 0,
                        ['@anon'] = data.nonStandard
                    }, function(insertId)
                    if insertId then
                        cb(1)

                        TriggerClientEvent('InfinityPhone:client:CreateCall', src, myData.phone_number)
                        TriggerClientEvent('InfinityPhone:client:AddToHistory', src, myData.phone_number, data.number, 0
                            ,
                            data.nonStandard)
                        TriggerClientEvent('InfinityPhone:client:AddToHistory', otherplayer, myData.phone_number,
                            data.number
                            , 0, data.nonStandard)
                        if data.nonStandard and not contact ~= nil then
                            TriggerClientEvent('InfinityPhone:client:ReceiveCall', otherplayer, 'Desconhecido')
                            TriggerClientEvent('esx:showNotification', otherplayer, "Telemóvel",
                                'Estás a receber uma chamada em número anónimo', 2000, 'info')
                        elseif data.nonStandard and contact ~= nil then
                            TriggerClientEvent('InfinityPhone:client:ReceiveCall', otherplayer, 'Desconhecido')
                            TriggerClientEvent('esx:showNotification', otherplayer, "Telemóvel",
                                'Estás a receber uma chamada em número anónimo', 2000, 'info')
                        elseif not data.nonStandard and contact ~= nil then
                            TriggerClientEvent('InfinityPhone:client:ReceiveCall', otherplayer, myData.phone_number)
                            TriggerClientEvent('esx:showNotification', otherplayer, "Telemóvel",
                                'Estás a receber uma chamada de: ' .. contact[1].name, 2000, 'info')
                        elseif not data.nonStandard and not contact ~= nil then
                            TriggerClientEvent('InfinityPhone:client:ReceiveCall', otherplayer, myData.phone_number)
                            TriggerClientEvent('esx:showNotification', otherplayer, "Telemóvel",
                                'Estás a receber uma chamada de: ' .. myData.phone_number, 2000, 'info')
                        end

                        Calls[myData.phone_number] = {
                            number = data.number,
                            status = 0,
                            record = insertId
                        }
                        Calls[data.number] = {
                            number = myData.phone_number,
                            status = 0,
                            record = insertId
                        }
                    else
                        cb(-1)
                    end
                end)
            end
        else
            cb(-2)
        end
    else
        cb(-1)
    end
end)

ESX.RegisterServerCallback('InfinityPhone:server:DeleteCallRecord', function(source, cb, data)
    local src = source
    local player = ESX.GetPlayerFromId(source)
    local myData = getIdentity(src)

    MySQL.Async.fetchAll('SELECT * FROM phone_calls WHERE id = @id', { ['@id'] = data.id }, function(record)
        if record[1] ~= nil then
            if record[1].sender == myData.phone_number then
                MySQL.Async.execute('UPDATE phone_calls SET sender_deleted = 1 WHERE id = @id AND sender = @phone',
                    { ['@id'] = data.id, ['@phone'] = myData.phone_number }, function(status)
                    if status > 0 then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            else
                MySQL.Async.execute('UPDATE phone_calls SET receiver_deleted = 1 WHERE id = @id AND receiver = @phone',
                    { ['@id'] = data.id, ['@phone'] = myData.phone_number }, function(status)
                    if status > 0 then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            end
        else
            cb(false)
        end
    end)
end)

--[[
RegisterServerEvent('InfinityPhone:server:ToggleHold')
AddEventHandler('InfinityPhone:server:ToggleHold', function(call)
    local src = source
    local tPlayer = (Calls[call.number].number)
    local numbersid = getIdentifierByPhoneNumber(tPlayer)
    local numbersid2 = getIdentifierByPhoneNumber(mPlayer)
    local otherplayer = ESX.GetPlayerFromIdentifier(numbersid).source
    TriggerClientEvent('InfinityPhone:client:OtherToggleHold', otherplayer)
    TriggerEvent("InfinityPhone:server:ToggleHold2", call)
end)

RegisterServerEvent('InfinityPhone:server:ToggleHold2')
AddEventHandler('InfinityPhone:server:ToggleHold2', function(call)
    local src = source
    local mPlayer = (Calls[Calls[call.number].number].number)
    local numbersid2 = getIdentifierByPhoneNumber(mPlayer)
    local otherplayer2 = ESX.GetPlayerFromIdentifier(numbersid2).source
    TriggerClientEvent('InfinityPhone:client:OtherToggleHold', otherplayer2)
end)]]

RegisterServerEvent('InfinityPhone:server:AcceptCall')
AddEventHandler('InfinityPhone:server:AcceptCall', function()
    local src = source
    local player = ESX.GetPlayerFromId(source)
    local myData = getIdentity(src)
    myData['phone_number'] = tonumber(myData.phone_number)

    if Calls[myData.phone_number] ~= nil then
        local numbersid = getIdentifierByPhoneNumber(Calls[myData.phone_number].number)
        local otherplayer = ESX.GetPlayerFromIdentifier(numbersid) -- erro
        local tPlayer = (Calls[myData.phone_number].number)
        if tPlayer ~= nil and otherplayer ~= nil then
            if (Calls[myData.phone_number].number ~= nil) and (Calls[Calls[myData.phone_number].number].number ~= nil) then
                Calls[Calls[myData.phone_number].number].status = 1
                Calls[myData.phone_number].status = 1

                TriggerClientEvent('InfinityPhone:client:AcceptCall', src, (tonumber(otherplayer.source) + 12640), false)
                TriggerClientEvent('InfinityPhone:client:AcceptCall', tonumber(otherplayer.source),
                    (tonumber(otherplayer.source) + 12640), true)
            else
                Calls[Calls[myData.phone_number].number] = nil
                Calls[myData.phone_number] = nil
                TriggerClientEvent('InfinityPhone:client:EndCall', src)
                TriggerClientEvent('InfinityPhone:client:EndCall', tonumber(otherplayer.source))
            end
        else
            TriggerClientEvent('InfinityPhone:client:EndCall', src)
        end
    end
end)

RegisterServerEvent('InfinityPhone:server:EndCall')
AddEventHandler('InfinityPhone:server:EndCall', function()
    local src = source
    local player = ESX.GetPlayerFromId(source)
    local myData = getIdentity(src)
    myData['phone_number'] = tonumber(myData.phone_number)

    if Calls[myData.phone_number] ~= nil then
        local tPlayer = (Calls[myData.phone_number].number)
        local numbersid = getIdentifierByPhoneNumber(tPlayer)
        local otherplayer = ESX.GetPlayerFromIdentifier(numbersid) -- erro
        if tPlayer ~= nil then
            Calls[Calls[myData.phone_number].number] = nil
            Calls[myData.phone_number] = nil

            TriggerClientEvent('InfinityPhone:client:EndCall', src)
            if otherplayer ~= nil then
                TriggerClientEvent('InfinityPhone:client:EndCall', tonumber(otherplayer.source))
            end
        end
    end
end)
