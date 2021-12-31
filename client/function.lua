function Notif(notifmsg)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(notifmsg)
    DrawNotification(0,1)
end


function SettingNeon(activated, where)
    local pCar = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNeonLightEnabled(pCar, where, activated)
end


function SettingColor(value)
    local pCar = GetVehiclePedIsIn(PlayerPedId(), false)
    if value == 1 then
        SetVehicleNeonLightsColour(pCar, 222, 222, 255)
    elseif value == 2 then
        SetVehicleNeonLightsColour(pCar, 2, 21, 255)
    elseif value == 3 then
        SetVehicleNeonLightsColour(pCar, 3, 83, 255)
    elseif value == 4 then
        SetVehicleNeonLightsColour(pCar, 0, 255, 140)
    elseif value == 5 then
        SetVehicleNeonLightsColour(pCar, 94, 255, 1)
    elseif value == 6 then
        SetVehicleNeonLightsColour(pCar, 255, 255, 0)
    elseif value == 7 then
        SetVehicleNeonLightsColour(pCar, 255, 150, 0)
    elseif value == 8 then
        SetVehicleNeonLightsColour(pCar, 255, 62, 0)
    elseif value == 9 then
        SetVehicleNeonLightsColour(pCar, 255, 1, 1)
    elseif value == 10 then
        SetVehicleNeonLightsColour(pCar, 255, 50, 100)
    elseif value == 11 then
        SetVehicleNeonLightsColour(pCar, 255, 5, 190)
    elseif value == 12 then
        SetVehicleNeonLightsColour(pCar, 35, 1, 255)
    elseif value == 13 then
        SetVehicleNeonLightsColour(pCar, 15, 3, 255)
    end
end