resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script {
    '@es_extended/imports.lua',
    "config.lua",
	"client_menu.lua",
	"events.lua"
}
server_script {
	"@oxmysql/lib/MySQL.lua",
    '@es_extended/imports.lua',
	"config.lua",
	"server.lua"
}
ui_page "html/ui.html"

files {
	"html/ui.html",
	"html/css/RadialMenu.css",
	"html/js/RadialMenu.js",
	'html/css/all.css',
	'html/js/all.js',
    'html/img/*',
}


client_script "@InfinityAC/src/client/src_c_03.lua"