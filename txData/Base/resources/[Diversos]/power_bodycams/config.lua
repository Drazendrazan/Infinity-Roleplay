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
whitelistedJobs = { -- the jobs that are whitelisted for bodycams
 'police',
}

---======================---
---===== Q/QBTarget =====---
---======================---
-- Enables support for qb/qtarget which replaces the terminal locations with qb/qtarget points.
enableTarget = false

targetResource = 'qb-target'
-- targetResource = 'qtarget'


---======================---
---===== Standalone =====---
---======================---
-- Displays server time on the bodycam feed.
enableTimeDisplay = true 

-- Use Realtime - if false then it will use the ingame time
usingRealtime = true 
-- set a timezone, 
usingTimezone = 'Europe/London' -- you can view the names timezones here. https://momentjs.com/timezone/

-- Enable Whitelist - Enable this if you only want certain people to be able to view the live feed of cameras. 
-- use the exports to manage who has access or enable QBUS support.
enableWhitelist = false 

-- Exports
-- exports["power_bodycams.pack"]:addBodycamAccess() - Add access to view feed
-- exports["power_bodycams.pack"]:removeBodycamAccess() - Remove access to view feed
-- exports["power_bodycams.pack"]:hasBodycamAccess() - Check if has access to view feed

-- Enables command to enable / disable bodycam (Bodycam has to be enabled for dispatch to view the feed.)
-- if qbus support is enabled then the command will only work for the whitelisted jobs.
enableCommand = true 
-- The name of the command example: bodycam - /bodycam ingame to turn on / off bodycam.
commandName = 'bodycam'

-- Enable a hotkey to enable/disable the body, the command must also be enabled (Default: L)
enableHotkey = true 
defaultHotkey = 'L'

-- if you don't want to use a command to enable/disable the bodycam feed but however want to force it force all police/ems then this can be done using the below events.
-- TriggerServerEvent('bodycam:enableBodycam') -- This will enable the bodycam for the client that called the event.
-- TriggerServerEvent('bodycam:disableBodycam') -- This will disable the bodycam for the client that called the event.

-- you can also send an optional parameter with the players name, if this isn't added then it will use the players steam name. 
-- example of above that would enable bodycam with the players name set: TriggerServerEvent('bodycam:enableBodycam', "John Smith") 

-- EUP Check 
-- WARNING: This will override the command and the events so please use this setting without the others.

-- This allows you to set a clothing id for example a bodycam prop, when this is on a player they will have the bodycam feed enabled
-- if the clothing is removed then the bodycam is disabled
-- if qbus support is enabled then this will only check the people with the whitelisted job.
eupCheck = false 

maleModel = { -- Male Model
 componentId = 9, -- Component ID of the bodycam clothing id (example: 9 = vest)  
 textureId = 39 -- Texture ID of the bodycam clothing id 
}

femaleModel = { -- Female Model
 componentId = 9, -- Component ID of the bodycam clothing id (example: 9 = vest)  
 textureId = 30 -- Texture ID of the bodycam clothing id 
}

-- Enable Access Terminals, you can disable this and use the following event.
-- TriggerEvent('bodycam:accessFeeds') - This is a client side event.
enableTerminals = true 

-- Locations for the access terminal to view the dashcam feeds
AccessTerminals = {
 {x = 448.9666, y = -998.8121, z = 34.9701}, -- Gabs MRPD Dispatch Room
}
-- Language config, this will allow you to edit the language incase your server is not english based. 
Lang = {
 ["showPromt"] = "Pressione ~INPUT_CONTEXT~ para acessar as bodycams", 
 ["noFeeds"] = "Sem bodycams",
 ["exitFeed"] = "Sair",
 ["nextFeed"] = "Próximo", 
 ["previousFeed"] = "Anterior",
 ["camEnabled"] = "Bodycam ligada",
 ["camDisabled"] = "Bodycam desligada",
}