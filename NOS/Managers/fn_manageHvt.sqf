// Get the closest BLUFOR unit to the HVT.
params ["_unit"];

if !(isServer) exitWith {};
// TODO check for shit
_hvt = _unit;


if (isNull _hvt) exitWith {
	if (DEBUG) then { "HVT has not been setup." remoteExec ["systemChat"]; };
};

// "HVT setup! aTracking HVT!" remoteExec ["systemChat"]; 
_hvtLocation = createMarker ["hvtLocation_999", position _hvt];
_hvtLocation setMarkerSize [75, 75];
_hvt setVariable ["isHostile", true];


// Build Debug Marker
if (DEBUG) then {
		_hvtLocation setMarkerAlpha 0.7;
		_hvtLocation setMarkerShape "ELLIPSE";
		_hvtLocation setMarkerColor "ColorGUER";
		sleep 5;
};
// if dead break
// if cuffed break
// if non hostile
// else
	// if alone
		// set non hostile
// KICKOFF TRACKING
// while alive, and not captured
while {alive _hvt} do {
	
	_isCuffed = _hvt getVariable ["ace_captives_isHandcuffed", false];
	_isHostile = _hvt getVariable ["isHostile", true];

	if !(alive _hvt) exitWith {
		if (DEBUG) then {
			"HVT HAS DIED!" remoteExec ["systemChat"]; 
		};
	};

	if (_isCuffed) exitWith {
		if (DEBUG) then {
			"HVT HAS BEEN CAPTURED!" remoteExec ["systemChat"]; 
		};
	};

	// Update HVT pos
	// _oldLocation = _hvtLocation;
	_hvtLocation setMarkerPos position _hvt;
	// Slow down for debug output
	if (DEBUG) then {
		"HVT marker updated!" remoteExec ["systemChat"];
		sleep 5;
	};

	// IF HOSTILE CHECKS
	if (_isHostile) then {
		if (DEBUG) then {
			"HVT IS HOSTILE!" remoteExec ["systemChat"];
		};

		// check team status
		_teamAlive = units group _hvt inAreaArray _hvtLocation select { alive _x; };
		if (count _teamAlive == 1) then {
			if (DEBUG) then {
				"HVT IS NOW NON HOSTILE!" remoteExec ["systemChat"];
			};
			_hvt setVariable ["isHostile", false];
			[_hvt] call NOS_fnc_makeCiv;
		} else {
			if (DEBUG) then {
				["HVT group members supporting! Count: ", count _teamAlive] joinString  " " remoteExec ["systemChat"];
			}
		}
	// END OF HOSTILE CHECKS

	// NON HOSTILE
	} else {		
		if (DEBUG) then {
			"HVT IS NON HOSTILE!" remoteExec ["systemChat"];
		};
		// if notNeatBlu
		_nearPlayer = [_hvt] call NOS_fnc_isNearPlayer;
		if (DEBUG) then {
			["Is near player", _nearPlayer] joinString  " " remoteExec ["systemChat"];
			sleep 5;
		};
		if (_nearPlayer) then {
			// surrender
			doStop _hvt;
			if (DEBUG) then {
				"HVT IS SURRENDERING!" remoteExec ["systemChat"];
			};
			[_hvt] call NOS_fnc_makeSurrender;
		} else {
			if (DEBUG) then {
				"HVT IS NOW RUNNING!" remoteExec ["systemChat"];
			};

			// TODO -- Currently the HVT will run to a random waypoint given a random building pos and attempt to hide.
			// Would like to make this more refined, and set HVT 'safe' zones, or something a bit more realistic.
			[_hvt] call NOS_fnc_makeNotSurrender;			
			_posList = [];

			// TODO IS THIS DANGEROUS
			// This should be a switched single call
			// If unit isHiding, do nothing.
			// Else tell him to hide.

			//while {count _posList == 0} do {
			//	_posList = [HVT, false, 20] call Zen_FindBuildingPositions;
			//	if (DEBUG) then {
			//		["Possible pos:", _posList] joinString  " " remoteExec ["systemChat"];
			//	};
			//};
			//_pos = selectRandom _posList;
			//[HVT, _pos, "full", "safe", "green"] call Zen_OrderInfantryMove;
		};
	}; // END
	sleep 1;
};