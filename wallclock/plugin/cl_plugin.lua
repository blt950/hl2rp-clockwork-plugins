--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

Clockwork.datastream:Hook("Clocks", function(data)
	cwClocks.storedList = data;
end);

Clockwork.datastream:Hook("ClocksAdd", function(data)
	cwClocks.storedList[#cwClocks.storedList + 1] = data;
end);

Clockwork.datastream:Hook("ClocksRemove", function(data)
	for k, v in pairs(cwClocks.storedList) do
		if (v.position == data) then
			cwClocks.storedList[k] = nil;
		end;
	end;
end);