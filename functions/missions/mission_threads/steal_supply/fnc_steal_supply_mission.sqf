
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

_radius = 200;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "supply";
_markerText2 = localize "STR_DUWS_X_ceg3mxxc";

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

_vehPos = _targetpos;

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

// CREATE TRUCK & CRATES
_truck1 = opfor_TRANS_TRUCK_X createVehicle (_vehpos);

_box1 = "";
_box2 = "";
_static1 = "";
_static2 = "";
switch (VERSION_X) do {
	case "MODERN": {
		_box1 = "O_supplyCrate_F" createVehicle (_missionpos);
		_box2 = "O_supplyCrate_F" createVehicle (_missionpos);
		_box1 attachTo [_truck1,[0,-0.5,0]];
		_box1 setDir 90;
		_box2 attachTo [_truck1,[0,-2.2,0]];
		_box2 setDir 75;
		_static1 = "CargoNet_01_barrels_F";
		_static2 = "CamoNet_INDP_open_F";
	};
	case "WW2": {
		_box1 = "LIB_AmmoCrates_NoInteractive_Large" createVehicle (_missionpos);
		_box2 attachTo [_truck1,[0.25,-1.7,-0.3]];
		_box2 setDir 0;
		_static1 = "Land_CratesWooden_F";
		_static2 = "CamoNet_INDP_open_F";
	};
	case "VIETNAM": {
		_box1 = "O_supplyCrate_F" createVehicle (_missionpos);
		_box2 = "O_supplyCrate_F" createVehicle (_missionpos);
		_box1 attachTo [_truck1,[0,-0.5,0]];
		_box1 setDir 90;
		_box2 attachTo [_truck1,[0,-2.2,0]];
		_box2 setDir 75;
		_static1 = "CargoNet_01_barrels_F";
		_static2 = "CamoNet_INDP_open_F";
	};
};

_obj1 = createVehicle [_static1, [(_vehpos select 0)-12, (_vehpos select 1)-10], [], 0, "CAN_COLLIDE"];
sleep 1;
_obj2 = createVehicle [_static1, [(_vehpos select 0)-10, (_vehpos select 1)-10], [], 0, "CAN_COLLIDE"];
sleep 1;
_obj3 = createVehicle [_static1, [(_vehpos select 0)-8, (_vehpos select 1)-10], [], 0, "CAN_COLLIDE"];
sleep 1;
_obj4 = createVehicle [_static2, [(_vehpos select 0)-10, (_vehpos select 1)-10], [], 0, "CAN_COLLIDE"];
sleep 1;

// Vehicle guards
_group = [_vehpos, EAST, [opfor_SL_SOLDIER_X, opfor_LAT_SOLDIER_X, opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup; 
_group deleteGroupWhenEmpty true;
// CREATE PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_p7qawzl4", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// MISSION COMPLETE ?
waitUntil {sleep 2; ((getdammage _truck1)>0.95 || (_truck1 distance PosOfBLUHQ)<50) || Mission_Cancelled};  

if (Mission_Cancelled) exitWith {};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

if (getdammage _truck1>0.95) exitWith {

	[{hint localize "STR_DUWS_X_jsg7ys0w"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
	[_VARtaskgeneratedName, "FAILED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

	// Spawn the "next mission" wait
	[] spawn fnc_missionTimer;
	// Spawn the cleanup
	[_targetpos,_radius] spawn fnc_mission_cleanup;

};

[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

// IF THE MISSION IS COMPLETE
[{hint localize "STR_DUWS_X_po7fmmoa"}] remoteExec ["BIS_fnc_Spawn",player1];
 
sleep 2;
deleteVehicle _box2;
sleep 2;
deleteVehicle _box1;
[{hint localize "STR_DUWS_X_3jmpthvi"}] remoteExec ["BIS_fnc_Spawn",player1];

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;

