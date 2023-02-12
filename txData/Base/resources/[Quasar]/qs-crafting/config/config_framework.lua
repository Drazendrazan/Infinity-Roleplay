
--███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░██╗
--██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝░██║░░██╗░░██║██╔══██╗██╔══██╗██║░██╔╝
--█████╗░░██████╔╝███████║██╔████╔██║█████╗░░░╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░
--██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░░████╔═████║░██║░░██║██╔══██╗██╔═██╗░
--██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝

Config.Framework = 'ESX' -- 'ESX' or 'QBCore'.

Config.CustomFrameworkExport = true -- Do you want to add your own export?
function CustomFrameworkExport()
    ESX = exports["es_extended"]:getSharedObject()
    -- QBCore = exports['qb-core']:GetCoreObject()
end

-- ESX.
Config.getSharedObject = 'esx:getSharedObject' -- Modify it if you use an ESX Custom.
Config.playerLoaded = 'esx:playerLoaded' -- Modify it if you use an ESX Custom.
Config.setJob = 'esx:setJob' -- Modify it if you use an ESX Custom.

-- QBCore.

Config.QBCoreGetCoreObject = 'qb-core' -- Modify it if you use an QBCore Custom.
Config.OnPlayerLoaded = 'QBCore:Client:OnPlayerLoaded' -- Modify it if you use an QBCore Custom.
Config.OnJobUpdate = 'QBCore:Client:OnJobUpdate' -- Modify it if you use an QBCore Custom.