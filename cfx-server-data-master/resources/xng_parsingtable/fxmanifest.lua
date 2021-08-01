
-- Define the FX Server version and game type
fx_version "adamant"
game "gta5"

-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


-- Script


client_scripts {
	'client.lua'
}
server_script {
	'server.lua'
}

exports {
    'ParsingTable_cl'
}

server_exports {
    'ParsingTable_sv'
}
