class CfgFunctions
{
	class NOS	{
		tag = "NOS";
		class Utilsm
		{
			file = "NOS\Utils";
			class getArsenalArray {};
			class isNearPlayer {};
		};

		class Debug
		{
			file = "NOS\Debug";
			class log {};
		};

		class Setup
		{
			file = "NOS\Setup";
			
			class setup {};
			class parseUnits {};
			class setupEventHandlers {};
		};

		class Managers
		{
			file = "NOS\Managers";
			class manageHvt {};
		};

		class Behavior
		{
			file = "NOS\Behavior";
			class makeCiv {};
			class makeNotSurrender {};
			class makeSurrender {};
		};
	};
};