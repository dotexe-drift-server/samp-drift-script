# samp-drift-script
A SA-MP server gamemode designed for drifting

This script is licensed under the GNU Lesser General Public License (LGPL) v3. For more information, please read LICENSE.md

# Where can I test the script?
The script is running on my drift server.

```
HostName: [0.3.7] dotexe's drift server
Address:  games.dotexe.cf:1337
Mode:     dotexe drift script
```

# Current features
- Chat notifications when a player leaves or joins the server
- Infinite nitrous
- TextDraw watermark in the bottom left of the screen
- Car godmode
- Player godmode
- /cmds (Help page - view all the commands)
- /ls (Los Santos)
- /lsap (Los Santos Airport)
- /lv (Las Venturas)
- /lvap (Las Venturas Airport)
- /sf (San Fierro)
- /sfap (San Fierro Airport)
- /car car_name (Spawn a car)
- /cc id1 id2 (Change the color of your car)
- /flip (Flip your car onto its wheels)
- /s (Save a custom teleport position)
- /r (Load your saved teleport position)
- /t time (Change your local player's time)
- /w weather (Change your local player's weather)
- /goto id (Go to a player)
- /vw id (Change virtual worlds)
- /text (Toggle the watermark in the bottom left)
- /skin id (Change your player's skin)
- /pj id (Change your car's paintjob)

# Repo files
- server.pwn - Raw source code
- server.amx - Compiled script, ready to be used on a server

# How to install
Put server.amx into <your server>/gamemodes and edit your server.cfg to point to the gamemode
  
```
gamemode0 server 1
```

Make sure to install sscanf2 or the script won't work.

You should also disable all of SA-MP's extra crap or else you may experience slowdown and time/lighting bugs. You should only have these enabled:

```
filterscripts mappack //only if needed
plugins sscanf.dll
```
