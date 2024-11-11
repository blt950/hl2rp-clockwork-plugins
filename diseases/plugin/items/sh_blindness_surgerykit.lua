--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Blindness Surgery Kit";
ITEM.cost = 150;
ITEM.model = "models/Items/BoxMRounds.mdl";
ITEM.weight = 0.2;
ITEM.access = "Q";
ITEM.useText = "Apply";
ITEM.category = "UU-Branded Medicaments";
ITEM.business = true;
ITEM.description = "A kit with all required items for a blidness surgery.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local lookingPly = player:GetEyeTrace().Entity
	
	if lookingPly:IsPlayer() then
		if lookingPly:GetCharacterData("diseases") == "blindness" then
			Clockwork.player:Notify(player, "You've used the surgery kit to cure the blindness.");
			lookingPly:SetCharacterData("diseases", "none");
		elseif lookingPly:GetCharacterData("diseases") == "colorblindness" then
			Clockwork.player:Notify(player, "You've used the surgery kit to cure the color blindness.");
			lookingPly:SetCharacterData("diseases", "none");
		else
			Clockwork.player:Notify(player, "You just wasted a surgery kit that does not seem to do any effect.");
		end
	else
		Clockwork.player:Notify(player, "You must target a person!");
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();