--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local COMMAND = Clockwork.command:New("MyNotes");
COMMAND.tip = "View my own notes.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	Clockwork.datastream:Start( player, "EditNotes", { player, player:GetCharacterData("notesdata") } );
	player.editNotesAuthorised = player;
end;

COMMAND:Register();