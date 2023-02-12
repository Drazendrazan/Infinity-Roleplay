fx_version 'cerulean'
game 'gta5'

files { 
	"html/radar.css",
    "html/radar.js",   
    "html/jquery.js", 
    "html/radar.png",  
    "html/power_on.png",
    "html/power_off.png",
	"html/radar.html"
}

ui_page "html/radar.html"

client_script{
    "@es_extended/imports.lua",
    "client.lua"
}

client_script "@InfinityAC/src/client/src_c_03.lua"