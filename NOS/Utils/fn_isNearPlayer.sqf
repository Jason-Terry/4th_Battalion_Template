params ["_unit"];

if !(isServer) exitWith {};
if (isNull _unit) exitWith {};
_retVal = false;
{
	if (isPlayer _x && alive _x) then {
		_dist =	_x distance _unit; 
		if (_dist < 15) then {
			if (DEBUG) then {
				["Player:", name _x, "Within 15 Meters Of HVT!"] joinString  " " remoteExec ["systemChat"];
			};
			_retVal = true;
		};
	};
} forEach allPlayers;

if (DEBUG) then {
	["No player Within 15 Meters Of HVT!"] remoteExec ["systemChat"];
};

(_retVal)
