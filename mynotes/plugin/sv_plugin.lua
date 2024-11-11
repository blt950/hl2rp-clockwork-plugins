--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local PLUGIN = PLUGIN;

function PLUGIN:Initialize()
	Clockwork.datastream:Hook("EditNotes", function(player, data)
		if (player.editNotesAuthorised == data[1] and type( data[2] ) == "string") then
			data[1]:SetCharacterData( "notesdata", string.sub(data[2], 0, 500) );
			
			player.editNotesAuthorised = nil;
		end;
	end);
end;
