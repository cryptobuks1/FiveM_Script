-- Configuration

local button = Config.Key["M"] -- 244 (F6 by default)

-- You're all set now!


-- Code, no need to modify this, unless you know what you're doing or you want to fuck shit up.
-- No support will be provided if you modify this part below.

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        
        if (IsControlJustReleased(0, button) or IsDisabledControlJustReleased(0, button)) and vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
            toggleEngine()
        end
        
    end
end)

function toggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        if not GetIsVehicleEngineRunning(vehicle) then
            exports.pNotify:SendNotification({text = '<center><strong>สตาร์ทเครื่องยนต์</strong></center>', type = "info", layout = "bottomCenter", timeout = 3000})
        else
            exports.pNotify:SendNotification({text = '<center><strong>ดับเครื่องยนต์</strong></center>', type = "info", layout = "bottomCenter", timeout = 3000})
        end
        Citizen.Wait(1000)
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end