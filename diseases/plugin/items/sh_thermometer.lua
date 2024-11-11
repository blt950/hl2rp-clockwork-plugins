--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Thermometer";
ITEM.cost = 50;
ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
ITEM.weight = 0.2;
ITEM.access = "q";
ITEM.useText = "Apply";
ITEM.category = "UU-Branded Medicaments";
ITEM.business = true;
ITEM.description = "A stick that displays body temperature.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local lookingPly = player:GetEyeTrace().Entity
	
	if lookingPly:IsPlayer() then
		if lookingPly:GetCharacterData("diseases") == "fever" then
			Clockwork.player:Notify(player, "Thermometer: "..math.random(40.1, 43.6).."C");
		else
			Clockwork.player:Notify(player, "Thermometer: 37C");
		end
		return false;
	else
		Clockwork.player:Notify(player, "You must target a person!");
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();