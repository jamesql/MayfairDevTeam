-- Client.lua
local TggleSling = false
local gunn = nil

RegisterCommand("sling", function(source, args)
	local ped = GetPlayerPed(-1)
	if GetSelectedPedWeapon(ped) == GetHashKey("weapon_carbinerifle") then
		RemoveWeaponFromPed(ped, GetHashKey("weapon_carbinerifle"))
		TggleSling = true
		Sling()
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^1You have Slinged your AR!")
	else
		TggleSling = false
		TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^1You do not have a AR to sling!")
	end
end)

RegisterCommand("unsling", function(source, args)
	local ped = GetPlayerPed(-1)
	if (TggleSling == true) then
		UnSling()
		ShowNotification("Unslinged!")
		GiveWeaponToPed(ped, GetHashKey("weapon_carbinerifle"), 999, false, true)
	else
	TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^1You do not have an AR slinged!")
	end
end)


function Sling()
	if (gunn == nil) then
	gunn = CreateObject(GetHashKey("w_ar_carbinerifle"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(gunn, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 24818), -0.05, -0.13, 0, 0, 50.05, 0.55, true, true, false, true, 1, true)
	end
end

function UnSling()
	DeleteEntity(gunn)
	gunn = nil
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

-- __resource.lua


# Download Link
