It's a bird... it's a plane... it's...
                         ___ __           ___ __    __
  ___ ____ ____  _________  / /_  ____ ______/ /_  / /
 ___ / __ `/ _ \/ ___/ __ \/ __ \/ __ `/ ___/ __ \/ / 
___ / /_/ /  __/ /  / /_/ / /_/ / /_/ (__  ) / / /_/  
 ___\__,_/\___/_/   \____/_.___/\__,_/____/_/ /_(_)   
     the toribash combat flight simulator     v0.1

Made by cuckooman4. (oh, by the way, Uke has no AI, so scratch the "combat" part.)

Special thanks to the following:
Dafe for the first-person camera.

http://www.network-science.de/ascii/ for the ASCII art. (the logo is the slant font with slight
edits; the headers are cybermedium)

Oh, and of course thanks to Hampa for making Toribash.

With that said...

_ _  _ ____ ___ ____ _    _    ____ ___ _ ____ _  _ 
| |\ | [__   |  |__| |    |    |__|  |  | |  | |\ | 
| | \| ___]  |  |  | |___ |___ |  |  |  | |__| | \|
Put aerobash.lua in your \data\script folder.
(Mine is C:\Program Files\Games\Toribash-3.5\data\ script, but it depends on where you put your
Toribash folder.)

Put aerobash.tbm in your \data\mod folder.

And, yeah. That's it.

____ ____ _  _ ____ ___  _    ____ _   _ 
| __ |__| |\/| |___ |__] |    |__|  \_/  
|__] |  | |  | |___ |    |___ |  |   |   
The default controls are as follows:

    Pitch up                 K
    Pitch down               I
    Yaw left                 J
    Yaw right                L
    Roll left                M
    Roll right               .
    Fire left                Z
    Fire right               X
    Accelerate               U
    Decelerate               O
    Boost            Left ctrl
    Reset gamerules          Q
    Rear view       Left shift

You can modify these ingame, as well as in the aerobash.lua file.

----------------------------------------------------------------------------------------------------

[In a nutshell: You fly and shoot missiles. Your goal is to DQ Uke and not get DQ'd yourself. But
there is no AI as of yet, so if you do get DQ'd, you suck. Missiles are instagib and don't DQ.]

The objective of the game is to disqualify the enemy plane by either shooting off parts of it or
somehow getting it to fly into the ground. ...well, that would be the objective of the game, but I
have yet to program AI.

Some flight dynamics terminology: pitch refers to turning up and down, roll refers to... rolling...
and yaw refers to turning. <http://en.wikipedia.org/wiki/Yaw,_pitch,_and_roll> I like to use these
specialized terms because (1) they sound smart, and (2) they're more specific. ...but I'm not going
to use the terms port and starboard, because (1) I get them confused too often, and (2) there's no
particular advantage for those.

As you may have guessed, the pitch, yaw, roll, accelerate, and decelerate keys pitch, yaw, roll,
accelerate, and decelerate your plane. There's also air resistance, so if you don't touch the
keyboard for a while, your plane will come to a halt. (ignoring gravity)

The fire-left key fires a missile from your left wing, and the fire-right key fires a missile from
your right wing. Below each wing are seven missiles, (for a total of fourteen) which fire from the
outside in.

When fired, the missiles dismember themselves, and then shoot in the direction you're facing. If
they get within range of the enemy plane, (this range can be changed) they will turn toward it. The
missiles are instagib, so if they touch the enemy plane, they will cut it.

The missiles do not DQ, so if they hit the ground, you're still alive. However, if your wings, plane
body, or head hit the ground, you're dead.

You have five (by default; this is changable) emergency boosts you can use to increase your
acceleration (and by extension, your ability to get the hell away from the ground) for a short
period of time. In other words, it's a short burst of acceleration. I'd say a short burst of speed,
but that wouldn't be quite correct; you retain your speed once the boost is over, just not your
acceleration. Depending on the specific conditions, it may be enough to cut your plane in half.

The reset-gamerules key resets the gamerules to whatever the settings are in aerobash.lua. You can
use this to initialize the game settings easily.

Rear-view only works when using the third-person camera. It... looks backwards?

___ _  _ ____    _  _ _  _ ___  
 |  |__| |___    |__| |  | |  \ 
 |  |  | |___    |  | |__| |__/ 
The HUD is mostly self-explanatory, but in case you can't figure it out:

The minimap is in the bottom left corner. It shows where Uke is relative to you. The first number
from the top shows how far Uke is from you on the XY plane. (the distance ignoring altitude) The
second number is the difference between your altitudes. (and, of course, if you use the Pythagorean
Theorem, you can get the total distance in 3D space. But that's a mathematical thing you probably
don't care about.) The third number is your altitude. It'll turn red and start flashing if you go
too low.

The speedometer and accelerometer are in the bottom right corner. They show your acceleration and
speed. The accelerometer is by default on the inside and the speedometer is on the inside, but you
can change that. The gauges change colors depending on your speed/acceleration. They also show your
speed and acceleration numerically.

The rotation indicator is also in the bottom right corner. It tells you what directions you're
turning, in the event that you couldn't have figured that out by looking at your fingers.

In the top center are the missiles and boosts left indicators. The missile icon is supposed to look
like a missile of some sort, but the boost icon is just an arbitrary shape. They turn light gray
when used.

When using the toricam, there are two more things that'll appear onscreen: a crosshair and a
pitch/roll indicator. The crosshair, is, of course, the crosshair in the center of the screen. Note
that the crosshair is only accurate if the missiles are shooting from your head and you're not
moving; neither of these conditions are typically true, so factor those in when shooting. The
two bars in the center of the screen and the gradient bar going down from its midpoint make up the
pitch/roll indicator. The two bars indicate your roll... this one's obvious. The roll indicator is
a bar pointing down. These are positioned in 3D according to the positions of some of your body
parts, however, so they'll move a bit around the screen, since the plane isn't completely rigid.

In any of the three camera modes, you'll see two red streams of dots coming from your plane: that's
another aiming thing, more accurate than the crosshair since it comes from the missiles, but still
doesn't factor in your motion.

_  _ _  _ ____ _ _ _ _  _    ___  _  _ ____ ____ 
|_/  |\ | |  | | | | |\ |    |__] |  | | __ [__  
| \_ | \| |__| |_|_| | \|    |__] |__| |__] ___] 
If I know of a bug, chances are I'm gonna fix it. If I don't, that means I'm too lazy or can't
figure out what's wrong. Either way, it'll go under this section, with a brief explanation.

� You can't fire two missiles in one frame.
    � I know why this happens. I'll fix it later; I'm too lazy.
� You have to press the reset-gamerules button, start a new match, press it again, and start another
    match in order to reset the gamerules.
    � I know why this happens, but have yet to figure out how to fix it. Semi-solution implemented.

_  _ ____ ____ ____ _ ____ _  _    _  _ _ ____ ___ ____ ____ _   _ 
|  | |___ |__/ [__  | |  | |\ |    |__| | [__   |  |  | |__/  \_/  
 \/  |___ |  \ ___] | |__| | \|    |  | | ___]  |  |__| |  \   |   
Okay, clearly, there is no "history" involved here. There were no past versions. This is the first
release. But still, here's a list of features and some possible future additions.

Possible future additions
� Uke AI
� Two-player
� Improved missile system
    � Improved guided missiles
    � Explosion upon impact
� Improved flight engine
    � Set_body_torque() for rotation, not opposing forces on different body parts
    � Realistic lift (based on forward speed instead of acceleration)
� In-game settings menu
� Extended key support
    � Cancel the effect of keys that already serve some ingame function so they can be used
� Down arrow when using the third-person camera
� Control disabled if the plane gets a part decapped
� More fine-tuned default settings
� Humor

v0.1 (25-Jan-2009)
� Flight engine
    � Lift
    � Acceleration and deceleration
    � Yaw, pitch, and roll
    � Friction/air resistance
� Missile system
    � Instagib missiles
    � Basic guided missiles
� HUD
    � Boosts and missiles left
    � Visual turning indicator
    � Visual and numerical speedometer and accelerometer
    � Altitude indicator
        � Altitude in Toribash units
        � Visual alert when your plane goes too low (black, dark red, red, blinking red/black)
    � Minimap (with you, Uke, and missiles on it)
        � Distance between you and Uke
    � Red flash when taking damage
� Dafe's first person camera
    � When you switch to the toricam, Tori's invisible. (/option tori 0)
    � Crosshair and pitch/roll indicator when using the toricam.
    � Third-person camera (from right behind Tori)
� Too much swearing

____ ____ _  _ ___ ____ ____ ___    _  _ ____ 
|    |  | |\ |  |  |__| |     |     |\/| |___ 
|___ |__| | \|  |  |  | |___  |     |  | |___  
If you have any questions, comments, suggestions, love letters, answers to my math homework, or free
stuff, you can contact me at the Toribash Forums or via email. (I use gmail.) My name is cuckooman4
for both.

Note that if you're reporting a bug, make sure it's not already in the Known Bugs section of this
readme, and if you have a feature suggestion, check that it's not already in the Possible Future
Additions subsection of Version History.

____ _  _ ___     ____ _    ____ ____      _ ____ _    ____ ____ ____ 
|__| |\ | |  \    |__| |    [__  |  |      | | __ |    |  | |  | [__  
|  | | \| |__/    |  | |___ ___] |__| ,    | |__] |___ |__| |__| ___] .
I just felt like putting something here.

...meh.