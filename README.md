# samp-drift-script
A SA-MP server gamemode designed for drifting

# Where can I test the script?
The script is running on my drift server.

```
HostName: dotexe drift server
Address:  maikarusan.001www.com:1337
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

# How to install
Put server.pwn and server.amx into <your server>/gamemodes and edit your server.cfg to point to the gamemode
  
```
gamemode0 server 1
```

Make sure to install sscanf2 or the script won't work.

You should also disable all of SA-MP's extra crap or else you may experience slowdown and time/lighting bugs. You should only have these enabled:

```
filterscripts mappack //(if needed)
plugins sscanf.dll
```
