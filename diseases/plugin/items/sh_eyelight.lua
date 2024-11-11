--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Eyelight";
ITEM.cost = 50;
ITEM.model = "models/lagmite/lagmite.mdl";
ITEM.weight = 0.2;
ITEM.access = "q";
ITEM.useText = "Apply";
ITEM.category = "UU-Branded Medicaments";
ITEM.business = true;
ITEM.description = "A small flashlight you can check someones eyes with.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local lookingPly = player:GetEyeTrace().Entity
	
	if lookingPly:IsPlayer() then
		if lookingPly:GetCharacterData("diseases") == "blindness" then
			Clockwork.player:Notify(player, "The eyes of the person barely respond to the light.");
		elseif lookingPly:GetCharacterData("diseases") == "colorblindness" then
			Clockwork.player:Notify(player, "The eyes of the person seems not to respond to colored light.");
		else
			Clockwork.player:Notify(player, "The eyes of the person seems to respond to the light.");
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