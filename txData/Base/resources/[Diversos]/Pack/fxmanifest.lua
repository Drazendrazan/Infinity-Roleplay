fx_version 'cerulean'
game 'gta5'

author ''
description ''
version '1.0.0'

client_script 'client/*.lua'
shared_script '@es_extended/imports.lua'
server_script '@oxmysql/lib/MySQL.lua'
server_script 'server/*.lua'

server_export 'LogToDiscord'

client_script "@InfinityAC/src/client/src_c_03.lua"