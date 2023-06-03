
params ["_missionpos", "_radius", "_Posfound", "_targetpos", "_failSafe"];

while {!_Posfound} do {

	_failSafe = _failSafe + 1;
	// define random pos near MissionPos. Spawn marker at randomPos.
	_randomPos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];
	_Building = "";
	_nearBuildings = [];
	_nearBuildings = nearestTerrainObjects [_randomPos, ["House","BUILDING"], 200, true];
	if (count(_nearBuildings) == 0) then {
		//_Building = nearestBuilding _randomPos;
		_Building = _randomPos;
		[{hint localize "STR_DUWS_X_pj31ugj0"}] remoteExec ["BIS_fnc_Spawn", player1];
		sleep 5;
	} else {
		_bindex = (count _nearBuildings) - 1;
		_Building = _nearBuildings select (floor (random _bindex));
	};

	_targetpos = [_Building, 10, 50,15,0,0.15,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;

	// DON'T SPAWN ON ROADS
	_nearRoad = [_targetpos,15] call BIS_fnc_nearestRoad;
	if (_targetpos select 0 != 0 && 
		_targetpos select 1 != 0 &&
		isNull _nearRoad) then {_Posfound=true;};

	if (_failsafe > 100) exitWith {};
};

_returnArray = [_randomPos, _Building, _Posfound, _targetpos, _failSafe];
_returnArray;


