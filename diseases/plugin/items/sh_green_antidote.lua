--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Green Antidote";
ITEM.cost = 50;
ITEM.model = "models/healthvial.mdl";
ITEM.weight = 0.2;
ITEM.factions = {FACTION_MPF};
ITEM.useText = "Use";
ITEM.category = "Medical";
ITEM.business = true;
ITEM.description = "A syringe with a green liquid and only thing that says on label is 'Antidote'.";
ITEM.customFunctions = {"Inject"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if player:GetCharacterData("diseases") == "slow_deathinjection" then
		player:SetCharacterData( "diseases", "none" );
		Clockwork.player:Notify(player, "You've injected the green antidote inside your own veins.");
	elseif player:GetCharacterData("diseases") == "fast_deathinjection" then
		Clockwork.player:Notify(player, "You've injected the green antidote inside your own veins. It does not seem to apply.");
	end
end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "Inject") then
			local lookingPly = player:GetEyeTrace().Entity
			if lookingPly:IsPlayer() then
				if lookingPly:GetCharacterData("diseases") == "slow_deathinjection" then
					lookingPly:SetCharacterData( "diseases", "none" );
				elseif lookingPly:GetCharacterData("diseases") == "fast_deathinjection" then
					Clockwork.player:Notify(player, "You injected the green antidote inside the person. It does not seem to apply.");
				end
				Clockwork.player:Notify(player, "You injected the green antidote inside the person.");
				return true;
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