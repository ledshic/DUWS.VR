
params ["_MissionPos", "_mission_name"];

Mission_available = false;
publicVariable "Mission_available";

// define random pos AROUND TOWER. 
_radius = 400;
_cpreward = 20;
_apreward = 20;

_randomPos = [];
_Building = [];
_Posfound = false;
_targetpos = [];
_failSafe = 0;
_markerText = "sam";
_markerText2 = localize "STR_DUWS_X_8odg2zbl";

_POSdata = [_MissionPos, _radius, _Posfound, _targetpos, _failSafe] call missionPOS_fnc;

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

_towerPos = _targetpos;

_markerData = [_randomPos, _markerText, _markerText2, _radius] call fnc_missionMarkerData;
_markername = _markerData select 0;
_markername2 = _markerData select 1;

_centerSpawn = _towerPos;
_centerSpawnX = _towerPos select 0;
_centerSpawnY = _towerPos select 1;

_vehicle_0 = objNull;
_this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_vehicle_0 = _this;
_this setPos _towerPos;
_centerSpawnZ = (getpos _vehicle_0 select 2);
deleteVehicle _vehicle_0;


_staticsArray = [
	["uns_SON50_NVA",[3.48022,-3.52417,0],0,1,0,[],"","",true,false], 
	["wx_table04",[6.92505,-2.43872,0],90.4542,1,0,[],"","",true,false], 
	["uns_villtable1",[6.91943,-4.67078,0],156.426,1,0,[],"","",true,false],
	["mapboard",[9.84814,-2.51208,0],90.5037,1,0,[],"","",true,false],	
	["LAND_uns_vcshelter4",[7.73535,1.1217,0],358.408,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[7.75928,-4.02869,0],358.408,1,0,[],"","",true,false],
	["LAND_uns_vcshelter4",[-9.42896,-3.97546,0],179.728,1,0,[],"","",true,false],
	["LAND_uns_vcshelter4",[-9.41626,0.998169,0],179.728,1,0,[],"","",true,false],
	["LAND_uns_vcshelter2",[11.64917,4.78284,-0.385556],180.316,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter2",[-13.3691,5.41882,-0.377222],359.903,1,0,[],"","",true,false],  	
	["uns_HiddenAmmoBox_small2",[10.1689,-0.41272,0],88.7638,1,0,[],"","",true,false], 
	["uns_trap_box_VC",[10.1726,0.487671,0],180.002,1,0,[],"","",true,false], 
	["uns_AmmoBoxNVA",[-11.4194,1.05872,0],270.179,1,0,[],"","",true,false],
	["uns_HiddenAmmoBox",[10.7305,5.29529,-0.00199986],272.319,1,0,[],"","",true,false],
	["uns_HiddenAmmoBox",[-12.2537,5.44141,-0.00199986],87.5847,1,0,[],"","",true,false],
	["wx_table03",[10.2822,-3.95728,0],90.2855,1,0,[],"","",true,false],	
	["wx_barrel06",[-10.6436,-2.81494,0],203.4,1,0,[],"","",true,false], 
	["wx_barrel03",[-11.6526,-2.38843,0],184.804,1,0,[],"","",true,false], 
	["wx_barrel01",[-11.71,-3.07446,0],181.395,1,0,[],"","",true,false],
	["Land_barels3",[-11.751,-5.50574,0],0,1,0,[],"","",true,false],	
	["Land_wx_fielddefence_04",[15.0386,1.46863,0],173.318,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-6.69067,13.7911,0],77.0442,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[15.1733,-3.76038,0],189.259,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[0.343506,15.8177,0],69.6228,1,0,[],"","",true,false],
	["Land_wx_fielddefence_04",[-16.8972,0.85437,0],10.579,1,0,[],"","",true,false],
	["Land_wx_fielddefence_04",[-16.8828,-4.37634,0],354.639,1,0,[],"","",true,false],	
	["pook_Land_fort_rampart_MUD",[-5.80273,15.94263,0],179.639,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-1.39624,-17.4459,0],359.633,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-0.34277,17.6543,0],144.822,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-18.689,-1.4906,0],88.8389,1,0,[],"","",true,false],
	["pook_Land_fort_rampart_MUD",[16.8472,-1.62134,0],267.519,1,0,[],"","",true,false],
	["Land_Wood_Tower2",[-13.437,9.61096,0],179.293,1,0,[],"","",true,false],
	["Land_Wood_Tower2",[7.65771,16.1851,0],179.293,1,0,[],"","",true,false]	
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

_vehicle_02 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sa2_static_NVA", [(_centerSpawnX)-1.52173, (_centerSpawnY)-1.52173], [], 0, "CAN_COLLIDE"];
  _vehicle_02 = _this;
  _this setDir 0;
  _vehicle_02 setdamage 0.01;
};

_vehicle_03 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)-12.9282, (_centerSpawnY)-10.1113], [], 0, "CAN_COLLIDE"];
  _vehicle_03 = _this;
  _this setDir 212.827;
};
_vehicle_03 allowdamage false;
_vehicle_03 setdamage 0;

_vehicle_04 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)+11.3643, (_centerSpawnY)-9.84497], [], 0, "CAN_COLLIDE"];
  _vehicle_04 = _this;
  _this setDir 125.012;
};

_vehicle_05 = objNull;
if (true) then
{
  _this = createVehicle ["uns_pk_high_NVA", [(_centerSpawnX)-13.437, (_centerSpawnY)+10.61096,3], [], 0, "CAN_COLLIDE"];
  _vehicle_05 = _this;
  _this setDir 1.98805;
};

_vehicle_06 = objNull;
if (true) then
{
  _this = createVehicle ["uns_pk_high_NVA", [(_centerSpawnX)+7.65771, (_centerSpawnY)+17.1851,3], [], 0, "CAN_COLLIDE"];
  _vehicle_06 = _this;
  _this setDir 1.98805;
};

_vehicle_07 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sniper_tree2_t4_empty", [(_centerSpawnX)+59.2705, (_centerSpawnY)-2.80188], [], 0, "CAN_COLLIDE"];
  _vehicle_07 = _this;
  _this setDir 0;
};

sleep 1;

_groupTower = [getpos _vehicle_07, EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_towerGuard setPos [(getposATL _vehicle_07 select 0)-1.5,(getposATL _vehicle_07 select 1)+0.5,+10];
_towerGuard setUnitPos "DOWN";
_groupTower setBehaviour "AWARE";

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard4 = units _groupBunker select 3;
_guard1 moveinGunner _vehicle_03;
_guard2 moveinGunner _vehicle_04;
_guard3 moveinGunner _vehicle_05;
_guard4 moveinGunner _vehicle_06;

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["sam%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

[west, [_VARtaskgeneratedName], 
["STR_DUWS_X_zcp4hrzg", _mission_name, "(getMarkerPos str(_markername)"], objNull, true] call BIS_fnc_taskCreate; 

// Add CANCEL Action to HQ
// good example of remoteExec to JIP and host
[] remoteExec ["fnc_mission_cancel_action", [0,-2] select isDedicated,[false,true] select isDedicated];
// Start the CANCEL listen loop
[_markername, _markername2, _VARtaskgeneratedName, _mission_name, _targetpos] spawn fnc_mission_cancel;

// CREATE PATROLS
sleep 1;
[_targetpos, _radius] spawn fnc_missionPatrols;

// MISSION COMPLETED --   ATTENDRE QUE LA TOUR SOIT KO
waitUntil {sleep 2; !alive _vehicle_02 || Mission_Cancelled};  

if (Mission_Cancelled) exitWith {};
bluHQ_object removeAction _actionID;

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

