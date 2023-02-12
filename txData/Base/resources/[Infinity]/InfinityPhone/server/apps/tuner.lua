--[[RegisterServerEvent('InfinityPhone:server:CharacterSpawned')
AddEventHandler('InfinityPhone:server:CharacterSpawned', function()
    local src = source
    local char = exports['InfinityPhone']:FetchComponent('Fetch'):Source(src):GetData('character')
    local cData = char:GetData()

    Citizen.CreateThread(function()
        exports['ghmattimysql']:execute('SELECT * FROM phone_tuner WHERE charid = @charid', { ['charid'] = cData.id }, function(dbTunes)
            local tunes = {}
            if dbTunes[1] ~= nil then
                for k, v in pairs(dbTunes) do
                    table.insert(tunes, {
                        json.decode(v.data)
                    })
                end
            end

            TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'factory-tunes', data = Config.FactoryTunes } })
            TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'custom-tunes', data = tunes } })
        end)
    end)
end)
]]
AddEventHandler('InfinityPhone:shared:ComponentsReady', function()
    Callbacks = Callbacks or exports['InfinityPhone']:FetchComponent('Callbacks')

    Callbacks:RegisterServerCallback('InfinityPhone:server:SaveTune', function(source, data, cb)
        local char = exports['InfinityPhone']:FetchComponent('Fetch'):Source(source):GetData('character')
        exports['ghmattimysql']:execute('INSERT INTO phone_tuner (`charid`, `data`) VALUES(@charid, @data)', { ['charid'] = char:GetData('id'), ['data'] = json.encode(data.tune) }, function(response)
            data.tune.id = response.insertId
            cb(data.tune)
        end)
    end)

    Callbacks:RegisterServerCallback('InfinityPhone:server:DeleteTune', function(source, data, cb)
        local char = exports['InfinityPhone']:FetchComponent('Fetch'):Source(source):GetData('character')
        exports['ghmattimysql']:execute('DELETE FROM phone_tuner WHERE id = @id AND charid = @charid', { ['id'] = data.id, ['charid'] = char:GetData('id') }, function(response)
            cb(response.affectedRows > 0)
        end)
    end)
end)