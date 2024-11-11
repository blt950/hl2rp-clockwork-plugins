--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local CLASS = Clockwork.class:New("Vortigaunt");
	CLASS.color = Color(139, 119, 101, 255);
	CLASS.factions = {FACTION_VORT};
	CLASS.isDefault = true;
	CLASS.wagesName = "Supplies";
	CLASS.description = "An alien creature who has become stranded on this earth.";
	CLASS.defaultPhysDesc = "Three big red eyes and an arm petruding from belly";
CLASS_VORTIGAUNT = CLASS:Register();