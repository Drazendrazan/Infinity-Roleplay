fx_version "adamant"

game "gta5"

version '1.6.4'

lua54 'yes'

client_script {
    "config/config.lua",
    "config/config_playershop.lua",
    "config/config_stashes.lua",
    "config/config_framework.lua",
    "config/config_metadata.lua",
    "config/translations.lua",
    "client/main.lua",
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "config/config.lua",
    "config/config_playershop.lua",
    "config/config_stashes.lua",
    "config/config_commands.lua",
    "config/config_server.lua",
    "config/config_framework.lua",
    "config/translations.lua",
    "server/main.lua",
}

escrow_ignore {
    "config/config.lua",
    "config/config_playershop.lua",
    "config/config_stashes.lua",
    "config/config_metadata.lua",
    "config/config_commands.lua",
    "config/config_server.lua",
    "config/config_framework.lua",
    "config/translations.lua",
    "config/config_framework.lua",
}

dependencies {
    'progressbar', -- Required.
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}
dependency '/assetpacks'