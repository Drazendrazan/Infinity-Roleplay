fx_version "cerulean"

game "gta5"

version '1.1.0'

author 'quasar-store.com'

lua54 'yes'

client_script {
    "config/config.lua",
    "config/config_framework.lua",
    "client/main.lua"
}

server_script {
    "config/config.lua",
    "config/config_framework.lua",
    "server/main.lua",
    "server/version_check.lua",
}

escrow_ignore {
    "config/config.lua",
    "config/config_framework.lua",
    "server/version_check.lua",
}

dependencies {
	'qs-inventory', -- Required.
    'progressbar', -- Required.
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}
dependency '/assetpacks'