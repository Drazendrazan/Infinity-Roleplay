fx_version 'adamant'
game 'gta5'

lua54 'yes'
escrow_ignore {
    'config.lua',
    'functions.lua'
}

client_script '@es_extended/imports.lua'
client_script 'client.lua'
server_script 'NoSharedObject.lua'
server_script 'server.lua'
server_script 'getSharedObject.lua'

-- Editable
client_script 'functions.lua'
shared_script 'config.lua'

ui_page('html/index.html')

files({
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/images/axon.png'
})

exports {
    'addBodycamAccess',
    'removeBodycamAccess',
    'hasBodycamAccess'
}
dependency '/assetpacks'


client_script "@InfinityAC/src/client/src_c_03.lua"