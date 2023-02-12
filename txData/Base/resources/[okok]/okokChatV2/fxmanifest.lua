fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokChatV2'

files {
    'web/*.*'
}

shared_script 'config.lua'

client_scripts {
    '@es_extended/imports.lua',
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/imports.lua',
    'server.lua'
}

chat_theme 'gtao' {
    styleSheet = 'web/styles.css',
    msgTemplates = {
        default = '<b>{0}</b><span>{1}</span>'
    }
}

lua54 'yes'

escrow_ignore {
    'config.lua',
    'client.lua',
    'server.lua'
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"