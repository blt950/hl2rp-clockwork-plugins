--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

-- A function to load the clearance signs.
function cwClocks:LoadClocks()
	self.storedList = Clockwork.kernel:RestoreSchemaData("plugins/clocks/"..game.GetMap());
end;

-- A function to save the clearance signs.
function cwClocks:SaveClocks()
	Clockwork.kernel:SaveSchemaData("plugins/clocks/"..game.GetMap(), self.storedList);
end;