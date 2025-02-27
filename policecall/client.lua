local ox_target = exports['ox_target']

Citizen.CreateThread(function()
    -- Koordináty policejní stanice
    local policeStationCoords = vector3(441.2609, -981.9473, 30.6895)  -- Změň podle tvé skutečné policejní stanice
    local range = 2.0  -- Vzdálenost, na kterou se objeví interakce

    -- Přidání interakce pomocí ox_target
    ox_target:addSphereZone({
        coords = policeStationCoords,  -- Koordináty policejní stanice
        radius = range,  -- Velikost oblasti pro interakci
        debug = false,  -- Vypnutí debugování
        options = {
            {
                name = "call_for_help",  -- Název interakce
                label = "Zavolej pomoc",  -- Text na obrazovce
                icon = "fa-solid fa-phone",  -- Ikona pro tuto akci
                onSelect = function()
                    -- Získání hráčových informací
                    local data = exports['cd_dispatch']:GetPlayerInfo()
                    
                    -- Zavolání serverového eventu pro odeslání notifikace
                    TriggerServerEvent('police:callForHelp', data.coords, data.sex, data.street, data.unique_id)
                end,
            }
        }
    })
end)
