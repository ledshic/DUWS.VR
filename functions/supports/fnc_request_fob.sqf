_position = _this select 0;
_size = _this select 1;
_cost  = _this select 2;
_id = clientOwner;

if (commandpointsblu1 < _cost) exitWith {
  ["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
  sleep 15;
  _art = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
};

// Make sure not too many FOBs
_tooMany = false;
if (count Array_of_FOBS >= ceil(amount_zones_created/2)) then {
	["info",[localize "STR_DUWS_X_m7h89a4s",format[localize "STR_DUWS_X_6vjxo4eb",ceil(amount_zones_created/2)]]] call bis_fnc_showNotification;
	sleep 15;
	_art = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
	_tooMany = true;
};

if (_tooMany) exitWith {};

// CHECK FOR GOOD LOCATION
Hint localize "STR_DUWS_X_cp9cw550";
[localize "STR_DUWS_X_cp9cw550"] spawn fnc_sideChat_filter;

_trg=createTrigger["EmptyDetector",_position];
_trg setTriggerArea[_size,_size,0,false];
_trg setTriggerActivation["EAST","PRESENT",true];
_trg setTriggerStatements["this", "", ""];
sleep 10;
_amountOPFOR = count list _trg;

deleteVehicle _trg;

if (_amountOPFOR > 0) exitWith {
	Hint localize "STR_DUWS_X_8zn96920";
	[localize "STR_DUWS_X_8zn96920"] spawn fnc_sideChat_filter;
	sleep 15;
	_art = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
};

// try to find a pos, if no pos is found exit the script
_direction = direction player;
_newpos = [_position, 20, _direction] call BIS_fnc_relPos;
//_foundPickupPos = [_newpos, 0,40,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos
//_foundPickupPos = [_newpos, 0,10,0,0,0.25,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos
//if ((0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) || ((count nearestObjects [_foundPickupPos, [], 10]) > 0))
//	exitWith {hint localize "STR_DUWS_X_lqsyni7b"; sleep 5; _art = [player,"fob_support"] call BIS_fnc_addCommMenuItem;};
_foundPickupPos = _newpos;
// FOUND GOOD LOCATION
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";
[localize "STR_DUWS_X_1k60dqrv"] spawn fnc_sideChat_filter;

// SPAWN FOB ON SERVER
[_foundPickupPos, _size, (vehicleVarname player), _id] remoteExec ["fnc_fob_server", 2];

sleep 600;
_null = [player,"fob_support"] call BIS_fnc_addCommMenuItem;


