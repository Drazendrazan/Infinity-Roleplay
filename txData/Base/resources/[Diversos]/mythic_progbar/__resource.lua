fx_version 'adamant'

game 'gta5'fx_version 'adamant'

game 'gta5'

name 'Mythic Framework Progress Bar'
author 'Alzar - https://github.com/Alzar'
version 'v1.0.1'

ui_page('html/index.html') 

client_scripts {
    '@es_extended/imports.lua',
    'client/functions.lua',
    'client/events.lua',
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',

    'html/css/bootstrap.min.css',
    'html/js/jquery.min.js',
}

exports {
    'Progress',
    'ProgressWithStartEvent',
    'ProgressWithTickEvent',
    'ProgressWithStartAndTick'
}

client_script "@InfinityAC/src/client/src_c_03.lua"