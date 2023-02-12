QSConfig = {}

-- ESX Custom Framework.
QSConfig.getSharedObject = "esx:getSharedObject" -- Modify it if you use an ESX Custom.
QSConfig.playerLoaded = "esx:playerLoaded" -- Modify it if you use an ESX Custom.
QSConfig.playerLogout = "esx:playerLogout" -- Modify it if you use an ESX Custom.

-- DO NOT USE IF YOU DO NOT USE CUSTOM FRAMEWORK!
QSConfig.CustomFrameworkExport = true -- Do you want to add your own export?
function CustomFrameworkExport() -- Add the export here, as in the following example.
    -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    ESX = exports["es_extended"]:getSharedObject()
end

QSConfig.onAddInventoryItem = "esx:onAddInventoryItem" -- Modify it if you use an ESX Custom.
QSConfig.onRemoveInventoryItem = "esx:onRemoveInventoryItem" -- Modify it if you use an ESX Custom.

QSConfig.Language = "en" --You can choose between 'en', 'es' or create your own language.

-- Important information, since it depends on whether your package will work or not.
-- Remember to set Multicharacter = true if you use ESX Legacy.
QSConfig.IdentifierType = "license" -- Set the identifier type (can be: steam, license)
QSConfig.Multicharacter = true -- Activate this function in case of using ESX Legacy or Multicharacter.

-- Remember to modify these values ​​in qs-inventory as well.
QSConfig.Player = {}
QSConfig.Player.MaxWeight = 75000 -- Total weight that the player can carry.
QSConfig.Player.MaxInvSlots = 41 -- Maximum slots in inventory.

--Notification system and its configuration.
QSConfig.Notify = {}
QSConfig.Notify.NotificationStyling = {
    group = false, -- Allow notifications to stack with a badge instead of repeating
    position = "right", -- top-left | top-right | bottom-left | bottom-right | top | bottom | left | right | center
    progress = true -- Display Progress Bar
}
-- These are how you define different notification variants
-- The "icon" key is the css-icon code, this project uses `Material Icons` & `Font Awesome`
QSConfig.Notify.VariantDefinitions = {
    success = {
        classes = 'success',
        icon = 'done'
    },
    primary = {
        classes = 'primary',
        icon = 'info'
    },
    error = {
        classes = 'error',
        icon = 'dangerous'
    },
    police = {
        classes = 'police',
        icon = 'local_police'
    },
    ambulance = {
        classes = 'ambulance',
        icon = 'fas fa-ambulance'
    }
}

-- Modify the DrawText3D values ​​for the Developer Tools.
function DrawTextQS(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end