//Arma 3 Music Script
//Made by Niklas Brettschneider

//Hier werden alle Schüsse überwacht und verarbeitet.

_unit = _this select 0; // Object - Object the event handler is assigned to
_weapon = _this select 1; // String - Fired weapon
_muzzle = _this select 2; // String - Muzzle that was used
_mode = _this select 3; // String - Current mode of the fired weapon
_ammo = _this select 4; // String - Ammo used
_magazine = _this select 5; // String - magazine name which was used
_projectile = _this select 6; // Object - Object of the projectile that was shot 

hint format ["Shot fired with Weapon %1\n from distance %2", _firer, _weapon, _distance];

[1] execVM "sounds\musicHandler_Vietnam\battleIntensityChange.sqf";