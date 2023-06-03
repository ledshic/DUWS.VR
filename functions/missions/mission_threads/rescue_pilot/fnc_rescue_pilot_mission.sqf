
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND PILOT. spawn markers at randompos.
_radius = 300;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "pilot";
_markerText2 = localize "STR_DUWS_X_rudc9s55";

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

// CREATE PATROLS
// FIND A RANDOM LOCATION AWAY FROM HELI
_spawnPos = _targetpos;
_vec =[random [-1,0,1], random [-1,0,1], 0];
_dist = 75;
_spawnPos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _spawnPos;

sleep 1;
[_spawnPos, _radius] spawn fnc_missionPatrols;

// CREATE WRECK
_choppa = "";
switch (VERSION_X) do {
	case "MODERN": {
		_choppa = "Land_Wreck_Heli_Attack_01_F" createVehicle (_vehPos);
	};
	case "WW2": {
		_choppa = opfor_STATIC_CRASH createVehicle (_vehPos);
	};
	case "VIETNAM": {
		_choppa = blufor_STATIC_CRASH createVehicle (_vehPos);
	};
};

// CREATE PILOT
_group = createGroup west; 
_pilot = _group createUnit [blufor_HELI_PILOT_X, [_vehPos select 0, (_vehPos select 1)+2], [], 0, "FORM"];
_group deleteGroupWhenEmpty true;
_pilot setcaptive true; 
_pilot switchMove "acts_CrouchingIdleRifle01";

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_njsu8ofz", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// CREATE TRIGGER ZONE
pilot_west_close = false;
_trg=createTrigger["EmptyDetector",_choppa];
_trg setTriggerArea[100,100,0,false];
_trg setTriggerActivation["WEST","PRESENT",false];
_trg setTriggerStatements["this","pilot_west_close = true;", ""];
_trg setTriggerTimeout [10, 10, 10, true ];  

// PLAYER IS WITH THE PILOT --
waitUntil {sleep 1; pilot_west_close || !(alive _pilot) || Mission_Cancelled};

if (Mission_Cancelled) exitWith {};

// CHECK IF PILOT ALIVE
if (!(alive _pilot)) exitWith {
    deleteMarker str(_markername2);
    deleteMarker str(_markername);

	[{hint localize "STR_DUWS_X_q3iy1vcz"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

	[_VARtaskgeneratedName, "FAILED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];
	
	[] spawn fnc_missionTimer;

	[_targetpos,_radius] spawn fnc_mission_cleanup;	
};

_trigger = player1;
if (isMultiplayer) then {
	_nearestUnits = [];
	_nearestUnits = nearestObjects [_pilot,["Man"],150];
	{
		if (_x in _nearestUnits) then {_trigger = _x}; 
	} forEach call BIS_fnc_ListPlayers;   
};

[_pilot] joinSilent (group _trigger);
sleep 5;
_pilot setcaptive false;
_pilot switchMove "AidlPknlMstpSrasWrflDnon_AI";
[_pilot, localize "STR_DUWS_X_nstzbh49"] remoteExec ["globalChat", [0,-2] select isDedicated,false];
playMusic (selectRandom ShortRadioChatter);

sleep 55;

if (alive _pilot) then {
	[_pilot, localize "STR_DUWS_X_j6plvgar"] remoteExec ["globalChat", [0,-2] select isDedicated,false];
};

// PLAYER IS AT BASE WITH PILOT OR PILOT DEAD --
waitUntil {sleep 1; (_pilot distance PosOfBLUHQ)<50 OR !(alive _pilot)};

// CHECK IF PILOT ALIVE
if (!(alive _pilot)) exitWith {
    deleteMarker str(_markername2);
    deleteMarker str(_markername);

	[{hint localize "STR_DUWS_X_q3iy1vcz"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

	[_VARtaskgeneratedName, "FAILED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

	[] spawn fnc_missionTimer;

	[_targetpos,_radius] spawn fnc_mission_cleanup;
};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

sleep 1;

[_pilot, localize "STR_DUWS_X_0zdd9g8a"] remoteExec ["globalChat", [0,-2] select isDedicated,false];
deleteVehicle _pilot;

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;

// If HARDCORE, Rescue = chance of zone Intel
if (hardcore_mode_enable && (random 10) < (master_Intel_chance + master_Intel_boost)) then {[] spawn fnc_found_intel};

