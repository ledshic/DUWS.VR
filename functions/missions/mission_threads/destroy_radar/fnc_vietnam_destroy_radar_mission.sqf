
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND RADAR. 
_radius = 400;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "radar";
_markerText2 = localize "STR_DUWS_X_r8fz5xuh";

_POSdata = [_MissionPos, _radius, _Posfound, _targetpos, _failSafe] call fnc_missionTargetPos;

_randomPos = _POSdata select 0;
_Building = _POSdata select 1;
_Posfound = _POSdata select 2;
_targetpos = _POSdata select 3;
_failSafe = _POSdata select 4;

if (_failsafe > 10 && _Posfound == false) exitWith {
	Mission_available = true; 
	publicVariable "Mission_available"; 
	[{hint localize "STR_DUWS_X_crtzxs0j"}] remoteExec ["BIS_fnc_Spawn", player1];
};

[_markerText2,{hint _this}] remoteExec ["BIS_fnc_Spawn",  player1];

_radarPos = _targetpos;

//Create the marker	
_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

_centerSpawn = _radarPos;
_centerSpawnX = _centerSpawn select 0;
_centerSpawnY = _centerSpawn select 1;

_vehicle_0 = objNull;
_this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_vehicle_0 = _this;
_this setPos _centerSpawn;
_centerSpawnZ = (getpos _vehicle_0 select 2);
deleteVehicle _vehicle_0;


_staticsArray = [
	["wx_table04",[-2.80786,1.46118,0],270.452,1,0,[],"","",true,false], 
	["mapboard",[-2.29395,3.77686,0],90.5037,1,0,[],"","",true,false], 
	["uns_AmmoBoxNVA",[5.8833,0.450562,0],91.6118,1,0,[],"","",true,false], 
	["wx_table03",[-6.17603,1.30103,0],270.284,1,0,[],"","",true,false], 
	["uns_villtable1",[-2.67554,5.68323,0],336.425,1,0,[],"","",true,false], 
	["wx_sandbag03_end",[-2.78892,-6.32053,0],219.714,1,0,[],"","",true,false], 
	["wx_sandbag03_end",[2.7147,-6.61094,0],323.274,1,0,[],"","",true,false], 
	["wx_sandbag05",[0.00366211,-7.69873,0],1.37933,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter2",[7.58862,-3.88416,-0.385227],181.336,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter2",[-7.60107,-3.47437,-0.62641],0.31411,1,0,[],"","",true,false], 
	["uns_HiddenAmmoBox_small2",[-6.19751,5.7522,0],268.762,1,0,[],"","",true,false], 
	["uns_trap_box_VC",[-6.21631,6.62549,0],0,1,0,[],"","",true,false], 
	["uns_nvatruck",[0.904785,10.5399,0],91.4067,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-10.9907,-0.160278,0],353.317,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[11.229,0.515747,0],192.012,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-11.1255,5.0686,0],9.25694,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[11.3455,5.74512,0],176.071,1,0,[],"","",true,false],
	["Land_wx_fielddefence_04",[-2.13013,16.8885,0],86.4919,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[2.57764,16.9786,0],96.425,1,0,[],"","",true,false],	
	["pook_Land_fort_rampart_MUD",[-12.86426,2.82141,0],87.5168,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[13.08081,2.96509,0],270.272,1,0,[],"","",true,false],
	["pook_Land_fort_rampart_MUD",[0.514648,20.218,0],181.665,1,0,[],"","",true,false]	
];

// PLACE STATICS WITHOUT INTERACTION
_vehicle = objNull;
{
	_xyz = (_x select 1);
	_posX = (_xyz select 0);
	_posY = (_xyz select 1);
	_posZ = (_xyz select 2);
	_vehicle = createVehicle [(_x select 0), [0,0,0], [], 0, "CAN_COLLIDE"];
	_vehicle setDir (_x select 2);
	_vehicle setPosATL [(_centerSpawnX)+_posX,(_centerSpawnY)+_posY,0];
} forEach _staticsArray;

// PLACE STATICS WITH INTERACTION

_vehicle_31 = objNull;
if (true) then
{
  _this = createVehicle ["uns_SON9_NVA", [(_centerSpawnX)+0.658447, (_centerSpawnY)+4.37964], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 270.123;
};
_vehicle_31 allowdamage false;
_vehicle_31 setdamage 0;

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-4.71143, (_centerSpawnY)+5.53076], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 178.406;
};
_vehicle_32 allowdamage false;
_vehicle_32 setdamage 0;

_vehicle_33 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)+3.74658, (_centerSpawnY)+0.55896], [], 0, "CAN_COLLIDE"];
  _vehicle_33 = _this;
  _this setDir 1.1609;
};
_vehicle_33 allowdamage false;
_vehicle_33 setdamage 0;

_vehicle_34 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-4.71143, (_centerSpawnY)-0.55896], [], 0, "CAN_COLLIDE"];
  _vehicle_34 = _this;
  _this setDir 178.406;
};
_vehicle_34 allowdamage false;
_vehicle_34 setdamage 0;

_vehicle_35 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)+3.88379, (_centerSpawnY)+5.53076], [], 0, "CAN_COLLIDE"];
  _vehicle_35 = _this;
  _this setDir 1.1609;
};
_vehicle_35 allowdamage false;
_vehicle_35 setdamage 0;

_vehicle_36 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)-6.86523, (_centerSpawnY)+14.9672], [], 0, "CAN_COLLIDE"];
  _vehicle_36 = _this;
  _this setDir 327.971;
};

_vehicle_37 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)+7.50684, (_centerSpawnY)+15.1234], [], 0, "CAN_COLLIDE"];
  _vehicle_37 = _this;
  _this setDir 28.85;
};

_vehicle_38 = objNull;
if (true) then
{
  _this = createVehicle ["uns_ZU23_NVA", [(_centerSpawnX)+0.0795898, (_centerSpawnY)-5.0627], [], 0, "CAN_COLLIDE"];
  _vehicle_38 = _this;
  _this setDir 137.447;
};

_vehicle_39 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sniper_tree2_t5_empty", [(_centerSpawnX)-70, (_centerSpawnY)+1], [], 0, "CAN_COLLIDE"];
  _vehicle_39 = _this;
  _this setDir 0;
};

//sniper trees
_groupTower = [getpos _vehicle_39, EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_towerGuard setPos [(getposATL _vehicle_39 select 0)-1.5,(getposATL _vehicle_39 select 1)+0.5,+12];
_towerGuard setUnitPos "DOWN";
_groupTower setBehaviour "AWARE";



_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard1 moveinGunner _vehicle_36;
_guard2 moveinGunner _vehicle_37;
_guard3 moveinGunner _vehicle_38;


// CREATE PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["cache%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
["STR_DUWS_X_n4uc7t2x", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// MISSION COMPLETE ?
waitUntil {sleep 2; !alive _vehicle_31 || Mission_Cancelled};  

if (Mission_Cancelled) exitWith {};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

//[[_VARtaskgeneratedName, WEST],"BIS_fnc_deleteTask", true, true] call BIS_fnc_MP; 
//[[_VARtaskgeneratedName, "SUCCEEDED"], "BIS_fnc_taskSetState", true, true] call BIS_fnc_MP;
[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;

[] spawn fnc_missionTimer;

// Give cookies  (bonus & notifications)
[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
// Spawn the "next mission" wait
[] spawn fnc_missionTimer;
// Spawn the cleanup
[_targetpos,_radius] spawn fnc_mission_cleanup;
