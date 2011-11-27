README.TXT

=======================
TREPIDATION
Development Copy
Readme Updated 07-27-06
=======================


THE COMPLETE GUIDE TO TREPIDATION CAN BE FOUND AT
http://trepidation.u7net.com/manual/

=====================
GETTING STARTED NOTES
=====================
The default settings are pretty low end.

The first thing you will want to do, aside from setup your controls is setup your 
video settings.  Most modern computers (and even my computer) can run a lot higher 
than the defaults.

Also check your Net connection settings, the default is dialup, which will be crap 
on the test server.

================
BINDS & COMMANDS
================
Below is what has been added into trepidation that normally isnt present in Q3 or EF

+button5
	Alternate weapon fire.  (this is now in the options menu)
	example: /bind ALT +button5

+button6
	Energy Grapple.  (this is now in the options menu)
	example: /bind ALT +button6

+scanner
	Turns on (while held) the PTD (portable tracking device).
	example: /bind l +scanner

pdg
	activates transport for particle displacement grenades
	example: /bind x pdg

ui_dynamic menu
	Loads the dynamic menu when ingame... Nothing really on the menu just a 
	sample for the framework.
	example:  /bind . ui_dynamicmenu

========
WEAPONS
========
As Trepidation is a work in progress.  Only a handful of weapons have been completed 
and even fewer original weapon models are in place.  The new weapons are listed below, 
the remaining weapons are quake 3 defaults and may have no secondary fire capabilities. 


Weapon Name / Number
Description
Stats

GRENADE LAUNCHER (4)
Functions much like the Quake 3 grenade launcher.  
Primary fire bounces for a few seconds before exploding.
Alternate Fire explodes on impact.
The alt-fire grenade can be used for rocket jumping style manuevers
	Initial Ammo: 10
	Max Ammo: 50
	Ammo Pickups: 5
	Seconary Attack Ammo Usage: 3


SINGULARITY CANNON (5)
The singularity cannon produces an unstable quantum singularity on the fly which 
is launched causing significant damage as well as a fair amount splash damage.  This 
weapon is powered by Singularity Reactor Rods.  Alternate fire adds a quantum memory 
to the projectile which can be used to track and lock onto potential targets. 
	Initial Ammo: 10
	Max Ammo: 30
	Ammo Pickups: 5
	Seconary Attack Ammo Usage: 3

FLAME THROWER (6)
The flame thrower is a brand new weapon that replaces the lighning gun.
Primary fire of the flame thrower shoots balls of fire.
Alternate Fire fires more like a conventional flame thrower.  That is a single stream 
of fire.  Beware, alt fire uses a lot of ammo and you can easily burn yourself with 
the flames.
	Initial Ammo: 300
	Max Ammo: 400
	Ammo Pickups: 25
	Seconary Attack Ammo Usage: 1  (goes quick tho)


M42 GAUSS RIFLE (7)
A coilgun (also known as Gauss gun or Gauss rifle) is a type of cannon that uses a 
series of electromagnets to accelerate a magnetic shell to very high velocities. 
Coilguns are often mistakenly called railguns by many sources, and while they are 
similar in general concept (that is, a magnetic gun), they differ in operation, 
as a railgun accelerates projectiles down two parallel conducting rails. Coilguns 
are essentially identical to mass drivers, though on a smaller scale. 
( http://en.wikipedia.org/wiki/Gauss_gun )
Primary fire is a very focused shot.
Alternate Fire Fires A Singularity Burst.
	Initial Ammo: 10
	Max Ammo: 50
	Ammo Pickups: 10
	Seconary Attack Ammo Usage: 3

GATA GUN (X)
Primary Fire: Fires a bunch of Frisbees... I'll figure out the details on
explaining this one later.. they are really razor sharp discs... that
bounce around the environment... Aside from figuring out the explanation
I'd like to find a better name for this one.

Alternate fire fires a particle displacement grenade (PDG). This weapon 
fires a projectile.  From the time you fire the projectile you have 30 
seconds to obtain a lock and use it. A lock is only obtained once the projectile 
lands and comes to a complete stop.  Once a lock is obtained you can 
then press the PDG key and you transport to the location of the projectile 
location.  The projectile expires when you fire another or after 30 seconds.  
The 30 seconds begins from the time you fire the projectile.  The keybinding 
is in OPTIONS->CONTROLS->MISC.  Be careful though.. If you transport into a 
wall you may be stuck.
	Initial Ammo: 
	Max Ammo: 200
	Ammo Pickups: 
	Seconary Attack Ammo Usage: 12


DEVASTATOR (Weapon 9)
The devestator is the most powerful weapon available in Trepidation.
The Devastator primary attack fires a powerful energy burst that has a fair
splash radius and makes for some easy kills.
The Devastator Secondary attack fires a very powerful, SLOW moving burst, the 
projectile is affected a bit by gravity. The blast it makes on impact is 
devastating with a large blast radius. The shockwave is deadly. The reload 
time is about 3 1/2 seconds. The Devastator is not practical in enclosed 
spaces, as anyone within the range of its large explosion will take damage 
regardless of their amounts of armor 
and health... 
     Initial Ammo: 5
     Max Ammo: 15
     Ammo Pickups: 3 
     Seconary Attack Ammo Usage: 5 


================
OTHER INVENTORY
================
NAME/ [DEFAULT KEY BINDING]

PORTABLE TRACKING DEVICE (PTD) [L]
Not Yet Implemented Bind is found in CONTROLS->MISC

ENERGY GRAPPLE [MOUSE3]
The energy grapple.

PARTICLE DISPLACEMENT GRENADES (PDG's) [']
Particle Displacement Grenades are currently setup as ALT FIRE on the particle 
distruptor.  This weapon fires a projectile.  From the time you fire the projectile 
you have 30 seconds to obtain a lock and use it. A lock is only obtained once the 
projectile lands and comes to a complete stop.  Once a lock is obtained you can 
then press the PDG key and you transport to the location of the projectile 
location.  The projectile expires when you fire another or after 30 seconds.  
The 30 seconds begins from the time you fire the projectile.  The keybinding 
is in OPTIONS->CONTROLS->MISC

Be careful though.. If you transport into a wall you may be stuck.

===============
GAMETYPES
===============
DEATHMATCH/FREE FOR ALL (g_gametype 0) 
As the title implies this is every person for themselves. The goal of a 
deathmatch game is to kill (or "frag") as many other players as possible 
until a certain condition or limit is reached, commonly being a fraglimit or 
timelimit. Once one of these conditions is met, the match is over, and the 
winner is whoever has accumulated the most frags. It is based around the idea 
of player spawns, and weapon/item/pickup spawns in one play session

TEAM DEATHMATCH
Same as above but in team fashion.

TOURNEY
A tournament game is implicitly a one on one match, and further players are 
automatically entered as spectators (note, when the game starts, all clients, 
including the spectators respawn). You can follow the players by using “team 
follow1”, “team follow2”, and you can be a scoreboard by using “team scoreboard”. 

CAPTURE THE FLAG
Capture The Flag (CTF) is a traditional game where two teams each have a flag and 
the objective is to capture the other team's flag, located at the team's "base",
and bring it back to their own base.

INSTAGIB.
Instagib can be played in most gametypes. In instagib all players carry only a 
M42Gauss Rifle, which has infinite ammunition and fires instantly lethal shots 
with infinite velocity, at a low rate of fire. Since everyone always has the 
same weapon and there are no health, ammo or other pickups to collect, gameplay 
tends to have a heavy emphasis on reflexes, hand-eye coordination and positioning, 
as opposed to resource management and control. Because every single shot can 
instantly explode an enemy from any range, gameplay also tends to be very fast paced.

ARSENAL (g_gamemode 1) 
In Arsenal, You start out with an Arsenal of weapons pre-determined by the server 
admin. unlimited ammo and If you die your weapon is dropped (free for anyone to 
salvage) and you dont get it back.

The Object, is not to let your arsenal empty out. If you run out of weapons 
you are out of the game until the next round.

To win, stay alive, and be the last person standing. Things heat up when it gets 
down to 2 people. When there are only 2 people left Showdown starts, the last 
stage of the game becomes increasingly difficult as you'll find that powerups,
armor and health become more and more scarce.. 

If you pickup a weapon that isnt in your arsenal, you can use it until you die, 
but it doesnt get placed into your arsenal.

Game Tips: pickup every weapon you see, if it's a weapon you dont have be sure 
to use it, because if you get killed with it you wont lose a weapon out of your 
arsenal, as it will give you a longer run.

LAST MAN STANDING (g_gamemode 2) 
Last Man Standing is typically played in with g_gametype set to 0/Deathmatch, 
however LMS can be played in Team Deathmatch as well.  In LMS each player is 
randomly given a single weapon with unlimited ammo from the pool of weapons 
available (specified by the server admin).  The object of Last Man Standing 
is exactly as the name implies.  Be the last person standing.   Do not get 
killed (even once!) as you will be eliminated for the remainder of the round.  


======================
CONNECTING TO A SERVER
======================
There is a working master server so you should be able to find the test
 servers.  There have been some issues where the server browser wasnt working
for some people, If this is the case for you the test servers should already 
be loaded under FAVORITES in the server browser.

If all else fails, you can connect manually.

Currently Running Servers are here:
http://master.tnlsoft.com


=====
CVARS
=====
g_instagib (1/0 default: 0)
	Turns instagib mode on or off

There's a bunch of cvars for unlagged.. I'll pull those together shortly.


new engine commands/cvars for demos, sound and video

New cvars
cl_autoRecordDemo                 - record a new demo on each map change
cl_aviFrameRate                   - the framerate to use when capturing video
cl_aviMotionJpeg                  - use the mjpeg codec when capturing video

s_useOpenAL                       - use the OpenAL sound backend if available
s_alPrecache                      - cache OpenAL sounds before use
s_alGain                          - the value of AL_GAIN for each source
s_alSources                       - the total number of sources (memory) to
                                      allocate
s_alDopplerFactor                 - the value passed to alDopplerFactor
s_alDopplerSpeed                  - the value passed to alDopplerVelocity
s_alMinDistance                   - the value of AL_REFERENCE_DISTANCE for each source
s_alRolloff                       - the value of AL_ROLLOFF_FACTOR for each
                                      source
s_alMaxSpeakerDistance            - ET_SPEAKERS beyond this distance are culled
s_alDriver                        - which OpenAL library to use

s_sdlBits                         - SDL bit resolution
s_sdlSpeed                        - SDL sample rate
s_sdlChannels                     - SDL number of channels
s_sdlDevSamps                     - SDL DMA buffer size override
s_sdlMixSamps                     - SDL mix buffer size override

ttycon_ansicolor                  - enable use of ANSI escape codes in the tty
r_GLlibCoolDownMsec               - wait for some milliseconds to close GL library
com_altivec                       - enable use of altivec on PowerPC systems
s_backend                         - read only, indicates the current sound backend
in_shiftedKeys                    - non-SDL Linux only; enables binding to shifted keys
in_joystickNo                     - SDL only; select which joystick to use
cl_consoleHistory                 - read only, stores the console history
cl_platformSensitivity            - read only, indicates the mouse input scaling
r_ext_texture_filter_anisotropic  - anisotropic texture filtering

New commands
video [filename]        - start video capture (use with demo command)
stopvideo               - stop video capture

Also See Server CVARS:


===========
BOT SUPPORT
===========
There is one bot now supported.  Here's how to enable it in the console:

/bot_enable 1
/map XXXXXXXXXXXXX (whatever map you want to load)
/addbot sarge

Since this is a stolen bot from quake 3, we'll need to create our own.


================
DEDICATED SERVER
================
A few server configuration files are included.   You can start the dedicated 
server by clicking on the DED-SERVER.BAT file created on the desktop.

You can modify one of the server configuration files located in the 
'base' folder to meet your needs.

The following server configurations are also included:

ffa.cfg  		- FFA Gameplay 10 minutes 40 fraglimit.
ctf.cfg	-		- All Weapons CTF, Timelimit 15 minutes, capturelimit 10
ctfinstagib.cfg		- Instagib CTF, Timelimit 15 Minutes, capturelimit 10.
server.cfg		- Rotates through all the mods. This is what ded-server.bat loads.
arsenal.cfg		- Arsenal Gametype Config
lastmanstanding.cfg 	- Rotates Instagib and All Weapons Last Man Standing Maps

If you can run a home server please help out!


============
SERVER CVARS
============
Trepidation utilizes most standard quake 3 cvars, of which you can find a pretty extensive list here: 
http://trepidation.tnlsoft.com/tr/q3cvars.html

In addition Trepidation has a whole set of it's own CVARs listed below: 

g_instagib 0-off/1-on : Instagib one shot kill game mode.

g_gamemode Trepidation Game Modes:
0 - None
1 - Arsenal (must use g_gametype 0)
2 - Survival 
3 - Freeze Tag (must use g_gametype 3)
4 - Trepidation // Turrets // Whatever Not done

g_mulitjump 0-xxx Not Yet Implented


The following CVARs designate what weapons are available on each map if you turn the Flame Thrower off, the Flame Thrower will no longer spawn on maps which contain it. In the Arsenal game mode these are used to specify the weapons each player is given in their arsenal. In the Last Man Standing game mode these are used to determine which weapons can be randomly handed out at the beginning of each round

g_StartGauntlet	0-off/1 on
g_StartMG	0-off/1 on
g_StartSG	0-off/1 on
g_StartGauss	0-off/1 on
g_StartFlame	0-off/1 on
g_StartPlasma	0-off/1 on
g_StartSing	0-off/1 on
g_StartBFG	0-off/1 on


=======
MAPPING
=======
While there is a planned EF Compatability layer so that EF Maps will run 
on it as well as Quake 3 maps it has yet to be implemented.  For the best 
luck as far as mapping for Trepidation is to use GtkRadiant or Q3Radiant, 
Since the game will eventually run any EF map and any Q3 map.. EF Radiant,
 GtkRadiant or Q3Radiant will suffice... At the moment only q3 maps will 
spawn weapons/ammo/etc.. (so Q3Radiant might be better in the beginning, 
but then again... it's only the weapons and pickups that wont spawn right.. 
so your choice). 

We'll eventually have to recompile GtkRadiant itself with some new tools 
for the vehichles and whatever weapons we come up with... 

The biggest challenge the mappers are having at the moment is all of the 
textures have to be original or fall under the GPL or equivilant license..\

The current development build has a lot of textures in the zpakX-openmedia.pk3 
which are all gpl.  And of course anything in any Trep original map.

================
MAPPING: LADDERS
================
Trepidation offers Ladder support that the original Quake3 code lacked. Map 
designers should make a box around your ladders. This box should be given 
a texture of "common/ladderclip".  Make the box a lot smaller than you would 
in EF.

==============
MAPPING: OTHER
==============
textures/liquids/pool2
textures/liquids/lavafloor
textures/liquids/kc_fogcloud3

Only one is water, the other too are (obviously) lava and fog. So far I've got 
them all at least scrolling correctly and bobbing up and down, but I can't get 
the transparancy to work for the water yet. I'll keep working on it. I'll try 
to upload a pk3 with the new shader later tonight if I've got time.


=======
WEAPONS
=======
At this time, the new weapons do not have corresponding entities in Trepidation, 
they use the standard quake 3 weapon names.  Here are the replacements:

Flame Thrower        -  Lightning Gun
Singularity Cannon   -  Rocket Launcher
Gauss Rifle          -  Rail Gun
Devastator	     -  BDG

========
POWERUPS
========
No Information Yet


=========
HOLDABLES
=========
No Information Yet

=============
PLAYER MODELS
=============
Trepidation will reconized player skins created for Quake 3 as well as Star Trek 
Voyager Elite Force. The Elite Force MDR file format and directory structure is 
the preferred format as it offers additional options for custom sounds, however 
the Quake 3 MD3 based format will work as well. 



===========================================================
2006 Trepidation Project
http://trepidation.sourceforge.net

Credits:


