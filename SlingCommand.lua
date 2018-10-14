-- Client.lua
local TggleSling = false
local gunn = nil

RegisterCommand("sling", function(source, args)
	local ped = GetPlayerPed(-1)
	if GetSelectedPedWeapon(ped) == GetHashKey("weapon_specialcarbine") then
		SetPedDropsWeapon(ped)
		TggleSling = true
		Sling()
		ShowNotification("Slinged!")
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
		GiveWeaponToPed(ped, GetHashKey("weapon_specialcarbine"), 999, false, true)
	else
	TriggerEvent('chatMessage', '^1[[Mayfair]', {255, 255, 255}, "^1You do not have an AR slinged!")
	end
end)


function Sling()
	if (gunn == nil) then
	gunn = CreateObject(GetHashKey("w_ar_specialcarbine"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(gunn, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 24818), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
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
