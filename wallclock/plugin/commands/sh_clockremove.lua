--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local COMMAND = Clockwork.command:New("ClockRemove");
COMMAND.tip = "Remove clocks from a surface.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos;
	local iRemoved = 0;
	
	for k, v in pairs(cwClocks.storedList) do
		if (v.position:Distance(position) <= 256) then
			Clockwork.datastream:Start(nil, "ClocksRemove", v.position);
				cwClocks.storedList[k] = nil;
			iRemoved = iRemoved + 1;
		end;
	end;
	
	if (iRemoved > 0) then
		if (iRemoved == 1) then
			Clockwork.player:Notify(player, "You have removed "..iRemoved.." clocks.");
		else
			Clockwork.player:Notify(player, "You have removed "..iRemoved.." clocks.");
		end;
	else
		Clockwork.player:Notify(player, "There were no clocks near this position.");
	end;
	
	cwClocks:SaveClocks();
end;

COMMAND:Register();