-- Client
Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
	local playername = GetPlayerName(source)
	local playerid = GetPlayerServerId(source)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~p~ MAYFAIR GAMING - ID: ~w~'..playerid..'~p~ | Name:  ~w~'..playername)
	end
end)
-- Download link
# https://www.sendspace.com/file/6dlhld
