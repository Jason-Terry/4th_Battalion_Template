#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
// 4th Ranger Battalion - S-2 TEST FRAMEWORK by JAY CODES
// 8.10.19
// Tested with ArmA 3 ??

// This will fade in from black, to hide jarring actions at mission start, this is optional and you can change the value
// Some functions may not continue running properly after loading a saved game, do not delete this line

enableSaving [false, false];
// All clients stop executing here, do not delete this line
if (!isServer) exitWith {};
// Execution stops until the mission begins (past briefing), do not delete this line
sleep 1;

// Enter the mission code here

DEBUG = false;

if (DEBUG) then { 
	"DEBUG ENABLED" remoteExec ["systemChat"]; 
};

east setFriend [civilian,1];
civilian setFriend [east,1];

// TODO -- CIV Realtions
// west setFriend [civilian,1];
// civilian setFriend [west,1];

// fire jay coop framework init
_nos_init_res = [] call NOS_fnc_setup;

(true);
