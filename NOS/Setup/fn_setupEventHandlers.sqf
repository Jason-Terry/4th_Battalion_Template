

// Track when HVT's get captured.
["ace_captiveStatusChanged", {
    params ["_unit", "_state", "_reason"];

    if (_state) then {
        // [format ["%1 |IF| captive state changed with reason %2", name _unit, _reason]] remoteExec ["systemChat"];
    } else {
        // [format ["%1 |ELSE| captive state changed with reason %2", name _unit, _reason]] remoteExec ["systemChat"];
    };
}] call CBA_fnc_addEventHandler;


true;