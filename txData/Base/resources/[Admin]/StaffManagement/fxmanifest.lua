fx_version "cerulean"
game "gta5"

client_scripts {
    '@es_extended/imports.lua', "client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    '@es_extended/imports.lua',
    "server.lua",
    "LogSystem.lua"
}

server_export "isAllowedTo"

client_script "@InfinityAC/src/client/src_c_03.lua"