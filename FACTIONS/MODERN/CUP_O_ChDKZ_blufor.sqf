
///////////////
///////////////   "CUP_O_INS", "CUP ChDKZ + Spetsnaz", "CUP_O_ChDKZ"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"CUP_O_INS_Soldier";				//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"CUP_O_INS_Soldier_AT";				//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_GL_X =			"CUP_O_INS_Soldier_GL";				//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_TL_X =			"CUP_O_INS_Officer";				//initHQ\fnc_createpatrolFOB, initHQ\fnc_HQguards
blufor_SOLDIER_SL_X =			"CUP_O_INS_Officer";				//Comms voice, Multiplayer slot
blufor_SOLDIER_AR_X =			"CUP_O_INS_Soldier_AR";				//supports\fnc_paradrop, initHQ\fnc_HQguards
blufor_MARKSMAN_X = 			"CUP_O_RU_Sniper_M_EMR";			//initHQ\fnc_HQguards
blufor_OFFICER_X =				"CUP_O_INS_Commander";				//initHQ\fnc_BluHQinit
blufor_HELI_PILOT_X	=			"CUP_O_INS_Pilot";					//Rescue Pilot mission

blufor_BOAT_ARMED_X	=			"B_Boat_Armed_01_minigun_F";		//supports\taxi\fnc_boatTaxi
blufor_BOAT_CREW_X =			"B_Competitor_F";					//supports\taxi\fnc_boatTaxi

blufor_HELI_TRANS_ARM_X =		"CUP_O_Mi24_D_Dynamic_SLA";		//supports\taxi\fnc_helotaxi, random patrol
blufor_HELI_TRANS_UNARM_X =		"CUP_O_Mi8_CHDKZ";   			//random patrol
blufor_HELI_ATTACK_X =			"CUP_O_Mi24_D_Dynamic_SLA";		//dialog\fnc_request_hcATTchop, random patrol
blufor_PLANE_CAS_X =			"CUP_O_Su25_Dyn_SLA";			//dialog\fnc_request_hcCAS, random patrol
blufor_CAR_PATROL1_X =			"CUP_O_UAZ_MG_CHDKZ";			//random patrol
blufor_APC_PATROL1_X =			"CUP_O_BTR80A_CHDKZ";			//random patrol
blufor_APC_PATROL2_X =			"CUP_O_BMP2_CHDKZ";				//random patrol
blufor_TANK_PATROL1_X =			"CUP_O_T72_CHDKZ";				//random patrol


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"CUP_O_ZU23_TK";			// also "CUP_O_Igla_AA_pod_RU"
blufor_TURRET_AT =				"CUP_O_Kornet_RU";
blufor_TURRET_HMG =				"CUP_O_DSHKM_SLA";
blufor_TURRET_GMG =				"CUP_O_DSHKM_SLA";


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"CUP_O_RUS_SpecOps";					//operator
blufor_SPECOPS_GL_X =			"CUP_O_MVD_Soldier_TL";					//operator
blufor_SPECOPS_LAT_X =			"CUP_O_MVD_Soldier_AT";					//operator
blufor_SPECOPS_HAT_X =			"CUP_O_RU_Soldier_HAT_VDV";				//operator
blufor_SPECOPS_AA_X =			"CUP_O_RU_Soldier_AA_VDV";				//operator
blufor_SPECOPS_MG_X =			"CUP_O_MVD_Soldier_MG";					//operator
blufor_SPECOPS_MEDIC_X =		"CUP_O_RU_Medic_VDV";					//operator
blufor_SPECOPS_MARK_X =			"CUP_O_RUS_Soldier_Marksman";			//operator
blufor_SPECOPS_SNIPER_X =		"CUP_O_MVD_Sniper";						//operator
blufor_SPECOPS_EXP_X =			"CUP_O_RUS_Saboteur";					//operator
blufor_SPECOPS_ENG_X = 			"CUP_O_RU_Engineer_VDV";				//operator





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


blufor_RQST_UNIT_01_X = 			["CUP_O_INS_Soldier","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["CUP_O_INS_Soldier_GL","Grenadier (3CP)",3];
blufor_RQST_UNIT_03_X =				["CUP_O_INS_Soldier_AR","Automatic Rifleman (3CP)",3];
blufor_RQST_UNIT_04_X =				["CUP_O_INS_Soldier_MG","Heavy Gunner ",4];
blufor_RQST_UNIT_05_X =				["CUP_O_INS_Medic","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["CUP_O_INS_Soldier_LAT","AT Rifleman (3CP)",3];
blufor_RQST_UNIT_07_X =				["CUP_O_INS_Soldier_AT","AT Specialist (4CP)",4];
blufor_RQST_UNIT_08_X =				["CUP_O_INS_Soldier_AA","AA Specialist (4CP)",4];
blufor_RQST_UNIT_09_X =				["CUP_O_INS_Soldier_Engineer","Engineer (4CP)",4];
blufor_RQST_UNIT_10_X =				["CUP_O_INS_Woodlander2","Marksman (3CP)",3];
blufor_RQST_UNIT_11_X =				["CUP_O_INS_Sniper","Sniper (4CP)",4];
blufor_RQST_UNIT_12_X =				["empty",0,0];
blufor_RQST_UNIT_13_X =				["empty",0,0];
blufor_RQST_UNIT_14_X =				["empty",0,0];


///////////////////////////////
// dialog\fnc_request_vehicle
//   _index = lbCurSel 2102;
// dialog\fnc_request_vehicle_fob
//   _index = lbCurSel 2122;
////////////////////////////////

blufor_RQST_VEHICLE_01_X =			["B_Quadbike_01_F","ATV (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["C_Offroad_01_F","SF Offroader (2CP)",2];
blufor_RQST_VEHICLE_03_X =			["I_G_Van_01_transport_F","Transport Truck (6CP)",6];
blufor_RQST_VEHICLE_04_X =			["CUP_O_GAZ_Vodnik_PK_RU","GAZ Vodnik MG (10CP)",10];
blufor_RQST_VEHICLE_05_X =			["CUP_O_GAZ_Vodnik_AGS_RU","GAZ Vodnik GMG (18CP)",18];
blufor_RQST_VEHICLE_06_X =			["CUP_O_GAZ_Vodnik_BPPU_RU","GAZ Vodnik BPPU (25CP)",25];
blufor_RQST_VEHICLE_07_X =			["CUP_O_UAZ_Unarmed_CHDKZ","UAZ Unarmed (5CP)",5];
blufor_RQST_VEHICLE_08_X =			["CUP_O_UAZ_MG_CHDKZ","UAZ DshKm HMG (15CP)",15];
blufor_RQST_VEHICLE_09_X =			["CUP_O_UAZ_METIS_CHDKZ","UAZ Metis AT (20CP)",20];
blufor_RQST_VEHICLE_10_X =			["CUP_O_Ural_Open_CHDKZ","Ural Transport Uncovered (8CP)",8];
blufor_RQST_VEHICLE_11_X =			["CUP_O_Ural_CHDKZ","Ural Transport Covered (8CP)",8];
blufor_RQST_VEHICLE_12_X =			["CUP_O_Ural_Repair_CHDKZ","Ural Repair (15CP)",15];
blufor_RQST_VEHICLE_13_X =			["CUP_O_Ural_Reammo_CHDKZ","Ural Ammo (15CP)",15];
blufor_RQST_VEHICLE_14_X =			["CUP_O_Ural_Refuel_CHDKZ","Ural Fuel (15CP)",15];
blufor_RQST_VEHICLE_15_X =			["CUP_O_BRDM2_CHDKZ","BRDM-2 (28CP)",28];
blufor_RQST_VEHICLE_16_X =			["CUP_O_BRDM2_ATGM_CHDKZ","BRDM-2 ATGM (35CP)",35];
blufor_RQST_VEHICLE_17_X =			["CUP_O_BTR60_CHDKZ","BTR-60 (28CP)",28];
blufor_RQST_VEHICLE_18_X =			["CUP_O_BTR80_CHDKZ","BTR-80 (32CP)",32];
blufor_RQST_VEHICLE_19_X =			["CUP_O_BTR80A_CHDKZ","BTR-80A (35CP)",35];
blufor_RQST_VEHICLE_20_X =			["CUP_O_BMP2_CHDKZ","BMP-2 (30CP)",30];
blufor_RQST_VEHICLE_21_X =			["CUP_O_BMP_HQ_CHDKZ","BMP-2k (35CP)",35];
blufor_RQST_VEHICLE_22_X =			["CUP_O_T55_CHDKZ","T-55 Tank (35CP)",35];
blufor_RQST_VEHICLE_23_X =			["CUP_O_T72_CHDKZ","T-72 (40CP)",40];
blufor_RQST_VEHICLE_24_X =			["CUP_O_T90_RU","T-90A (50CP)",50];
blufor_RQST_VEHICLE_25_X =			["CUP_O_ZSU23_ChDKZ","ZSU-23 Tunguska (50CP)",50];
blufor_RQST_VEHICLE_26_X =			["CUP_O_BM21_CHDKZ","BM-21 Rockets (75CP)",75];
blufor_RQST_VEHICLE_27_X =			["B_Heli_Light_01_F","MH-9 Hummingbird (15CP)",15];
blufor_RQST_VEHICLE_28_X =			["CUP_O_UH1H_gunship_SLA","UH-1H Gunship (22CP)",22];
blufor_RQST_VEHICLE_29_X =			["CUP_O_Mi8_CHDKZ","MI-8 Trans Heli (25CP)",25];
blufor_RQST_VEHICLE_30_X =			["CUP_O_MI6A_CHDKZ","MI-6A Transport (40CP)",40];
blufor_RQST_VEHICLE_31_X =			["CUP_O_Mi24_D_Dynamic_SLA","MI-24D Armed (40CP",40];
blufor_RQST_VEHICLE_32_X =			["CUP_O_Su25_Dyn_SLA","SU-25 Frogfoot CAS (45CP)",45];
blufor_RQST_VEHICLE_33_X =			["CUP_O_SU34_SLA","SU-34 Sabre (50CP)",50];
blufor_RQST_VEHICLE_34_X =			["B_UAV_01_F","UAV Darter(5CP)",5];
blufor_RQST_VEHICLE_35_X =			["CUP_O_Pchela1T_RU","UAV Pchela 1T (15CP)",15];
blufor_RQST_VEHICLE_36_X =			["empty",0,0];
blufor_RQST_VEHICLE_37_X =			["empty",0,0];
blufor_RQST_VEHICLE_38_X =			["empty",0,0];
blufor_RQST_VEHICLE_39_X =			["empty",0,0];
blufor_RQST_VEHICLE_40_X =			["empty",0,0];
blufor_RQST_VEHICLE_41_X =			["empty",0,0];
blufor_RQST_VEHICLE_42_X =			["empty",0,0];
blufor_RQST_VEHICLE_43_X =			["empty",0,0];
blufor_RQST_VEHICLE_44_X =			["empty",0,0];
blufor_RQST_VEHICLE_45_X =			["empty",0,0];
blufor_RQST_VEHICLE_46_X =			["empty",0,0];
blufor_RQST_VEHICLE_47_X =			["empty",0,0];
blufor_RQST_VEHICLE_48_X =			["empty",0,0];
blufor_RQST_VEHICLE_49_X =			["empty",0,0];
blufor_RQST_VEHICLE_50_X =			["empty",0,0];



