local isDriving = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local ped = PlayerPedId(-1)
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            local speed = GetEntitySpeed(vehicle) * 3.6
            
            if DoesEntityExist(vehicle) then
                if speed >= 5 and not isDriving then
                    isDriving = true
                    ShakeGameplayCam('SKY_DIVING_SHAKE', Config.ShakeStrength)
                    Citizen.Wait(Config.ShakeDuration)
                    StopGameplayCamShaking(0)
                elseif speed == 0 then
                    isDriving = false
                end
            end
        end
    end
end)

--Pretty simple huh?