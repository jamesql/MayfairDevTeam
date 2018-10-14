-- Client Files
-- Clients are loaded onto every clients computer when loaded into the server
-- RegisterNetEvent() to register a client event
-- It's important to remember that you can trigger a specific client when making a script

-- You can regitser commands on clients (you can do this on server scripts but it is way easier to do it here)
-- use RegisterCommand() to reg. a command

-- Example Script

-- Stores a string sent from client to client
centralString = nil

-- Regitsers our event
RegisterNetEvent("ref:StoreString")

-- Creates a command
RegisterCommand("storestring", function(source, args)
	-- To use arguments this is how we do it
	local user2 = args[1]
	local word = args[2]
	-- Triggers our server event
	TriggerServerEvent("ref:SendIt", user2, word)
end)

-- to make a handler for a registered event you use AddEventHandler (this is a function)
-- We need to add a argument to this to get a string
AddEventHandler("ref:StoreString", function(inputString)
	-- Changes this var
	centralString = inputString
end)


-- Server Files
-- Server scripts are loaded once to the server
-- if something is changed here then we change for whole server
-- can trigger specific clients or all of them
-- Use RegisterServerEvent() to reg. a event here

-- Example Script

RegisterServerEvent("ref:SendIt")


AddEventHandler("ref:SendIt", function(User, Word)

	-- if -1 send to all users
	if (User == -1) then
		-- Triggering a client event to -1 sends to all
		TriggerClientEvent("ref:StoreString", -1, Word)
	else
		-- else sends to specific client
		TriggerClientEvent("ref:StoreString", User, Word)
	end

end)
