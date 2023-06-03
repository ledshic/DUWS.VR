
if ((vehiclevarname player) in game_master) then {

	_actionID = bluHQ_object addaction [localize "STR_DUWS_X_e9e627qt", {Mission_Cancelled = true;publicVariable "Mission_Cancelled"}, [], 0, true, true, "", "_this == player"];

	waitUntil {sleep 5; Mission_Cancelled || Kill_MissionCancel};  
	bluHQ_object removeAction _actionID;
	Kill_MissionCancel = false;
	publicVariable "Kill_MissionCancel";
};

