fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokBanking'

ui_page 'web/ui.html'

files {
	'web/*.*',
	'web/img/*.*'
}

shared_scripts {
	'@es_extended/imports.lua',
    'config.lua',
    'locales/*.lua'
}

client_scripts {
	'client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'server.lua',
	'client.lua',
	'locales/*.lua'
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"