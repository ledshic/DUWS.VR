

params ["_fob","_fob_pos","_fob_name"];

_markername = format["fob%1%2",round (_fob_pos select 0),round (_fob_pos select 1)]; // Define marker name
deleteMarker _markername;
FOB_removed = true;

//_fob_pos call BIS_fnc_removeRespawnPosition;

["info",[format[localize "STR_DUWS_X_mrmg6qui",_fob_name],localize "STR_DUWS_X_f28nbzbw"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];

// Delete the FOB triggers
// CREATE VARNAME FOR FOB TRIGGERs --> use the pos of the trigger
private "_trg";
call compile format["_trg = trigfob%1%2",round (_fob_pos select 0),round (_fob_pos select 1)];
deleteVehicle _trg;
private "_trg2";
call compile format["_trg2 = trigfob2%1%2",round (_fob_pos select 0),round (_fob_pos select 1)];
deleteVehicle _trg2;

// Remove FOB from Array_of_FOBS
{
	if (str (getPos _x) == str (_fob_pos)) then {
		Array_of_FOBS deleteAt _forEachIndex;
		publicVariable "Array_of_FOBS";
	};
} forEach Array_of_FOBS;
{
	if (_x == _fob_name) then {
		Array_of_FOBname deleteAt _forEachIndex;
		publicVariable "Array_of_FOBname";
	};
} forEach Array_of_FOBname;

// CLEANUP OBJECTS AFTER 5 min
[_fob_pos, _fob_name] spawn {  
	_zonePos = _this select 0;
	_fob_name = _this select 1;
	_radius = 15;
	sleep 300;  // 5 min
	_zoneObj = nearestObjects [_zonePos, [], _radius];
	{deleteVehicle _x;}foreach _zoneObj;
	
	// Make a Task Force with the leftover units
	_nearestUnits = nearestObjects [_zonePos,["Man"],200];
	_group = createGroup west;
	{
		if ((side _x) == WEST) then {[_x] joinSilent _group};
	} forEach _nearestUnits;
	if (count (units _group) > 0) then {
		_group deleteGroupWhenEmpty true;
		_TFname = format["FOB_%1", _fob_name];
		[_group] spawn fnc_WARCOM_wp_blu_assault;
		[_group,_TFname] spawn fnc_WARCOM_gps_marker;
		waitUntil {sleep 5;(count WARCOM_zones_controled_by_OPFOR) > 0};
	};
};



