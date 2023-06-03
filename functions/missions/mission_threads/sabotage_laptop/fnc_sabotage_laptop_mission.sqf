
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND INTEL
_radius = 200;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "sabot";
_markerText2 = "";
switch (VERSION_X) do {
	case "MODERN": {
		_markerText2 = localize "STR_DUWS_X_0rh5ayby";
	};
	case "WW2": {
		_markerText2 = localize "STR_DUWS_X_nc4v4zma";
	};
	case "VIETNAM": {
		_markerText2 = localize "STR_DUWS_X_nc4v4zma";
	};
};

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

_tableLoc = _targetpos;

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

// create LAPTOP
_laptop = "";
switch (VERSION_X) do {
	case "MODERN": {
		_table = createVehicle ["Land_WoodenTable_large_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_table setDir 0;
		sleep 1;
		_pallet = createVehicle ["VirtualReammoBox_camonet_F", [(_tableLoc select 0)+3, (_tableLoc select 1)+3], [], 0, "CAN_COLLIDE"];
		sleep 1;
		_laptop = createVehicle ["Land_Laptop_unfolded_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_laptop setpos [(_tableLoc select 0),(_tableLoc select 1),1.0];
		_laptop setDir 270;
		sleep 1;
		_camonet = createVehicle ["CamoNet_INDP_open_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_camonet setDir 0;
		sleep 1;
	};
	case "WW2": {
		_table = createVehicle ["Land_WoodenTable_large_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_table setDir 0;
		sleep 1;
		_pallet = createVehicle ["LIB_AmmoCrates_NoInteractive_Large", [(_tableLoc select 0)+3, (_tableLoc select 1)+3], [], 0, "CAN_COLLIDE"];
		sleep 1;
		_laptop = createVehicle ["LIB_SovRadio", _tableLoc, [], 0, "CAN_COLLIDE"];
		_laptop setpos [(_tableLoc select 0),(_tableLoc select 1),0.85];
		_laptop setDir 270;
		sleep 1;
		_camonet = createVehicle ["CamoNet_INDP_open_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_camonet setDir 0;
		sleep 1;
	};
	case "VIETNAM": {
		_table = createVehicle ["Land_WoodenTable_large_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_table setDir 0;
		sleep 1;
		_pallet = createVehicle ["VirtualReammoBox_camonet_F", [(_tableLoc select 0)+3, (_tableLoc select 1)+3], [], 0, "CAN_COLLIDE"];
		sleep 1;
		_laptop = createVehicle ["wx_radio", _tableLoc, [], 0, "CAN_COLLIDE"];
		_laptop setpos [(_tableLoc select 0),(_tableLoc select 1),1.0];
		_laptop setDir 270;
		sleep 1;
		_camonet = createVehicle ["CamoNet_INDP_open_F", _tableLoc, [], 0, "CAN_COLLIDE"];
		_camonet setDir 0;
		sleep 1;
	};
};

// CREATE OPFOR PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["sabotage%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

switch (VERSION_X) do {
	case "MODERN": {
		[west, [_VARtaskgeneratedName], 
		[localize "STR_DUWS_X_j97ecrsh", _mission_name, "aoMarker"], objNull, true] call BIS_fnc_taskCreate; 
	};
	case "WW2": {
		[west, [_VARtaskgeneratedName],
		[localize "STR_DUWS_X_euhsfj7z", _mission_name, "aoMarker"], objNull, true] call BIS_fnc_taskCreate; 
	};
	case "VIETNAM": {
		[west, [_VARtaskgeneratedName], 
		[localize "STR_DUWS_X_euhsfj7z", _mission_name, "aoMarker"], objNull, true] call BIS_fnc_taskCreate; 
	};
};
// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// ADD SABOTAGE ACTION TO LAPTOP
[_laptop,[localize "STR_DUWS_X_p3200mf5", fnc_sabotage_laptop_success, [_MissionPos,_targetpos,_mission_name,_markername,_markername2,_radius], 0, true, true, "", "_this == player"]] remoteExec ["addAction", [0,-2] select isDedicated,true];

// Put an intel action on LAPTOP
if (hardcore_mode_enable && (random 10) < (master_Intel_chance + master_Intel_boost)) then {
	_code = {[] spawn fnc_found_intel};
	[_laptop, localize "STR_DUWS_X_7yec9ifj", "search", _code] spawn fnc_actionRotary;
};
