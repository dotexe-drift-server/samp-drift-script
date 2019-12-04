#include <a_samp>
#include <a_players>
#include <a_vehicles>
#include <a_objects>
#include <a_sampdb>
#include <core>
#include <float>
#include <string>
#include <file>
#include <time>
#include <datagram>
#include <izcmd>
#include <sscanf2>

#define COLOR_WHITE "{ffffff}"
#define COLOR_GREY "{a3a3a3}"
#define COLOR_RED "{f81414}"
#define COLOR_GREEN "{00ff22}"
#define COLOR_LIGHTBLUE "{00ced1}"
#define DIALOG_CMDS 1
#define PREFIX "" COLOR_GREY "[SERVER]: " COLOR_WHITE
#define PREFIX_ERROR "" COLOR_GREY "[SERVER]: " COLOR_RED

main()
{
	print("\n-----------------------------------");
	print("       dotexe's drift script       ");
	print("-----------------------------------\n");
}

new Text:WATERMARK;
new CARGOD[MAX_PLAYERS], GOD[MAX_PLAYERS];
new VEHICLE[MAX_PLAYERS];
new TEXT_SHOWN[MAX_PLAYERS];
new Float:PosX[MAX_PLAYERS], Float:PosY[MAX_PLAYERS], Float:PosZ[MAX_PLAYERS], Float:Angle[MAX_PLAYERS], Interior[MAX_PLAYERS];

new VEHICLE_NAMES[212][] =
{
        "Landstalker", "Bravura", "Buffalo", "Linerunner", "Pereniel", "Sentinel", "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
        "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat", "Mr Whoopee", "BF Injection",
        "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
        "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
        "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider",
        "Glendale", "Oceanic", "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR3 50", "Walton", "Regina",
        "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood",
        "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B",
        "Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropdust", "Stunt", "Tanker", "RoadTrain",
        "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune", "Cadrona", "FBI Truck",
        "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent", "Bullet", "Clover",
        "Sadler", "Firetruck", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster A",
        "Monster B", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito", "Freight", "Trailer",
        "Kart", "Mower", "Duneride", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "Newsvan", "Tug", "Trailer A", "Emperor",
        "Wayfarer", "Euros", "Hotdog", "Club", "Trailer B", "Trailer C", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)",
        "Police Car (LVPD)", "Police Ranger", "Picador", "S.W.A.T. Van", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer A", "Luggage Trailer B",
        "Stair Trailer", "Boxville", "Farm Plow", "Utility Trailer"
};

public OnGameModeInit()
{
	SetGameModeText("dotexe drift script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	EnableStuntBonusForAll(0);

	WATERMARK = TextDrawCreate(5, 430, "--");
	TextDrawFont(WATERMARK,3);
 	TextDrawLetterSize(WATERMARK,0.399999,1.600000);
    	TextDrawColor(WATERMARK,0xffffffff);
    	TextDrawSetString(WATERMARK, "dotexe drift script");
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

native gpci (playerid, serial [], len);

public OnPlayerConnect(playerid)
{
	CARGOD[playerid] = true;
	GOD[playerid] = true;
	TEXT_SHOWN[playerid] = true;
	for(new i; i < MAX_PLAYERS; i++)
	{
	    new name[MAX_PLAYER_NAME + 1];
	    GetPlayerName(playerid, name, sizeof(name));
     		new string[128];
     		format(string, sizeof(string), COLOR_GREY "[SERVER]: " COLOR_WHITE "Player %s(%d) has joined the server", name, playerid);
	    	SendClientMessage(i, 0xffffffff, string);
	}
	if(TEXT_SHOWN[playerid]) TextDrawShowForPlayer(playerid, WATERMARK);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	for(new i; i < MAX_PLAYERS; i++)
	{
	    	new name[MAX_PLAYER_NAME + 1];
	    	GetPlayerName(playerid, name, sizeof(name));
 		new string[128];
 		format(string, sizeof(string), PREFIX "Player %s(%d) has left the server", name, playerid);
	    	SendClientMessage(i, 0xffffffff, string);
	}
	TextDrawHideForPlayer(playerid, WATERMARK);
	return 1;
}

public OnPlayerUpdate(playerid)
{
    	if(GOD[playerid]) SetPlayerHealth(playerid, Float:0x7F800000);
		if(IsPlayerInAnyVehicle(playerid) && CARGOD[playerid]) RepairVehicle(GetPlayerVehicleID(playerid));
		new VEH;
		VEH = GetPlayerVehicleID(playerid);
		if(VEH > 0) AddVehicleComponent(VEH, 1010);
		return 1;
	}
	
	public OnPlayerCommandPerformed(playerid, cmdtext[], success)
	{
		if (!success)
    	{
			SendClientMessage(playerid, 0xffffffff, PREFIX_ERROR "Invalid command! Try /cmds for help");
    	}
    	return 1;
}

RETURN_VEHICLE_ID(VEHICLE_NAME[])
{
    	for(new i; i != 211; i++) if(strfind(VEHICLE_NAMES[i], VEHICLE_NAME, true) != -1) return i + 400;
    	return INVALID_VEHICLE_ID;
}

CMD:cmds(PLAYER_ID, PARAMS[])
{
	new TEXT[1337];
	strcat(TEXT, COLOR_RED "Player Commands\n" COLOR_WHITE);
	strcat(TEXT, "/ls - Los Santos\n/lsap - Los Santos Airport\n/lv - Las Venturas\n/lvap - Las Venturas Airport\n/sf - San Fierro\n/sfap - San Fierro Airport\n");
	strcat(TEXT, "/car <name> - Spawn a car\n/cc <id1> <id2> - Change car color\n/flip - Flip your car upright\n/s - Save a custom teleport position\n/r - Load your saved teleport position\n");
	strcat(TEXT, "/t <time> - Change your local player's time\n/w <weather> - Change your local player's weather\n");
	strcat(TEXT, "/goto <id> - Teleport to a player\n/vw <id> - Change virtual worlds\n/text - Toggle the watermark in the bottom left\n/skin <id> - Change your player's skin\n/pj <id> - Change your car's paintjob\n");
	ShowPlayerDialog(PLAYER_ID, DIALOG_CMDS, DIALOG_STYLE_MSGBOX, "Commands", TEXT, "Ok", "");
	return 1;
}

CMD:skin(PLAYER_ID, PARAMS[])
{
    	new SKIN;
    	if(sscanf(PARAMS, "d", SKIN)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid; /skin <id>");
    	else if(SKIN < 0 || SKIN > 311) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Skin cannot be above 311 or below 0!");
    	else { SetPlayerSkin(PLAYER_ID, SKIN); SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Your skin has been changed."); }
    	return 1;
}

CMD:vw(PLAYER_ID, PARAMS[])
{
   	 new WORLD;
   	 if(sscanf(PARAMS, "d", WORLD)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid; /vw <id>");
   	 else if(WORLD < 0 || WORLD > 255) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Virtual world cannot be above 255 or below 0!");
   	 else { SetPlayerVirtualWorld(PLAYER_ID, WORLD); SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Your virtual world has been changed."); }
    	return 1;
}

CMD:cargod(PLAYER_ID, PARAMS[])
{
    	CARGOD[PLAYER_ID] = !CARGOD[PLAYER_ID];
    	return SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Car god mode has been toggled! Run this command again to toggle it back on/off.");
}

CMD:god(PLAYER_ID, PARAMS[])
{
	GOD[PLAYER_ID] = !GOD[PLAYER_ID];
	if(!GOD[PLAYER_ID])
	{
	    	SetPlayerHealth(PLAYER_ID, 100);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "God mode! Run this command again to toggle it back on/off.");
	return 1;
}

CMD:text(PLAYER_ID, PARAMS[])
{
	TEXT_SHOWN[PLAYER_ID] = !TEXT_SHOWN[PLAYER_ID];
 	if(TEXT_SHOWN[PLAYER_ID]) TextDrawShowForPlayer(PLAYER_ID, WATERMARK);
    	else TextDrawHideForPlayer(PLAYER_ID, WATERMARK);
    	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Text has been toggled! Run this command again to toggle it back on/off.");
	return 1;
}

CMD:car(PLAYER_ID, PARAMS[])
{
	new CAR_NAME[128], STRING[128], Float:X, Float:Y, Float:Z;
	GetPlayerPos(PLAYER_ID, Float:X, Float:Y, Float:Z);
	if(sscanf(PARAMS, "s[128]", CAR_NAME)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid: /car <name>");
	else if(RETURN_VEHICLE_ID(CAR_NAME) < 400 || RETURN_VEHICLE_ID(CAR_NAME) > 611 || RETURN_VEHICLE_ID(CAR_NAME) == 0) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Vehicle does not exist!");
	else
	{
		if(VEHICLE[PLAYER_ID] != 0) DestroyVehicle(VEHICLE[PLAYER_ID]);
	  	VEHICLE[PLAYER_ID] = CreateVehicle(RETURN_VEHICLE_ID(CAR_NAME), X, Y, Z + 3.0, 0, -1, -1, 1);
		SetVehicleVirtualWorld(VEHICLE[PLAYER_ID], GetPlayerVirtualWorld(PLAYER_ID));
	  	PutPlayerInVehicle(PLAYER_ID, VEHICLE[PLAYER_ID], 0);
	 	format(STRING,sizeof(STRING), PREFIX "Your %s has been spawned.",CAR_NAME);
	 	SendClientMessage(PLAYER_ID, 0xffffffff, STRING);
	}
 	return 1;
}

CMD:cc(PLAYER_ID, PARAMS[])
{
	new COLOR_ID, COLOR_ID2, VEHICLE_ID, STR[128];
  	VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
 	if(!(IsPlayerInAnyVehicle(PLAYER_ID))) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "You are not in a vehicle!");
    	else if(sscanf(PARAMS, "dd", COLOR_ID,COLOR_ID2)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid; /cc <color1> <color2>");
    	else if(!IsPlayerInAnyVehicle(PLAYER_ID)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "You are not in a vehicle!");
    	else if(COLOR_ID < 0 || COLOR_ID > 255) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Color cannot be above 255 or below 0!");
    	else if(COLOR_ID2 < 0 || COLOR_ID2 > 255) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Color cannot be above 255 or below 0!");
    	else { ChangeVehicleColor(VEHICLE_ID, COLOR_ID, COLOR_ID2); SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Car color changed."); }
    	return 1;
}

CMD:pj(PLAYER_ID, PARAMS[])
{
	new PJ, VEHICLE_ID;
  	VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
    	if(!(IsPlayerInAnyVehicle(PLAYER_ID))) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "You are not in a vehicle!");
    	else if(sscanf(PARAMS, "d", PJ)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid; /pj <id>");
    	else if(!IsPlayerInAnyVehicle(PLAYER_ID)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "You are not in a vehicle!");
    	else if(PJ < 0 || PJ > 3) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Paintjob cannot be above 3 or below 0!");
    	else { ChangeVehiclePaintjob(VEHICLE_ID, PJ); SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Paintjob color changed."); }
    	return 1;
}

CMD:flip(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
		new CURRENT_VEHICLE;
	   	new Float:ANGLE;
	   	CURRENT_VEHICLE = GetPlayerVehicleID(PLAYER_ID);
	   	GetVehicleZAngle(CURRENT_VEHICLE, ANGLE);
	  	SetVehicleZAngle(CURRENT_VEHICLE, ANGLE);
  	 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Your vehicle has been flipped.");
	}
	else SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "You are not in a vehicle!");
	return 1;
}

CMD:t(PLAYER_ID, PARAMS[])
{
	new TIME;
	if(sscanf(PARAMS, "d", TIME)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid: /t <time>");
	else if(TIME < 0 || TIME > 23) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Time can not be above 23 or below 0!");
	else { SetPlayerTime(PLAYER_ID, TIME, 0); SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Time has been changed!"); }
	return 1;
}

CMD:w(PLAYER_ID, PARAMS[])
{
	new WEATHER;
	if(sscanf(PARAMS, "d", WEATHER)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid: /w <weather>");
	else if(WEATHER < 0 || WEATHER > 255) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Weather can not be above 255 or below 0!");
	else { SetPlayerWeather(PLAYER_ID, WEATHER); SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Weather has been changed!"); }
	return 1;
}

CMD:s(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
		GetVehiclePos(VEHICLE_ID, PosX[PLAYER_ID], PosY[PLAYER_ID], PosZ[PLAYER_ID]);
    		GetVehicleZAngle(VEHICLE_ID, Angle[PLAYER_ID]);
	}
	else
	{
		GetPlayerPos(PLAYER_ID, PosX[PLAYER_ID], PosY[PLAYER_ID], PosZ[PLAYER_ID]);
		GetPlayerFacingAngle(PLAYER_ID, Angle[PLAYER_ID]);
	}
	GetPlayerInterior(PLAYER_ID, Interior[PLAYER_ID]);
    	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Saved teleport position.");
    	return 1;
}

CMD:r(PLAYER_ID, PARAMS[])
{
    	if ( PosX[ PLAYER_ID ] != 0 && PosY[ PLAYER_ID ] != 0 && PosZ[ PLAYER_ID ] != 0 )
	{
		if(IsPlayerInAnyVehicle(PLAYER_ID))
		{
		    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
		    	SetVehiclePos(VEHICLE_ID, PosX[PLAYER_ID], PosY[PLAYER_ID], PosZ[ PLAYER_ID ]);
		    	SetVehicleZAngle(VEHICLE_ID, Angle[PLAYER_ID]);
		}
		else
		{
			SetPlayerPos(PLAYER_ID, PosX[PLAYER_ID], PosY[PLAYER_ID], PosZ[PLAYER_ID]);
			SetPlayerFacingAngle(PLAYER_ID, Angle[PLAYER_ID]);
		}
		SetPlayerInterior(PLAYER_ID, Interior[PLAYER_ID]);
        	SendClientMessage( PLAYER_ID, 0xffffffff, PREFIX "Teleported to saved position." );
	}
	return 1;
}

CMD:goto(PLAYER_ID, PARAMS[])
{
	new Float:POS_X, Float:POS_Y, Float:POS_Z, ID;
	if(sscanf(PARAMS, "d", ID)) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Invalid arguments! Valid: /goto <id>");
	else if(!(IsPlayerConnected(ID))) SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX_ERROR  "Player is not online!");
	else
	{
		if(IsPlayerInAnyVehicle(PLAYER_ID))
		{
			new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
        		GetPlayerPos(ID, POS_X, POS_Y, POS_Z);
 			SetVehiclePos(VEHICLE_ID, POS_X, POS_Y, POS_Z);
		 	SetPlayerVirtualWorld(PLAYER_ID, GetPlayerVirtualWorld(ID));
 			SetVehicleVirtualWorld(VEHICLE_ID, GetPlayerVirtualWorld(ID));
 			PutPlayerInVehicle(PLAYER_ID, VEHICLE_ID, 0);
		}
		else {
			GetPlayerPos(ID, POS_X, POS_Y, POS_Z);
			SetPlayerPos(PLAYER_ID, POS_X, POS_Y, POS_Z);
			SetPlayerVirtualWorld(PLAYER_ID, GetPlayerVirtualWorld(ID));
		}
	 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "Teleported to player!");
	}
	return 1;
}

CMD:ls(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    	SetVehiclePos(VEHICLE_ID, 2499.8733,-1667.6309,13.3512);
   		SetVehicleZAngle(VEHICLE_ID, 90);
	}
	else {
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, 2499.8733,-1667.6309,13.3512);
		SetPlayerFacingAngle(PLAYER_ID, 90);
	}
 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "You've been teleported to Los Santos.");
 	return 1;
}

CMD:lsap(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    	SetVehiclePos(VEHICLE_ID, 1934.8811,-2305.5283,13.5469);
	    	SetVehicleZAngle(VEHICLE_ID, 180);
	}
	else {
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, 1934.8811,-2305.5283,13.5469);
		SetPlayerFacingAngle(PLAYER_ID, 180);
	}
 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "You've been teleported to Los Santos Airport.");
 	return 1;
}

CMD:sf(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    	SetVehiclePos(VEHICLE_ID, -2670.1101,-4.9832,6.1328);
	    	SetVehicleZAngle(VEHICLE_ID, 90);
	}
	else
	{
	    	SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, -2670.1101,-4.9832,6.1328);
		SetPlayerFacingAngle(PLAYER_ID, 90);
	}
 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "You've been teleported to San Fierro.");
 	return 1;
}

CMD:sfap(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
		new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    	SetVehiclePos(VEHICLE_ID, -1315.9419,-223.8595,14.1484);
	    	SetVehicleZAngle(VEHICLE_ID, 90);
	}
	else {
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, -1315.9419,-223.8595,14.1484);
		SetPlayerFacingAngle(PLAYER_ID, 90);
	}
 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "You've been teleported to San Fierro Airport.");
 	return 1;
}

CMD:lv(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    	SetVehiclePos(VEHICLE_ID, 2421.7185,1121.9866,10.8125);
		SetVehicleZAngle(VEHICLE_ID, 0);
	}
	else {
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, 2421.7185,1121.9866,10.8125);
		SetPlayerFacingAngle(PLAYER_ID, 0);
	}
 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "You've been teleported to Las Venturas.");
 	return 1;
}

CMD:lvap(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    	new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    	SetVehiclePos(VEHICLE_ID, 1487.9703,1736.9537,10.8125);
	    	SetVehicleZAngle(VEHICLE_ID, 90);
	}
	else
	{
 		SetPlayerInterior(PLAYER_ID, 0);
        	SetPlayerPos(PLAYER_ID, 1487.9703,1736.9537,10.8125);
        	SetPlayerFacingAngle(PLAYER_ID, 90);
	}
 	SendClientMessage(PLAYER_ID, 0xffffffff, PREFIX "You've been teleported to Las Venturas Airport.");
 	return 1;
}
