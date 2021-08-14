-- DO NOT CHANGE IF YOU DO NOT KNOW WHAT YOU ARE DOING!!!!
-- - 1 : x
-- - 2 : y
-- - 3 : z
-- - 4 : heading
-- - 5 : model hash
-- - 6 : ped model
-- - 7 : heading text
-- - 8 : animation string
ESX = nil

CreateThread(function()
    for _, v in pairs(Config.Peds) do
        addNPC(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
    end
end)

CreateThread(function()
    while Config.displayText do
        local pos = GetEntityCoords(PlayerPedId())
        
        Wait(0)
        for _, v in pairs(Config.Peds) do
            local distance = #(pos - vec3(v[1], v[2], v[3]))
            if (distance < Config.displayDistance) then
                local distance = GetDistanceBetweenCoords(pos, v[1], v[2], v[3], true)
                -- DrawText4GGGD(v[1], v[2], v[3] + 1, Config.displayColor .. v[7], 1.2, 1)
                if distance <= 5.0 then
                    local size = distance
                    if distance <= 2.0 then
                        size = 2
                    end
                    -- DrawText3D(v[1], v[2], v[3] + 1, Config.displayColor .. v[7], size, 1)
                    DrawText3D(v[1], v[2], v[3] + 0.25 , "[~g~E~w~] " .. v[7], size, 0.5)
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text, scl, font)

    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local camX, camY, camZ = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(camX, camY, camZ, x, y, z, 1)

    local scale = (1 / dist) / scl
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 1.1 * scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function addNPC(x, y, z, heading, hash, model, headingText, animation)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(15)
    end
    RequestAnimDict(animation)
    while not HasAnimDictLoaded(animation) do
        Wait(15)
    end
    ped = CreatePed(4, model, x, y, z - 1, 3374176, false, true)
    SetEntityHeading(ped, heading)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskPlayAnim(ped, animation, "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
end
