
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND TARGET. spawn markers at random.
_radius = 200;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "sniper";
_markerText2 = localize "STR_DUWS_X_tq053mvh";

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
	[{hint"No suitable location found.  Please try again."}] remoteExec ["BIS_fnc_Spawn", player1];
};

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn",  player1];

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

// CREATE PATROLS, NO VEHICLES
sleep 1;
[_missionpos, 15, false] spawn fnc_createoppatrol2; // <-- around target
sleep 1;
[_randompos, _radius, false] spawn fnc_createoppatrol2;
sleep 1;
[_randompos, _radius, false] spawn fnc_createopteam2;
sleep 1;
[_randompos, _radius, false] spawn fnc_createopteam2;

_group = [_targetpos, EAST, [opfor_SL_SOLDIER_X, opfor_SNIPER_SOLDIER_X, opfor_SNIPER_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup; 
_group deleteGroupWhenEmpty true;
_target1 = units _group select 1;
_target2 = units _group select 2;

// Put an intel action on leader
if (hardcore_mode_enable && (random 10) < (master_Intel_chance + master_Intel_boost)) then {
	_leader = units _group select 0;
	_code = {[] spawn fnc_found_intel};
	[_leader, "Search for Intel", "search", _code] spawn fnc_actionRotary;
};

// No hat for WW2/Vietnam or Modern OPTRE, HL2 or TIOW 
if (VERSION_X == "MODERN" || VERSION_X == "VIETNAM") then {
	if !(("OPTRE" in BLUFOR_FactionFile_X) 
		or ("HL2ECR" in BLUFOR_FactionFile_X)
		or ("TIOW" in BLUFOR_FactionFile_X)) then {
		removeheadgear _target1;
		removeheadgear _target2;
		_target1 addHeadgear "H_Shemag_khk";
		_target2 addHeadgear "H_Shemag_khk";
	};
};

[_group, _targetpos, _radius] call bis_fnc_taskPatrol;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["sniperhunt%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_16dh939j", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

waitUntil {sleep 2; (!alive _target1 && !alive _target2) || Mission_Cancelled};  // MISSION COMPLETED --

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

