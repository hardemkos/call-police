local ox_target = exports['ox_target']

Citizen.CreateThread(function()
    -- Koordináty policejní stanice
    local policeStationCoords = vector3(441.2609, -981.9473, 30.6895)  
    local range = 2.0 


    ox_target:addSphereZone({
        coords = policeStationCoords,  
        radius = range,  
        debug = false,  
        options = {
            {
                name = "call_for_help",  
                label = "Zavolej pomoc",  
                icon = "fa-solid fa-phone",  
                onSelect = function()
                  
                    local data = exports['cd_dispatch']:GetPlayerInfo()
                    
                    
                    TriggerServerEvent('police:callForHelp', data.coords, data.sex, data.street, data.unique_id)
                end,
            }
        }
    })
end)
