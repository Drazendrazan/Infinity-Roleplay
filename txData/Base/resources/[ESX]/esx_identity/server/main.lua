local playerIdentity = {}
local alreadyRegistered = {}

local function saveIdentityToDatabase(identifier, identity)
    MySQL.update.await(
        'UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ? WHERE identifier = ?',
        { identity.firstName, identity.lastName, identity.dateOfBirth, identity.sex, identity.height, identifier })
end

local function checkDate(str)
    if string.match(str, '(%d%d)/(%d%d)/(%d%d%d%d)') ~= nil then
        local d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')

        m = tonumber(m)
        d = tonumber(d)
        y = tonumber(y)

        if ((d <= 0) or (d > 31)) or ((m <= 0) or (m > 12)) or ((y <= 1900) or (y > 2021)) then
            return false
        elseif m == 4 or m == 6 or m == 9 or m == 11 then
            if d > 30 then
                return false
            else
                return true
            end
        elseif m == 2 then
            if y % 400 == 0 or (y % 100 ~= 0 and y % 4 == 0) then
                if d > 29 then
                    return false
                else
                    return true
                end
            else
                if d > 28 then
                    return false
                else
                    return true
                end
            end
        else
            if d > 31 then
                return false
            else
                return true
            end
        end
    else
        return false
    end
end

local function formatDate(str)
    local d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')
    local date = str

    date = m .. "/" .. d .. "/" .. y

    return date
end

local function checkAlphanumeric(str)
    return (string.match(str, "%W"))
end

local function checkForNumbers(str)
    return (string.match(str, "%d"))
end

local function checkNameFormat(name)
    if not checkAlphanumeric(name) then
        if not checkForNumbers(name) then
            local stringLength = string.len(name)
            if stringLength > 0 and stringLength < 20 then
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

local function checkDOBFormat(dob)
    local date = tostring(dob)

    if checkDate(date) then
        return true
    else
        return false
    end
end

local function checkSexFormat(sex)
    if sex == "m" or sex == "M" or sex == "f" or sex == "F" then
        return true
    else
        return false
    end
end

local function checkHeightFormat(height)
    local numHeight = tonumber(height)
    if numHeight < 150 and numHeight > 220 then
        return false
    else
        return true
    end
end

local function convertToLowerCase(str)
    return string.lower(str)
end

local function convertFirstLetterToUpper(str)
    return str:gsub("^%l", string.upper)
end

local function formatName(name)
    local loweredName = convertToLowerCase(name)
    local formattedName = convertFirstLetterToUpper(loweredName)
    return formattedName
end

local function setIdentity(xPlayer)
    if alreadyRegistered[xPlayer.identifier] then
        local currentIdentity = playerIdentity[xPlayer.identifier]

        xPlayer.setName(('%s %s'):format(currentIdentity.firstName, currentIdentity.lastName))
        xPlayer.set('firstName', currentIdentity.firstName)
        xPlayer.set('lastName', currentIdentity.lastName)
        xPlayer.set('dateofbirth', currentIdentity.dateOfBirth)
        xPlayer.set('sex', currentIdentity.sex)
        xPlayer.set('height', currentIdentity.height)
        TriggerClientEvent('esx_identity:setPlayerData', xPlayer.source, currentIdentity)
        if currentIdentity.saveToDatabase then
            saveIdentityToDatabase(xPlayer.identifier, currentIdentity)
        end

        playerIdentity[xPlayer.identifier] = nil
    end
end

local function checkIdentity(xPlayer)
    MySQL.single('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = ?',
        { xPlayer.identifier }, function(result)
        if result then
            if result.firstname then
                playerIdentity[xPlayer.identifier] = {
                    firstName = result.firstname,
                    lastName = result.lastname,
                    dateOfBirth = result.dateofbirth,
                    sex = result.sex,
                    height = result.height
                }

                alreadyRegistered[xPlayer.identifier] = true
                setIdentity(xPlayer)
            else
                playerIdentity[xPlayer.identifier] = nil
                alreadyRegistered[xPlayer.identifier] = false
                TriggerClientEvent('esx_identity:showRegisterIdentity', xPlayer.source)
                MySQL.update.await("UPDATE users SET phone_number = ? WHERE identifier = ?", { math.random(910000000, 989999999), xPlayer.identifier })
            end
        else
            TriggerClientEvent('esx_identity:showRegisterIdentity', xPlayer.source)
            MySQL.update.await("UPDATE users SET phone_number = ? WHERE identifier = ?", { math.random(910000000, 989999999), xPlayer.identifier })
        end
    end)
end

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()
    local playerId, identifier = source, ESX.GetIdentifier(source)
    Wait(40)

    if identifier then
        MySQL.single('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = ?',
            { identifier }, function(result)
            if result then
                if result.firstname then
                    playerIdentity[identifier] = {
                        firstName = result.firstname,
                        lastName = result.lastname,
                        dateOfBirth = result.dateofbirth,
                        sex = result.sex,
                        height = result.height
                    }

                    alreadyRegistered[identifier] = true

                    deferrals.done()
                else
                    playerIdentity[identifier] = nil
                    alreadyRegistered[identifier] = false
                    deferrals.done()
                end
            else
                playerIdentity[identifier] = nil
                alreadyRegistered[identifier] = false
                deferrals.done()
            end
        end)
    else
        deferrals.done(TranslateCap('no_identifier'))
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(300)

        while not ESX do Wait(0) end

        local xPlayers = ESX.GetExtendedPlayers()

        for i = 1, #(xPlayers) do
            if xPlayers[i] then
                checkIdentity(xPlayers[i])
            end
        end
    end
end)

RegisterNetEvent('esx:playerLoaded', function(playerId, xPlayer)
    local currentIdentity = playerIdentity[xPlayer.identifier]

    if currentIdentity and alreadyRegistered[xPlayer.identifier] == true then
        xPlayer.setName(('%s %s'):format(currentIdentity.firstName, currentIdentity.lastName))
        xPlayer.set('firstName', currentIdentity.firstName)
        xPlayer.set('lastName', currentIdentity.lastName)
        xPlayer.set('dateofbirth', currentIdentity.dateOfBirth)
        xPlayer.set('sex', currentIdentity.sex)
        xPlayer.set('height', currentIdentity.height)
        TriggerClientEvent('esx_identity:setPlayerData', xPlayer.source, currentIdentity)
        if currentIdentity.saveToDatabase then
            saveIdentityToDatabase(xPlayer.identifier, currentIdentity)
        end

        Wait(0)

        TriggerClientEvent('esx_identity:alreadyRegistered', xPlayer.source)

        playerIdentity[xPlayer.identifier] = nil
    else
        TriggerClientEvent('esx_identity:showRegisterIdentity', xPlayer.source)
    end
end)

ESX.RegisterServerCallback('esx_identity:registerIdentity', function(source, cb, data)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        if not alreadyRegistered[xPlayer.identifier] then
            if checkNameFormat(data.firstname) then
                if checkNameFormat(data.lastname) then
                    if checkSexFormat(data.sex) then
                        if checkDOBFormat(data.dateofbirth) then
                            if checkHeightFormat(data.height) then
                                local formattedFirstName = formatName(data.firstname)
                                local formattedLastName = formatName(data.lastname)
                                local formattedDate = formatDate(data.dateofbirth)

                                playerIdentity[xPlayer.identifier] = {
                                    firstName = formattedFirstName,
                                    lastName = formattedLastName,
                                    dateOfBirth = formattedDate,
                                    sex = data.sex,
                                    height = data.height,
                                }

                                local currentIdentity = playerIdentity[xPlayer.identifier]

                                xPlayer.setName(('%s %s'):format(currentIdentity.firstName, currentIdentity.lastName))
                                xPlayer.set('firstName', currentIdentity.firstName)
                                xPlayer.set('lastName', currentIdentity.lastName)
                                xPlayer.set('dateofbirth', currentIdentity.dateOfBirth)
                                xPlayer.set('sex', currentIdentity.sex)
                                xPlayer.set('height', currentIdentity.height)
                                TriggerClientEvent('esx_identity:setPlayerData', xPlayer.source, currentIdentity)
                                saveIdentityToDatabase(xPlayer.identifier, currentIdentity)
                                alreadyRegistered[xPlayer.identifier] = true
                                playerIdentity[xPlayer.identifier] = nil
                                local log = "**Info:**\n**Name:** "..xPlayer.getName().." \n**Data de Nascimento:** "..currentIdentity.dateOfBirth.." \n**Sexo:** "..currentIdentity.sex.."\n**Altura:** "..currentIdentity.height
                                exports["Pack"]:LogToDiscord(source,
                                    "https://discord.com/api/webhooks/1040394762559180812/tBOT-Rba56cUDFnY3fOeTF80MeWmhF7vzRc2yPsCTiPG7tVwSaO-moBH9rrrZ39B9WwP"
                                    , "Identity", log)
                                cb(true)
                            else
                                xPlayer.showNotification("REGISTO", TranslateCap('invalid_height_format'), 2000, "error")
                                cb(false)
                            end
                        else
                            xPlayer.showNotification("REGISTO", TranslateCap('invalid_dob_format'), 2000, "error")
                            cb(false)
                        end
                    else
                        xPlayer.showNotification("REGISTO", TranslateCap('invalid_sex_format'), 2000, "error")
                        cb(false)
                    end
                else
                    xPlayer.showNotification("REGISTO", TranslateCap('invalid_lastname_format'), 2000, "error")
                    cb(false)
                end
            else
                xPlayer.showNotification("REGISTO", TranslateCap('invalid_firstname_format'), 2000, "error")
                cb(false)
            end
        else
            xPlayer.showNotification("REGISTO", TranslateCap('already_registered'), 2000, "error")
            cb(false)
        end
    else
        TriggerClientEvent("esx:showNotification", source, "REGISTO", TranslateCap('data_incorrect'), 2000, "error")
        cb(false)
    end
end)
