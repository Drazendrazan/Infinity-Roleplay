--███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░██╗
--██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝░██║░░██╗░░██║██╔══██╗██╔══██╗██║░██╔╝
--█████╗░░██████╔╝███████║██╔████╔██║█████╗░░░╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░
--██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░░████╔═████║░██║░░██║██╔══██╗██╔═██╗░
--██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝

Config.Framework = 'ESX'                --- @param Set 'ESX' if you use es_extended or 'QBCore' if you use qb-core.
Config.CustomFrameworkExport = true    --- @param Do you want to add your own export?
Config.SkinScript = 'esx_skin'          --- @param Script 'esx_skin' or 'qb-clothing'

--- @param If your are using ESX 1.8.5 or higher put in true 'Config.CustomFrameworkExport' and uncomment the ESX function from line 14 
function CustomFrameworkExport() -- Add the export here, as in the following example.
    ESX = exports["es_extended"]:getSharedObject()
    -- QBCore = exports['qb-core']:GetCoreObject()
end

--█▀▀ █▀▀ █─█ 
--█▀▀ ▀▀█ ▄▀▄ 
--▀▀▀ ▀▀▀ ▀─▀

Config.getSharedObject = 'esx:getSharedObject'  -- Configure your framework here.
Config.playerLoaded = 'esx:playerLoaded'  -- Configure your framework here.

Config.ESXSkinCallback = 'esx_skin:getPlayerSkin'
Config.SkinChanger = 'skinchanger:loadClothes'


--▒█▀▀█ ▒█▀▀█ ▒█▀▀█ █▀▀█ █▀▀█ █▀▀ 
--▒█░▒█ ▒█▀▀▄ ▒█░░░ █░░█ █▄▄▀ █▀▀ 
--░▀▀█▄ ▒█▄▄█ ▒█▄▄█ ▀▀▀▀ ▀░▀▀ ▀▀▀

Config.QBCoreGetCoreObject = 'qb-core'
Config.QBCoreplayerLoaded = 'QBCore:Client:OnPlayerLoaded'
Config.QBInputName = 'qb-input'

Config.QBCoreQBClothing = 'qb-clothing:client:loadOutfit'