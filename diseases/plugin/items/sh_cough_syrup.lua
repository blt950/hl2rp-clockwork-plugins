--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	� 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "UU-Branded Cough Syrup";
ITEM.uniqueID = "cough_syrup";
ITEM.cost = 25;
ITEM.model = "models/props_junk/glassjug01.mdl";
ITEM.weight = 0.2;
ITEM.access = "q";
ITEM.useText = "Drink";
ITEM.category = "UU-Branded Medicaments";
ITEM.business = true;
ITEM.description = "A glass jug filled with a brown slimy substance.";
ITEM.customFunctions = {"Give"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if player:GetCharacterData("diseases") == "cough" then
		player:SetCharacterData( "diseases", "none" );
	end
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Give") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				if lookingPly:GetCharacterData("diseases") == "cough" then
					lookingPly:SetCharacterData( "diseases", "none" );
					Clockwork.player:Notify(player, "You gave some cough sirup to the person.");
					player:TakeItem(player:FindItemByID("cough_syrup"));
				end
			else
				Clockwork.player:Notify(player, "You must target a person!");
				return false;
			end;
		end;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();