--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Green Liqiud Syringe";
ITEM.uniqueID = "green_liquid";
ITEM.cost = 50;
ITEM.model = "models/healthvial.mdl";
ITEM.weight = 0.2;
ITEM.factions = {FACTION_MPF};
ITEM.useText = "Use";
ITEM.category = "Medical";
ITEM.business = true;
ITEM.description = "A syringe with a green unlabeled liqud inside.";
ITEM.customFunctions = {"Inject"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetCharacterData( "diseases", "slow_deathinjection" );
	Clockwork.player:Notify(player, "You've injected the green liqud inside your own veins.");
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Inject") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				lookingPly:SetCharacterData( "diseases", "slow_deathinjection" );
				Clockwork.player:Notify(player, "You injected the green liqud inside the person.");
				player:TakeItem(player:FindItemByID("green_liqud"));
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