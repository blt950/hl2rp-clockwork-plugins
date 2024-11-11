--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

/*
===================================================
================== CONFIGURATION ==================
===================================================
*/

local peakSplit = 16 // The ammount of players that splits the peaks. Low peak and high peak. This number is when the high peak starts
local lowPeakTime = 30 // The amount of minutes a player has to be AFK during low peak to get kicked.
local highPeakTime = 15 // The amount of minutes a player has to be AFK during high peak to get kicked.

/*
===================================================
============= DO NOT EDIT BELOW THIS ==============
===================================================
*/


local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

function PLUGIN:GetPlayerAmount()
	local count = 0
	for k,v in pairs(player.GetAll()) do
		count = count + 1
	end
	return count;
end

function PLUGIN:ClockworkInitPostEntity()
	timer.Create( "afkTimer", 5, 0, function()
		for k,ply in pairs(player.GetAll()) do
			if !ply:IsUserGroup("operator") and !ply:IsAdmin() and !ply:IsSuperAdmin() then

				if(ply.lastAngles != ply:EyeAngles().pitch)then

					ply.AFK = CurTime()
					ply.lastAngles = ply:EyeAngles().pitch

				elseif(self:GetPlayerAmount() >= peakSplit and ply.AFK < CurTime() - highPeakTime*60)then
					Clockwork.player:NotifyAll("System has kicked '"..ply:Name().."' (AFK more than "..highPeakTime.." minutes).");
					ply:Kick("AFK more than "..highPeakTime.." minutes");
				elseif(self:GetPlayerAmount() <= (peakSplit-1) and ply.AFK < CurTime() - lowPeakTime*60)then
					Clockwork.player:NotifyAll("System has kicked '"..ply:Name().."' (AFK more than "..lowPeakTime.." minutes).");
					ply:Kick("AFK more than "..lowPeakTime.." minutes");
				end
			end
		end
	end)
end;