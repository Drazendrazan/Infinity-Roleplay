AppData = {}
Callbacks = nil
Cache = nil

function RegisterData(source, key, data)
    if AppData[source] ~= nil then
        AppData[source].key = data
    else
        AppData[source] = {}
        AppData[source].key = data
    end
end

ESX.RegisterServerCallback('InfinityPhone:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getInventoryItem(item).count)
end)

ESX.RegisterServerCallback('InfinityPhone:server:GetPhoneNumber', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    cb(getNumberPhone(identifier))
end)

RegisterCommand("startphone", function (source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    if source == 0 or xPlayer.getGroup() == "owner" then
        TriggerClientEvent("InfinityPhone:startphone", -1)
    end
end)

ESX.RegisterServerCallback('InfinityPhone:getOtherPlayerData', function(source, cb)
    local player = ESX.GetPlayerFromId(source)
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height, phone_number FROM users WHERE identifier = @identifier'
        , {
        ['@identifier'] = player.identifier
    })

    local firstname    = result[1].firstname
    local lastname     = result[1].lastname
    local height       = result[1].height
    local sex          = result[1].sex
    local dob          = result[1].dateofbirth
    local height       = result[1].height
    local phone_number = result[1].phone_number

    local data = {
        name         = GetPlayerName(player),
        job          = player.job,
        inventory    = player.inventory,
        accounts     = player.accounts,
        weapons      = player.loadout,
        firstname    = firstname,
        lastname     = lastname,
        sex          = sex,
        dob          = dob,
        height       = height,
        phone_number = phone_number
    }

    cb(data)

end)

function getIdentity(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local job = xPlayer.getJob()
        local result = MySQL.query.await('SELECT * FROM users WHERE identifier = ?', { xPlayer.identifier })
        if result[1] ~= nil then
            local identity = result[1]
            return {
                identifier = identity['identifier'],
                firstname = identity['firstname'],
                lastname = identity['lastname'],
                dateofbirth = identity['dateofbirth'],
                sex = identity['sex'],
                height = identity['height'],
                phone_number = identity['phone_number'],
                accounts = json.decode(identity['accounts']),
                job = job.label .. " - " .. job.grade_label
            }
        else
            return nil
        end
    else
        return nil
    end
end

RegisterServerEvent('InfinityPhone:server:SetupApps')
AddEventHandler('InfinityPhone:server:SetupApps', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local cData = getIdentity(src)
    if not cData.lastname or not cData.firstname then
        return
    end
    TriggerClientEvent('InfinityPhone:client:SetupData', src, {
        { name = 'myData', data = {
            id = xPlayer.identifier,
            name = cData.firstname .. ' ' .. cData.lastname,
            phone = cData.phone_number
        } },
        { name = 'apps', data = Config.Apps }
    })
end)

RegisterServerEvent('InfinityPhone:server:giveNumber')
AddEventHandler('InfinityPhone:server:giveNumber', function(num, target)
    TriggerClientEvent('InfinityPhone:client:showNumToMe', tonumber(target), num)
end)



RegisterServerEvent('InfinityPhone:server:SetupInfo')
AddEventHandler('InfinityPhone:server:SetupInfo', function(target)
    local src
    if target then
        src = target
    else
        src = source
    end
    local cData = getIdentity(src)

    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'firstname', data = cData.firstname } })
    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'lastname', data = cData.lastname } })
    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'myNumber', data = cData.phone_number } })
    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'money', data = cData.accounts["money"] } })
    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'bank', data = cData.accounts["bank"] } })
    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'job', data = cData.job } })
end)



ESX.RegisterServerCallback('InfinityPhone:server:RegisterData', function(source, cb, data)
    RegisterData(source, data.key, data.data)
    cb(true)
end)

ESX.RegisterServerCallback('InfinityPhone:server:GetData', function(source, cb, data)
    cb(AppData[source][data.key])
end)

--====================================================================================
--  Utils
--====================================================================================
function getNumberPhone(identifier)
    local result = MySQL.scalar("SELECT users.phone_number FROM users WHERE users.identifier = ?",
        {
            identifier
        })
    if result ~= nil then
        return result
    end
    return nil
end

function getIdentifierByPhoneNumber(phonenumber)
    local result = MySQL.query.await("SELECT users.identifier FROM users WHERE users.phone_number = ?",
        {
            phonenumber
        })
    if result[1] then
        return result[1].identifier
    end
    return nil
end

math.randomseed(os.time())

--- Pour les numero du style XXX-XXXX
function getPhoneRandomNumber()
    local numBase0 = math.random(91, 98)
    local numBase1 = math.random(0, 9999999)
    local num = string.format("%d%07d", numBase0, numBase1)
    return num
end

--function getOrGeneratePhoneNumber(sourcePlayer, identifier, cb)
--    local sourcePlayer = sourcePlayer
--    local identifier = identifier
--    local id
--    local myPhoneNumber = getNumberPhone(identifier)
--    if myPhoneNumber == '0' or myPhoneNumber == nil then
--        repeat
--            myPhoneNumber = getPhoneRandomNumber()
--            id = getIdentifierByPhoneNumber(myPhoneNumber)
--        until id == nil
--        MySQL.update("UPDATE users SET phone_number = @myPhoneNumber WHERE identifier = @identifier", {
--            ['@myPhoneNumber'] = myPhoneNumber,
--            ['@identifier'] = identifier
--        }, function()
--            cb(myPhoneNumber)
--        end)
--    else
--        cb(myPhoneNumber)
--    end
--end
--
--AddEventHandler('esx:playerLoaded', function(source)
--    local sourcePlayer = tonumber(source)
--    local identifier = ESX.GetPlayerFromId(source).identifier
--    getOrGeneratePhoneNumber(sourcePlayer, identifier, function(myPhoneNumber)
--        TriggerEvent("InfinityPhone:server:SetupInfo", sourcePlayer)
--    end)
--end)