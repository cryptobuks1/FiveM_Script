Config                            = {}
Config.Locale                     = 'th'

Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 15, max = 40 }

Config.Vehicles = {
	'adder',
	'asea',
	'asterope',
	'banshee',
	'buffalo'
}

Config.Zones = {

	MechanicActions = {
		Pos   = { x = -346.9, y = -133.44, z = 39.01 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 0, b = 204 },
		Type  = 1
	},
--[[
	Garage = {
		Pos   = { x = -715.3, y = -1483.03, z = 4.30 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1,
	}, ]]

	--[[Craft = {
		Pos   = { x = -323.140, y = -129.882, z = 37.999 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},]]

	VehicleSpawnPoint = {
		Pos   = { x = -356.39, y = -111.27, z = 38.95, h = 156.42 },										
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = { x = -356.39, y = -111.27, z = 38.95 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 2
	},
--[[
	VehicleDelivery = {
		Pos   = { x = -691.35, y = -1414.97, z = 4.10 },
		Size  = { x = 20.0, y = 20.0, z = 3.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1,
	}]]
}

Config.Towables = {
	vector3(-2480.9, -212.0, 17.4),
	vector3(-2723.4, 13.2, 15.1),
	vector3(-3169.6, 976.2, 15.0),
	vector3(-3139.8, 1078.7, 20.2),
	vector3(-1656.9, -246.2, 54.5),
	vector3(-1586.7, -647.6, 29.4),
	vector3(-1036.1, -491.1, 36.2),
	vector3(-1029.2, -475.5, 36.4),
	vector3(75.2, 164.9, 104.7),
	vector3(-534.6, -756.7, 31.6),
	vector3(487.2, -30.8, 88.9),
	vector3(-772.2, -1281.8, 4.6),
	vector3(-663.8, -1207.0, 10.2),
	vector3(719.1, -767.8, 24.9),
	vector3(-971.0, -2410.4, 13.3),
	vector3(-1067.5, -2571.4, 13.2),
	vector3(-619.2, -2207.3, 5.6),
	vector3(1192.1, -1336.9, 35.1),
	vector3(-432.8, -2166.1, 9.9),
	vector3(-451.8, -2269.3, 7.2),
	vector3(939.3, -2197.5, 30.5),
	vector3(-556.1, -1794.7, 22.0),
	vector3(591.7, -2628.2, 5.6),
	vector3(1654.5, -2535.8, 74.5),
	vector3(1642.6, -2413.3, 93.1),
	vector3(1371.3, -2549.5, 47.6),
	vector3(383.8, -1652.9, 37.3),
	vector3(27.2, -1030.9, 29.4),
	vector3(229.3, -365.9, 43.8),
	vector3(-85.8, -51.7, 61.1),
	vector3(-4.6, -670.3, 31.9),
	vector3(-111.9, 92.0, 71.1),
	vector3(-314.3, -698.2, 32.5),
	vector3(-366.9, 115.5, 65.6),
	vector3(-592.1, 138.2, 60.1),
	vector3(-1613.9, 18.8, 61.8),
	vector3(-1709.8, 55.1, 65.7),
	vector3(-521.9, -266.8, 34.9),
	vector3(-451.1, -333.5, 34.0),
	vector3(322.4, -1900.5, 25.8)
}

Config.Uniforms = {
	recrue = {
		male = {
			tshirt_1=90, 	tshirt_2 = 0,
			torso_1=66, 	torso_2 = 0,
			decals_1=0, 	decals_2 = 0,
			arms=4,
			pants_1 = 24, 	pants_2=0,
			shoes = 9,
			hair_color_1 = 0, hair_color_2 = 0,
			glasses_1 = 5, 	glasses_2 = 5,
			hair_1 =18, 		hair_2=0,
			helmet_1=56, 	helmet_2=0,
			face=19,
			skin=34,
			
		},
		female = {
			torso_1=73,		
			tshirt_2=3,
			decals_2=0,
			glasses=0,
			hair_1=2,
			shoes=1,
			hair_color_2=0,
			glasses_1=19,
			skin=13,
			face=6,
			pants_2=5,
			tshirt_1=75,
			pants_1=37,
			helmet_1=57,
			torso_2=0,
			arms=14,
			sex=1,
			glasses_2=0,
			decals_1=0,
			hair_2=0,
			helmet_2=0,
			hair_color_1=0
		}
	},

	novice = {
		male = {
			tshirt_1=90, 	tshirt_2 = 0,
			torso_1=66, 	torso_2 = 0,
			decals_1=0, 	decals_2 = 0,
			arms=4,
			pants_1 = 24, 	pants_2=0,
			shoes = 9,
			hair_color_1 = 0, hair_color_2 = 0,
			glasses_1 = 5, 	glasses_2 = 5,
			hair_1 =18, 		hair_2=0,
			helmet_1=56, 	helmet_2=0,
			face=19,
			skin=34,
			
		},
		female = {
			torso_1=73,		
			tshirt_2=3,
			decals_2=0,
			glasses=0,
			hair_1=2,
			shoes=1,
			hair_color_2=0,
			glasses_1=19,
			skin=13,
			face=6,
			pants_2=5,
			tshirt_1=75,
			pants_1=37,
			helmet_1=57,
			torso_2=0,
			arms=14,
			sex=1,
			glasses_2=0,
			decals_1=0,
			hair_2=0,
			helmet_2=0,
			hair_color_1=0
		}
	},

	experimente = {
		male = {
			tshirt_1=90, 	tshirt_2 = 0,
			torso_1=66, 	torso_2 = 0,
			decals_1=0, 	decals_2 = 0,
			arms=4,
			pants_1 = 24, 	pants_2=0,
			shoes = 9,
			hair_color_1 = 0, hair_color_2 = 0,
			glasses_1 = 5, 	glasses_2 = 5,
			hair_1 =18, 		hair_2=0,
			helmet_1=56, 	helmet_2=0,
			face=19,
			skin=34,
			
		},
		female = {
			torso_1=73,		
			tshirt_2=3,
			decals_2=0,
			glasses=0,
			hair_1=2,
			shoes=1,
			hair_color_2=0,
			glasses_1=19,
			skin=13,
			face=6,
			pants_2=5,
			tshirt_1=75,
			pants_1=37,
			helmet_1=57,
			torso_2=0,
			arms=14,
			sex=1,
			glasses_2=0,
			decals_1=0,
			hair_2=0,
			helmet_2=0,
			hair_color_1=0
		}
	},

	chief = {
		male = {
			tshirt_1=90, 	tshirt_2 = 0,
			torso_1=66, 	torso_2 = 0,
			decals_1=0, 	decals_2 = 0,
			arms=4,
			pants_1 = 24, 	pants_2=0,
			shoes = 9,
			hair_color_1 = 0, hair_color_2 = 0,
			glasses_1 = 5, 	glasses_2 = 5,
			hair_1 =18, 		hair_2=0,
			helmet_1=56, 	helmet_2=0,
			face=19,
			skin=34,
			
		},
		female = {
			torso_1=73,		
			tshirt_2=3,
			decals_2=0,
			glasses=0,
			hair_1=2,
			shoes=1,
			hair_color_2=0,
			glasses_1=19,
			skin=13,
			face=6,
			pants_2=5,
			tshirt_1=75,
			pants_1=37,
			helmet_1=57,
			torso_2=0,
			arms=14,
			sex=1,
			glasses_2=0,
			decals_1=0,
			hair_2=0,
			helmet_2=0,
			hair_color_1=0
		}
	},

	boss = {
		male = {
			tshirt_1=90, 	tshirt_2 = 0,
			torso_1=66, 	torso_2 = 0,
			decals_1=0, 	decals_2 = 0,
			arms=4,
			pants_1 = 24, 	pants_2=0,
			shoes = 9,
			hair_color_1 = 0, hair_color_2 = 0,
			glasses_1 = 5, 	glasses_2 = 5,
			hair_1 =18, 		hair_2=0,
			helmet_1=56, 	helmet_2=0,
			face=19,
			skin=34,
			
		},
		female = {
			torso_1=73,		
			tshirt_2=3,
			decals_2=0,
			glasses=0,
			hair_1=2,
			shoes=1,
			hair_color_2=0,
			glasses_1=19,
			skin=13,
			face=6,
			pants_2=5,
			tshirt_1=75,
			pants_1=37,
			helmet_1=57,
			torso_2=0,
			arms=14,
			sex=1,
			glasses_2=0,
			decals_1=0,
			hair_2=0,
			helmet_2=0,
			hair_color_1=0
		}
	},
}

for k,v in ipairs(Config.Towables) do
	Config.Zones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end