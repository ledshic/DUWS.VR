
///////////////
///////////////   "B_ION", "ION", "B_ION"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"B_ION_Soldier_lxWS";					//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"B_D_CTRG_Soldier_LAT2_lxWS";				//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_GL_X =			"B_D_CTRG_Soldier_JTAC_lxWS";				//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_TL_X =			"B_ION_TL_lxWS";				//initHQ\fnc_createpatrolFOB, initHQ\fnc_HQguards
blufor_SOLDIER_SL_X =			"B_ION_TL_lxWS";				//Comms voice, Multiplayer slot
blufor_SOLDIER_AR_X =			"B_ION_soldier_AR_lxWS";				//supports\fnc_paradrop, initHQ\fnc_HQguards
blufor_MARKSMAN_X = 			"B_ION_marksman_lxWS";				//initHQ\fnc_HQguards
blufor_OFFICER_X =				"B_ION_Story_Givens_lxWS";					//initHQ\fnc_BluHQinit
blufor_HELI_PILOT_X	=			"B_ION_Helipilot_lxWS";				//Rescue Pilot mission

blufor_BOAT_ARMED_X	=			"B_Boat_Armed_01_minigun_F";	//supports\taxi\fnc_boatTaxi
blufor_BOAT_CREW_X =			"B_Competitor_F";				//supports\taxi\fnc_boatTaxi

blufor_HELI_TRANS_ARM_X =		"B_ION_Heli_Light_02_dynamicLoadout_lxWS";		//supports\taxi\fnc_helotaxi, random patrol
blufor_HELI_TRANS_UNARM_X =		"B_ION_Heli_Light_02_unarmed_lxWS";   //random patrol
blufor_PLANE_CAS_X =			"B_Plane_CAS_01_dynamicLoadout_F";				//dialog\fnc_request_hcCAS
blufor_CAR_PATROL1_X =			"B_ION_Offroad_armed_lxWS";				//random patrol
blufor_APC_PATROL1_X =			"B_ION_APC_Wheeled_01_command_lxWS";	//random patrol
blufor_APC_PATROL2_X =			"B_ION_APC_Wheeled_02_hmg_lxWS";		//random patrol


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"B_static_AA_F";
blufor_TURRET_AT =				"B_static_AT_F";
blufor_TURRET_HMG =				"B_HMG_01_high_F";
blufor_TURRET_GMG =				"B_GMG_01_high_F";


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"B_D_CTRG_Soldier_lxWS";					//operator
blufor_SPECOPS_GL_X =			"B_D_CTRG_Soldier_JTAC_lxWS";				//operator
blufor_SPECOPS_LAT_X =			"B_D_CTRG_Soldier_LAT2_lxWS";				//operator
blufor_SPECOPS_HAT_X =			"B_D_CTRG_Soldier_LAT2_lxWS";		//operator
blufor_SPECOPS_AA_X =			"B_soldier_AA_F";				//operator
blufor_SPECOPS_MG_X =			"B_D_CTRG_Soldier_HG_lxWS";		//operator
blufor_SPECOPS_MEDIC_X =		"B_D_CTRG_Soldier_Medic_lxWS";				//operator
blufor_SPECOPS_MARK_X =			"B_D_CTRG_Soldier_M_lxWS";					//operator
blufor_SPECOPS_SNIPER_X =		"B_ghillie_ard_F";					//operator
blufor_SPECOPS_EXP_X =			"B_D_CTRG_Soldier_Exp_lxWS";				//operator
blufor_SPECOPS_ENG_X = 			"B_ION_shot_lxWS";			//operator





/////////////////////////////////////////////////////////////////
// REQUEST Units/Vehicles
//
// THESE HAVE FIXED AMOUNTS -fill the ends with ["empty",0,0];
//
// - Units = 				14
// - Vehicles/Statics = 	50
//
/////////////////////////////////////////////////////////////////

// REQUEST MENU defines labels/index for all request menu units/vehicles (not Operators)

// request_vehicle, request_vehicle_fob, request_unit, request_unit_fob 
// - these files contain the classnames referenced by the label/index


///////////////////////////////
// dialog\fnc_request_unit
//   _index = lbCurSel 2100;
// dialog\fnc_request_unit_fob
//   _index = lbCurSel 2120;
///////////////////////////////


blufor_RQST_UNIT_01_X = 			["B_ION_Soldier_lxWS","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["B_D_CTRG_Soldier_JTAC_lxWS","Grenadier (3CP)",3];
blufor_RQST_UNIT_03_X =				["B_ION_soldier_AR_lxWS","Automatic Rifleman (3CP)",3];
blufor_RQST_UNIT_04_X =				["B_D_CTRG_Soldier_HG_lxWS","Heavy Gunner (4CP)",4];
blufor_RQST_UNIT_05_X =				["B_ION_medic_lxWS","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["B_D_CTRG_Soldier_LAT2_lxWS","AT Rifleman (3CP)",3];
blufor_RQST_UNIT_07_X =				["B_ION_TL_lxWS","Team Leader (3CP)",3];
blufor_RQST_UNIT_08_X =				["B_ION_Soldier_SG_lxWS","Shotgunner (3CP)",3];
blufor_RQST_UNIT_09_X =				["B_ION_shot_lxWS","Engineer (4CP)",4];
blufor_RQST_UNIT_10_X =				["B_ION_marksman_lxWS","Marksman (3CP)",3];
blufor_RQST_UNIT_11_X =				["B_ION_shot_lxWS","Specialist (3CP)",3];

///////////////////////////////
// dialog\fnc_request_vehicle
//   _index = lbCurSel 2102;
// dialog\fnc_request_vehicle_fob
//   _index = lbCurSel 2122;
////////////////////////////////   

blufor_RQST_VEHICLE_01_X =			["B_ION_Quadbike_01_lxWS","ATV (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["B_ION_Offroad_lxWS","SF Offroader (2CP)",2];
blufor_RQST_VEHICLE_03_X =			["I_G_Van_01_transport_F","Transport Truck (6CP)",6];
blufor_RQST_VEHICLE_04_X =			["B_ION_Truck_02_covered_lxWS","Zamak Transport Covered (8CP)",8];
blufor_RQST_VEHICLE_05_X =			["B_Truck_01_fuel_F","HEMTT Fuel (8CP)",8];
blufor_RQST_VEHICLE_06_X =			["B_Truck_01_medical_F","HEMTT Medical (8CP)",8];
blufor_RQST_VEHICLE_07_X =			["B_Truck_01_Repair_F","HEMTT Repair (12CP)",12];
blufor_RQST_VEHICLE_08_X =			["B_Truck_01_ammo_F","HEMTT Ammo (14CP)",14];
blufor_RQST_VEHICLE_09_X =			["B_ION_Offroad_armed_lxWS","Offroad HMG (15CP)",15];
blufor_RQST_VEHICLE_10_X =			["C_Plane_Civil_01_racing_F","Civilian Plane (15CP)",15];
blufor_RQST_VEHICLE_11_X =			["B_ION_APC_Wheeled_02_hmg_lxWS","MSE-3 Marid HMG (20CP)",20];
blufor_RQST_VEHICLE_12_X =			["B_ION_Heli_Light_02_unarmed_lxWS","PO-30 Orca (Unarmed) (20CP)",20];
blufor_RQST_VEHICLE_13_X =			["B_ION_APC_Wheeled_01_command_lxWS","AMV-7 Marshall(30CP)",30];
blufor_RQST_VEHICLE_14_X =			["B_ION_Heli_Light_02_dynamicLoadout_lxWS","PO-30 Orca (30 CP)",30];