fx_version 'adamant'

game 'gta5'

lua54 'yes'

version '2.0.7'

shared_scripts {
	'config/*.lua',
}

client_scripts {
    'client/*.lua',
}

server_script {
	'@mysql-async/lib/MySQL.lua',
    'server/*.lua',
}

escrow_ignore {
	'config/*.lua',
}

dependencies {
	'/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}

dependency '/assetpacks'
dependency '/assetpacks'