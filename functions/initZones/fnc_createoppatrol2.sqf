// usage: [position, radius] spawn fnc_createoppatrol2
// radius: 50 for patrol inside and around base, 500 for medium, 1300 for island

_patrolCenter = _this select 0;
_radius   = _this select 1;

_position = [_patrolCenter,50,_radius,5,0,0.5,0,[],[]] call BIS_fnc_findSafePos;

// hint format["%1",_position];

_initGroup = [opfor_SOLDIER_X,opfor_SOLDIER_X];
_multipliedGroup = [];
if (enemyunitMultiplier < 0) then {enemyunitMultiplier = 1};
for "_i" from 0 to (enemyunitMultiplier - 1) step 1 do
{
	_multipliedGroup = _multipliedGroup + _initGroup;
};
_group = [_position, EAST, _multipliedGroup,[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
_patrolRadius = round(_radius/1.25);

_group setCombatMode "YELLOW";

{
    if (_x == 3) then {   // 3rd waypoint should be a random building in patrol radius
		_currentpos = getpos leader _group;
		_randompos = [(_currentpos select 0)+(random _patrolradius)-(random _patrolradius), (_currentpos select 1)+(random _patrolradius)-(random _patrolradius)];
		_Building = nearestBuilding _randompos;
		_posBuilding = getpos _Building;
		_wp = _group addWaypoint [_posBuilding, 0];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointTimeout [300, 450, 600]; 
	} else {
		_wp = _group addWaypoint [_patrolCenter, _patrolRadius];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointCompletionRadius 100;
		_wp setWaypointTimeout [60, 120, 180]; 
	};
} forEach [1, 2, 3];

	_wp1 = _group addWaypoint [_patrolCenter, 30];
	_wp1 setWaypointType "CYCLE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "LIMITED";

	