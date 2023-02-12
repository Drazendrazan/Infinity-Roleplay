fx_version 'adamant'
game 'gta5'

author 'Power Scripts (power-scripts.com)'

lua54 'yes'
escrow_ignore {
 'config.lua',
 'notification.lua'
}

shared_script '@es_extended/imports.lua'

client_script 'client.lua'
client_script 'notification.lua'
server_script 'server.lua'
shared_script 'config.lua'

ui_page('html/index.html')

files({
 'html/index.html',
 'html/script.js',
 'html/style.css',
})

exports {
 'addDashcamAccess',
 'removeDashcamAccess',
 'hasDashcamAccess'
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"