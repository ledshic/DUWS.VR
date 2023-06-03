

_name =			_this select 0;
_zonePos =		_this select 1;
_markername =	_this select 2;
_markername2 =	_this select 3;
_trigger =		_this select 4;
_firstBlu =		_trigger select 0;

diag_log format ["Enter Zone: %1  POS: %2  markers: %3  %4", _name, _zonePos, _markername, _markername2];

sleep 0.5;

// Check if trigger (player) is in aircraft
if ((getpos vehicle _firstBlu) select 2 > 2) exitWith{};

["location_enter",[_name,""]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];

// If HARDCORE and Zone entered, make Zone visible
if (hardcore_mode_enable && "Zone" in _name) then {
	["ONE",_zonePos] spawn fnc_zone_reveal;
};

waitUntil {
	sleep 5;
    count _trigger < 1;
}; 

["location_leave",[_name,""]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];

