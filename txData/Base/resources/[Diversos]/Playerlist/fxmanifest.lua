fx_version 'cerulean'
game 'gta5'

files {
    "UI/ui.html",
    "UI/style.css",
    "UI/script.js",
}

ui_page 'UI/ui.html'

shared_script '@es_extended/imports.lua'

server_scripts {
    "server.lua"
}

client_scripts {
    "client.lua"
}