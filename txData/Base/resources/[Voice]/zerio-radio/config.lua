Config = {}

Config.Channels = { 
    [1] = {
        label = "Rádio DPLS",
        jobs = { "police" }
    },
    [2] = {
        label = "Rádio SEM",
        jobs = { "ambulance" }
    },
    [3] = {
        label = "Rádio Bennys",
        jobs = { "mechanic" }
    },
    [4] = {
        label = "Rádio DPLS/SEM",
        jobs = { "police", "ambulance" }
    },
}

Config.Locale = "pt"

-- pma-voice or mumble-voip
Config.VoiceScript = "pma-voice"

-- item -> Opens through the Config.Item itemname
-- command -> Opens through the command /radio
-- keybind -> Opens through a button press (Config.Button)
-- custom -> Opens through the event "zerio-radio:client:open"
Config.OpenType = "item"

Config.Item = "radio"
-- Full keybind list exists here, https://docs.fivem.net/docs/game-references/controls/
-- (Only important if Config.OpenType is keybind)
Config.Button = 318

-- ONLY FOR MUMBLE-VOIP, has to be the same as the talking key for the animation to work
Config.RadioKey = 137

-- The command name for changing radio channels, if you remove this line then the command will be removed
--Config.ChangeRadioChannelCommand = "changeradio"

Config.DisconnectOnDeath = true

-- IMPORTANT!! For the stopping of the radio when dropped to work this event has to be triggered when the radio gets removed from your inventory.
-- zerio-radio:client:removedradio (client event, no arguments needed)
-- Open a ticket for more information if needed

-- DONT CHANGE THIS IF YOU DONT KNOW WHAT YOU ARE DOING!!!!!!!!!!!!!!!!
Config.EventNames = { PlayerLoaded = "esx:playerLoaded", PlayerUnLoaded = "esx:onPlayerLogout" }
