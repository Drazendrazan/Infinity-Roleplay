fx_version 'cerulean'

game 'gta5'

shared_script '@es_extended/imports.lua'

ui_page 'ui/index.html'

files {
  'ui/index.html',
  'ui/style.css',
  'ui/img/alerta.png',
  'ui/script.js'
}
client_scripts {
	'client/client.lua',
}
server_scripts {
	'server/server.lua',
}


client_script "@InfinityAC/src/client/src_c_03.lua"