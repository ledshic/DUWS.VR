
_exiting = false;
_cpreward = 25;
_apreward = 25;

if (!isNil "BLD1") then {
    if (alive BLD1) exitWith {
		_exiting = true;
		[{hint localize "STR_DUWS_X_mfxb090t"}] remoteExec ["BIS_fnc_Spawn", player1];
	};
};
 
if (_exiting) exitWith {true};

params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND VEHICLE.
_radius = 500;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "recov";
_markerText2 = localize "STR_DUWS_X_63pnqj4l";

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

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn", player1];

_vehpos = _targetpos;

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

// CREATE Mobile builder vehicle and give it a name with public variable
_bld1 = opfor_REPAIR_TRUCK_X createVehicle (_vehPos);
_Varname = "BLD1";
_bld1 SetVehicleVarName _VarName;
_bld1 Call Compile Format ["%1=_This ; PublicVariable ""%1""",_VarName];

_static1 = "";
_static2 = "";
switch (VERSION_X) do {
	case "MODERN": {
		_static1 = "CargoNet_01_barrels_F";
		_static2 = "CamoNet_INDP_open_F";
	};
	case "WW2": {
		_static1 = "Land_CratesWooden_F";
		_static2 = "CamoNet_INDP_open_F";
	};
};

_obj1 = createVehicle [_static1, [(_vehpos select 0)-12, (_vehpos select 1)], [], 0, "CAN_COLLIDE"];
sleep 1;
_obj2 = createVehicle [_static1, [(_vehpos select 0)-10, (_vehpos select 1)], [], 0, "CAN_COLLIDE"];
sleep 1;
_obj3 = createVehicle [_static1, [(_vehpos select 0)-8, (_vehpos select 1)], [], 0, "CAN_COLLIDE"];
sleep 1;
_obj4 = createVehicle [_static2, [(_vehpos select 0)-10, (_vehpos select 1)], [], 0, "CAN_COLLIDE"];
sleep 1;

// Vehicle Guards
_group = [_vehPos, EAST, [opfor_SL_SOLDIER_X, opfor_LAT_SOLDIER_X, opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup; 
_group deleteGroupWhenEmpty true;

// CREATE PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_czpvn5z1", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// MISSION COMPLETE ?
waitUntil {sleep 2; ((getdammage BLD1)>0.95 || (BLD1 distance PosOfBLUHQ)<50) || Mission_Cancelled};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

if (Mission_Cancelled) exitWith {};

if (getdammage BLD1>0.95) exitWith {
	
  [{hint localize "STR_DUWS_X_obc4591x"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
  
  [_VARtaskgeneratedName, "FAILED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

  // Spawn the "next mission" wait
  [] spawn fnc_missionTimer;
  // Spawn the cleanup
  [_targetpos,_radius] spawn fnc_mission_cleanup;

};

// IF THE MISSION IS COMPLETE
[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

[[{hint localize "STR_DUWS_X_125f39s4"}],"BIS_fnc_Spawn",true] call BIS_fnc_MP;
sleep 2;

//BLD1cap = true;
//publicvariable "BLD1cap";

// ADD VEHICLE MARKER
_init_code =
{
	waitUntil {!isNil "BLD1"};
	[BLD1, -1, west, "LIGHT"] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf";
	[BLD1, "mil_triangle", "ColorBlue", "2", "2", "BLD-1"] call kndr_assignMarker;
};

[[[], _init_code], "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;
//[] remoteExec ["_init_code", [0,-2] select isDedicated,true];

sleep 5;
[{hint localize "STR_DUWS_X_rw65exr8"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;

