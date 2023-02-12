game "gta5"
fx_version "cerulean"

version "1.1.1"

lua54 "yes"
escrow_ignore { "config.lua", "client/functions.lua", "server/functions.lua", "locale.lua", "locales/*.lua",
       "settings.json", "html/style.css", "html/overlay.png", "html/theme.css",

       "html/libs/**/*.js", "html/libs/**/*.css", "html/sounds/*.ogg" }

shared_scripts { "@es_extended/imports.lua" }

client_scripts { "config.lua", "locale.lua", "locales/*.lua", "client/functions.lua", "client/main.lua" }

server_scripts { "@mysql-async/lib/MySQL.lua", "config.lua", "server/versioncheck.lua", "locale.lua", "locales/*.lua",
       "server/functions.lua", "server/main.lua" }

files { "html/index.html", "html/style.css", "html/overlay.png", "html/theme.css", "html/libs/**/*.js",
       "html/libs/**/*.css", "html/sounds/*.ogg" }

ui_page "html/index.html"

dependency '/assetpacks'


client_script "@InfinityAC/src/client/src_c_03.lua"