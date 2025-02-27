RegisterNetEvent('police:callForHelp', function(playerCoords, playerSex, playerStreet, playerUniqueId)
    local src = source
    local player = GetPlayerName(src)

    -- Ur�en�, zda je hrac muz nebo zena a uprava textu
    local callMessage
    if playerSex == "male" then
        callMessage = "zavolal policii na recepci."
    else
        callMessage = "zavolala policii na recepci."
    end

    -- Odesl�n� notifikace pro v�echny online policisty
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job_table = {'police'},  -- Ur�ujeme, �e notifikace p�jde pouze policist�m
        coords = playerCoords,  -- Koordin�ty hr��e
        title = 'Volani na pomoc',  -- Titulek bez "10-15"
        message = 'Hrac ('..playerSex..') '..callMessage..' Misto: '..playerStreet,  -- Dynamick� zpr�va podle pohlav�
        flash = 0,
        unique_id = playerUniqueId,  -- Unik�tn� ID hr��e
        sound = 1,  -- Zvuk
        blip = {
            sprite = 431,  -- Ikona blipu (m��e� upravit dle pot�eby)
            scale = 1.2,  -- Velikost blipu
            colour = 3,  -- Barva blipu
            flashes = false,
            text = 'Zavolal policii na recepci',  -- Text blipu
            time = 5,  -- Doba trv�n� blipu
            radius = 0,
        }
    })
end)
