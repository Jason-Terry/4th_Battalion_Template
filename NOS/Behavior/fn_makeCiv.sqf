
//"Return maximum of first and second argument";
params ["_unit"];

if !(isServer) exitWith {};

[_unit] joinSilent createGroup civilian;
_unit setBehaviour "careless";
{
	_unit removeWeapon _x;
	sleep .1;
	_weaponHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
	_weaponHolder addWeaponCargoGlobal [_x, 1];
	_weaponHolder setPos (_unit modelToWorld [0,.2,1.2]);
	_weaponHolder disableCollisionWith _unit;
	_dir = random(360);
	_speed = 1.5;
	_weaponHolder setVelocity [_speed * sin(_dir), _speed * cos(_dir),4];  
	
} forEach weapons _unit;

