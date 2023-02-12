fx_version 'adamant'

game 'gta5'

description 'esx Identity'

version '1.2.0'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'locales/en.lua',
	'locales/cs.lua',
	'locales/de.lua',
	'locales/fr.lua',
	'locales/pt.lua',
	'config.lua',
	'server/main.lua',
	'server/logs.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/cs.lua',
	'locales/de.lua',
	'locales/fr.lua',
	'locales/pt.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/script.js',
	'html/style.css'
}

dependency 'es_extended'


exports {
  'openRegistry'
}


client_script "@InfinityAC/src/client/src_c_03.lua"