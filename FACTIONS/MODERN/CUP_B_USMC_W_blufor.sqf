
///////////////
///////////////   "CUP_B_USMC", "CUP USMC Wood", "CUP_B_USMC_W"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"CUP_B_USMC_Soldier";					//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"CUP_B_USMC_Soldier_AT";				//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_GL_X =			"CUP_B_USMC_Soldier_GL";				//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_TL_X =			"CUP_B_USMC_Soldier_TL";				//initHQ\fnc_createpatrolFOB, initHQ\fnc_HQguards
blufor_SOLDIER_SL_X =			"CUP_B_USMC_Soldier_SL";				//Comms voice, Multiplayer slot
blufor_SOLDIER_AR_X =			"CUP_B_USMC_Soldier_AR";				//supports\fnc_paradrop, initHQ\fnc_HQguards
blufor_MARKSMAN_X = 			"CUP_B_USMC_Soldier_Marksman";			//initHQ\fnc_HQguards
blufor_OFFICER_X =				"CUP_B_USMC_Officer";					//initHQ\fnc_BluHQinit
blufor_HELI_PILOT_X	=			"CUP_B_USMC_Pilot";						//Rescue Pilot mission

blufor_CAN_DIFFUSE1_X =			"CUP_B_FR_Soldier_Exp";					//IED Defuser  EPD\Ied_Settings.sqf 
blufor_CAN_DIFFUSE2_X =			"CUP_B_USMC_Engineer";					//IED Defuser  EPD\Ied_Settings.sqf
IED_DEVICE_X =					"B_408_Ball";							//IED Device   EPD\IED\ExplosionFunctions.sqf

blufor_BOAT_ARMED_X	=			"CUP_B_RHIB_USMC";						//supports\taxi\fnc_boatTaxi
blufor_BOAT_CREW_X =			"C_Man_UtilityWorker_01_F";				//supports\taxi\fnc_boatTaxi

blufor_HELI_TRANS_ARM_X =		"CUP_B_MH60L_DAP_4x_USN";				//supports\taxi\fnc_helotaxi, random patrol
blufor_HELI_TRANS_UNARM_X =		"CUP_B_CH53E_VIV_USMC";  				//random patrol
blufor_HELI_ATTACK_X =			"CUP_B_AH1Z_Dynamic_USMC";				//dialog\fnc_request_hcATTchop, random patrol
blufor_PLANE_CAS_X =			"CUP_B_A10_DYN_USA";					//dialog\fnc_request_hcCAS, random patrol
blufor_CAR_PATROL1_X =			"CUP_B_HMMWV_M1114_USMC";				//random patrol
blufor_APC_PATROL1_X =			"CUP_B_M1126_ICV_M2_Woodland";			//random patrol
blufor_APC_PATROL2_X =			"CUP_B_M2A3Bradley_USA_W";				//random patrol
blufor_TANK_PATROL1_X =			"CUP_B_M1A1_Woodland_USMC";				//random patrol


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"CUP_B_CUP_Stinger_AA_pod_US";
blufor_TURRET_AT =				"CUP_B_TOW_TriPod_US";
blufor_TURRET_HMG =				"B_G_HMG_02_high_F";
blufor_TURRET_GMG =				"B_G_HMG_02_high_F";


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"CUP_B_FR_Soldier_Assault";				//operator
blufor_SPECOPS_GL_X =			"CUP_B_FR_Soldier_GL";					//operator
blufor_SPECOPS_LAT_X =			"CUP_B_USMC_Soldier_AT_FROG_WDL";		//operator 
blufor_SPECOPS_HAT_X =			"CUP_B_USMC_Soldier_HAT_FROG_WDL";		//operator
blufor_SPECOPS_AA_X =			"CUP_B_USMC_Soldier_AA_FROG_WDL";		//operator
blufor_SPECOPS_MG_X =			"CUP_B_USMC_Soldier_AR_FROG_WDL";		//operator
blufor_SPECOPS_MEDIC_X =		"CUP_B_FR_Medic";				 		//operator
blufor_SPECOPS_MARK_X	=		"CUP_B_FR_Soldier_Marksman";			//operator
blufor_SPECOPS_SNIPER_X =		"CUP_B_FR_Story_Sykes";					//operator
blufor_SPECOPS_EXP_X =			"CUP_B_FR_Soldier_Exp";					//operator
blufor_SPECOPS_ENG_X =			"CUP_B_USMC_Engineer_FROG_WDL"; 		//operator





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


blufor_RQST_UNIT_01_X = 			["CUP_B_USMC_Soldier","Rifleman (USMC) (2CP)",2];
blufor_RQST_UNIT_02_X =				["CUP_B_USMC_Soldier_GL","Grenadier (USMC) (3CP)",3];
blufor_RQST_UNIT_03_X =				["CUP_B_USMC_Soldier_AR","Automatic Rifleman (USMC) (3CP)",3];
blufor_RQST_UNIT_04_X =				["CUP_B_USMC_Soldier_MG","Heavy Gunner (USMC) (4CP)",4];
blufor_RQST_UNIT_05_X =				["CUP_B_USMC_Medic","Medic (USMC) (4CP)",4];
blufor_RQST_UNIT_06_X =				["CUP_B_USMC_Soldier_AT","AT Rifleman (USMC) (3CP)",3];
blufor_RQST_UNIT_07_X =				["CUP_B_USMC_Soldier_HAT","AT Specialist (USMC) (4CP)",4];
blufor_RQST_UNIT_08_X =				["CUP_B_USMC_Soldier_AA","AA Specialist (USMC) (4CP)",4];
blufor_RQST_UNIT_09_X =				["CUP_B_USMC_Engineer","Engineer (USMC) (4CP)",4];
blufor_RQST_UNIT_10_X =				["CUP_B_USMC_Engineer","Engineer (USMC) (4CP)",4];
blufor_RQST_UNIT_11_X =				["CUP_B_FR_Soldier_Exp","Explosive Specialist (Frog) (4CP)",4];
blufor_RQST_UNIT_12_X =				["CUP_B_USMC_Spotter","Spotter (USMC) (3CP)",3];
blufor_RQST_UNIT_13_X =				["CUP_B_USMC_Soldier_Marksman","Marksman (USMC) (3CP)",3];
blufor_RQST_UNIT_14_X =				["CUP_B_USMC_Sniper_M40A3","Sniper (USMC) (4CP)",4];


///////////////////////////////
// dialog\fnc_request_vehicle
//   _index = lbCurSel 2102;
// dialog\fnc_request_vehicle_fob
//   _index = lbCurSel 2122;
////////////////////////////////

blufor_RQST_VEHICLE_01_X =			["B_Quadbike_01_F","ATV (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["C_Offroad_01_F","SF Offroader (2CP)",2];
blufor_RQST_VEHICLE_03_X =			["I_G_Van_01_transport_F","Transport Truck (6CP)",6];
blufor_RQST_VEHICLE_04_X =			["CUP_B_HMMWV_Unarmed_USMC","HMMWV Unarmed (5CP)",5];
blufor_RQST_VEHICLE_05_X =			["CUP_B_HMMWV_M1114_USMC","HMMWV HMG (8CP)",8];
blufor_RQST_VEHICLE_06_X =			["CUP_B_M1151_Mk19_USMC","HMMWV GMG (18CP)",18];
blufor_RQST_VEHICLE_07_X =			["CUP_B_M1167_USMC","HMMWV TOW (25CP)",25];
blufor_RQST_VEHICLE_08_X =			["CUP_B_RG31_M2_OD_USMC","RG-31 HMG (10CP)",10];
blufor_RQST_VEHICLE_09_X =			["CUP_B_RG31_Mk19_OD_USMC","RG-31 GMG (18CP)",18];
blufor_RQST_VEHICLE_10_X =			["CUP_B_RG31E_M2_OD_USMC","RG-31E Mk5E (25CP)",25];
blufor_RQST_VEHICLE_11_X =			["CUP_B_MTVR_USMC","MTVR Transport Covered (8CP)",8];
blufor_RQST_VEHICLE_12_X =			["CUP_B_MTVR_Repair_USMC","MTVR Repair (15CP)",15];
blufor_RQST_VEHICLE_13_X =			["CUP_B_MTVR_Ammo_USMC","MTVR Ammo (15CP)",15];
blufor_RQST_VEHICLE_14_X =			["CUP_B_MTVR_Refuel_USMC","MTVR Fuel (15CP)",15];
blufor_RQST_VEHICLE_15_X =			["CUP_B_M1126_ICV_M2_Woodland","M1126 HMG crows (25CP)",25];
blufor_RQST_VEHICLE_16_X =			["CUP_B_M1126_ICV_MK19_Woodland","M1126 GMG crows (28CP)",28];
blufor_RQST_VEHICLE_17_X =			["CUP_B_M1128_MGS_Woodland","M1126 MGS cannon (30CP)",30];
blufor_RQST_VEHICLE_18_X =			["CUP_B_LAV25_USMC","LAV-25 Bushmaster (30CP)",30];
blufor_RQST_VEHICLE_19_X =			["CUP_B_LAV25M240_USMC","LAV-25 Bush/M240 (32CP)",32];
blufor_RQST_VEHICLE_20_X =			["CUP_B_AAV_USMC","AAVP7 (35CP)",35];
blufor_RQST_VEHICLE_21_X =			["CUP_B_M2A3Bradley_USA_W","Bradley ERA (35CP)",35];
blufor_RQST_VEHICLE_22_X =			["CUP_B_M60A3_TTS_USMC","M-60A3 Tank  (38CP)",38];
blufor_RQST_VEHICLE_23_X =			["CUP_B_M1A1_Woodland_USMC","M1A1 Tank (40CP)",40];
blufor_RQST_VEHICLE_24_X =			["CUP_B_M1A2_TUSK_MG_USMC","M1A2 TUSK (45CP)",45];
blufor_RQST_VEHICLE_25_X =			["CUP_B_M270_DPICM_USMC","M270 DPICM Artillery (60CP)",60];
blufor_RQST_VEHICLE_26_X =			["CUP_B_M270_HE_USMC","M270 HE Artillery (65CP)",65];
blufor_RQST_VEHICLE_27_X =			["CUP_B_MH6J_USA","MH-6J Littlebird (15CP)",15];
blufor_RQST_VEHICLE_28_X =			["CUP_B_AH6M_USA","AH-6M Armed (25CP)",25];
blufor_RQST_VEHICLE_29_X =			["CUP_B_UH1Y_Gunship_Dynamic_USMC","UH-1Y Venom Gunship (25CP",45];
blufor_RQST_VEHICLE_30_X =			["CUP_B_AH1Z_Dynamic_USMC","AH-1Z Cobra (40CP)",40];
blufor_RQST_VEHICLE_31_X =			["CUP_B_MH60S_USMC","MH-60S Seahawk (22CP)",22];
blufor_RQST_VEHICLE_32_X =			["CUP_B_MH60L_DAP_4x_USN","MH-60L Knighthawk ESSSx4 (35CP)",35];
blufor_RQST_VEHICLE_33_X =			["CUP_B_CH53E_USMC","CH-53E SeaKnight (26CP)",26];
blufor_RQST_VEHICLE_34_X =			["CUP_B_A10_DYN_USA","A-10 Warthog (45CP)",45];
blufor_RQST_VEHICLE_35_X =			["CUP_B_AV8B_DYN_USMC","AV-8B Harrier (50CP)",50];
blufor_RQST_VEHICLE_36_X =			["CUP_B_F35B_USMC","F-35B Lightning (55CP)",55];
blufor_RQST_VEHICLE_37_X =			["CUP_B_MV22_USMC_RAMPGUN","MV-22 OSPREY (30CP)",30];
blufor_RQST_VEHICLE_38_X =			["B_UAV_01_F","UAV Darter(5CP)",5];
blufor_RQST_VEHICLE_39_X =			["CUP_B_USMC_DYN_MQ9","UAV MQ-9 Reaper (USMC)(15CP)",15];
blufor_RQST_VEHICLE_40_X =			["B_UGV_01_rcws_F","UGV Stomper RCWS (20CP)",20];
blufor_RQST_VEHICLE_41_X =			["B_T_UAV_03_dynamicLoadout_F","MQ-12 UAV (20CP)",20];
blufor_RQST_VEHICLE_42_X =			["empty",0,0];
blufor_RQST_VEHICLE_43_X =			["empty",0,0];
blufor_RQST_VEHICLE_44_X =			["empty",0,0];
blufor_RQST_VEHICLE_45_X =			["empty",0,0];
blufor_RQST_VEHICLE_46_X =			["empty",0,0];
blufor_RQST_VEHICLE_47_X =			["empty",0,0];
blufor_RQST_VEHICLE_48_X =			["empty",0,0];
blufor_RQST_VEHICLE_49_X =			["empty",0,0];
blufor_RQST_VEHICLE_50_X =			["empty",0,0];


