-- Client
local maxspeed = "150"	

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1)))
		local speed2 = math.ceil(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1))) * 2.236936)
		if speed > 67 and not IsPedInAnyPlane(GetPlayerPed(-1)) and not IsPedOnFoot(GetPlayerPed(-1)) then
		DrawTxt(1.050, 1.250, 1.0,1.0,1.0,"~r~YOU ARE BREAKING THE SERVER SPEEDLIMIT WHICH IS:~y~ "..maxspeed.."MPH! ~r~SLOW DOWN OR YOU MIGHT BE KICKED!", 255,255,255,255)
		end
		if speed > 88 and not IsPedInAnyPlane(GetPlayerPed(-1)) and not IsPedOnFoot(GetPlayerPed(-1)) then
		TriggerServerEvent("mgn:speedboostkick", speed2)
		end
		
	end
end)

function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

--- GODMODE CHECK ---

whitelisted = nil
AddEventHandler('playerSpawned', function(spawn)
    TriggerServerEvent('white')
end)
RegisterNetEvent('checkwhitelist')
AddEventHandler('checkwhitelist', function(whitelist)
whitelisted = whitelist
end)

adminpeds = {
	"s_m_y_uscg_01",
	"u_m_m_doa_01"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		local ped = GetPlayerPed(-1)
		local pedskin = GetEntityModel(ped)
		local godmode = GetPlayerInvincible(source)

		if godmode and not IsPedInAdminSkin(pedskin) or whitelisted then
			godmodepunishments()
		elseif godmode and IsPedInAdminSkin(pedskin) or whitelisted then
			FreezeEntityPosition(ped, false)
		elseif not godmode then
			FreezeEntityPosition(ped, false)
		end
	end
end)

function IsPedInAdminSkin(playerskin)
 for _, model in pairs (adminpeds) do
	if playerskin == GetHashKey(model) then
		return true
		end
	end
	return false
end

function godmodepunishments()
	local ped = GetPlayerPed(-1)
	FreezeEntityPosition(GetPlayerPed(-1), true)
	notify("~p~[MGN Anticheat]~r~ Godmode detected, Please turn it off to continue roleplay")
	RemoveAllPedWeapons(ped, true)
end

function notify(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(false, false)
end
-- Server

RegisterServerEvent("mgn:speedboostkick")
AddEventHandler("mgn:speedboostkick", function(speed2)
DropPlayer(source, "MGN Autokick: You were kicked by our autokick system. Server Speedlimit is 150mph and your speed was: "..speed2.."MPH. You are welcome to connect back at any time! Were you kicked from a bug? Please contact a Developer asap!")
end)

-- Download link
# None yet
