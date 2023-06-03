

///// DUWS_X  RERUN THE OPFOR FACTION FILE FOR JIP SIDE MISSION GEN
if (hasInterface && isMultiplayer)	then {
	[] call fnc_OPFOR_FactionFile_X;
	sleep 1;
};

if (isnil ("Mission_available")) then {Mission_available = true;publicVariable "Mission_available"};
if (!Mission_available) exitWith {[localize "STR_DUWS_X_b68ftbvf"] spawn fnc_sideChat_filter};
if (!((vehiclevarname player) in game_master)) exitWith {hint localize "STR_DUWS_X_eck4xh9m"};

Mission_Cancelled = false;
publicVariable "Mission_Cancelled";

// init the array of missions
array_of_missions = [];

failsafe_not_found = true;
failsafe_not_found2 = false;
_failsafe2 = [] spawn {  // Spawn the secondary failsafe
	uiSleep 20;
	failsafe_not_found2 = true;
};

_handle = [] spawn {  // Spawn the MAIN SEARCH

  _counter = 0;

  _kibot_pos_array_missionPos = [[-99999,-99999,-99999]];

  // CURRENTLY 11 MISSIONS AVAILABLE, 0 indexed
  _missionConfig = [];
  _missionCount = [0,1,2,3,4,5,6,7,8,9,10];
  _missionShuffle = _missionCount call BIS_fnc_arrayShuffle;
  
  while {_counter < count _missionCount} do {

	_progress = 0.1 * _counter;
	progressLoadingScreen _progress;
	
	//////////////////////////////////////////////
	/// DUWS_X "More Urban" changes
	///  - put near a building
	///  - stay away from zone centers
	//////////////////////////////////////////////

	_Posfound = false;
	_ZnLocation = [];
	_foundSafePos = [];

	while {!_Posfound} do {
		
		if (moreUrban == 1 && failsafe_not_found2 == false) then {
			// MORE URBAN
			_ZnAnchor = position (MissionLocations select (floor (random (count MissionLocations))));
			_ZnLocation = [_ZnAnchor, 100, 400,10,0,0.3,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
			_Building = nearestBuilding _ZnLocation;
			_foundSafePos = [(getpos _Building select 0),(getpos _Building select 1)];
		}else{
			// LESS URBAN
			_foundSafePos = [PosOfBLUHQ, 0, (zones_max_dist_from_hq*1.5),5,0,0.3,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
		};

		_Posfound = true;
		
		// STAY AWAY FROM CENTER OF ZONES
		_zonesArray = WARCOM_zones_controled_by_OPFOR + WARCOM_zones_controled_by_BLUFOR;
		for [{_t=1}, {_t <= count _zonesArray}, {_t=_t+1}] do 
		{                                         
			// get the index of the element
			_zonesArray_index = _t-1;
			_distance = (_zonesArray select _zonesArray_index) distance (_foundSafePos);
			if (_distance < (zones_max_radius*0.75)) then {_Posfound = false};
		};
		
	};
 
	// CREATE AN ARRAY OF POSSIBLE POSITIONS
    _found_dist_away = true;
    _kibot_distances_array = [];
    // for each element of the array of safe positions, 
    for [{_t=1}, {_t <= count _kibot_pos_array_missionPos}, {_t=_t+1}] do 
    {                                         
        // get the index of the element
        _kibot_pos_array_missionPos_index = _t-1;
        // create an array of all missionPos distances to current _foundSafePos.
        _kibot_distances_array = _kibot_distances_array +[(_kibot_pos_array_missionPos select _kibot_pos_array_missionPos_index) distance (_foundSafePos)]; 
    };
    // for each element of the array of distances we just generated...
    for [{_t=1}, {_t<=count _kibot_distances_array}, {_t=_t+1}] do
    {                                           
        // get the index of the tested element
        _kibot_distances_array_index = _t-1;
        // select an element with index so we can check it
        _check = (_kibot_distances_array select _kibot_distances_array_index);
        // check the distances contained in the distances array 1 by 1. If a distance is inferior to defined values, dump it.
        if (_check < 250) then {
            // If any mission is <250m away, tell it to this variable;
            _found_dist_away = false;   
        };
    };

    if (_foundsafePos distance player > 1500
        && _found_dist_away
        && _foundsafePos distance hq_blu1 < (zones_max_dist_from_hq*1.5)) then {

        // A VALID POS HAS BEEN FOUND add the position to the array of missionPos
        _kibot_pos_array_missionPos = _kibot_pos_array_missionPos + [_foundSafePos];
		
		if (_counter == (count _missionCount)-1) then {failsafe_not_found = false;};
		_currentMission = _missionShuffle select _counter;

		// Add each mission type to stratmap array

        switch (_currentMission) do {

			case 0: { // mission RESCUE SQUAD
				mission0_pos = _foundSafepos;
                mission0_name = [0] call fnc_random_name;
    
                _missionConfig = [
                    mission0_pos,
					{_handle = [mission0_pos,mission0_name] remoteExec ["fnc_rescue_squad_mission", 2]},
                    mission0_name,
                    localize "STR_DUWS_X_kievbwmd",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa",
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 1: { // mission STEAL SUPPLY
                mission1_name = [0] call fnc_random_name;
                mission1_pos = _foundSafepos;

                _missionConfig = [
                    mission1_pos,
					{_handle = [mission1_pos,mission1_name] remoteExec ["fnc_steal_supply_mission", 2]},
                    mission1_name,
                    localize "STR_DUWS_X_p7qawzl4",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\BasicSpeed_ca.paa",
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 2: { // mission TARGET HVT
                mission2_name = [0] call fnc_random_name;
                mission2_pos = _foundSafepos;
    
                _missionConfig = [
                    mission2_pos,
					{_handle = [mission2_pos,mission2_name] remoteExec ["fnc_target_hvt_mission", 2]},
                    mission2_name,
                    localize "STR_DUWS_X_19ajhe1d",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 3: { // mission DESTROY TOWER
                mission3_name = [0] call fnc_random_name;
                mission3_pos = _foundSafepos;

				switch (VERSION_X) do {
					case "MODERN": {  // RADIO TOWER
						_missionConfig = [
							mission3_pos,
							{_handle = [mission3_pos,mission3_name] remoteExec ["fnc_destroy_tower_mission", 2]},
							mission3_name,
							localize "STR_DUWS_X_dgpqenyw",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
					};
					case "WW2": {  // RADIO TRUCK
						_missionConfig = [
							mission3_pos,
							{_handle = [mission3_pos,mission3_name] remoteExec ["fnc_destroy_tower_mission", 2]},
							mission3_name,
							localize "STR_DUWS_X_lh5dhnjp",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
					};
					case "VIETNAM": {  // SAM SITE
						_missionConfig = [
							mission3_pos,
							{_handle = [mission3_pos,mission3_name] remoteExec ["fnc_destroy_sam_mission", 2]},
							mission3_name,
							localize "STR_DUWS_X_zcp4hrzg",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
					};
				};
                array_of_missions = array_of_missions + [_missionConfig];
			};

            case 4: { // mission RESCUE PILOT
                mission4_name = [0] call fnc_random_name;
                mission4_pos = _foundSafepos;
    
                _missionConfig = [
                    mission4_pos,
					{_handle = [mission4_pos,mission4_name] remoteExec ["fnc_rescue_pilot_mission", 2]},
                    mission4_name,
                    localize "STR_DUWS_X_njsu8ofz",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\Direction_ca.paa", 
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 5: { // mission Sniper HUNT
                mission5_name = [0] call fnc_random_name;
                mission5_pos = _foundSafepos;
    
                _missionConfig = [
                    mission5_pos,
					{_handle = [mission5_pos,mission5_name] remoteExec ["fnc_target_sniper_mission", 2]},
                    mission5_name,
                    localize "STR_DUWS_X_16dh939j",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };
			
            case 6: { // mission Steal BUILDER
                mission6_name = [0] call fnc_random_name;
                mission6_pos = _foundSafepos;
    
                _missionConfig = [
                    mission6_pos,
					{_handle = [mission6_pos,mission6_name] remoteExec ["fnc_steal_builder_mission", 2]},
                    mission6_name,
                    localize "STR_DUWS_X_czpvn5z1",
					"",
					"\a3\ui_f\data\gui\cfg\hints\BasicSpeed_ca.paa",
					1,
					[]
				];
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 7: { // mission TARGET ARMOR HVT
                mission7_name = [0] call fnc_random_name;
                mission7_pos = _foundSafepos;
    
                _missionConfig = [
                    mission7_pos,
					{_handle = [mission7_pos,mission7_name] remoteExec ["fnc_target_armor_mission", 2]},
                    mission7_name,
                    localize "STR_DUWS_X_y7z1cx6j",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\Annoucning_ca.paa",
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 8: { // mission SABOTAGE LAPTOP
                mission8_name = [0] call fnc_random_name;
                mission8_pos = _foundSafepos;
    
				switch (VERSION_X) do {
					case "MODERN": {
						_missionConfig = [
							mission8_pos,
							{_handle = [mission8_pos,mission8_name] remoteExec ["fnc_sabotage_laptop_mission", 2]},
							mission8_name,
							localize "STR_DUWS_X_j97ecrsh",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
					};
					case "WW2": {  // RADIO
						_missionArray = [
							mission8_pos,
							{_handle = [mission8_pos,mission8_name] remoteExec ["fnc_sabotage_laptop_mission", 2]},
							mission8_name,
							localize "STR_DUWS_X_euhsfj7z",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
					};
					case "VIETNAM": {  // RADIO
						_missionArray = [
							mission8_pos,
							{_handle = [mission8_pos,mission8_name] remoteExec ["fnc_sabotage_laptop_mission", 2]},
							mission8_name,
							localize "STR_DUWS_X_euhsfj7z",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
					};
				};
                array_of_missions = array_of_missions + [_missionConfig];
            };

            case 9: { // mission DESTROY AMMO CACHE
                mission9_name = [0] call fnc_random_name;
                mission9_pos = _foundSafepos;
    
                _missionConfig = [
                    mission9_pos,
					{_handle = [mission9_pos,mission9_name] remoteExec ["fnc_destroy_cache_mission", 2]},
                    mission9_name,
                    localize "STR_DUWS_X_geryeddp",
                    "",
                    "\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
                    1,
                    []
                ];
                array_of_missions = array_of_missions + [_missionConfig];
            };
		
			case 10: { // mission DESTROY RADAR
                mission10_name = [0] call fnc_random_name;
                mission10_pos = _foundSafepos;
    
				switch (VERSION_X) do {
					case "MODERN": {
						_missionConfig = [
							mission10_pos,
							{_handle = [mission10_pos,mission10_name] remoteExec ["fnc_destroy_radar_mission", 2]},
							mission10_name,
							localize "STR_DUWS_X_n4uc7t2x",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
						array_of_missions = array_of_missions + [_missionConfig];
					};
					case "VIETNAM": {
						_missionConfig = [
							mission10_pos,
							{_handle = [mission10_pos,mission10_name] remoteExec ["fnc_vietnam_destroy_radar_mission", 2]},
							mission10_name,
							localize "STR_DUWS_X_n4uc7t2x",
							"",
							"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa",
							1,
							[]
						];
						array_of_missions = array_of_missions + [_missionConfig];
					};
				};
			};
		};

        _counter = _counter + 1;

	};
  };
  missionSearchDone = 1;
};

_maxTime = diag_tickTime + 60; // max 60s of loadingscreen before failsafe aborts
startLoadingScreen [localize "STR_DUWS_X_dmfmwmfp"];
waitUntil { uiSleep .01; !isNil "missionSearchDone" || diag_tickTime > _maxTime };
missionSearchDone = nil;
endLoadingScreen;
terminate _handle;

if (failsafe_not_found == true) exitWith {hint localize "STR_DUWS_X_crtzxs0j"};

hint "Mission Selector";

// NOW OPEN THE MAP
_isNight = false;
if ((20 < daytime) OR (daytime < 5)) then {_isNight=true};

// https://community.bistudio.com/wiki/BIS_fnc_StrategicMapOpen
// 0: DISPLAY - parent display. When empty, mission display is used.
// 1: ARRAY - default view position in format [x,y,y] or [x,y]
// 2: ARRAY - list of missions in format:
// 3: ARRAY - list of ORBAT groups in format:
// 4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
// 5: ARRAY - list of custom images in format:
// 6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
// 7: BOOL - true for night version of strategic map (darker with blue tone)

[(findDisplay 46), getpos player, array_of_missions, [], [], [], 1, _isNight] call BIS_fnc_strategicMapOpen;

