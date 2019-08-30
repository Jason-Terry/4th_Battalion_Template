//"Return maximum of first and second argument";
params ["_unit"];

if !(isServer) exitWith {};


["ACE_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;

