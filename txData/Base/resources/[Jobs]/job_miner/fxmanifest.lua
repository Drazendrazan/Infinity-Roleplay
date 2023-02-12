fx_version 'adamant'
games { 'gta5' }

lua54 'yes'

client_scripts { 
	"cfg/*",
	"client/*"
}
server_scripts { 
	--"@vrp/lib/utils.lua",
	"cfg/*",
	"server/*"
}

escrow_ignore {
	'server/functions.lua',
	'client/functions.lua',
	'cfg/config.lua',
	'[PICKAXE MODEL]/w_me_battleaxe.ydr',
	'[PICKAXE MODEL]/w_me_battleaxe.ytd',
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"