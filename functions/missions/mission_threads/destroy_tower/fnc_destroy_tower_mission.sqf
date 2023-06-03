
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND TOWER. 
_radius = 400;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "tower";
_markerText2 = localize "STR_DUWS_X_yn5me1h4";

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

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn",player1];

_towerPos = _targetpos;

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

_centerSpawn = _towerPos;
_centerSpawnX = _towerPos select 0;
_centerSpawnY = _towerPos select 1;

_vehicle_0 = objNull;
_this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_vehicle_0 = _this;
_this setPos _centerSpawn;
_centerSpawnZ = (getpos _vehicle_0 select 2);
deleteVehicle _vehicle_0;

_staticsArray = [];

switch (VERSION_X) do {
	case "MODERN": {
		_staticsArray = [
			["Land_CratesWooden_F",[-3.56738,-6.65527,0],269.589,1,0,[],"","",true,false], 
			["CargoNet_01_barrels_F",[3.37939,-7.32568,0],0,1,0,[],"","",true,false], 
			["Land_CratesWooden_F",[-5.61475,-6.56982,0],269.589,1,0,[],"","",true,false], 
			["CargoNet_01_barrels_F",[5.3335,-7.30029,0],0,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[-3.70996,8.57227,0],1.64537,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[2.06396,8.42969,0],1.64537,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[10.0508,1.10498,0],271.593,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[-4.1333,-9.50635,0],179.745,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[9.91553,-4.47949,0],271.593,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[4.69043,-9.56396,0],179.745,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[-10.3931,2.490234,0],271.593,1,0,[],"","",true,false], 
			["Land_HBarrier_5_F",[-10.5269,-3.28467,0],271.593,1,0,[],"","",true,false], 
			["Land_TBox_F",[-0.117676,-14.9492,0],182.221,1,0,[],"","",true,false]
		];
	};
	case "WW2": {
		_staticsArray = [
			["opfor_STATIC_AMMO",[-2.03711,0.421875,0],101.741,1,0,[],"","",true,false], 
			["Land_Bunker_01_blocks_3_F",[-0.625,2.22266,0],11.4215,1,0,[],"","",true,false], 
			["Land_CamoNetVar_EAST",[-0.46875,2.55859,0],7.27667,1,0,[],"","",true,false], 
			["Land_BagFence_Long_F",[1.25391,6.35742,0],187.825,1,0,[],"","",true,false], 
			["Land_BagFence_Short_F",[6.57031,-0.171875,0],271.645,1,0,[],"","",true,false], 
			["Land_Bunker_01_blocks_3_F",[6.08398,3.29883,0],69.6271,1,0,[],"","",true,false], 
			["Land_Bunker_01_blocks_1_F",[-0.0390625,-7.04883,0],186.487,1,0,[],"","",true,false], 
			["Land_Bunker_01_blocks_1_F",[-1.53125,-6.89844,0],186.487,1,0,[],"","",true,false], 
			["Land_CratesWooden_F",[-4.11523,-6.23828,0],5.87235,1,0,[],"","",true,false], 
			["Land_Bunker_01_blocks_3_F",[-7.87695,0.328125,0],274.582,1,0,[],"","",true,false], 
			[opfor_TURRET_HMG,[-5.49805,-6.76172,0],136.274,1,0,[],"","",true,false], 
			[opfor_TURRET_HMG,[-5.49805,5.88672,0],331.423,1,0,[],"","",true,false], 
			["Land_BagFence_Long_F",[-3.86914,-7.21484,0],182.966,1,0,[],"","",true,false], 
			["Land_BagFence_Short_F",[5.77734,-5.88086,0],102.746,1,0,[],"","",true,false], 
			["Land_BagFence_Short_F",[-4.33203,7.10156,0],186.872,1,0,[],"","",true,false], 
			["Land_BagFence_Round_F",[4.85742,-7.86719,0],327.853,1,0,[],"","",true,false], 
			["Land_BagFence_Corner_F",[-6.11328,-7.14844,0],175.6,1,0,[],"","",true,false], 
			["Land_BagFence_Short_F",[-8.51563,-3.06836,0],270.5,1,0,[],"","",true,false], 
			["Land_BagFence_Round_F",[-6.46484,6.78906,0],135.817,1,0,[],"","",true,false] 
		];
	};
};
	
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
// TOWER / TRUCK
_vehicle_7 = objNull;

switch (VERSION_X) do {
	case "MODERN": {
		_vehicle_7 = createVehicle ["Land_TTowerBig_2_F", [0,0,0], [], 0, "CAN_COLLIDE"];
		_vehicle_7 setDir 0;
		_vehicle_7 setPosATL [(_centerSpawnX), (_centerSpawnY), 0];
		_vehicle_7 setDamage 0.5;
		_vehicle_7 setVectorUp [0,0,1];
		// requires explosives
		_vehicle_7 addEventHandler [ "HandleDamage", {
			_tower = _this select 0;
			_projectile = _this select 4;
			_dmg = 1;
			if ( _projectile isKindOf "PipeBombBase" ) then {
				_tower removeEventHandler ["HandleDamage", _thisEventHandler];
			} else {
				_dmg = 0.5;
			};
			_dmg
		}];
	};
	case "WW2": {
		_vehicle_7 = createVehicle [opfor_STATIC_RAD, [0,0,0], [], 0, "CAN_COLLIDE"];
		_vehicle_7 setDir 99.5098;
		_vehicle_7 setPos [(_centerSpawnX)+0.486328, (_centerSpawnY)-2.79297, (_centerSpawnZ)+0];
	
		_groupBunker1 = [getpos _vehicle_22, EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
		_groupBunker1 deleteGroupWhenEmpty true;
		_groupBunker2 = [getpos _vehicle_25, EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
		_groupBunker2 deleteGroupWhenEmpty true;
		_guard1 = units _groupBunker1 select 0;
		_guard2 = units _groupBunker2 select 0;
		_guard1 moveinGunner _vehicle_16;
		_guard2 moveinGunner _vehicle_17;
	};
};

// CREATE PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["tower%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_dgpqenyw", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// MISSION COMPLETE ?
waitUntil {sleep 5; !alive _vehicle_7 || (damage _vehicle_7) == 1 || Mission_Cancelled};  

if (Mission_Cancelled) exitWith {};

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


