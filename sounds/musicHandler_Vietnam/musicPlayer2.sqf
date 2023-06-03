//Arma 3 Music Script
//Made by Niklas Brettschneider

/*_playlist = ["Track01_Proteus","Track02_SolarPower","Track03_OnTheRoad",
"Track04_Underwater1","Track05_Underwater2","Track06_CarnHeli","Track07_ActionDark", 
"Track08_Night_ambient", "Track09_Night_percussions", "Track10_StageB_action", 
"Track11_StageB_stealth", "Track12_StageC_action", "Track13_StageC_negative",
"Track14_MainMenu", "Track15_MainTheme"];
_durationList = [94,114,88,96,96,111,111,204,194,96,184, 204, 194, 96, 184, 96, 184, 128, 162];*/


_safeTracks = ["fow_main_theme", "BOB_Main", "BOB_Buck", "BOB_Suite", "SavingRyanMain", "Airfight", "genwarmain", "genwarzukunft", "BOB_Requiem", "BOB_Swamp", "This_ismy_Home", "Norman", "War_isnot_over"];
_safeDurations = [185, 145, 123, 388, 370, 180, 124, 206, 194, 127, 221, 167, 217];


_combatTracks = ["Beetfield", "BOB_Mission", "Tiger_battle", "BFV", "Still_inthis_Fight", "Prelude_to_War"];
_combatDurations = [312, 349, 371, 262, 220, 503];


_stealthTracks = ["I'm_Scared_Too", "The_Mole", "Airfight", "BOB_Nixon", "BOB_Swamp"];
_stealthDurations = [226, 336, 180, 136, 127];


_movingFastTracks = ["Norman", "Airfight", "BOB_Main", "Fury_This_Is_My_Home", "April_1945", "BOB_Suite"];
_movingFastDurations = [167, 180, 145, 224, 234, 388];

final_battle1,finalbattle_cut,horrors,illumination,iwillgo,mackenzie_short,montage,niceday,photographer,telegrams,the_target,troops_line,under_cover,whatiswar
//schauen ob das Lied zu ende ist
durationSinceTrackWasStarted = durationSinceTrackWasStarted + 0.2;
if(durationSinceTrackWasStarted > duration - 5) then
{
	2 fadeMusic 0;
};
if(durationSinceTrackWasStarted > duration - 2) then
{
	isMusicCurrentlyPlaying = 0;
};
	


//im Kampf
if(battleIntensity > 10 ) then
{
	//Wenn vorher kein kampf war oder Musik zu ende ist, neue Spielen
	if(currentMusicState != "combat" || isMusicCurrentlyPlaying == 0) then
	{
		currentMusicState = "combat";
		if(vehicle player != player) then
		{
			//Kampf im Fahrzeug
			_selecter = floor(random count _movingFastTracks);// Track02_SolarPower
			playMusic (_movingFastTracks select _selecter); 
			duration = (_movingFastDurations select _selecter);
			currentTrack = (_movingFastTracks select _selecter);
			
			if(debugging == 1) then
			{
				hint format ["Changed music to InVehicleFightMusic Trackname: %1", (_movingFastTracks select _selecter)];
			};
		}
		else
		{
			//Kampf zu fu�
			wasInCarBefore = 0;
			_selecter = floor(random count _combatTracks); //Track07_ActionDark
			playMusic (_combatTracks select _selecter); 
			duration = (_combatDurations select _selecter);
			currentTrack = (_combatTracks select _selecter);
			
			if(debugging == 1) then
			{
				hint format ["Changed music to NormalFightMusic Trackname: %1", (_combatTracks select _selecter)];
			};
		};
		2 fadeMusic Volume;
		isMusicCurrentlyPlaying = 1;
		durationSinceTrackWasStarted = 0;
	};
	if(vehicle player != player && wasInCarBefore == 0) then
	{	
		VehicleIamIn = vehicle player;
		//wechsel ins Fahrzeug
		if(debugging == 1) then
		{
			hint "adding event handler for vehicle";
		};
		_eventForShotFiredNear = VehicleIamIn addEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
		_eventForTakingDamage = VehicleIamIn addEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
		_eventForExplosionsNearby = VehicleIamIn addEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
		_eventForMissileIncoming = VehicleIamIn addEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
		 
		 _getOut = VehicleIamIn addEventHandler["GetOut",{
			if(debugging == 1) then
			{
				hint "removing event handler for vehicle";
			};
				_eventForShotFiredNear = (_this select 0) removeEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
				_eventForTakingDamage = (_this select 0) removeEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
				_eventForExplosionsNearby = (_this select 0) removeEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
				_eventForMissileIncoming = (_this select 0) removeEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
		 }];
		
		wasInCarBefore = 1;
		//Kampf im Fahrzeug
		_selecter = floor(random count _movingFastTracks);// Track02_SolarPower
		playMusic (_movingFastTracks select _selecter); 
		duration = (_movingFastDurations select _selecter);
		currentTrack = (_movingFastTracks select _selecter);
		if(debugging == 1) then
		{
			hint format ["Changed music to InVehicleFightMusic Because a Vehicle was entered Trackname: %1", (_movingFastTracks select _selecter)];
		};
	};
	if(vehicle player == player && wasInCarBefore == 1) then
	{
		//wechsel aus Fahrzeug raus
		wasInCarBefore = 0;
		
		//Kampf zu fu�
		_selecter = floor(random count _combatTracks); //Track07_ActionDark
		playMusic (_combatTracks select _selecter); 
		duration = (_combatDurations select _selecter);
		currentTrack = (_combatTracks select _selecter);
		
		if(debugging == 1) then
		{
			hint format ["Changed music to NormalFightMusic Because a Vehicle was Left Trackname: %1", (_combatTracks select _selecter)];
		};
	};
}
else 
{//au�erhalb vom Kampf
	_selecter = 0;
	if(battleIntensity <= 10) then
	{
		//Wenn vorher kampf war oder Musik zu ende ist, neue Spielen
		if(currentMusicState != "nonCombat" || isMusicCurrentlyPlaying == 0) then
		{
			currentMusicState = "nonCombat";
			2 fadeMusic volume;
			if(isDay == 0)then
			{
				//nachts stealth musik spielen
				_selecter = floor(random count _stealthTracks);
				playMusic (_stealthTracks select _selecter); 
				duration = (_stealthDurations select _selecter);
				currentTrack = (_stealthTracks select _selecter);
				
				if(debugging == 1) then
				{
					hint format ["Changed music to StealthMusic Trackname: %1", (_stealthTracks select _selecter)];
				};
				
			};
			if(isDay == 1) then
			{
				//Tags�ber ohne kampf safe musik Spielen
				_selecter = floor(random count _safeTracks);
				playMusic (_safeTracks select _selecter); 
				duration = (_safeDurations select _selecter);
				currentTrack = (_safeTracks select _selecter);
				
				if(debugging == 1) then
				{
					hint format["Changed music to NormalMusic Trackname: %1", (_safeTracks select _selecter)];
				};
			};
			
			isMusicCurrentlyPlaying = 1;
			durationSinceTrackWasStarted = 0;
		};
		
		//Einstieg ins Fahrzeug ohne Kampf
		if(vehicle player != player && wasInCarBefore == 0) then
		{	
			VehicleIamIn = vehicle player;
			//wechsel ins Fahrzeug
			
			if(debugging == 1) then
			{
				hint "adding event handler for vehicle";
			};
			_eventForShotFiredNear = VehicleIamIn addEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
			_eventForTakingDamage = VehicleIamIn addEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
			_eventForExplosionsNearby = VehicleIamIn addEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
			_eventForMissileIncoming = VehicleIamIn addEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
			 
			 _getOut = VehicleIamIn addEventHandler["GetOut",{
				if(debugging == 1) then
				{
					hint "removing event handler for vehicle";
				};
				_eventForShotFiredNear = (_this select 0) removeEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
				_eventForTakingDamage = (_this select 0) removeEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
				_eventForExplosionsNearby = (_this select 0) removeEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
				_eventForMissileIncoming = (_this select 0) removeEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
			 }];
			
			wasInCarBefore = 1;
		};
		if(vehicle player == player && wasInCarBefore == 1) then
		{
			//wechsel aus Fahrzeug raus
			wasInCarBefore = 0;
		};
	};
};





















