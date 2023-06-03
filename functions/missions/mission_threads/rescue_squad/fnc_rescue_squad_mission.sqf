
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

_markerText = "resc";
_markerText2 = localize "STR_DUWS_X_g8dfn556";
_radius = 300;
_positions_needed = 5;

// define random pos AROUND SOLDIERS. spawn markers at randompos.
//_randompos = [(_missionpos select 0)+(random _radius)-(random _radius), (_missionpos select 1)+(random _radius)-(random _radius)];

// find some buildings for squad to hide
_usableBuildings = [];
_usableBuildings = [_MissionPos,_positions_needed,_radius] call fnc_usableBuildings;

if (count _usableBuildings < 2) exitWith {
	Mission_available = true; 
	publicVariable "Mission_available"; 
	[{hint localize "STR_DUWS_X_crtzxs0j"}] remoteExec ["BIS_fnc_Spawn", player1];
};

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn",  player1];

_Building = _usableBuildings select (floor (random (count _usableBuildings)));
_BuildingPos = getPos _Building;
_targetpos = _BuildingPos;

_markerData = [_MissionPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

// Create soldiers  -- BEGIN
_soldier1 = format ["s1%1%2",round(_MissionPos select 0),round(_Missionpos select 1)];    // Give them names
_soldier2 = format ["s2%1%2",round(_MissionPos select 0),round(_Missionpos select 1)];    
_soldier3 = format ["s3%1%2",round(_MissionPos select 0),round(_Missionpos select 1)];    

_group = createGroup west;

blufor_SOLDIER_TL_X createUnit [[(_BuildingPos select 0),(_BuildingPos select 1)+30], _group,format["this setcaptive true; %1 = this",_soldier1],blufor_ai_skill_random];
blufor_SOLDIER_LAT_X createUnit [[(_BuildingPos select 0),(_BuildingPos select 1)+31], _group,format["this setcaptive true; %1 = this",_soldier2],blufor_ai_skill_random];
blufor_SOLDIER_AR_X createUnit [[(_BuildingPos select 0),(_BuildingPos select 1)+32], _group,format["this setcaptive true; %1 = this",_soldier3],blufor_ai_skill_random];

sleep 5;
_randPos = selectRandom [3,4,5];
_safePos = _Building buildingPos _randPos;
//hint str _safePos;
_rand = random 1;
{
	_x setPosATL [_safePos select 0,(_safePos select 1)+_rand,_safePos select 2];
	_x switchMove "acts_CrouchingIdleRifle01";
	_rand = random 1;
} forEach units _group;

// END CREATE SOLDIERS

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["rescue%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
[localize "STR_DUWS_X_kievbwmd", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// CREATE TRIGGER ZONES
_trg=createTrigger["EmptyDetector",_Building];
//_trg setTriggerArea[25,25,0,false];
_trg setTriggerArea[100,100,0,false];
_trg setTriggerActivation["WEST","PRESENT",false];
_trg setTriggerStatements["this",format["[""%1"",""%2"",%3,%4,%5,%6,%7,%8,""%9""] spawn fnc_rescue_squad_success",_markername,_markername2,_soldier1,_soldier2,_soldier3,_MissionPos,_targetPos,_radius,_mission_name], ""];
_trg setTriggerTimeout [10, 10, 10, true ];  

sleep 30;

// CREATE OPFOR PATROLS
[_MissionPos, _radius] spawn fnc_missionPatrols;

