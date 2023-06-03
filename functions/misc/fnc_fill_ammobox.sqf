
// FILL ANY OBJECT WITH AMMO, WEAPONS, etc...
// Get the lists from fnc_create_ammo_lists

_ammobox = _this select 0;
_side = _this select 1;

clearMagazineCargoGlobal _ammobox; 
clearWeaponCargoGlobal _ammobox; 
clearItemCargoGlobal _ammobox; 
clearBackpackCargoGlobal _ammobox;

switch (_side) do {
	case "blufor": {
		{
			_ammobox addWeaponCargoGlobal [_x, 2];
		} forEach blufor_ammobox_weapons;
		{
			_ammobox addMagazineCargoGlobal [_x, 2];
		} forEach blufor_ammobox_magazines;
		{
			_ammobox addItemCargoGlobal [_x, 2];
		} forEach blufor_ammobox_items;

	};
	case "opfor": {
		{
			_ammobox addWeaponCargoGlobal [_x, 2];
		} forEach opfor_ammobox_weapons;
		{
			_ammobox addMagazineCargoGlobal [_x, 2];
		} forEach opfor_ammobox_magazines;
		{
			_ammobox addItemCargoGlobal [_x, 2];
		} forEach opfor_ammobox_items;
	};
};


