Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},

	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Armory
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.8, -992.6, 24.9),			
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = false,
		maxDistance = 1.25
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 12,
		size = 2
	},

	-- Vinewood Police Station (Cells)

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 340.0,
		objCoords = vector3(614.06, -1.89, 82.78),			
		textCoords = vector3(614.06, -1.89, 82.78),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 160.98,
		objCoords = vector3(612.83, -11.05, 82.78),			
		textCoords = vector3(612.83, -11.05, 82.78),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 160.98,
		objCoords = vector3(609.13, -9.69, 82.78),			
		textCoords = vector3(609.13, -9.69, 82.78),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 160.98,
		objCoords = vector3(605.16, -8.26, 82.78),			
		textCoords = vector3(605.16, -8.26, 82.78),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 160.98,
		objCoords = vector3(601.37, -6.89, 82.78),			
		textCoords = vector3(601.37, -6.89, 82.78),
		authorizedJobs = {'police', 'tek', 'katonasag' },
		locked = true,
		maxDistance = 1.25
	},

	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 90.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},
	--sivuovi
	
		{
		textCoords = vector3(457.00, -972.28, 30.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 180.0, objCoords = vector3(457.4, -972.36, 30.72)},
			{objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 360.0, objCoords = vector3(455.2087, -972.2543, 30.81)}
		}
	},
	--sivuovi 2
			{
		textCoords = vector3(441.8, -998.73, 30.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 360.0, objCoords = vector3(440.7392, -998.7462, 30.8)},
			{objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 180.0, objCoords = vector3(443.0618,-998.7462,30.8153)}
		}
	},
	--tuplaovi
	{
		textCoords = vector3(469.43, -986.26, 30.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_mrpd_door_01'), objHeading = 270.0, objCoords = vector3(469.4406, -985.0313, 30.82319)},
			{objHash = GetHashKey('gabz_mrpd_door_01'), objHeading = 90.0, objCoords = vector3(469.4406,-987.4377,30.82319)}
		}
	},
--takaovi
	{
		textCoords = vector3(468.37, -1014.21, 26.42),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_mrpd_door_03'), objHeading = 180.0, objCoords = vector3(469.7743, -1014.406, 26)},
			{objHash = GetHashKey('gabz_mrpd_door_03'), objHeading = 360.0, objCoords = vector3(467.3686,-1014.406,26.48697)}
		}
	},
	
	

	-- 
	{
		objHash = GetHashKey('gabz_mrpd_door_05'),
		objHeading = 270.0,
		objCoords = vector3(458.6543, -990.6498, 30.82),
		textCoords = vector3(458.79, -989.36, 30.69),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- aulaovi1
	{
		objHash = GetHashKey('gabz_mrpd_door_04'),
		objHeading = 360.0,
		objCoords = vector3(440.5201, -977.6011, 30),
		textCoords = vector3(440.5201, -977.6011, 30),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- aulaovi2
	{
		objHash = GetHashKey('gabz_mrpd_door_05'),
		objHeading = 180.0,
		objCoords = vector3(440.5201, -986.2335, 30),
		textCoords = vector3(440.5201, -986.2335, 30),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	--Maken huone
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(458.6543, -990.6498, 30),
		textCoords = vector3(458.6543, -990.6498, 30.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Sairaala l‰‰ke
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 140.0,
		objCoords = vector3(355.72, -1387.28, 32.44),
		textCoords = vector3(355.72, -1387.28, 32.44),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	-- Sairaala tuplaovi
	{
		textCoords = vector3(348.56, -587.44, 43.28),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_cor_firedoor'), objHeading = 230.0, objCoords = vector3(348.96, -1421.6, 32.44)}, --oikee
			{objHash = GetHashKey('v_ilev_cor_firedoor'), objHeading = 50.0, objCoords = vector3(349.32, -1421.2, 32.44)} --vasen
		}
	},
	--Sairaalan toiset ovet
	{
		textCoords = vector3(364.36, -1413.08, 32.92),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor004'), objHeading = 320.0, objCoords = vector3(365.0, -1413.64, 32.92)}, --vasen
			{objHash = GetHashKey('v_ilev_ph_gendoor004'), objHeading = 140.0, objCoords = vector3(364.36, -1412.08, 32.92)} --oikee
		}
	},

	--
	-- Mission Row Cells
	--

	-- talli1
	{
		objHash = GetHashKey('gabz_mrpd_garage_door'),
		objHeading = 0.0,
		objCoords = vector3(451.76, -1001.28, 25.76),
		textCoords = vector3(451.76, -1001.28, 25.96),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 6.25
	},

	-- talli2
	{
		objHash = GetHashKey('gabz_mrpd_garage_door'),
		objHeading = 0.0,
		objCoords = vector3(430.76, -1001.28, 25.76),
		textCoords = vector3(430.76, -1001.28, 25.86),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 6.25
	},

	-- selli1
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 0.0,
		objCoords = vector3(477.9126, -1012.189, 26),
		textCoords = vector3(477.9126, -1012.189, 26),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell2
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 0.0,
		objCoords = vector3(480.9128, -1012.189, 26),
		textCoords = vector3(480.9128, -1012.189, 26),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	--selli3
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 0.0,
		objCoords = vector3(483.9127, -1012.189, 26.4),
		textCoords = vector3(483.9127, -1012.189, 26.4),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},
	--selli4
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 0.0,
		objCoords = vector3(486.9131, -1012.189, 26),
		textCoords = vector3(486.9131, -1012.189, 26),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},
	--selli5
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 180.0,
		objCoords = vector3(484.1764, -1007.734, 26),
		textCoords = vector3(484.1764, -1007.734, 26),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},
	
	
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 180.0,
		objCoords = vector3(481.0084, -1004.118, 26),
		textCoords = vector3(481.0084, -1004.118, 26),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = GetHashKey('gabz_mrpd_cells_door'),
		objHeading = 270.0,
		objCoords = vector3(476.6157, -1008.875, 26.48),
		textCoords = vector3(476.6157, -1008.875, 26.48),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},
	--Nikon ovi
	{
		objHash = GetHashKey('v_ilev_ra_door2'),
		objHeading = 300.0,
		objCoords = vector3(-556.49, -190.82, 70.123),
		textCoords = vector3(-556.49, -190.82, 70.123),
		authorizedJobs = {'gouvernement'},
		locked = true,
		maxDistance = 2.25
	},
	
	{
		objHash = GetHashKey('v_ilev_ra_door2'),
		objHeading = 300.0,
		objCoords = vector3(-556.04, -191.56, 65.44),
		textCoords = vector3(-556.04, -191.56, 65.44),
		authorizedJobs = {'gouvernement'},
		locked = true,
		maxDistance = 2.25
	},
	
	{
		objHash = GetHashKey('v_ilev_ra_door2'),
		objHeading = 300.0,
		objCoords = vector3(-556.24, -191.68, 60.92),
		textCoords = vector3(-556.24, -191.68, 60.92),
		authorizedJobs = {'gouvernement'},
		locked = true,
		maxDistance = 2.25
	},
	--nikon ovi kans ^^
	{
		objHash = GetHashKey('v_ilev_ra_door2'),
		objHeading = 300.0,
		objCoords = vector3(-556.08, -191.56, 56.28),
		textCoords = vector3(-556.08, -191.56, 56.28),
		authorizedJobs = {'gouvernement'},
		locked = true,
		maxDistance = 2.25
	},


	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 5,
		size = 2
	},



	

}