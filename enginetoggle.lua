# Engine Toggle By Viggo

-- Client --
RegisterCommand("engine", function(source, args, raw)
    engine()
end)

function engine()
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        if IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
            SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false, true)
            SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
            notify("Engine off")
        else
            SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false, true)
            SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
            notify("~g~Engine on")
        end
    else
       notify('~r~You must be inside of a vehicle')
    end
end

function notify(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(false, false)
end
-- Download Link --
https://www.sendspace.com/file/8deb0k
