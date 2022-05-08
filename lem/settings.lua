-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["settings"] = {
		["frequency"] = 1000;
	};
	["condition_events"] = {
		[1] = {
			["enabled"] = false;
			["name"] = "testevent1";
		};
		[2] = {
			["enabled"] = false;
			["name"] = "testevent2";
		};
	};
	["characters"] = {
		["Character1"] = {
			["condition_events"] = {
			};
			["text_events"] = {
				["testevent2"] = 1;
				["testevent1"] = 1;
			};
		};
	};
	["text_events"] = {
		[1] = {
			["enabled"] = true;
			["name"] = "testevent1";
			["pattern"] = "#*#say my name#*#";
		};
		[2] = {
			["enabled"] = true;
			["name"] = "testevent2";
			["pattern"] = "#*#say my class#*#";
		};
	};
}
return obj1
