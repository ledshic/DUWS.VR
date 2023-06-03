
// CLEANUP

params ["_targetpos","_radius"];

sleep 1200;

_close = false;

{
	if ((_targetpos distance _x) < (zones_max_radius * 1.2)) exitWith {close = true};
} forEach WARCOM_zones_controled_by_OPFOR;

if (_close == false) then {
	_missObj = _targetpos nearObjects (_radius * 1.2);
	{
		if (side _x != WEST) then {deleteVehicle _x};
	} foreach _missObj;
};
