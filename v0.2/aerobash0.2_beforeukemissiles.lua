--[[ It's a bird... it's a plane... it's...
                         ___ __           ___ __    __
  ___ ____ ____  _________  / /_  ____ ______/ /_  / /
 ___ / __ `/ _ \/ ___/ __ \/ __ \/ __ `/ ___/ __ \/ / 
___ / /_/ /  __/ /  / /_/ / /_/ / /_/ (__  ) / / /_/  
 ___\__,_/\___/_/   \____/_.___/\__,_/____/_/ /_(_)   
     the toribash combat flight simulator     v0.2

Made by cuckooman4. (with Dafe's first-person camera)
Credits to http://www.network-science.de/ascii/ for the ASCII art. (slant font with slight edits)
--]]

--===================================== CHANGE SETTINGS HERE =====================================--
-- You can change almost everything in the game here. You'll probably find yourself content with the
-- defaults, but I put almost everything as a variable you can change here just for those of you who
-- don't like the defaults for some strange reason. There are a lot of nonessential features that
-- can be disabled, but by default all the features (with the exception of guided missiles) are on,
-- for the reason that I like to show off the full capabilities of stuff.

-- Game rules. You can change these normally ingame with /set.
gamerules = {
	gravity = -20, -- -9.82 is default Toribash gravity.
	mod = "aerobash.tbm", -- Game mod.
	ed = 5000, -- Engage distance: How far away from each other you start.
	eh = 20000, -- Engage height: How far off the ground you start.
	mf = 1000000, -- Match frames: How long the game is.
	dt = 1500 -- Dismemberment threshold: How easy it is for your plane to break.
}

-- Miscellaneous script settings. You can't change normally ingame with /set.
camMode = 2 -- Default camera mode: 0 is normal; 1 is first-person; 2 is third-person.
cameradist = 10 -- How far the third-person camera is from you by default.
zoomspeed = 1 -- How fast the third-person camera zoom is.
gamemode = 1 -- Set to 1 for the actual game; (DQ and Uke AI on) set to 0 to just fly around for
	-- fun. (DQ and Uke AI off)
freezescreen = 1 -- The "Press space to play" screen when the game is paused: 0 is off; 1 is on.
freezescreenalpha = 0.5 -- The freezescreen has a background of semitransparent white: This is the
	-- alpha value of the white. 1 is solid white; 0 is fully transparent.
boosts = 5 -- How many boosts you can use.
torialpha = 0.25 -- The opacity of Tori when using the third-person camera.

-- Uke AI settings.
uhspeed = 0.5 -- How fast Uke's head goes.
ubspeed = 1 -- How fast Uke's body goes.
ukeminalt = 100 -- How low is too low.
ukehpullup = 20 -- How fast Uke's body turns upward if too low.
ukebpullup = 150 -- How fast Uke's body turns upward if too low.

-- Aiming guide settings.
guide = {
	on = 1, -- Master on/off switch.
	length = 50,
	dots = 50, -- It's made of a bunch of dots; this is how many.
	dotradius = 0.1,
	r = 1,
	g = 0,
	b = 0,
	a = 0.5
}

-- Damage alert. This makes the screen flash red (with alpha transparency) if you take too much
	-- damage at once.
bloodalertmax = 0.5 -- The maximum opacity.
injurychangereduce = 1.5
bloodcolor = 0.7 -- 0 to 1. 0 is black, 1 is red.
bloodalert0 = 0
bloodalert1 = 50000

-- Altitude alert. Between altalert0 and altalert 1, the altitude indicator in the HUD will be a
	-- shade of red. Above altalert0, it's black, and below it, it's red. Below altalert1, the
	-- indicator will blink red/black. Also, if you're going down fast enough and are low enough,
	-- (and therefore will reach the ground in a short enough time) a flashing message will appear
	-- on the screen telling you that you're gonna crash.
altalert0 = 150
altalert1 = 50
blinkrate = 5 -- This is the frequency in frames.
altalertmessage = 1 -- Set to 0 to turn off the flashing message.
altalerttime = 0.8 -- Lower means you have to be falling faster and be lower; higher means you don't
	-- have to be falling as fast and as low.

-- Guided missile stuff. This still needs a crapload of improvements, so by default it's off.
guidedmissiles = 0 -- Master on/off switch for guided missiles. 0 is off; 1 is on.
homingrange = 10 -- How close a missile has to be to home in on it.
homingtime = 10 -- When a missile gets within range of the target, it'll home in on it for this
	-- many frames, but no more, so it doesn't just stick to it.
hspeed = 2 -- Homing speed. This is the force applied to a missile when it's within range of the
	-- enemy
target = 1 -- The bodypart the missile is guided toward
	--[[ From http://forum.toribash.com/showthread.php?t=9391:
		0 - head (head)
		1 - breast (front part of body)
		2 - chest (back part of body)
		3 - stomach (back wing)
		4 - groin (rudder)
		5 - r_pecs (right wing)
		6 - r_biceps (innermost left-wing missile)
		7 - r_triceps (sixth left-wing missile)
		8 - l_pecs (left wing)
		9 - l_biceps (innermost left-wing missile)
		10 - l_triceps (sixth left-wing missile)
		11 - r_hand (fifth right-wing missile)
		12 - l_hand (fifth left-wing missile)
		13 - r_butt (fourth right-wing missile)
		14 - l_butt (fourth left-wing missile)
		15 - r_thigh (third right-wing missile)
		16 - l_thigh (third left-wing missile)
		17 - l_leg (second left-wing missile)
		18 - r_leg (second right-wing missile)
		19 - r_foot (outermost right-wing missile)
		20 - l_foot  (outermost left-wing missile)
	--]]

-- Speeds and forces. Higher is faster unless otherwise noted.
zspeed = 30 -- Rolling speed.
yspeed = 50 -- Pitching speed.
xspeed = 30 -- Yawing speed.
sspeed = 15 -- Movement speed. This is actually acceleration, but meh.
xlift = 0 -- Lift multiplier. This acts as a master on-off switch or an easier way to change all
	-- three values at once.
blift = 1.3 -- Breast lift.
clift = 0.9 -- Chest lift.
wlift = 0.8 -- Wing lift.
aspeed = 1 -- Acceleration and deceleration.
mspeed = 250 -- Missile speed.
boost = 2 -- Boost. Speed multiplier, decreases with time via bfric variable.

-- Friction. These use division, (to go closer to zero) so use numbers greater than one. (less than
	-- one will be negative friction, less than zero will fuck your plane up, and zero will fuck up
	-- the world. 
sfric = 1.1 -- Sspeed friction.
bfric = 1.03 -- Boost friction.
mfric = 0.3 -- Motion friction. This one is mathematically different from the other friction
	-- variables, but just for ease of use, I put it here. Higher is more friction; lower is less.
rfric = 3 -- Rotational friction. Like mfric, it's mathematically different from the other friction
	-- variables, but here for ease of use. Higher is more friction; lower is less.
	
-- Various GUI stuff.
circlesides = 32 -- Circles in Toribash are actually many-sided polygons. This is how many sides.
mmpos = 75 -- How far away the minimap is from the bottom left corner.
minimapmaxdist = 250 -- 60 on the minimap represents this far in reality. (scale)
speedometerout = 170 -- Radius of the outer circle for the speedometer
speedometerin = 150 -- Radius of the inner circle for the speedometer
speedometermax = 200 -- The speedometer is full when you're going this fast
accelometerout = 140 -- Radius of the outer circle for the accelerometer
accelometerin = 120 -- Radius of the inner circle for the accelerometer
accelometermax = aspeed/(sfric-1)*2 -- The accelerometer is full when you're accelerating this fast.
	-- You can change this, but I'd recommend you leave it alone; this formula calculates the
	-- maximum possible accleration you can reach.
missilespacing = 10 -- Spacing between the missile icons.
arrowsize = 20 -- "Radius" of the pitch/yaw arrow
rollmeterout = 40 -- Radius of the outer circle for the roll indicator
rollmeterin = 30 -- Radius of the inner circle for the roll indicator
rollmeterspeed = 2 -- How fast the roll indicator spins
turnarrowpos = 48 -- How far away the turn arrows are from the bottom right corner.
boostspacing = 12 -- Spacing between the boost icons.
crosshairout = 100 -- Radius of the outer crosshair circle
crosshairin = 30 -- Radius of the inner crosshair circle
dirindicator = 1 -- On/off switch for the pitch and roll indicators; 1 is on, anything else is off.

-- Key settings here. For typing keys, use string.byte("blah"). For example, for the A key, (which I
	-- don't recommend you use because it controls the camera) use string.byte("a"). Make sure
	-- there's a comma in between each. (note how there's a comma after each one except the last
	-- one.) For other keys, use these numbers.
	--[[
		Backspace: 8
		Enter: 13
		Left shift: 304
		Right shift: 303
		Left control: 306
		Right control: 305
		Left alt: 308
		Right alt: 307
		Numpad 0: 256
		Numpad 1: 257
		Numpad 2: 258
		Numpad 3: 259
		Numpad 4: 260
		Numpad 5: 261
		Numpad 6: 262
		Numpad 7: 263
		Numpad 8: 264
		Numpad 9: 265
		Numpad /: 267
		Numpad *: 268
		Numpad -: 269
		Numpad +: 270
		Numpad enter: 271
	--]]
defaultkeys = {
	reloadscript = string.byte("0"),
	up = string.byte("k"),
	down = string.byte("i"),
	rleft = string.byte("m"),
	rright = string.byte("."),
	yleft = string.byte("j"),
	yright = string.byte("l"),
	fire_l = string.byte("z"),
	fire_r = string.byte("x"),
	accel = string.byte("u"),
	decel = string.byte("o"),
	boost = 306, -- Left control
	reset = string.byte("q"),
	rearview = 304 -- Left shift
}

--================================== DO NOT EDIT BELOW THIS LINE =================================--
-- Okay, that's a bit misleading. Because there may be a few things you want to change that happen
-- to be below this line. But unless you know what you're doing, DO NOT EDIT BELOW THAT LINE. And
-- even if you do know what you're doing, save a backup copy or something. And also, igloos. :D

if camMode == 1 or camMode == 2 then run_cmd("option tori 0") else run_cmd("option tori 1") end
run_cmd("option blood 0")

camzoom = 0

resetkeysbutton = 0.5

wx, wy = get_window_size()

blinktrack = 0
injury = 0
injurychange = 0

missilenumbers = {20,17,16,14,12,10,9,19,18,15,13,11,7,6}
missilestatus = { }
ukemissilestatus = { 7, 7 }

editkeys = 0

function round(n)
	return math.floor(n*1000)/1000
end

function distbetween(a,b)
	return(math.sqrt((a.x-b.x)^2 + (a.y-b.y)^2 + (a.z-b.z)^2))
end

-- Thanks to some dude on a Lua forum: (http://lua-users.org/lists/lua-l/2005-08/msg00813.html)
function clone(node)
  if type(node) ~= "table" then return node end
  local b = {}
  table.foreach(node, function(k,v) b[k]=clone(v) end)
  return b
end

keys = clone(defaultkeys)

-- BANG! (from the left)
function fire_l()
	checkmissiles()
	if flags.l == 7 then
		dismember_joint(0,19)
		flags.fire = -20
		missilestatus[20] = homingtime
		flags.l = 6
	elseif flags.l == 6 then
		dismember_joint(0,17)
		flags.fire = -17
		missilestatus[17] = homingtime
		flags.l = 5
	elseif flags.l == 5 then
		dismember_joint(0,15)
		flags.fire = -16
		missilestatus[16] = homingtime
		flags.l = 4
	elseif flags.l == 4 then
		dismember_joint(0,13)
		flags.fire = -14
		missilestatus[14] = homingtime
		flags.l = 3
	elseif flags.l == 3 then
		dismember_joint(0,11)
		flags.fire = -12
		missilestatus[12] = homingtime
		flags.l = 2
	elseif flags.l == 2 then
		dismember_joint(0,9)
		flags.fire = -10
		missilestatus[10] = homingtime
		flags.l = 1
	elseif flags.l == 1 then
		dismember_joint(0,8)
		flags.fire = -9
		missilestatus[9] = homingtime
		flags.l = 0
	end
end

-- BANG! (from the right)
function fire_r()
	checkmissiles()
	if flags.r == 7 then
		dismember_joint(0,18)
		flags.fire = -19
		missilestatus[19] = homingtime
		flags.r = 6
	elseif flags.r == 6 then
		dismember_joint(0,16)
		flags.fire = -18
		missilestatus[18] = homingtime
		flags.r = 5
	elseif flags.r == 5 then
		dismember_joint(0,14)
		flags.fire = -15
		missilestatus[15] = homingtime
		flags.r = 4
	elseif flags.r == 4 then
		dismember_joint(0,12)
		flags.fire = -13
		missilestatus[13] = homingtime
		flags.r = 3
	elseif flags.r == 3 then
		dismember_joint(0,10)
		flags.fire = -11
		missilestatus[11] = homingtime
		flags.r = 2
	elseif flags.r == 2 then
		dismember_joint(0,6)
		flags.fire = -7
		missilestatus[7] = homingtime
		flags.r = 1
	elseif flags.r == 1 then
		dismember_joint(0,5)
		flags.fire = -6
		missilestatus[6] = homingtime
		flags.r = 0
	end
end

function checkmissiles()
	local pa = get_body_info(0,3).pos
	local pb = get_body_info(0,2).pos
	if flags.fire < 0 then
		flags.fire = -1 * flags.fire
	elseif flags.fire ~= 0 then
		set_body_force(0,flags.fire,mspeed*(pb.x-pa.x)/distbetween(pb,pa)*0.3,mspeed*(pb.y-pa.y)/distbetween(pb,pa)*0.3,mspeed*(pb.z-pa.z)/distbetween(pb,pa)*0.3)
		flags.fire = 0
	end
end

-- Process keypresses.
function kdown(k)
	if editkeys == 0 then
		if k == keys.reloadscript then run_cmd("loadscript aerobash0.2_beforeukemissiles.lua") end
		if k == keys.yleft then flags.x = -1 end
		if k == keys.yright then flags.x = 1 end
		if k == keys.up then flags.y = 1 end
		if k == keys.down then flags.y = -1 end
		if k == keys.rleft then flags.z = -1 end
		if k == keys.rright then flags.z = 1 end
		if k == keys.fire_l and flags.fire == 0 then fire_l() end
		if k == keys.fire_r and flags.fire == 0 then fire_r() end
		if k == keys.accel then flags.a = aspeed end
		if k == keys.decel then flags.a = -1 * aspeed end
		if k == keys.reset then initrules() end
		if k == keys.boost and flags.bc > 0 then
			flags.b = boost
			flags.bc = flags.bc - 1
		end
		if k == keys.rearview then cameradist = -cameradist end
		if k == 55 then
			camMode = (camMode + 1) % 3
			if camMode == 1 or camMode == 2 then run_cmd("option tori 0") else run_cmd("option tori 1") end
		end
		
		if k == string.byte("w") and camMode == 2 then
			camzoom = -zoomspeed
			return 1
		end
		if k == string.byte("s") and camMode == 2 then
			camzoom = zoomspeed
			return 1
		end
		
		if (k == string.byte("w") or k == string.byte("a") or k == string.byte("s") or k == string.byte("d")) and camMode ~= 0 then
			return 1
		end
	else
		if editkeys == 1 then
			keys.up = k
			editkeys = 2
		elseif editkeys == 2 then
			keys.down = k
			editkeys = 3
		elseif editkeys == 3 then
			keys.rleft = k
			editkeys = 4
		elseif editkeys == 4 then
			keys.rright = k
			editkeys = 5
		elseif editkeys == 5 then
			keys.yleft = k
			editkeys = 6
		elseif editkeys == 6 then
			keys.yright = k
			editkeys = 7
		elseif editkeys == 7 then
			keys.fire_l = k
			editkeys = 8
		elseif editkeys == 8 then
			keys.fire_r = k
			editkeys = 9
		elseif editkeys == 9 then
			keys.accel = k
			editkeys = 10
		elseif editkeys == 10 then
			keys.decel = k
			editkeys = 11
		elseif editkeys == 11 then
			keys.boost = k
			editkeys = 12
		elseif editkeys == 12 then
			keys.reset = k
			editkeys = 13
		elseif editkeys == 13 then
			keys.rearview = k
			editkeys = 0
		end
	end
end

-- Process keyreleases.
function kup(k)
	if editkeys == 0 then
		if k == keys.yleft then flags.x = 0 end
		if k == keys.yright then flags.x = 0 end
		if k == keys.up then flags.y = 0 end
		if k == keys.down then flags.y = 0 end
		if k == keys.rleft then flags.z = 0 end
		if k == keys.rright then flags.z = 0 end
		if k == keys.accel then flags.a = 0 end
		if k == keys.decel then flags.a = 0 end
		if k == string.byte("w") or k == string.byte("s") then camzoom = 0 end
		if k == keys.rearview then cameradist = -cameradist end
	end
end

function mdown(b,x,y)
	if (flags.freeze == 1 or get_world_state().match_frame == 0) and freezescreen == 1 then
		if x > wx/2-80 and x < wx/2+80 and y > 120 and y < 160 and editkeys == 0 then
			editkeys = 1
		end
		if x > wx/2-80 and x < wx/2+80 and y > 170 and y < 210 then
			keys = clone(defaultkeys)
			resetkeysbutton = 0
			editkeys = 0
		end
	end
end

-- Stuff that happens every frame. Movement control happens here.
function newframe()
	-- Update altitude alert blink thing.
	if(blinktrack == (blinkrate * 2 - 1)) then
		blinktrack = 0
	else
		blinktrack = blinktrack + 1
	end

	local pa = get_body_info(0,3).pos
	local pb = get_body_info(0,4).pos
	local pc = get_body_info(0,2).pos
	
	-- Breast force
	local bfax = sspeed*flags.b*flags.s*(pc.x-pa.x)
	local bfay = sspeed*flags.b*flags.s*(pc.y-pa.y)
	local bfaz = sspeed*flags.b*flags.s*(pc.z-pa.z)
	local bfvx = yspeed*flags.y*(pb.x-pa.x)
	local bfvy = yspeed*flags.y*(pb.y-pa.y)
	local bfvz = yspeed*flags.y*(pb.z-pa.z)
	local xs
	local ys
	local zs
	xs, ys, zs = get_body_linear_vel(0,1)
	local bffx = -1 * mfric * xs
	local bffy = -1 * mfric * ys
	local bffz = -1 * mfric * zs
	
	local uxs
	local uys
	local uzs
	uxs, uys, uzs = get_body_linear_vel(1,1)
	local ubffx = -1 * mfric * uxs
	local ubffy = -1 * mfric * uys
	local ubffz = -1 * mfric * uzs
	
	local ts = flags.s
	local bflx = ts*blift*(pb.x-pa.x)*xlift
	local bfly = ts*blift*(pb.y-pa.y)*xlift
	local bflz = ts*blift*(pb.z-pa.z)*xlift
	local cflx = ts*clift*(pb.x-pa.x)*xlift
	local cfly = ts*clift*(pb.y-pa.y)*xlift
	local cflz = ts*clift*(pb.z-pa.z)*xlift
	local wflx = ts*wlift*(pb.x-pa.x)*xlift
	local wfly = ts*wlift*(pb.y-pa.y)*xlift
	local wflz = ts*wlift*(pb.z-pa.z)*xlift
	
	-- Uke's air resistance
	set_body_force(1,1,ubffx,ubffy,ubffz)

	-- Acceleration, pitching, and motion friction
--	set_body_force(0,1,sspeed*flags.b*flags.s*(pc.x-pa.x)+yspeed*flags.y*(pb.x-pa.x),sspeed*flags.b*flags.s*(pc.y-pa.y)+yspeed*flags.y*(pb.y-pa.y),sspeed*flags.b*flags.s*(pc.z-pa.z)+yspeed*flags.y*(pb.z-pa.z))
	set_body_force(0,1,bfax + bfvx + bffx + bflx,bfay + bfvy + bffy + bfly,bfaz + bfvz + bffz + bflz)
	set_body_force(0,2,yspeed*flags.y*(pa.x-pb.x) + cflx,yspeed*flags.y*(pa.y-pb.y) + cfly,yspeed*flags.y*(pa.z-pb.z) + cflz)
	
	-- Wing force
	local wfzx = zspeed*flags.z*(pa.x-pb.x)
	local wfzy = zspeed*flags.z*(pa.y-pb.y)
	local wfzz = zspeed*flags.z*(pa.z-pb.z)
	local wfxx = xspeed*flags.x*(pa.x-pc.x)
	local wfxy = xspeed*flags.x*(pa.y-pc.y)
	local wfxz = xspeed*flags.x*(pa.z-pc.z)
	
	-- Rolling and yawing
	set_body_force(0,5,wflx+wfzx+wfxx,wfly+wfzy+wfxy,wflz+wfzz+wfxz)
	set_body_force(0,8,wflx-wfzx-wfxx,wfly-wfzy-wfxy,wflz-wfzz-wfxz)
	--set_body_torque(0,1,wflx+wfzx+wfxx,wfly+wfzy+wfxy,wflz+wfzz+wfxz)
	
	flags.s = (flags.a + flags.s)/sfric
	flags.b = (flags.b - 1)/bfric + 1
	
	injurychange = injurychange/injurychangereduce + get_player_info(0).injury - injury
	injury = get_player_info(0).injury
	
	rx, ry, rz = get_body_angular_vel(0,1)
	rx = rx * -1 * rfric
	ry = ry * -1 * rfric
	rz = rz * -1 * rfric
	
	set_body_torque(0,1,rx,ry,rz)
	
	urx, ury, urz = get_body_angular_vel(1,1)
	urx = urx * -1 * rfric
	ury = ury * -1 * rfric
	urz = urz * -1 * rfric
	
	set_body_torque(1,1,urx,ury,urz)
	
	checkmissiles()
	
	if guidedmissiles == 1 then
		local ukepos = get_body_info(1,target).pos
		local curpos
		for i=1,14 do
			curpos = get_body_info(0,missilenumbers[i]).pos
			if (math.sqrt((curpos.x-ukepos.x)^2 + (curpos.y-ukepos.y)^2 + (curpos.z-ukepos.z)^2) < homingrange) and (missilestatus[missilenumbers[i]] ~= nil) and (missilestatus[missilenumbers[i]] ~= 0) then
				set_body_force(0,missilenumbers[i],hspeed*(ukepos.x-curpos.x),hspeed*(ukepos.y-curpos.y),hspeed*(ukepos.z-curpos.z))
				missilestatus[missilenumbers[i]] = missilestatus[missilenumbers[i]] - 1
			end
		end
	end
	
	-- Hold joints
	for i = 0,19 do
		set_joint_state(0,i,3)
		set_joint_state(1,i,3)
	end
	
	-- Uke AI
	if gamemode == 1 then	
		local thp = get_body_info(0,0).pos
		local uhp = get_body_info(1,0).pos
		local uphforce = 0
		local upbforce = 0
		if uhp.z < ukeminalt then
			uphforce = (ukeminalt - uhp.z)/ukeminalt * ukehpullup
			upbforce = (ukeminalt - uhp.z)/ukeminalt * ukebpullup
		end
		set_body_force(1,0,(thp.x - uhp.x)*uhspeed,(thp.y - uhp.y)*uhspeed,(thp.z - uhp.z)*uhspeed+uphforce)
		set_body_force(1,1,(thp.x - uhp.x)*ubspeed,(thp.y - uhp.y)*ubspeed,(thp.z - uhp.z)*ubspeed+upbforce)
	end
end

function drawmissile(x,y,a)
	set_color(0.5,0.5,0.5,a)
	draw_quad(x-4,y,8,20)
	draw_disk(x,y,0,4,16,1,90,180,0)
	draw_disk(x,y+25,0,5,3,1,90,180,0)
end

-- Draw the HUD and stuff.
function draw2d()
	wx, wy = get_window_size()
	
	if resetkeysbutton ~= 0.5 then resetkeysbutton = resetkeysbutton + 0.1 end
	
	-- Freeze screen
	if flags.freeze == 1 or get_world_state().match_frame == 0 then
		set_ghost(0) -- Kill the ghosts
	end
	if (flags.freeze == 1 or get_world_state().match_frame == 0) and freezescreen == 1 then
		run_cmd("option hud 0")
		set_color(1,1,1,freezescreenalpha) -- Semitransparent white
		draw_quad(0,0,wx,wy) -- Cover the screen in semitransparent white
		set_color(1,1,0,1)
		draw_centered_text("Press space to play",wy-30,2)
		set_color(0.7,0,0,1) -- Dark red
		draw_centered_text("Press space to play",wy-30,2)
		draw_centered_text("Aerobash!",20,3)
		draw_text("v0.2",wx/2+130,50,2)
		set_color(0,0,0,1)
		draw_centered_text("The Toribash combat flight simulator, made by cuckooman4",80,1)
		
		if editkeys == 0 then
			set_color(0.5,0.5,0.5,0.5)
			draw_quad(wx/2-80,120,160,40)
			set_color(0,0,0,1)
			draw_centered_text("Set keys",125,2)
		elseif editkeys == 1 then draw_centered_text("Pitch up",125,2)
		elseif editkeys == 2 then draw_centered_text("Pitch down",125,2)
		elseif editkeys == 3 then draw_centered_text("Roll left",125,2)
		elseif editkeys == 4 then draw_centered_text("Roll right",125,2)
		elseif editkeys == 5 then draw_centered_text("Yaw left",125,2)
		elseif editkeys == 6 then draw_centered_text("Yaw right",125,2)
		elseif editkeys == 7 then draw_centered_text("Fire left",125,2)
		elseif editkeys == 8 then draw_centered_text("Fire right",125,2)
		elseif editkeys == 9 then draw_centered_text("Accelerate",125,2)
		elseif editkeys == 10 then draw_centered_text("Decelerate",125,2)
		elseif editkeys == 11 then draw_centered_text("Boost",125,2)
		elseif editkeys == 12 then draw_centered_text("Reset gamerules",125,2)
		elseif editkeys == 13 then draw_centered_text("Rear-view",125,2) end
		
		set_color(0.5,0.5,0.5,resetkeysbutton)
		draw_quad(wx/2-80,170,160,40)
		set_color(0,0,0,1)
		draw_centered_text("Reset keys",175,2)
	-- Everything else
	else
		run_cmd("option hud 1")
		run_cmd("option hint 0")
		t = {x = 5, y = 80, s = 15}
		set_color(0,0,0,1)
		
		local maxaccel = aspeed/(sfric-1)*2
		local accel
		if(math.abs(flags.s) > maxaccel/boost - 0.001) then accel = maxaccel/boost * flags.s / math.abs(flags.s)
		elseif(math.abs(flags.s) < 0.001) then accel = 0
		else accel = round(flags.s) end
		
		local bfhc -- In case you're wondering, fhc stands for "for human consumption." And the b is for
			-- boost, of course.
		if(flags.b > boost - 0.001) then bfhc = boost 
		elseif(flags.b < 1.001) then bfhc = 1
		else bfhc = round(flags.b) end
		
		local naccel = flags.s * flags.b
		if(math.abs(naccel) > maxaccel) then naccel = maxaccel * naccel / math.abs(naccel)
		elseif(math.abs(math.abs(naccel) - 10) < 0.001) then naccel = 10
		elseif(math.abs(naccel) < 0.001) then naccel = 0
		else naccel = round(naccel) end
		
		local turnflags = ""
		if flags.x == -1 then turnflags = turnflags .. "L"
		elseif flags.x == 1 then turnflags = turnflags .. "R" end
		if flags.z == -1 then turnflags = turnflags .. "l"
		elseif flags.z == 1 then turnflags = turnflags .. "r" end
		if flags.y == -1 then turnflags = turnflags .. "D"
		elseif flags.y == 1 then turnflags = turnflags .. "U" end
		if flags.z == 0 and flags.y == 0 and flags.x == 0 then turnflags = "-" end
		--[[ Text-based GUI now replaced with visual stuff.
		addline("Relative score: " .. round(get_player_info(0).score - get_player_info(1).score))
		if flags.bc == 0 then set_color(1,0,0,1) end
		addline("Boosts left: " .. flags.bc)
		set_color(0,0,0,1)
		addbreak()
		addline("Gross acceleration: " .. accel)
		addline("Boost multiplier: x" .. bfhc)
		addline("Net acceleration: " .. naccel)
		addbreak()
		addline("Speed: " .. getspeed())
		--]]
		--[[ This was the altitude indicator before I moved it to the center of the minimap.
		if(get_body_info(0,1).pos.z > altalert1) then set_color((altalert0 - get_body_info(0,1).pos.z)/(altalert0 - altalert1),0,0,1)
		else
			if blinktrack < blinkrate then set_color(0,0,0,1)
			else set_color(1,0,0,1) end
		end
		addline("Altitude: " .. round(get_body_info(0,1).pos.z) - 0.93)
		set_color(0,0,0,1)--]]
		
		-- Minimap
		set_color(0.5,0.5,0.5,0.5)
		draw_disk(mmpos,wy-mmpos,0,60,circlesides,1,0,360,0)
		set_color(1,1,1,0.5)
		draw_quad(mmpos-1,wy-mmpos-56,2,110)
		draw_quad(mmpos-55,wy-mmpos-1,110,2)
		for i=1,14 do
			if missilestatus[missilenumbers[i]] then
			missileblip(i)
			end
		end
		ukeblip()
		set_color(0.5,0,0,1)
		draw_quad(mmpos-2,wy-mmpos-2,4,4)
		bordertext("l",getdistancetoukeflat(),120,wy-135,1)
		bordertext("l",getdistancetoukevert(),135,wy-115,1)
		bordertext("l",round(get_body_info(0,1).pos.z) - 0.939,140,wy-95,1)
		set_color(0,0,0,1)
		draw_text(getdistancetoukeflat(),120,wy-135,1)
		draw_text(getdistancetoukevert(),135,wy-115,1)
		if(get_body_info(0,1).pos.z > altalert1) then set_color((altalert0 - get_body_info(0,1).pos.z)/(altalert0 - altalert1),0,0,1)
		else
			if blinktrack < blinkrate then set_color(0,0,0,1)
			else set_color(1,0,0,1) end
		end
		draw_text(round(get_body_info(0,1).pos.z) - 0.939,140,wy-95,1)
		
		-- Speedometer
		set_color(0.5,0.5,0.5,0.5)
		draw_disk(wx,wy,speedometerin,speedometerout,circlesides,1,270,-90,0)
		set_color(2/speedometermax*getspeed(),-2/speedometermax*getspeed()+2,0,1)
		if -getspeed()/speedometermax*90 > -90 then
			draw_disk(wx,wy,speedometerin,speedometerout,circlesides,1,270,-getspeed()/speedometermax*90,0)
			set_color(1,1,1,0.5)
			draw_disk(wx,wy,speedometerin,speedometerout,circlesides,1,270-getspeed()/speedometermax*90-0.5,1,0)
		else
			draw_disk(wx,wy,speedometerin,speedometerout,circlesides,1,270,-90,0)
		end
		bordertext("r",getspeed(),5,wy-speedometerout,1)
		set_color(0,0,0,1)
		draw_right_text(getspeed(),5,wy-speedometerout,1)
		
		-- Accelerometer
		set_color(0.5,0.5,0.5,0.5)
		draw_disk(wx,wy,accelometerin,accelometerout,circlesides,1,270,-90,0)
		set_color(2/accelometermax*(flags.s*flags.b/2+10),-2/accelometermax*(flags.s*flags.b/2+10)+2,0,1)
		draw_disk(wx,wy,accelometerin,accelometerout,circlesides,1,225,-flags.s*flags.b/accelometermax*45,0)
		set_color(1,1,1,0.5)
		draw_disk(wx,wy,accelometerin,accelometerout,circlesides,1,224.5,1,0)
		bordertext("r",naccel,5,wy-accelometerout,1)
		set_color(0,0,0,1)
		draw_right_text(naccel,5,wy-accelometerout,1)
		
		-- Turning flags
		if flags.z == -1 then
			set_color(0.5,0.5,0.5,0.1)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides,1,get_world_state().match_frame*rollmeterspeed,120,0)
			set_color(0.5,0.5,0.5,0.3)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides,1,get_world_state().match_frame*rollmeterspeed+120,120,0)
			set_color(0.5,0.5,0.5,0.5)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides,1,get_world_state().match_frame*rollmeterspeed+240,120,0)
		elseif flags.z == 1 then
			set_color(0.5,0.5,0.5,0.5)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides,1,-get_world_state().match_frame*rollmeterspeed,120,0)
			set_color(0.5,0.5,0.5,0.3)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides,1,-get_world_state().match_frame*rollmeterspeed+120,120,0)
			set_color(0.5,0.5,0.5,0.1)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides,1,-get_world_state().match_frame*rollmeterspeed+240,120,0)
		else
			set_color(0.5,0.5,0.5,0.25)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,rollmeterin,rollmeterout,circlesides*3,1,0,360,0)
		end
		set_color(0.5,0.5,0.5,0.5)
		if flags.x == 0 and flags.y == 1 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,45,270,0)
		elseif flags.x == 1 and flags.y == 1 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,0,270,0)
		elseif flags.x == 1 and flags.y == 0 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,-45,270,0)
		elseif flags.x == 1 and flags.y == -1 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,-90,270,0)
		elseif flags.x == 0 and flags.y == -1 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,-135,270,0)
		elseif flags.x == -1 and flags.y == -1 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,-180,270,0)
		elseif flags.x == -1 and flags.y == 0 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,135,270,0)
		elseif flags.x == -1 and flags.y == 1 then
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,2,1,90,270,0)
		else
			set_color(0.5,0.5,0.5,0.25)
			draw_disk(wx-turnarrowpos,wy-turnarrowpos,0,arrowsize,4,1,0,360,0)
		end
		
		-- Missiles
		for i=1,7 do
			if flags.l >= i then drawmissile(wx/2-i*missilespacing,70,0.5)
			else drawmissile(wx/2-i*missilespacing,70,0.25) end
		end
		for i=1,7 do
			if flags.r >= i then drawmissile(wx/2+i*missilespacing,70,0.5)
			else drawmissile(wx/2+i*missilespacing,70,0.25) end
		end
		
		-- Boosts
		for i=1,boosts do
			if flags.bc >= i then set_color(0.5,0.5,0.5,0.5)
			else set_color(0.5,0.5,0.5,0.25) end
			draw_disk(wx/2 + boosts*boostspacing/2 - boostspacing*i + boostspacing/2,105,0,5,4,1,0,360,0)
		end
		
		-- Blood flash
		local bloodalpha = (bloodalert0 - injurychange)/(bloodalert0 - bloodalert1)
		if bloodalpha > 1 then bloodalpha = 1 end
		bloodalpha = bloodalpha * bloodalertmax
		
		set_color(bloodcolor,0,0,bloodalpha) -- Red
		draw_quad(0,0,wx,wy) -- Blood
		
		-- Crosshair
		if camMode == 1 then
			set_color(0.5,0.5,0.5,0.75)
			draw_quad(wx/2-crosshairout,wy/2-1,crosshairout*2,2)
			draw_quad(wx/2-1,wy/2-crosshairout,2,crosshairout*2)
			draw_disk(wx/2,wy/2,crosshairout,crosshairout+2,circlesides,1,0,360,0)
			draw_disk(wx/2,wy/2,crosshairin,crosshairin+1,circlesides,1,0,360,0)
		end
		
		-- Camera indicator
		local cd = ""
		if camMode == 2 then
			cd = " (" .. cameradist .. ")"
		end
		bordertext("l","Camera: " .. cams[camMode+1] .. cd,8,80,1)
		set_color(0,0,0,1)
		draw_text("Camera: " .. cams[camMode+1] .. cd,8,80,1)
		
		-- Flashing message if you're too low
		if altalertmessage == 1 then
			local meh1
			local meh2
			local vvel
			meh1, meh2, vvel = get_body_linear_vel(0,1)
			-- The flashing message when you go too low
			--if(get_body_info(0,1).pos.z < altalert1 and vvel < -0.1 and blinktrack < blinkrate) then
			if 0 > get_body_info(0,1).pos.z/vvel and get_body_info(0,1).pos.z/vvel > -altalerttime and vvel ~= 0 and blinktrack < blinkrate then
				set_color(1,0,0,1)
				if wx > 550 then
					draw_centered_text("approaching ground",100,3)
					draw_centered_text("crash imminent",150,3)
				else
					draw_centered_text("approaching",100,3)
					draw_centered_text("ground crash",150,3)
					draw_centered_text("imminent",200,3)
				end
				set_color(0,0,0,1)
			end
		end
	end
end

-- Add line to the HUD text. This is now useless, but left here in case I change my mind.
function addline(s)
	draw_text(s,t.x,t.y)
	t.y = t.y + t.s
end

-- Add a 5-pixel break in the HUD text. This is also now useless.
function addbreak()
	t.y = t.y + 5
end

function bordertext(t,s,x,y,f)
	set_color(1,1,1,0.3)
	if t == "l" then
		draw_text(s,x-1,y-1,f)
		draw_text(s,x,y-1,f)
		draw_text(s,x+1,y-1,f)
		draw_text(s,x+1,y,f)
		draw_text(s,x+1,y+1,f)
		draw_text(s,x,y+1,f)
		draw_text(s,x-1,y+1,f)
		draw_text(s,x-1,y,f)
	elseif t == "r" then
		draw_right_text(s,x-1,y-1,f)
		draw_right_text(s,x,y-1,f)
		draw_right_text(s,x+1,y-1,f)
		draw_right_text(s,x+1,y,f)
		draw_right_text(s,x+1,y+1,f)
		draw_right_text(s,x,y+1,f)
		draw_right_text(s,x-1,y+1,f)
		draw_right_text(s,x-1,y,f)
	end
end

function getspeed()
	local xs
	local ys
	local zs
	xs, ys, zs = get_body_linear_vel(0,1)
	return round(math.sqrt(xs^2 + ys^2 + zs^2))
end

function ukeblip()
	local toripos = get_body_info(0,1).pos
	local ukepos = get_body_info(1,1).pos
	local torichest = get_body_info(0,2).pos
	local toridir = math.atan2((toripos.x - torichest.x),(toripos.y - torichest.y))+math.pi
	local uketoridir = math.atan2((toripos.x - ukepos.x),(toripos.y - ukepos.y))+math.pi
	local dir = math.pi/2-toridir+uketoridir
	local dist = math.sqrt((toripos.x - ukepos.x)^2+(toripos.y - ukepos.y)^2)/minimapmaxdist*60
	if 60 < dist then dist = 60 end
	local ukeblipx = dist * math.cos(dir) + mmpos-2
	local ukeblipy = dist * math.sin(dir) + wy-mmpos-2
	set_color(0,0,0.5,1)
	draw_quad(ukeblipx,ukeblipy,4,4)
end

function missileblip(m)
	local toripos = get_body_info(0,1).pos
	local missilepos = get_body_info(0,missilenumbers[m]).pos
	local torichest = get_body_info(0,2).pos
	local toridir = math.atan2((toripos.x - torichest.x),(toripos.y - torichest.y))+math.pi
	local missiletoridir = math.atan2((toripos.x - missilepos.x),(toripos.y - missilepos.y))+math.pi
	local dir = math.pi/2-toridir+missiletoridir
	local dist = math.sqrt((toripos.x - missilepos.x)^2+(toripos.y - missilepos.y)^2)/minimapmaxdist*60
	if 60 >= dist then
		local missileblipx = dist * math.cos(dir) + mmpos-1
		local missileblipy = dist * math.sin(dir) + wy-mmpos-1
		set_color(0,0,0,1)
		draw_quad(missileblipx,missileblipy,2,2)
	end
end

-- Gets the angle from the direction Tori's facing to the direction from Tori to Uke in degrees,
	-- clockwise, and with zero at forward, with the world flattened vertically. (z-position is
	-- irrelevant.)
function getdirectiontoukeflat()
	local toripos = get_body_info(0,1).pos
	local ukepos = get_body_info(1,1).pos
	local torichest = get_body_info(0,2).pos
	local toridir = math.atan2((toripos.x - torichest.x),(toripos.y - torichest.y))/2/math.pi*360+180
	local uketoridir = math.atan2((toripos.x - ukepos.x),(toripos.y - ukepos.y))/2/math.pi*360+180
	local relativedir = 180-math.ceil(toridir - uketoridir)
	return relativedir
end

-- Gets the distance from Tori to Uke with the world flattened vertically. (z-position is
	-- irrelevant.)
function getdistancetoukeflat()
	local toripos = get_body_info(0,1).pos
	local ukepos = get_body_info(1,1).pos
	local uketoridist = round(math.sqrt((toripos.x - ukepos.x)^2+(toripos.y - ukepos.y)^2))
	return uketoridist
end

-- Gets the vertical distance from Tori to Uke, that is to say, the difference between their
	-- altitudes. (x- and y- position is irrelevant.)
function getdistancetoukevert()
	local toripos = get_body_info(0,1).pos
	local ukepos = get_body_info(1,1).pos
	local uketoridist = round(ukepos.z - toripos.z)
	return uketoridist
end

-- When editing:
function edit()
	flags.freeze = 1
end

-- When playing:
function action()
	flags.freeze = 0
	editkeys = 0
end

-- Initialize flags.
function startgame()
	flags = {
		z = 0, -- Rolling. Can be -1, 0, or 1.
		y = 0, -- Pitching. Can be -1, 0, or 1. 
		x = 0, -- Yawing. Can be -1, 0, 1 or 1.
		l = 7, -- Number of left-wing missiles left. Can be an integer from 0 to 7.
		r = 7, -- Number of right-wing missiles left. Can be an integer from 0 to 7.
		fire = 0,
		s = 0, -- Acceleration. Can be any real number within the constraints of friction.
		a = 0, -- Change of acceleration per frame. Can be -aspeed, 0, or aspeed.
		b = 1, -- Boost multiplier. Can any real number between 1 and boost.
		bc = boosts, -- Number of boosts left. Can be an integer from 0 to 7.
		freeze = 0 -- This flag is 1 when the game is frozen, and 0 otherwise.
	}
	missilestatus = { }
	injury = 0
	injurychange = 0
end

-- Initialize game settings.
function initrules()
	run_cmd("set mod " .. gamerules.mod)
	run_cmd("set gravity 0 0 " .. gamerules.gravity)
	run_cmd("set ed " .. gamerules.ed)
	run_cmd("set eh " .. gamerules.eh)
	run_cmd("set mf " .. gamerules.mf)
	run_cmd("set tf " .. gamerules.mf) -- This is intentional, so that pressing space will play the
		-- whole game.
	run_cmd("set dt " .. gamerules.dt)
	run_cmd("set dq 0")
	run_cmd("clear")
end

initrules()

-- First person camera by Dafe

function matrixMult(M1, M2)
  --Check valid dimsensions before doing anything else
  local r, c
  if(#M1 == 0) then
    run_cmd("echo Invalid matrix multiplication.  Matrix empty.  Operation aborted.")
    print("Invalid matrix multiplication.  Matrix empty.  Operation aborted.")
    printMatrix(M1)
    return {}
  end
  for r=1, #M1 do
    if(#M2 ~= #M1[r]) then
      run_cmd("echo Invalid matrix multiplication.  Operation aborted.")
      print("Invalid matrix multiplication.  Operation aborted.")
      printMatrix(M1)
      return {}
    end
  end
  r = #M1
  c = #M1[1]
  
  --Actually do this pain in the ass operation
  local Prod = {}
  for x=1, r do
    Prod[x] = {}
    for y=1, c do
      local sum = 0
      for z=1, c do
        sum = sum + M1[x][z] * M2[z][y]
      end
      Prod[x][y] = sum
    end
  end
  return Prod
end


function ODEMatrix(rot)
  --rot - rotation matrix from get_body_info().rot
  --Pull rotation bits out only
  --ODE, you so crazy
  return {{rot.r0, rot.r4, rot.r8}, {rot.r1, rot.r5, rot.r9}, {rot.r2, rot.r6, rot.r10}}
end

function rotatePoint(P, rot)
  local newPoint = matrixMult({{P.x, P.y, P.z}}, rot)
  return {x=newPoint[1][1], y=newPoint[1][2], z=newPoint[1][3]}
end


function ukeCam()
  local P = {x=0, y=-1, z=0}
  local head = get_body_info(1, 0)
  local rot = head.rot
  P = rotatePoint(P, ODEMatrix(rot))  
  
  set_camera_lookat(P.x + head.pos.x, P.y + head.pos.y, P.z + head.pos.z)
  set_camera_pos(head.pos.x, head.pos.y, head.pos.z)
  return 1  
end

function toriCam()
  local P = {x=0, y=-1, z=0}
  local head = get_body_info(0, 0)
  local rot = ODEMatrix(head.rot)
  P = rotatePoint(P, rot)
  
  set_camera_lookat(P.x + head.pos.x, P.y + head.pos.y, P.z + head.pos.z)
  set_camera_pos(head.pos.x, head.pos.y, head.pos.z)
  --set_camera_pos(-P.x*cameradist + head.pos.x, -P.y*cameradist + head.pos.y, -P.z*cameradist + head.pos.z)
  
	set_color(0.5,0.5,0.5,1)
	redrawmissiles()
	
	local pa = get_body_info(0,3).pos
	local pb = get_body_info(0,4).pos
	local pc = get_body_info(0,2).pos
	local blah = get_body_info(0,1)
	local tofront = 10
	
	-- Roll indicator
	if dirindicator == 1 then
		local todown = 0.05
		set_color(0,0,0,0.05)
		draw_box_m(tofront*(pc.x-pa.x)+blah.pos.x-todown*(pa.x-pb.x),tofront*(pc.y-pa.y)+blah.pos.y-todown*(pa.y-pb.y),tofront*(pc.z-pa.z)+blah.pos.z-todown*(pa.z-pb.z),5,0.05,0.1,blah.rot)
		--draw_box_m(P.x + head.pos.x, P.y + head.pos.y, P.z + head.pos.z,5,0.05,0.1,blah.rot)
		set_color(0,0,0,0.1)
		draw_box_m(tofront*(pc.x-pa.x)+blah.pos.x+todown*(pa.x-pb.x),tofront*(pc.y-pa.y)+blah.pos.y+todown*(pa.y-pb.y),tofront*(pc.z-pa.z)+blah.pos.z+todown*(pa.z-pb.z),5,0.05,0.1,blah.rot)
		--draw_box_m(P.x + head.pos.x, P.y + head.pos.y, P.z + head.pos.z,5,0.05,0.1,blah.rot)
	end
	
	-- Down arrow
	if dirindicator == 1 then
		for i = 1,8 do
			set_color(0,0,0,i/20)
			draw_box_m(tofront*(pc.x-pa.x)+blah.pos.x,tofront*(pc.y-pa.y)+blah.pos.y,tofront*(pc.z-pa.z)+blah.pos.z-i/15,0.1,0.1,0.1,0)
		end
	end
  return 1
end

function thirdCam()
	local P = {x=0, y=-1, z=0}
	local head = get_body_info(0, 0)
	local rot = ODEMatrix(head.rot)
	P = rotatePoint(P, rot)

	--set_camera_lookat(P.x + head.pos.x, P.y + head.pos.y, P.z + head.pos.z)
	set_camera_lookat(head.pos.x, head.pos.y, head.pos.z)
	set_camera_pos(-P.x*cameradist + head.pos.x, -P.y*cameradist + head.pos.y, -P.z*cameradist + head.pos.z)

	set_color(0.5,0.5,0.5,0.75)
	redrawmissiles()
	redrawbody()
	
	--[[local pa = get_body_info(0,3).pos
	local pb = get_body_info(0,4).pos
	local pc = get_body_info(0,2).pos
	local blah = get_body_info(0,1)
	local tofront = -10
	
	if dirindicator == 1 then
		for i = 1,8 do
			set_color(0,0,0,i/20)
			draw_box_m(tofront*(pc.x-pa.x)+blah.pos.x,tofront*(pc.y-pa.y)+blah.pos.y,tofront*(pc.z-pa.z)+blah.pos.z-i/15,0.3,0.3,0.3,0)
		end
	end--]]
end

function draw3d()
	cameradist = cameradist + camzoom

	if guide.on == 1 then
		drawguide()
	end

  if(camMode == 0) then
    return
  elseif(camMode == 1) then
    toriCam()
  else
    thirdCam()
  end
end

function redrawmissiles()
	for i = 1,14 do
		if missilestatus[missilenumbers[i]] then
			local asdf = get_body_info(0,missilenumbers[i])
			draw_capsule_m(asdf.pos.x,asdf.pos.y,asdf.pos.z,0.3,0.1,asdf.rot)
		end
	end
end

function redrawbody()	
	for i = 0,20 do
		local curbody = get_body_info(0,i)
		set_color(0,0,0,torialpha)
		if curbody.sides.y == 0 then
			draw_sphere_m(curbody.pos.x,curbody.pos.y,curbody.pos.z,curbody.sides.x,curbody.rot)
		elseif curbody.sides.z == 0 then
			draw_capsule_m(curbody.pos.x,curbody.pos.y,curbody.pos.z,curbody.sides.y,curbody.sides.x,curbody.rot)
		else
			draw_box_m(curbody.pos.x,curbody.pos.y,curbody.pos.z,curbody.sides.x,curbody.sides.y,curbody.sides.z,curbody.rot)
		end
	end
end

function drawguide()
	local pa = get_body_info(0,3).pos
	local pb = get_body_info(0,2).pos
	if flags.l ~= 0 then
		local pm = get_body_info(0,missilenumbers[8-flags.l]).pos
		for i = 1,guide.dots do
			set_color(guide.r,guide.g,guide.b,guide.a)
			draw_sphere_m(pm.x+i*(pb.x-pa.x)*guide.length/guide.dots/distbetween(pb,pa),pm.y+i*(pb.y-pa.y)*guide.length/guide.dots/distbetween(pb,pa),pm.z+i*(pb.z-pa.z)*guide.length/guide.dots/distbetween(pb,pa),guide.dotradius,0/distbetween(pb,pa))
		end
	end
	if flags.r ~= 0 then
		local pm = get_body_info(0,missilenumbers[15-flags.r]).pos
		for i = 1,guide.dots do
			set_color(guide.r,guide.g,guide.b,guide.a)
			draw_sphere_m(pm.x+i*(pb.x-pa.x)*guide.length/guide.dots/distbetween(pb,pa),pm.y+i*(pb.y-pa.y)*guide.length/guide.dots/distbetween(pb,pa),pm.z+i*(pb.z-pa.z)*guide.length/guide.dots/distbetween(pb,pa),guide.dotradius,0/distbetween(pb,pa))
		end
	end
end

cams = {"normal","first-person","third-person"}

-- Hooks. These control events and do stuff accordingly.
add_hook("key_down","aerobash",kdown) -- Controls keypresses.
add_hook("key_up","aerobash",kup) -- Controls keyreleases. Is that a word?
add_hook("enter_frame","aerobash",newframe) -- Every frame, shit happens.
add_hook("new_game","aerobash",startgame) -- New game.
add_hook("draw2d","aerobash",draw2d) -- Draw HUD and stuff.
add_hook("enter_freeze","aerobash",edit) -- Edit.
add_hook("exit_freeze","aerobash",action) -- End edit.
add_hook("draw3d","aerobash",draw3d) -- First-person camera thing and missile drawing.
add_hook("mouse_button_down","aerobash",mdown) -- Mouseclick.