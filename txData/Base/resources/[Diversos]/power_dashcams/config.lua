---======================---
---==== QBCore Support ====---
---======================---
-- Enabling Support
enableQBCore = false
-- Name of your qb-core resource, incase you have renamed it.
QBC_resourceName = 'qb-core'

-- The event names, incase you have renamed standard qbcore functions
QBC_playerLoadedEvent = 'QBCore:Client:OnPlayerLoaded'
QBC_jobUpdateEvent = 'QBCore:Client:OnJobUpdate'

---======================---
---===== ESX Support ====---
---======================---
-- Enabling Support
enableESX = true

-- The event names, incase you have renamed standard qbcore functions
ESX_playerLoadedEvent = 'esx:playerLoaded'
ESX_jobUpdateEvent = 'esx:setJob'

---======================---
---== Whitelisted Jobs ==---
---======================---
whitelistedJobs = { -- the jobs that are whitelisted for dashcams
    'police'
}

---======================---
---===== Q/QBTarget =====---
---======================---
-- Enables support for qb/qtarget which replaces the terminal locations with qb/qtarget points
enableTarget = false

-- targetResource = 'qb-target'
targetResource = 'qtarget'


---======================---
---===== Standalone =====---
---======================---
-- Enable Debug command - /dashcam - this will let you view the dashcam of the vehicle you are driving (very good for dashcam position)
debugCommand = false

-- Enable Whitelist export - simply call the exports in order to whitelist a player to view dashcam feeds.
enableWhitelist = false


-- This will detect all vehicles that are known to the server and that match the models in the AllowedVehicles list
-- if you don't use this then it will only allow you to watch dashcams of vehicles with a player inside.
findAllVehicles = true

-- Use Realtime - if false then it will use the ingame time
usingRealtime = true
-- set a timezone,
usingTimezone = 'Europe/London' -- you can view the names timezones here. https://momentjs.com/timezone/

-- Adding vehicles can be done by simply adding a new line with the vehicle model name, you can also edit the offset of the dashcam aswell as the bone that its attached too.

-- This will now use the spawn name of the vehicle.
AllowedVehicles = {
    ["polchar"] = { boneName = "bonnet", xOffset = 0.16, yOffset = -0.60, zOffset = 0.17 },
    ["polraptor"] = { boneName = "bonnet", xOffset = 0.16, yOffset = -0.60, zOffset = 0.25 },
    ["poltah"] = { boneName = "bonnet", xOffset = 0.16, yOffset = -0.60, zOffset = 0.25 },
    ["poltaurus"] = { boneName = "bonnet", xOffset = 0.16, yOffset = -0.60, zOffset = 0.15 },
    ["polvic"] = { boneName = "bonnet", xOffset = 0, yOffset = -0.25, zOffset = 0.25 },
    ["camaroRB"] = { boneName = "bonnet", xOffset = 0.0, yOffset = -0.25, zOffset = 0.25 },
}

-- Enable Access Terminals, you can disable this and use the following event.
-- TriggerEvent('dashcam:accessFeeds') - This is a client side event.
enableTerminals = true

-- Locations for the access terminal to view the dashcam feeds
AccessTerminals = {
    { x = 443.2770, y = -996.5320, z = 34.9702 }, -- Gabs MRPD Dispatch Room
}

-- Language config, this will allow you to edit the language incase your server is not english based.
Lang = {
    ["showPromt"] = "Pressione ~INPUT_CONTEXT~ para aceder às dashcams",
    ["noFeeds"] = "Sem dashcams",
    ["exitFeed"] = "Sair",
    ["nextFeed"] = "Próxima",
    ["previousFeed"] = "Anterior",
    ["switchCameraView"] = "Alterar visão"
}

-- Exports
-- exports["power_dashcams"]:addDashcamAccess() - Add access
-- exports["power_dashcams"]:removeDashcamAccess() - Remove access
-- exports["power_dashcams"]:hasDashcamAccess() - Check if has access.
