-- This will allow you to use a custom notification handler for using things like pNotify.
RegisterNetEvent('dashcam:notification')
AddEventHandler('dashcam:notification', function(message)
    ESX.ShowNotification(msg, "", 2000, "info")
end)