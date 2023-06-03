
//if (!Mission_available) exitWith {};

//Mission_available = false;

Kill_MissionCancel = true;
publicVariable "Kill_MissionCancel";

sleep 300;   // 5 min

if (Mission_available) exitWith {};
Mission_available = true;
publicVariable "Mission_available";

["info",["",localize "STR_DUWS_X_6mg3jdt8"]] remoteExec ['BIS_fnc_showNotification',player1];
