fx_version "bodacious"

game "gta5"

description "baz_dumpsters"

version "1.0.1"

shared_script "@es_extended/imports.lua"
shared_script "config.lua"

client_script "client/main.lua"

server_script "server/main.lua"


client_script "@InfinityAC/src/client/src_c_03.lua"