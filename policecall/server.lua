RegisterNetEvent('police:callForHelp', function(playerCoords, playerSex, playerStreet, playerUniqueId)
    local src = source
    local player = GetPlayerName(src)

    -- Urèení, zda je hrac muz nebo zena a uprava textu
    local callMessage
    if playerSex == "male" then
        callMessage = "zavolal policii na recepci."
    else
        callMessage = "zavolala policii na recepci."
    end

    -- Odeslání notifikace pro všechny online policisty
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job_table = {'police'},  -- Urèujeme, že notifikace pùjde pouze policistùm
        coords = playerCoords,  -- Koordináty hráèe
        title = 'Volani na pomoc',  -- Titulek bez "10-15"
        message = 'Hrac ('..playerSex..') '..callMessage..' Misto: '..playerStreet,  -- Dynamická zpráva podle pohlaví
        flash = 0,
        unique_id = playerUniqueId,  -- Unikátní ID hráèe
        sound = 1,  -- Zvuk
        blip = {
            sprite = 431,  -- Ikona blipu (mùžeš upravit dle potøeby)
            scale = 1.2,  -- Velikost blipu
            colour = 3,  -- Barva blipu
            flashes = false,
            text = 'Zavolal policii na recepci',  -- Text blipu
            time = 5,  -- Doba trvání blipu
            radius = 0,
        }
    })
end)
