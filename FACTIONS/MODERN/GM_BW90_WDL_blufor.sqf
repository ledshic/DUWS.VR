
///////////////
///////////////   "gm_fc_ge", "GM German Bundeswehr 90s (Wood) + USA (3CB)", "GM_BW90_WDL"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"gm_ge_army_rifleman_g36a1_90_flk";				//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"gm_ge_army_antitank_g36a1_pzf3_90_flk";		//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_GL_X =			"gm_ge_army_grenadier_hk69a1_90_flk";			//initHQ\fnc_HQguards, supports\fnc_paradrop
blufor_SOLDIER_TL_X =			"gm_ge_army_squadleader_g36a1_p2a1_90_flk";		//initHQ\fnc_createpatrolFOB, initHQ\fnc_HQguards
blufor_SOLDIER_SL_X =			"gm_ge_army_radioman_g36a1_90_flk";				//Comms voice, Multiplayer slot
blufor_SOLDIER_AR_X =			"gm_ge_army_machinegunner_mg3_90_flk";			//supports\fnc_paradrop, initHQ\fnc_HQguards
blufor_MARKSMAN_X = 			"gm_ge_army_marksman_g3a3_90_flk";				//initHQ\fnc_HQguards
blufor_OFFICER_X =				"gm_ge_army_officer_p1_90_flk";					//initHQ\fnc_BluHQinit
blufor_HELI_PILOT_X	=			"gm_ge_army_pilot_p1_80_oli";					//Rescue Pilot mission

blufor_BOAT_ARMED_X	=			"UK3CB_TKA_B_RHIB_Gunboat";						//supports\taxi\fnc_boatTaxi
blufor_BOAT_CREW_X =			"gm_ge_army_rifleman_g36a1_90_flk";				//supports\taxi\fnc_boatTaxi

blufor_HELI_TRANS_ARM_X =		"UK3CB_CW_US_B_LATE_UH60M";						//supports\taxi\fnc_helotaxi, random patrol
blufor_HELI_TRANS_UNARM_X =		"gm_ge_army_ch53g";   							//random patrol
blufor_HELI_ATTACK_X =			"UK3CB_CW_US_B_LATE_AH64";						//dialog\fnc_request_hcATTchop, random patrol
blufor_PLANE_CAS_X =			"UK3CB_CW_US_B_LATE_A10";						//dialog\fnc_request_hcCAS, random patrol
blufor_CAR_PATROL1_X =			"gm_ge_army_fuchsa0_engineer";					//random patrol
blufor_APC_PATROL1_X =			"gm_ge_army_luchsa2";							//random patrol
blufor_APC_PATROL2_X =			"gm_ge_army_marder1a2";							//random patrol
blufor_TANK_PATROL1_X =			"gm_ge_army_Leopard1a5";						//random patrol


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"UK3CB_CW_US_B_LATE_Stinger_AA_pod";
blufor_TURRET_AT =				"UK3CB_CW_US_B_LATE_TOW_TriPod";
blufor_TURRET_HMG =				"UK3CB_CW_US_B_LATE_M2_TriPod";
blufor_TURRET_GMG =				"UK3CB_CW_US_B_LATE_MK19_TriPod";


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"gm_ge_army_rifleman_g36a1_90_flk";					//operator
blufor_SPECOPS_GL_X =			"gm_ge_army_grenadier_hk69a1_90_flk";				//operator
blufor_SPECOPS_LAT_X =			"gm_ge_army_antitank_g36a1_pzf3_90_flk";			//operator
blufor_SPECOPS_HAT_X =			"gm_ge_army_antitank_g36a1_pzf3_90_flk";			//operator
blufor_SPECOPS_AA_X =			"gm_ge_army_antiair_g36a1_fim43_90_flk";			//operator
blufor_SPECOPS_MG_X =			"gm_ge_army_machinegunner_mg3_90_flk";				//operator
blufor_SPECOPS_MEDIC_X =		"gm_ge_army_medic_g36a1_90_flk";					//operator
blufor_SPECOPS_MARK_X =			"gm_ge_army_marksman_g3a3_90_flk";					//operator
blufor_SPECOPS_SNIPER_X =		"gm_ge_army_marksman_g3a3_90_flk";					//operator
blufor_SPECOPS_EXP_X =			"gm_ge_army_demolition_g36a1_90_flk";				//operator
blufor_SPECOPS_ENG_X = 			"gm_ge_army_engineer_g36a1_90_flk";					//operator





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


blufor_RQST_UNIT_01_X = 			["gm_ge_army_rifleman_g36a1_90_flk","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["gm_ge_army_grenadier_hk69a1_90_flk","Grenadier (GraPi) (3CP)",3];
blufor_RQST_UNIT_03_X =				["gm_ge_army_machinegunner_mg3_90_flk","Machinegunner (MG3) (3CP)",3];
blufor_RQST_UNIT_04_X =				["gm_ge_army_demolition_g36a1_90_flk","Explosive Specialist (4CP)",4];
blufor_RQST_UNIT_05_X =				["gm_ge_army_medic_g36a1_90_flk","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["gm_ge_army_antitank_g36a1_pzf3_90_flk","AT Specialist (4CP)",4];
blufor_RQST_UNIT_07_X =				["gm_ge_army_antiair_g36a1_fim43_90_flk","AA Specialist (4CP)",4];
blufor_RQST_UNIT_08_X =				["gm_ge_army_engineer_g36a1_90_flk","Engineer (4CP)",4];
blufor_RQST_UNIT_09_X =				["gm_ge_army_marksman_g3a3_90_flk","Marksman (3CP)",3];
blufor_RQST_UNIT_10_X =				["gm_ge_army_crew_90_flk","Crewman (2CP)",4];
blufor_RQST_UNIT_11_X =				["gm_ge_army_antitank_g36a1_milan_90_flk","Rifleman (Milan) (4CP)",4];
blufor_RQST_UNIT_12_X =				["empty",0,0];
blufor_RQST_UNIT_13_X =				["empty",0,0];
blufor_RQST_UNIT_14_X =				["empty",0,0];


///////////////////////////////
// dialog\fnc_request_vehicle
//   _index = lbCurSel 2102;
// dialog\fnc_request_vehicle_fob
//   _index = lbCurSel 2122;
////////////////////////////////

blufor_RQST_VEHICLE_01_X =			["gm_ge_army_k125","Krad K125 (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["gm_ge_army_iltis_cargo","Iltis (Unarmed) (2CP)",4];
blufor_RQST_VEHICLE_03_X =			["gm_ge_army_iltis_mg3","Iltis (MG3) (6CP)",6];
blufor_RQST_VEHICLE_04_X =			["gm_ge_army_iltis_milan","Iltis (AT) (8CP)",8];
blufor_RQST_VEHICLE_05_X =			["gm_ge_army_u1300l_cargo","U1300 (Cargo) (8CP)",8];
blufor_RQST_VEHICLE_06_X =			["gm_ge_army_u1300l_repair","U1300 (Repair) (15CP)",15];
blufor_RQST_VEHICLE_07_X =			["gm_ge_army_u1300l_medic","U1300 Medic (15CP)",15];
blufor_RQST_VEHICLE_08_X =			["gm_ge_army_kat1_451_cargo","KAT1 451 (Cargo) (10CP)",10];
blufor_RQST_VEHICLE_09_X =			["gm_ge_army_kat1_451_reammo","KAT1 451 (Ammo) (15CP)",15];
blufor_RQST_VEHICLE_10_X =			["gm_ge_army_kat1_451_refuel","KAT1 451 (Fuel) (15CP)",15];
blufor_RQST_VEHICLE_11_X =			["gm_ge_army_fuchsa0_engineer","Fuchs (MG) (15CP)",15];
blufor_RQST_VEHICLE_12_X =			["gm_ge_army_fuchsa0_reconnaissance","Fuchs (AT) (18CP)",18];
blufor_RQST_VEHICLE_13_X =			["gm_ge_army_m113a1g_apc","M113 (MG) (15CP)",15];
blufor_RQST_VEHICLE_14_X =			["gm_ge_army_m113a1g_apc_milan","M113 (AT) (18CP)",18];
blufor_RQST_VEHICLE_15_X =			["gm_ge_army_marder1a2","Marder 1A2 (30CP)",30];
blufor_RQST_VEHICLE_16_X =			["gm_ge_army_luchsa2","Luchs 2A1 (25CP)",25];
blufor_RQST_VEHICLE_17_X =			["gm_ge_army_Leopard1a5","Leopard 1A5 (35CP)",35];
blufor_RQST_VEHICLE_18_X =			["gm_ge_army_gepard1a1","Gepard 1A1 (30CP)",30];
blufor_RQST_VEHICLE_19_X =			["gm_ge_army_ch53gs","CH53GS (20CP)",20];
blufor_RQST_VEHICLE_20_X =			["gm_ge_army_bo105p_pah1a1","PAH 1A1 (20CP)",20];
blufor_RQST_VEHICLE_21_X =			["gm_ge_army_bo105p1m_vbh_swooper","VBH Swooper (15CP)",15];
blufor_RQST_VEHICLE_22_X =			["UK3CB_CW_US_B_LATE_UH1H_GUNSHIP","UH-1H Gunship (USA) (30CP)",30];
blufor_RQST_VEHICLE_23_X =			["UK3CB_CW_US_B_LATE_AH64","AH64 (USA) (45CP)",45];
blufor_RQST_VEHICLE_24_X =			["UK3CB_CW_US_B_LATE_UH60M","UH60M Armed (USA) (25CP)",25];
blufor_RQST_VEHICLE_25_X =			["UK3CB_CW_US_B_LATE_A10","A10 (USA) (45CP)", 45];
blufor_RQST_VEHICLE_26_X =			["UK3CB_CW_US_B_LATE_M109","M109 (USA) (50CP)",50];
blufor_RQST_VEHICLE_27_X =			["empty",0,0];
blufor_RQST_VEHICLE_28_X =			["empty",0,0];
blufor_RQST_VEHICLE_29_X =			["empty",0,0];
blufor_RQST_VEHICLE_30_X =			["empty",0,0];
blufor_RQST_VEHICLE_31_X =			["empty",0,0];
blufor_RQST_VEHICLE_32_X =			["empty",0,0];
blufor_RQST_VEHICLE_33_X =			["empty",0,0];
blufor_RQST_VEHICLE_34_X =			["empty",0,0];
blufor_RQST_VEHICLE_35_X =			["empty",0,0];
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


