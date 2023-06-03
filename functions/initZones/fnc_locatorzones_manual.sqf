_radius = _this select 0;
_diff = _this select 1;

[{hint localize "STR_DUWS_X_5ve9v8c0"}] remoteExec ["BIS_fnc_Spawn", player1,false];
[[localize "STR_DUWS_X_shuo4nyn"]] remoteExec ["BIS_fnc_typeText", [0,-2] select isDedicated,false];

// ON WATER ? >> FLAT ? >> DISTANCE BETWEEN ZONES ? >> OK !

_worldName = getText(configFile >> "cfgWorlds" >> worldName >> "description");

titleCut ["", "BLACK IN", 10];
man_fortified = true; publicVariable "man_fortified";
openMap [true, true];
mapAnimAdd [3, 1, PosOfBLUHQ];
mapAnimCommit;
//sleep 3;
_zones_array = [[-9999,-9999,-9999]];

for [{_i=1}, {_i<=zones_number}, {_i=_i+1}] do  // BEGIN "FOR" LOOP --
{
    player globalChat format[localize "STR_DUWS_X_6izloqi3",_i];
    _found = false;
    man_zone_radius = 0; publicVariable "man_zone_radius";
    man_points_zone = 0; publicVariable "man_points_zone"; 
    while {man_zone_radius<=zones_min_radius} do {
        _random_zones_max_radius = random zones_max_radius;
        man_zone_radius = round _random_zones_max_radius;   
        man_points_zone = round (man_zone_radius/10);
    };
	
    while {!_found} do {
        clicked = false;
        OnMapSingleClick "ClickedPos = _pos; clicked = true;";	
        _found_distance = false;
        man_missionPos = []; publicVariable "man_missionPos";
		_Posfound = false;

		// Make sure no previous zones or FOBs are nearby
		if (DUWS_MODE == "DOMINATION") then {
			_fob_locations = [];
			_too_close = [];
			{
				_fob_locations = _fob_locations + [getPos _x];
			} forEach Array_of_FOBS;

			if (count(_fob_locations) > 0) then {
				{
					_too_close = serv_zones_array_temp + [_x];
				} forEach _fob_locations;
			} else {
				_too_close = serv_zones_array_temp ;
			};
			{
				if ((_x distance ClickedPos) < 1500) then {
					_Posfound = true;  // trick the _Posfound loop
					hint localize "STR_DUWS_X_bsxj4ef9";
				};
			} forEach _too_close;
		};
				
        if (clicked) then {

			while {!_Posfound} do {
				_posDeMeilleurTruc = [];
				_nearRoad = [];
				if (simple_zones_enable) then {  // allow for tighter spaces
					_posDeMeilleurTruc = [ClickedPos, 0,10,3,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
					_nearRoad = [_posDeMeilleurTruc,3] call BIS_fnc_nearestRoad;
				} else {
					_posDeMeilleurTruc = [ClickedPos, 0,25,15,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
					_nearRoad = [_posDeMeilleurTruc,20] call BIS_fnc_nearestRoad;
				};

				if (0 == _posDeMeilleurTruc select 0 && 0 == _posDeMeilleurTruc select 1) then {
					clicked = false;
					hint localize "STR_DUWS_X_blz9jyju";
				} else {
					// DON'T SPAWN ON ROADS
					if (isNull _nearRoad) then {
						onMapSingleClick "";
						hint localize "STR_DUWS_X_7o4m3o2t";
						man_missionPos = _posDeMeilleurTruc;
						_Posfound = true;
						_found_distance = true;
					} else {
						clicked = false;
						hint localize "STR_DUWS_X_wwegpr4y";
					};	
				};
			};
		};

        if (_found_distance) then {

			currzone = _i;
			publicVariable "currzone";  
			_next = amount_zones_created;
			
		    man_missionPos = [round(man_missionPos select 0),round(man_missionPos select 1)];
			_prefab=true;
			if (simple_zones_enable) then {_prefab = false};

			[format[localize "STR_DUWS_X_39z6pg7y",currzone],man_points_zone,man_zone_radius,man_missionPos,man_fortified,_prefab,currzone] remoteExec ["fnc_createZone", 2];
            _found = true;
            _zones_array = _zones_array + [man_missionPos]; 
			
			//found
			[{player globalChat format[localize "STR_DUWS_X_vai9q3po",currzone]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
			sleep 1;
			//generating
			[{player globalChat format[localize "STR_DUWS_X_1lfvd9iw",currzone]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

            waituntil {sleep 1;amount_zones_created > _next;};
        };
    };
};

//openMap [false, false]; 

trap = _worldname;
publicVariable "trap";

[{player globalChat format[localize "STR_DUWS_X_d5e848d8",trap,profileName]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
[{player globalChat localize "STR_DUWS_X_518bqchj"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
[{hint format[localize "STR_DUWS_X_7mog9k78",
	zones_number,zones_max_radius,zones_min_radius,zones_max_dist_from_hq,
	weather_type,time_of_day,enableChopperFastTravel,enable_fast_travel,
	ZeusStatus,staminaEnabled,VCOM_AI_enable,time_Multiplier,simple_zones_enable,CIV_PRESENCE
]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

// For some reasons I had to add a zone [0,0,0] in _zones_array, now I must remove it:
_zones_array = [_zones_array, 0] call BIS_fnc_removeIndex;

//player globalchat format["%1",_zones_array];
serv_zones_array = [] + _zones_array;
publicVariable "serv_zones_array";

sleep 1;
[
	[
		[localize "STR_DUWS_X_518bqchj","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		[localize "STR_DUWS_X_37xxl2nt","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		[format[localize "STR_DUWS_X_dqxeffa2",_worldName,profilename],"<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]
	]
] spawn BIS_fnc_typeText;  

if (DUWS_MODE == "DOMINATION") then {
	sleep 5;
	openMap [false, false];
};

