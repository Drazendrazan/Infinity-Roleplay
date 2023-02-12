resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

description 'Napad ammunation by GLN (zakaz resellowania)'

shared_script '@es_extended/imports.lua'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_script "@InfinityAC/src/client/src_c_03.lua"