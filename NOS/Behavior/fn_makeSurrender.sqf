//"Return maximum of first and second argument";
params ["_unit"];

if !(isServer) exitWith {};

// TODO -- if not civ, call makeCiv just in case.
["ACE_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;

