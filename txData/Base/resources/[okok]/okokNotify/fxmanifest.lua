fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokNotify'

ui_page 'web/ui.html'

files {
	'web/*.*'
}

client_scripts {
	'config.lua',
	'client.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"