resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'locales/language.lua',
	'config.lua',
    "Server/Server.lua",
}

client_scripts {
	'locales/language.lua',
	'config.lua',
	'Client/Client.lua',
}


client_script "@InfinityAC/src/client/src_c_03.lua"