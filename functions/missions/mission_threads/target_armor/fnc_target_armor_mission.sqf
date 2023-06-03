
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND TARGET. spawn markers at randompos.
_radius = 200;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "tank";
_markerText2 = localize "STR_DUWS_X_1cc4kj4s";

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

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn", player1];

_vehpos = [_targetpos, 10, 30,10,0,0.15,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

// CREATE PATROLS
[_targetpos, _radius] spawn fnc_missionPatrols;
// Damaged Tank
_vehicle_1 = opfor_MBT_TANK1_X createVehicle (_vehpos);
_vehicle_1 setDamage 0.65;

_obj1 = createVehicle ["CamoNet_OPFOR_open_F", _targetpos, [], 0, "CAN_COLLIDE"];
_obj2 = createVehicle ["Land_WoodenTable_large_F", [(_targetpos select 0)+1, (_targetpos select 1)+1], [], 0, "CAN_COLLIDE"];

// Commander group
_group = [_targetpos, EAST, [opfor_OFFICER_X, opfor_CREW_X, opfor_OPERATOR_X, opfor_ENG_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup; 
_group deleteGroupWhenEmpty true;
_target = units _group select 0;

// No hat for OPTRE, HL2 or TIOW 
if !(("OPTRE" in BLUFOR_FactionFile_X) 
	or ("HL2ECR" in BLUFOR_FactionFile_X)
	or ("TIOW" in BLUFOR_FactionFile_X)) then {
	removeheadgear _target;
	_target addHeadgear "H_HelmetCrew_I";
};

// Put an intel action on target
if (hardcore_mode_enable && (random 10) < (master_Intel_chance + master_Intel_boost)) then {
	_code = {[] spawn fnc_found_intel};
	[_target, "Search for Intel", "search", _code] spawn fnc_actionRotary;
};

_wp = _group addWaypoint [_vehpos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointTimeout [30, 45, 60]; 

_wp = _group addWaypoint [_targetpos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointTimeout [30, 45, 60]; 

_wp2 = _group addWaypoint [[(_targetpos select 0)+10, (_targetpos select 1)+10], 0];
_wp2 setWaypointType "CYCLE";
_wp2 setWaypointBehaviour "SAFE";
_wp2 setWaypointTimeout [30, 45, 60]; 

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["targetarmor%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_y7z1cx6j", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// MISSION COMPLETED ?
waitUntil {sleep 2; !alive _target || Mission_Cancelled};  

if (Mission_Cancelled) exitWith {};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

//[[_VARtaskgeneratedName, "SUCCEEDED"], "BIS_fnc_taskSetState", true, true] call BIS_fnc_MP;
[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

sleep 1;

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;
