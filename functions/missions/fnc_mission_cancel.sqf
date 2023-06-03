
// MISSION CANCELLED
waitUntil {sleep 2; Mission_Cancelled || Kill_MissionCancel};  

if (Kill_MissionCancel) exitWith{};

params ["_markername", "_markername2", "_VARtaskgeneratedName", "_mission_name", "_targetpos"];

hint localize "STR_DUWS_X_peyn06te";

Mission_available = true;
publicVariable "Mission_available";

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

[_VARtaskgeneratedName, "CANCELED"] remoteExec ['BIS_fnc_taskSetState',[0,-2] select isDedicated,true];
sleep 10;
["info",[format[localize "STR_DUWS_X_525m2813",_mission_name],localize "STR_DUWS_X_ekfz3xca"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
sleep 300;

_close = false;
{
	if ((_targetpos distance _x) < (zones_max_radius * 1.2)) then {
		_missObj = _targetpos nearObjects 50;
		{deleteVehicle _x;}foreach _missObj;
		_close = true;
	};
	if (_close == true) exitWith {};
} forEach WARCOM_zones_controled_by_OPFOR;

if (_close == false) then {
	_missObj = _targetpos nearObjects 500;
	{deleteVehicle _x;}foreach _missObj;
};
