fx_version 'cerulean'
game 'gta5'

shared_script '@es_extended/imports.lua'

client_scripts {
	"config.lua",
	"client/garageMenu.lua",
	"client/gui.lua",
	"client/functions.lua",
	"client/main.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/main.lua",
}

client_script "@InfinityAC/src/client/src_c_03.lua"