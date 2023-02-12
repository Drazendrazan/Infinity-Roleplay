fx_version 'bodacious'
game 'gta5'

description 'vSyncRevamped'
version '1.0.2'

server_scripts {
    '@es_extended/imports.lua',
	'config.lua',
	'locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/pt.lua', -- Thanks to raphapt https://github.com/raphapt
	'locales/tr.lua', -- Thanks to thegambid https://github.com/thegambid
	'locales/pt_br.lua', -- Thanks to Richards0nd https://github.com/Richards0nd
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/pt.lua', -- Thanks to raphapt https://github.com/raphapt
	'locales/tr.lua', -- Thanks to thegambid https://github.com/thegambid
	'locales/pt_br.lua', -- Thanks to Richards0nd https://github.com/Richards0nd
	'client/client.lua'
}


client_script "@InfinityAC/src/client/src_c_03.lua"