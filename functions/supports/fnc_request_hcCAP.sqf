
_index = lbCurSel 2103;

_cost = _this select 0;
CAPInUse = true;

_spawnPos = getmarkerpos str blu_hq_markername;
_spawnPos = [(_spawnPos select 0)+500, _spawnPos select 1, (_spawnPos select 2)+500];

_grouptype = [blufor_PLANE_FIGHTER_X];

if (commandpointsblu1 < _cost) exitWith
{
	["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
	sleep 15;
	_hcCAP = [player,"hc_CAP"] call BIS_fnc_addCommMenuItem;
	hcCAS = _hcCAP;
	CAPInUse = false;
};

_group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
player hcsetgroup [_group,""];
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";
ctrlSetText [1000, format["%1",commandpointsblu1]];
DUWS_number_CAS = DUWS_number_CAS + 1;
_group setGroupId [format[localize "STR_DUWS_X_8mtxjfj3",DUWS_number_CAS]];
hint localize "STR_DUWS_X_gu6cbc5f";
			 
sleep 600;
_hcCAP = [player,"hc_CAP"] call BIS_fnc_addCommMenuItem;
hcCAS = _hcCAP;
CAPInUse = false;
    



