fx_version "cerulean"
game "gta5"

lua54 'yes'

author 'SSDev Studios (https://store.ssdev.studio)'
description 'Arcade Claw Machine'

version '1.0.4'

client_script {
	"constants.lua",
	"config.lua",
	"client/client.lua",
	"client/targetting.lua",
}

server_script {
	"constants.lua",
	"config.lua",
	"server/server.lua"
}

escrow_ignore {
	"config.lua",
	"constants.lua",
	"server/server.lua",
	"client/targetting.lua"
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"