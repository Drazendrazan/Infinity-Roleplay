fx_version 'cerulean'
game 'gta5'
description 'ak47 crime'
version '1.0.0'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/images/blindfold.png',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
	'file.json'
}

shared_script '@es_extended/imports.lua'

server_scripts {
	'handler.lua',
    'NoSharedObject.lua',
	'config.lua',
	'server/utils.lua',
	'server/cuff.lua',
	'server/drag.lua',
	'server/bind.lua',
	'server/blindfold.lua',
	'server/loader.lua',

	'locales/locale.lua',
	'locales/en.lua',
    'locales/pt.lua'
}

client_scripts {
	'config.lua',
	'client/utils.lua',
	'client/cuff.lua',
	'client/drag.lua',
	'client/trunk.lua',
	'client/bind.lua',
	'client/blindfold.lua',
	'client/menu.lua',
	'client/loader.lua',

	'locales/locale.lua',
	'locales/en.lua',
    'locales/pt.lua'
}

client_script "@InfinityAC/src/client/src_c_03.lua"