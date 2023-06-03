
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND CACHE. 
_radius = 400;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "cache";
_markerText2 = localize "STR_DUWS_X_g0up7agm";

// Find a random position within the radius
_POSdata = [_MissionPos, _radius, _Posfound, _targetpos, _failSafe] call fnc_missionTargetPos;

_randomPos = _POSdata select 0;
_Building = _POSdata select 1;
_Posfound = _POSdata select 2;
_targetpos = _POSdata select 3;
_failSafe = _POSdata select 4;

if (_failsafe > 10 && _Posfound == false) exitWith {
	Mission_available = true; 
	publicVariable "Mission_available"; 
	[{hint localize "STR_DUWS_X_crtzxs0j"}] remoteExec ["BIS_fnc_Spawn", player1];
};

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn",  player1];

_cachePos = _targetpos;

//Create the marker	
_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

_centerSpawn = _cachePos;
_centerSpawnX = _centerSpawn select 0;
_centerSpawnY = _centerSpawn select 1;

_vehicle_0 = objNull;
_this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_vehicle_0 = _this;
_this setPos _centerSpawn;
_centerSpawnZ = (getpos _vehicle_0 select 2);
deleteVehicle _vehicle_0;

_staticsArray = [
	["CamoNet_INDP_open_F",[0.942383,-0.640625,0],342.004,1,0,[],"","",true,false], 
	["Land_GarbageHeap_02_F",[-1.71191,-1.54443,3.33786e-006],93.4817,1,0,[],"","",true,false], 
	["Land_CratesWooden_F",[-1.27148,2.11084,0],0,1,0,[],"","",true,false], 
	["Land_GarbageHeap_04_F",[-2.4165,-0.706543,-0.0443211],90.9487,1,0,[],"","",true,false], 
	["Land_CratesWooden_F",[1.46631,-3.19775,0],0,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-6.48291,-3.77783,0],49.5237,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-8.11426,1.68848,0],88.8804,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[1.946484,-8.04492,0],0.520331,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-0.718359,8.46387,0],183.745,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[3.80957,6.41455,0],45.2709,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[9.2251,-1.25684,0],269.491,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[-7.08691,7.32031,0],134.261,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[8.24512,-6.67188,0],314.617,1,0,[],"","",true,false]
];

// PLACE STATICS WITHOUT INTERACTION
_vehicle = objNull;
{
	_xyz = (_x select 1);
	_posX = (_xyz select 0);
	_posY = (_xyz select 1);
	_posZ = (_xyz select 2);
	_vehicle = createVehicle [(_x select 0), [0,0,0], [], 0, "CAN_COLLIDE"];
	_vehicle setDir (_x select 2);
	_vehicle setPosATL [(_centerSpawnX)+_posX,(_centerSpawnY)+_posY,0];
} forEach _staticsArray;

// PLACE STATICS WITH INTERACTION
// AMMOBOXES
_vehicle_7 = objNull;
_vehicle_7 = createVehicle ["Box_FIA_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_7 setDir 0;
_vehicle_7 setPosATL [(_centerSpawnX), (_centerSpawnY), 0];
_vehicle_7 setDamage 0.5;
clearMagazineCargoGlobal _vehicle_7; 
clearWeaponCargoGlobal _vehicle_7; 
clearItemCargoGlobal _vehicle_7; 
clearBackpackCargoGlobal _vehicle_7;
_vehicle_8 = objNull;
_vehicle_8 = createVehicle ["Box_FIA_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_8 setDir 0;
_vehicle_8 setPosATL [(_centerSpawnX)+2.23633, (_centerSpawnY)-0.296875, 0];
_vehicle_8 setDamage 0.5;
clearMagazineCargoGlobal _vehicle_8; 
clearWeaponCargoGlobal _vehicle_8; 
clearItemCargoGlobal _vehicle_8; 
clearBackpackCargoGlobal _vehicle_8;
// requires explosives
_vehicle_7 addEventHandler [ "HandleDamage", {
	_cache = _this select 0;
	_projectile = _this select 4;
	_dmg = 1;
	if ( _projectile isKindOf "PipeBombBase" ) then {
		_cache removeEventHandler ["HandleDamage", _thisEventHandler];
	} else {
		_dmg = 0.5;
	};
	_dmg
}];

// HMG BUNKERS
_vehicle_9 = objNull;
_vehicle_9 = createVehicle [blufor_TURRET_HMG, [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_9 setDir 314.218;
_vehicle_9 setPosATL [(_centerSpawnX)-5.52539, (_centerSpawnY)+5.98193, 0];
_vehicle_9 allowdamage false;
_vehicle_9 setdamage 0;
//_vehicle_9 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_10 = objNull;
_vehicle_10 = createVehicle [blufor_TURRET_HMG, [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_10 setDir 136.703;
_vehicle_10 setPosATL [(_centerSpawnX)+6.7168, (_centerSpawnY)-5.49365, 0];
_vehicle_10 allowdamage false;
_vehicle_10 setdamage 0;
//_vehicle_10 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_groupBunker1 = [getpos _vehicle_9, EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_groupBunker2 = [getpos _vehicle_10, EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker2 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;
_guard2 = units _groupBunker2 select 0;
_guard1 moveinGunner _vehicle_9;
_guard2 moveinGunner _vehicle_10;
_vehicle_9 setDir( [_centerSpawnX,_centerSpawnY] getDir getPosWorld _vehicle_9); //try to situate this guy radially
_vehicle_10 setDir( [_centerSpawnX,_centerSpawnY] getDir getPosWorld _vehicle_10); //try to situate this guy radially

[_guard2] joinSilent _groupBunker1;

// CREATE PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["cache%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_geryeddp", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// MISSION COMPLETE ?
waitUntil {sleep 5; !alive _vehicle_7 || (damage _vehicle_7) == 1 || Mission_Cancelled};  

if (Mission_Cancelled) exitWith {};

// SECONDARY EXPLOSIONS
_bomb= "grenade" createVehicle[(_cachePos select 0), (_cachePos select 1)];
sleep 0.5;
_bomb= "grenade" createVehicle[(_cachePos select 0), (_cachePos select 1)];
_bomb= "grenade" createVehicle[(_cachePos select 0), (_cachePos select 1)];
sleep 0.1;
_bomb= "grenade" createVehicle[(_cachePos select 0), (_cachePos select 1)];
sleep 0.5;
_bomb= "Bo_Mk82" createVehicle[(_cachePos select 0), (_cachePos select 1)];
sleep 0.5;
_bomb= "Bo_Mk82" createVehicle[(_cachePos select 0), (_cachePos select 1)];
sleep 0.5;
_bomb= "grenade" createVehicle[(_cachePos select 0), (_cachePos select 1)];
sleep 0.5;
_bomb= "grenade" createVehicle[(_cachePos select 0), (_cachePos select 1)];

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;
