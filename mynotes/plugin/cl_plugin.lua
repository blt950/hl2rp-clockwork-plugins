--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:Initialize()
	Clockwork.datastream:Hook("EditNotes", function(data)
		if (IsValid( data[1] )) then
			if (Schema.notesPanel and Schema.notesPanel:IsValid()) then
				Schema.notesPanel:Close();
				Schema.notesPanel:Remove();
			end;
			
			Schema.notesPanel = vgui.Create("cwNotes");
			Schema.notesPanel:Populate(data[1], data[2] or "");
			Schema.notesPanel:MakePopup();
			
			gui.EnableScreenClicker(true);
		end;
	end);
end