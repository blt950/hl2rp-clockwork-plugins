--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local COMMAND = Clockwork.command:New("ClockAdd");
COMMAND.tip = "Add clock to a surface.";
COMMAND.text = "<background Bool>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local traceLine = player:GetEyeTraceNoCursor();
	local fScale = 3;
	
	if (fScale) then
		fScale = fScale * 0.25;
	end;
	
	local data = {
		text = arguments[1],
		scale = fScale,
		angles = traceLine.HitNormal:Angle(),
		position = traceLine.HitPos + (traceLine.HitNormal * 1.25)
	};
	
	data.angles:RotateAroundAxis(data.angles:Forward(), 90);
	data.angles:RotateAroundAxis(data.angles:Right(), 270);
	
	Clockwork.datastream:Start(nil, "ClocksAdd", data);
	
	cwClocks.storedList[#cwClocks.storedList + 1] = data;
	cwClocks:SaveClocks();
	
	Clockwork.player:Notify(player, "You have added a clock.");
end;

COMMAND:Register();