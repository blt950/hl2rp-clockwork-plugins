--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

surface.CreateFont( "ClockFont", {
	 font = "Arial Black",
	 size = 106,
	 weight = 1400,
	 blursize = 0,
	 scanlines = 0,
	 antialias = true,
	 underline = false,
	 italic = false,
	 strikeout = false,
	 symbol = false,
	 rotary = false,
	 shadow = false,
	 additive = false,
	 outline = false
	} )

local timestamp = CurTime()
local splitter


-- Called just after the translucent renderables have been drawn.
function cwClocks:PostDrawTranslucentRenderables(bDrawingDepth, bDrawingSkybox)
	if (bDrawingSkybox or bDrawingDepth) then return; end;

	local eyeAngles = EyeAngles();
	local eyePos = EyePos();
	
	cam.Start3D(eyePos, eyeAngles);
		for k, v in pairs(self.storedList) do
			local alpha = math.Clamp(
				Clockwork.kernel:CalculateAlphaFromDistance(1024, eyePos, v.position) * 1.5, 0, 255
			);

			local minute = Clockwork.kernel:ZeroNumberToDigits(Clockwork.time:GetMinute(), 2);
			local hour = Clockwork.kernel:ZeroNumberToDigits(Clockwork.time:GetHour(), 2);
			
			if CurTime() > timestamp then
				if first then
					splitter = ":"
					first = false
					timestamp = CurTime()+1
				else
					splitter = " "
					first = true
					timestamp = CurTime()+1
				end
			end
			
			if (alpha > 0) then

				v.markupObject = markup.Parse(
					"<font=ClockFont><colour=255,255,255,255>"..hour..splitter..minute.."\n</colour></font>"
				);
				Clockwork.kernel:OverrideMarkupDraw(v.markupObject);
				
				cam.Start3D2D(v.position, v.angles, (v.scale or 0.25) * 0.2);
					if tobool(v.text) then
						draw.RoundedBox( 0, -130, -5, 260, 110, Color(100,100,100,alpha))
						draw.RoundedBox( 8, -125, 0, 250, 100, Color(0,0,0,alpha))

					end
					render.PushFilterMin(TEXFILTER.ANISOTROPIC);
					render.PushFilterMag(TEXFILTER.ANISOTROPIC);
							v.markupObject:Draw(0, 40, 1, nil, alpha);
					render.PopFilterMag();
					render.PopFilterMin();
				cam.End3D2D();
			end;
		end;
	cam.End3D();
end;