RegisterNetEvent('police:callForHelp', function(playerCoords, playerSex, playerStreet, playerUniqueId)
    local src = source
    local player = GetPlayerName(src)

    
    local callMessage
    if playerSex == "male" then
        callMessage = "zavolal policii na recepci."
    else
        callMessage = "zavolala policii na recepci."
    end

    
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job_table = {'police'},  
        coords = playerCoords,  
        title = 'Volani na pomoc',  
        message = 'Hrac ('..playerSex..') '..callMessage..' Misto: '..playerStreet,  
        flash = 0,
        unique_id = playerUniqueId,  
        sound = 1,  
        blip = {
            sprite = 431,  
            scale = 1.2,  
            colour = 3,  
            flashes = false,
            text = 'Zavolal policii na recepci',  
            time = 5,  
            radius = 0,
        }
    })
end)
