RegisterServerEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(source, xPlayer)
    local phoneNumber = math.random(910000000, 989999999)
    MySQL.query('SELECT phone_number FROM users WHERE identifier = ?', {
        xPlayer.identifier
    }, function(result)
        if result[1].phone_number == nil then
            MySQL.query('UPDATE users SET phone_number = ? WHERE identifier = ?', { phoneNumber, xPlayer.identifier })
        end
    end)
end)
