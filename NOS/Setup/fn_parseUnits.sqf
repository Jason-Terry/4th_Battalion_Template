// List all HVT

sleep 1;
_allVars = allVariables missionNamespace;
_allVars sort true;

if (DEBUG) then {
	"PREPING PARSE UNITS" remoteExec ["systemChat"];
	["Total _var to check: ", count _AllVars] joinString  " " remoteExec ["systemChat"];
};

_allVars apply { 
	_var = _x splitString "_";
	switch (_var select 0) do {
		case "hvt": { 
			NOS_HVT_LIST pushBackUnique _x;
		};
		case "pat": { 
			NOS_PAT_LIST pushBackUnique _x;
		};
		case "grs": { 
			NOS_GRS_LIST pushBackUnique _x;
		};
		case "sen": { 
			NOS_SEN_LIST pushBackUnique _x;
		};
		case "qrf": { 
			NOS_QRF_LIST pushBackUnique _x;
		};
		case "ars": { 
			NOS_ARS_LIST pushBackUnique _x;
		};
		default { };
	};
};

if (DEBUG) then {
	["HVT Count: ", count NOS_HVT_LIST] joinString  " " remoteExec ["systemChat"];
	["HVT Content: ", NOS_HVT_LIST] joinString  " " remoteExec ["systemChat"];
	sleep 2;
	["PAT Count: ", count NOS_PAT_LIST] joinString  " " remoteExec ["systemChat"];
	["PAT Content: ", NOS_PAT_LIST] joinString  " " remoteExec ["systemChat"];
	sleep 2;
	["GRS Count: ", count NOS_GRS_LIST] joinString  " " remoteExec ["systemChat"];
	["GRS Content: ", NOS_GRS_LIST] joinString  " " remoteExec ["systemChat"];
	sleep 2;
	["SEN Count: ", count NOS_SEN_LIST] joinString  " " remoteExec ["systemChat"];
	["SEN Content: ", NOS_SEN_LIST] joinString  " " remoteExec ["systemChat"];
	sleep 2;
	["QRF Count: ", count NOS_QRF_LIST] joinString  " " remoteExec ["systemChat"];
	["QRF Content: ", NOS_QRF_LIST] joinString  " " remoteExec ["systemChat"];
	sleep 2;
	["ARS Count: ", count NOS_ARS_LIST] joinString  " " remoteExec ["systemChat"];
	["ARS Content: ", NOS_ARS_LIST] joinString  " " remoteExec ["systemChat"];
};

true
