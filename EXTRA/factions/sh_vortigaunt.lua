--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local FACTION = Clockwork.faction:New("Vortigaunt");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "halfliferp/factions/vortigaunt";
FACTION.models = {
	female = {
		"models/vortigaunt.mdl",
	},
	male = {
		"models/vortigaunt.mdl",
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;

FACTION_VORT = FACTION:Register();