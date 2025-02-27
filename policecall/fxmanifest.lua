fx_version 'cerulean'
game 'gta5'

author 'Tvoje jméno nebo název serveru'
description 'Skript pro zavolání pomoci na policejní stanici pomocí ox_target a cd_dispatch'
version '1.0.0'

client_scripts {
    'client.lua'  -- Klientská část skriptu
}

server_scripts {
    'server.lua'  -- Serverová část skriptu
}

dependencies {
    'ox_target',    -- Závislost na ox_target pro interakce
    'cd_dispatch'   -- Závislost na cd_dispatch pro notifikace
}
