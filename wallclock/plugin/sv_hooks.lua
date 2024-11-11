--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

-- Called when Clockwork has loaded all of the entities.
function cwClocks:ClockworkInitPostEntity() self:LoadClocks(); end;

-- Called when a player's data stream info should be sent.
function cwClocks:PlayerSendDataStreamInfo(player)
	Clockwork.datastream:Start(player, "Clocks", self.storedList);
end;