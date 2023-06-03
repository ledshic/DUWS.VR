
_addAction = _this select 0;

if (_addAction == "select") then {
	// create marker on MHQ
	_markerType = "b_motor_inf";
	waitUntil {!isNil "MHQ1"};
	if (MHQ1 isKindof "tank") then {_markerType = "b_armor"};

	[MHQ1, _markerType, "ColorYellow", 1, 1, localize "STR_DUWS_X_9ziy0qai"] remoteExec ["kndr_assignMarker", [0,-2] select isDedicated,false];

	// spawn loop to detect MHQ destroyed
	[] spawn fnc_MHQ_destroyed;

};

if (_addAction == "deploy") then {
	if ((vehiclevarname player) in Request_Players) then {
		removeAllActions MHQ1;
		MHQ1 addaction [localize "STR_DUWS_X_rqzxlvf4",{[] remoteExec ["fnc_MHQ_deploy",2]}];
	};
};

if (_addAction == "undeploy") then {
	if ((vehiclevarname player) in Request_Players) then {
		removeAllActions MHQ1;
		MHQ1 addaction [localize "STR_DUWS_X_fjpyu3zb",{[] remoteExec ["fnc_MHQ_undeploy",2]}];
	};
};

