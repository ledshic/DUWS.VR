
params ["_markername","_markername2","_sol1","_sol2","_sol3","_MissionPos","_targetPos","_radius","_mission_name"];

_trigger = player1;
if (isMultiplayer) then {

	_nearestUnits = [];
	if (alive _sol1) then {
		_nearestUnits = nearestObjects [_sol1,["Man"],150];
	} else {
		if (alive _sol2) then {
			_nearestUnits = nearestObjects [_sol2,["Man"],150];
		} else {
			if (alive _sol3) then {
				_nearestUnits = nearestObjects [_sol3,["Man"],150];
			};
		};
	};

	diag_log format ["Nearest Units: %1", _nearestUnits];

	{
		if (_x in _nearestUnits) then {_trigger = _x}; 
	} forEach call BIS_fnc_ListPlayers;   

};

_sol1 setcaptive false;
_sol2 setcaptive false;
_sol3 setcaptive false;
//_sol1 switchMove "AmovPpneMstpSnonWnonDnon";
//_sol2 switchMove "AmovPpneMstpSnonWnonDnon";
//_sol3 switchMove "AmovPpneMstpSnonWnonDnon";
_sol1 switchMove "";
_sol2 switchMove "";
_sol3 switchMove "";

_cpreward = 20;
_apreward = 20;

sleep 60;

private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate taskname/variable name

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

// IF SOLDIERS DEAD
if (!(alive _sol1) && !(alive _sol2) && !(alive _sol3)) exitWith {

	[{hint localize "STR_DUWS_X_1sp94d75"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

	[_VARtaskgeneratedName, "FAILED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

	[] spawn fnc_missionTimer;

	[_targetPos,_radius] spawn fnc_mission_cleanup;
};

[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

// Define globalChat source
_solRadio = "";
if (alive _sol1) then {
	_solRadio = _sol1;
} else {
	if (alive _sol2) then {
		_solRadio = _sol2;
	} else {
		if (alive _sol3) then {
			_solRadio = _sol3;
		};
	};
};

// JOIN PLAYER
if (alive _sol1) then {
	[_sol1] joinSilent (group _trigger);
};
if (alive _sol2) then {
	[_sol2] joinSilent (group _trigger);
};
if (alive _sol3) then {
	[_sol3] joinSilent (group _trigger);
};

[_solRadio, localize "STR_DUWS_X_lyjjiteq"] remoteExec ["globalChat", [0,-2] select isDedicated,false];

[{hint localize "STR_DUWS_X_q9yne5ax"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
sleep 5;

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;

// If HARDCORE, Rescue = chance of zone Intel
if (hardcore_mode_enable && (random 10) < (master_Intel_chance + master_Intel_boost)) then {[] spawn fnc_found_intel};

