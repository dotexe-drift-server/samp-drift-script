# samp-drift-script
A SA-MP server gamemode designed for drifting

# Where can I test the script?
The script is running on my drift server.

```
HostName: [0.3.7] dotexe's drift server
Address:  204.118.69.87:1337
Players:  x / 1000
Ping:     x
Mode:     dotexe drift script
Language: English
```

# What do the users have to say?
- "You're singlehandedly reviving the drifting community" -d4vst3r
- "You're making me want to record SA-MP again" -7thor

# Current features
- Chat notifications when a player leaves or joins the server
- Registration and login, passwords saved as a hash in a .ini file (passwords are not saved as raw text)
- Money, kills, and other things are saved to an .ini file just like the passwords
- Infinite nitrous
- Car godmode
- Player godmode
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

# How to install
Put server.pwn and server.amx into <your server>/gamemodes and edit your server.cfg to point to the gamemode
  
```
gamemode0 server 1
```

Make sure to install YSI and sscanf2 or the script won't work.

You should also disable all of SA-MP's extra crap or else you may experience slowdown and time/lighting bugs. You should only have these enabled:

```
filterscripts gl_actions gl_mapicon
plugins sscanf.dll
```
