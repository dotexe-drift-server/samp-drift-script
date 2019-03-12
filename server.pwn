#include <a_samp>
#include <izcmd>
#include <sscanf2>
#include <core>
#include <float>
#include <string>
#include <file>
#include <time>
#include <datagram>
#include <a_players>
#include <a_vehicles>
#include <a_objects>
#include <a_sampdb>

main()
{
	print("\n-----------------------------------");
	print("       dotexe's drift script       ");
	print("-----------------------------------\n");
}

new VEHICLE[MAX_PLAYERS];
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

new
    Float: PosX[ MAX_PLAYERS ],
    Float: PosY[ MAX_PLAYERS ],
    Float: PosZ[ MAX_PLAYERS ],
    Float: Angle[ MAX_PLAYERS ],
    Interior[ MAX_PLAYERS ]
;

public OnPlayerDisconnect( playerid, reason )
{
    return ( 1 );
}

public OnPlayerConnect( playerid )
{
    return ( 1 );
}


public OnPlayerSpawn( playerid )
{
	GetPlayerPos(playerid, PosX[playerid], PosY[playerid], PosZ[playerid]);
 	GetPlayerFacingAngle(playerid, Angle[playerid]);
    return ( 1 );
}

public OnGameModeInit()
{
	SetGameModeText("dotexe drift script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
    SetPlayerHealth(playerid, Float:0x7F800000);
	if(IsPlayerInAnyVehicle(playerid))
	{
        RepairVehicle(GetPlayerVehicleID(playerid));
	}
	new VEH;
	VEH = GetPlayerVehicleID(playerid);
	if(VEH > 0)
	{
	    AddVehicleComponent(VEH, 1010);
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

RETURN_VEHICLE_ID(VEHICLE_NAME[])
{
    for(new x; x != 211; x++) if(strfind(VEHICLE_NAMES[x], VEHICLE_NAME, true) != -1) return x + 400;
    return INVALID_VEHICLE_ID;
}

CMD:t(PLAYER_ID, PARAMS[])
{
	new TIME;
	if(sscanf(PARAMS, "d", TIME)) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Invalid arguments! Valid: /t <time>");
	else if(TIME < 0 || TIME > 23) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Time can not be above 23 or below 0!");
	else
	{
		SetPlayerTime(PLAYER_ID, TIME);
	}
	return 1;
}

CMD:w(PLAYER_ID, PARAMS[])
{
	new WEATHER;
	if(sscanf(PARAMS, "d", WEATHER)) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Invalid arguments! Valid: /t <time>");
	else if(WEATHER < 0 || WEATHER > 255) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Time can not be above 255 or below 0!");
	else
	{
		SetPlayerWeather(PLAYER_ID, WEATHER);
	}
	return 1;
}

CMD:car(PLAYER_ID, PARAMS[])
{
	new bool:COMMAND_RAN = false;
	if(COMMAND_RAN == false)
	{
	    new CAR_NAME[128];
		new STRING[128];
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(PLAYER_ID, Float:X, Float:Y, Float:Z);
		if(sscanf(PARAMS, "s", CAR_NAME))
		{
			return SendClientMessage(PLAYER_ID, 0xff0000ff, "Invalid arguments! Valid: /car <name>");
		}
		else if(RETURN_VEHICLE_ID(CAR_NAME) < 400 || RETURN_VEHICLE_ID(CAR_NAME) > 611 || RETURN_VEHICLE_ID(CAR_NAME) == 0)
		{
			return SendClientMessage(PLAYER_ID, 0xff0000ff, "Vehicle does not exist!");
		}
		if(VEHICLE[PLAYER_ID] != 0)
		{
	        DestroyVehicle(VEHICLE[PLAYER_ID]);
		}
	    VEHICLE[PLAYER_ID] = CreateVehicle(RETURN_VEHICLE_ID(CAR_NAME), X, Y, Z + 3.0, 0, -1, -1, 1);
	    PutPlayerInVehicle(PLAYER_ID,VEHICLE[PLAYER_ID],0);
	    format(STRING,sizeof(STRING),"Your %s has been spawned.",CAR_NAME);
	    SendClientMessage(PLAYER_ID, 0xffffffff, STRING);
	    COMMAND_RAN = true;
	}
	return 1;
}

CMD:cc(PLAYER_ID, PARAMS[])
{
    new COLOR_ID, COLOR_ID2, VEHICLE_ID, STR[75];
    VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
    if(!(IsPlayerInAnyVehicle(PLAYER_ID))) return SendClientMessage(PLAYER_ID, 0xff0000ff, "You are not in a vehicle!");
    else if(sscanf(PARAMS, "dd", COLOR_ID,COLOR_ID2)) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Invalid arguments! Valid; /cc <color1> <color2>");
    else if(!IsPlayerInAnyVehicle(PLAYER_ID)) return SendClientMessage(PLAYER_ID, 0xff0000ff, "You are not in a vehicle!");
    else if(COLOR_ID < 0 && COLOR_ID > 126) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Color 1 cannot be above 126 or below 0!");
    else if(COLOR_ID2 < 0 && COLOR_ID2 > 126) return SendClientMessage(PLAYER_ID, 0xff0000ff, "Color 2 cannot be above 126 or below 0!");
    else
    {
        ChangeVehicleColor(VEHICLE_ID, COLOR_ID, COLOR_ID2);
        format(STR, sizeof(STR),"Car color changed.",COLOR_ID, COLOR_ID2);
        SendClientMessage(PLAYER_ID, 0xffffffff, STR);
    }
    return 1;
}

CMD:flip(PLAYER_ID, PARAMS[])
{
	new bool:COMMAND_RAN = false;
	if(COMMAND_RAN == false)
	{
 		if(IsPlayerInAnyVehicle(PLAYER_ID))
		{
			new CURRENT_VEHICLE;
	   		new Float:ANGLE;
	    	CURRENT_VEHICLE = GetPlayerVehicleID(PLAYER_ID);
	    	GetVehicleZAngle(CURRENT_VEHICLE, ANGLE);
	    	SetVehicleZAngle(CURRENT_VEHICLE, ANGLE);
	    	SendClientMessage(PLAYER_ID, 0xffffffff, "Your vehicle has been flipped.");
		}
		else
		{
 			SendClientMessage(PLAYER_ID, 0xff0000ff, "You are not in a vehicle!");
		}
	    COMMAND_RAN = true;
	}
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
    SendClientMessage(PLAYER_ID, 0xffffffff, "Saved teleport position.");

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
        SendClientMessage( PLAYER_ID, 0xffffffff, "Teleported to saved position." );
    }
    return 1;
}

CMD:ls(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    SetVehiclePos(VEHICLE_ID, 2499.8733,-1667.6309,13.3512);
	}
	else
	{
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, 2499.8733,-1667.6309,13.3512);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, "You've been teleported to Los Santos.");
	return 1;
}

CMD:lsap(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    SetVehiclePos(VEHICLE_ID, 1934.8811,-2305.5283,13.5469);
	}
	else
	{
		SetPlayerInterior(PLAYER_ID, 0);
 		SetPlayerPos(PLAYER_ID, 1934.8811,-2305.5283,13.5469);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, "You've been teleported to Los Santos Airport.");
	return 1;
}

CMD:sf(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    SetVehiclePos(VEHICLE_ID, -2670.1101,-4.9832,6.1328);
	}
	else
	{
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, -2670.1101,-4.9832,6.1328);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, "You've been teleported to San Fierro.");
	return 1;
}

CMD:sfap(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    SetVehiclePos(VEHICLE_ID, -1315.9419,-223.8595,14.1484);
	}
	else
	{
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, -1315.9419,-223.8595,14.1484);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, "You've been teleported to San Fierro Airport.");
	return 1;
}

CMD:lv(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    SetVehiclePos(VEHICLE_ID, 2421.7185,1121.9866,10.8125);
		SetVehicleZAngle(VEHICLE_ID, 90);
	}
	else
	{
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, 2421.7185,1121.9866,10.8125);
		SetPlayerFacingAngle(PLAYER_ID, 90);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, "You've been teleported to Las Venturas.");
	return 1;
}

CMD:lvap(PLAYER_ID, PARAMS[])
{
	if(IsPlayerInAnyVehicle(PLAYER_ID))
	{
	    new VEHICLE_ID = GetPlayerVehicleID(PLAYER_ID);
	    SetVehiclePos(VEHICLE_ID, 1487.9703,1736.9537,10.8125);
	}
	else
	{
		SetPlayerInterior(PLAYER_ID, 0);
		SetPlayerPos(PLAYER_ID, 1487.9703,1736.9537,10.8125);
	}
	SendClientMessage(PLAYER_ID, 0xffffffff, "You've been teleported to Las Venturas Airport.");
	return 1;
}
