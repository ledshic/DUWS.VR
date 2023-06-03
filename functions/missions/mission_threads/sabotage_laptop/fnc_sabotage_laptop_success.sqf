
_object = _this select 0;

_arguments = _this select 3;
_missionPos = _arguments select 0;
_targetPos = _arguments select 1;
_mission_name = _arguments select 2;
_markername = _arguments select 3;
_markername2 = _arguments select 4;
_radius = _arguments select 5;

_cpreward = 20;
_apreward = 20;
//_mission_name = MissionNameCase8;

_count = 0;  
{  
  _object setObjectTexture [_count,"#(rgb,8,8,3)color(0,0,1,1)"];  
  _count = _count + 1;  
  if (_count == 1) exitwith{}; 
} foreach getObjectTextures _object;  

[_object,0] remoteExec ["removeAction",[0,-2] select isDedicated];

hint localize "STR_DUWS_X_v5ylof1e";

// TASK AND NOTIFICATION
private "_VARtaskgeneratedName";
_VARtaskgeneratedName = format ["sabotage%1%2",round(_MissionPos select 0),round(_Missionpos select 1)]; // generate variable name for task

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

//[[_VARtaskgeneratedName, "SUCCEEDED"], "BIS_fnc_taskSetState", true, true] call BIS_fnc_MP;
[_VARtaskgeneratedName, "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", [0,-2] select isDedicated,true];

// Give cookies  (bonus & notifications)
//[_cpreward, _apreward, _mission_name] spawn fnc_mission_reward;
[_cpreward, _apreward, _mission_name] remoteExec ["fnc_mission_reward", 2];

// Spawn the "next mission" wait
//[] spawn fnc_missionTimer;
[] remoteExec ["fnc_missionTimer", 2];

// Spawn the cleanup
//[_targetPos,_radius] spawn fnc_mission_cleanup;
[_targetPos,_radius] remoteExec ["fnc_mission_cleanup", 2];

