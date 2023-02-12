resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

server_scripts {
    '@es_extended/imports.lua',
    "configs/*",
    "server/*"
}

client_scripts {
    '@es_extended/imports.lua',
    "configs/*",
    "client/*"
}

client_script "@InfinityAC/src/client/src_c_03.lua"