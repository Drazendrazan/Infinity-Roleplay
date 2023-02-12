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
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"