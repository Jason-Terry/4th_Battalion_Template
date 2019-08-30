// parse
// GLOBAL CONTAINERS
NOS_HVT_LIST = [];
NOS_PAT_LIST = [];
NOS_GRS_LIST = [];
NOS_SEN_LIST = [];
NOS_QRF_LIST = [];
NOS_ARS_LIST = [];

_nos_ev_res = [] call NOS_fnc_setupEventHandlers;
_nos_pu_res = [] call NOS_fnc_parseUnits;
_ars_arr = [] call NOS_fnc_getArsenalArray;

// apply
if (count NOS_HVT_LIST > 0) then {
	NOS_HVT_LIST apply { 
		[missionNamespace getVariable _x] spawn NOS_fnc_manageHvt; 
	}; 
};

if (count NOS_ARS_LIST > 0) then {
	NOS_ARS_LIST apply { 
		if (DEBUG) then {
			["Attempting To Setup Ace Arsenal: ", _x] joinString  " " remoteExec ["systemChat"];
		};
		[missionNamespace getVariable _x, _ars_arr] call ace_arsenal_fnc_initBox; 
	}; 
};
// verify