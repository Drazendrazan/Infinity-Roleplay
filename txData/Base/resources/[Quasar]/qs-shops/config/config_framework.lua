Config.Framework = 'ESX' -- 'ESX' or 'QBCore'.
Config.CustomFrameworkExport = true -- Do you want to add your own export?
function CustomFrameworkExport() -- Add the export here, as in the following example.
    -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    -- QBCore = exports['qb-core']:GetCoreObject()
    ESX = exports["es_extended"]:getSharedObject()
end

-- Ignore this if you are using QBCore
Config.QBCoreGetCoreObject = 'qb-core'
Config.getSharedObject = 'esx:getSharedObject'
Config.setJob = 'esx:setJob'