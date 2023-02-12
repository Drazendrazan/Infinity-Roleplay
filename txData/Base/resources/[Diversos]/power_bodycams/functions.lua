-- This will allow you to use a custom notification handler for using things like pNotify.
RegisterNetEvent('bodycam:notification')
AddEventHandler('bodycam:notification', function(message)
    ESX.ShowNotification(message, "", 2000, "info")
end)
