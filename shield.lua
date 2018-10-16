-- Client.lua
local Tggleshield = false
local shieldd = nil

RegisterCommand("shieldon", function(source, args)
	local ped = GetPlayerPed(-1)
	Tggleshield = true
	Shieldon()
	ShowNotification("~p~[Mayfair] ~w~Shield Equipped!")
end)

RegisterCommand("shieldoff", function(source, args)
	local ped = GetPlayerPed(-1)
	if (Tggleshield == true) then
		ShieldBack()
		ShowNotification("~p~[Mayfair] ~w~Shield Unequipped!")
	else
		TriggerEvent('chatMessage', '^1[Mayfair]', {255, 255, 255}, "^1You dont have a shield equipped!")
	end
end)


function Shieldon()
	if (shieldd == nil) then
	shieldd = CreateObject(GetHashKey("prop_riot_shield"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(shieldd, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 61163), 0.0249999, 0.03, -0.145, 110.68, -53.5302, -173.02, true, true, true, true, 1, true)
	end
end

function ShieldBack()
	DeleteEntity(shieldd)
	shieldd = nil
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end 

# No download yet
