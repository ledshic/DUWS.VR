
_faction = _this select 0;
_vehClass = _this select 1;
_position = _this select 2;
_radius = _this select 3;


// DETERMINE LA FACTION
_side = WEST; 

_vehpos = [[(_position select 0)+10, (_position select 1)+0],200,400,15,0,0.5,0,[],[]] call BIS_fnc_findSafePos;

// ARRAY of Random Vehicles
_anyveh = "";
_airveh = "";
switch (VERSION_X) do {
	case "MODERN": {
		_anyveh = selectRandomWeighted [
			blufor_CAR_PATROL1_X,1.0,
			blufor_APC_PATROL1_X,1.0,
			blufor_APC_PATROL2_X,1.0,
			blufor_TANK_PATROL1_X,1.0
		];
		_airveh = selectRandomWeighted [
			blufor_HELI_TRANS_ARM_X,1.0,
			blufor_HELI_ATTACK_X,1.0,
			blufor_PLANE_CAS_X,0.7
		];
	};
	case "WW2": {
		//Dang Edit extra tanks
		_anyveh = selectRandomWeighted [
			blufor_CAR_PATROL1_X,1.0,
			blufor_APC_PATROL1_X,1.0,
			blufor_APC_PATROL2_X,1.0,
			blufor_TANK_PATROL_X,0.4,
			blufor_TANK_PATROL1_X,0.3,
			blufor_TANK_PATROL2_X,0.6,
			blufor_TANK_PATROL3_X,1.0,
			blufor_TANK_PATROL4_X,0.8,
			blufor_TANK_PATROL5_X,0.7
		];
		//Dang Edit extra planes for secret weapons
		_airveh = selectRandomWeighted [
			blufor_PLANE_PATROL_X,1.0,
			blufor_PLANE_PATROL1_X,1.0,
			blufor_PLANE_PATROL2_X,1.0,
			blufor_PLANE_PATROL3_X,1.0,
			blufor_PLANE_PATROL4_X,1.0,
			blufor_PLANE_FIGHTER_X,1.0,
			blufor_PLANE_CAS_X,1.0
		];
	};
	case "VIETNAM": {
		_anyveh = selectRandomWeighted [
			blufor_CAR_PATROL1_X,1.0,
			blufor_APC_PATROL1_X,1.0,
			blufor_APC_PATROL2_X,1.0,
			blufor_APC_PATROL3_X,1.0,
			blufor_APC_PATROL4_X,1.0,
			blufor_APC_PATROL5_X,1.0,
			blufor_APC_PATROL6_X,1.0,
			blufor_TANK_PATROL1_X,1.0,
			blufor_TANK_PATROL2_X,1.0,
			blufor_TANK_PATROL3_X,1.0,
			blufor_TANK_PATROL4_X,1.0
		];

		_airveh = selectRandomWeighted [
			blufor_HELI_TRANS_ARM_X,1.0,
			blufor_HELI_ATTACK_X,1.0,
			blufor_HELI_ATTACK1_X,1.0,
			blufor_HELI_ATTACK2_X,1.0,
			blufor_HELI_ATTACK3_X,1.0,
			blufor_PLANE_CAS_X,1.0,
			blufor_PLANE_FIGHTER_X,1.0,
			blufor_PLANE_PATROL_X,1.0,
			blufor_PLANE_PATROL1_X,1.0,
			blufor_PLANE_PATROL2_X,1.0,
			blufor_PLANE_PATROL3_X,1.0
		];
	};
};

_createdVehFnc = [];
if (_vehClass == "car") then {
	_createdVehFnc = [_vehpos,0,blufor_CAR_PATROL1_X,_side] call bis_fnc_spawnvehicle;
} else {
	if (_vehClass == "air") then {
		_vec =[random [-1,0,1], random [-1,0,1], 0];
		_dist = 500;
		_vehpos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _position;
		_vehpos = [_vehpos select 0, _vehpos select 1, (_vehpos select 2)+800];
		_createdVehFnc = [_vehpos,0,_airveh,_side] call bis_fnc_spawnvehicle;
	} else {
		_createdVehFnc = [_vehpos,0,_anyveh,_side] call bis_fnc_spawnvehicle;
	};
};

_veh = _createdVehFnc select 0 ;// vehicle object

if (_vehClass == "air") then {
	_veh engineOn true;
	switch (VERSION_X) do {
		case "MODERN": {
			_veh flyInHeight 150;
		};
		case "WW2": {
			_veh setvelocity [250,0,250];
			_veh flyInHeight 800;
		};
		case "VIETNAM": {
			_veh setPos [_vehpos select 0, _vehpos select 1, 300];// set height
			_veh engineOn true;
			_veh setVelocity [0,0,150];
			_veh flyInHeight 150;
		};
	};
};

_vehGroup = _createdVehFnc select 2;
_vehGroup deleteGroupWhenEmpty true;

{
	_x setSkill blufor_ai_skill_random;
} foreach units _vehGroup;

// Set the waypoints
//hint format["%1",_patrolRadius];
[_vehGroup] spawn fnc_WARCOM_wp_blu_patrol;


