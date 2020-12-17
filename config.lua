Config                            = {}

Config.DrawDistance               = 30.0
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerHelikopter           = { x = 6.0, y = 6.0, z = 2.5 }
Config.MarkerAuto                 = { x = 3.0, y = 3.0, z = 3.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.Locale                     = 'en'

Config.MarkerTypes = {
	Brodovi = 35,
	BossMeni = 31,
	SpawnAuta = 36,
	ObicanMarker = 27,
	Helikopteri = 34,
	VracanjeAuta = 1,
	Oruzarnica = 21
}

Config.Mafije = {

	vagos = { -- rijeseno
		Armories = {vector3(-1129.65, -1604.64, 4.4)},
		Vehicles = {vector3(-1123.79, -1611.55, 4.4)},
		MeniVozila = {
			Vozilo1 = 'schlagen',
			Vozilo2 = 'seminole',
			Vozilo3 = 'enduro',
		},
		BossActions = {vector3(-1119.86, -1624.39, 4.4)},
		ParkirajAuto = {vector3(-1108.21, -1602.68, 3.68),},
	},

	automafija = {-- rijeseno
		Armories = {vector3(973.46, -1811.45, 31.27)},
		Vehicles = {vector3(969.40, -1824.04, 31.09)},
		MeniVozila = {
			Vozilo1 = 'schlagen',
			Vozilo2 = 'seminole',
			Vozilo3 = 'enduro',
		},
		BossActions = {vector3(967.79, -1828.88, 31.23)},
		ParkirajAuto = {vector3(976.14, -1828.74, 30.17),},
	},

	pinkpanteri = {-- rijeseno
		Armories = {vector3(7.96, 530.04, 170.62)},
		Vehicles = {vector3(13.95, 548.18, 176.14)},
		MeniVozila = {
			Vozilo1 = 'buffalo',
			Vozilo2 = 'seminole',
			Vozilo3 = 'enduro',
		},
		BossActions = {vector3(-7.03, 530.56, 175.0)},
		ParkirajAuto = {vector3(22.49, 544.42, 175.03),},
	},

	zg80 = {-- rijeseno
		Armories = {vector3(1055.13, 216.16, 80.98)},
		Vehicles = {vector3(1035.28, 204.96, 80.84)},
		MeniVozila = {
			Vozilo1 = 'revolter',
			Vozilo2 = 'rocoto',
			Vozilo3 = 'enduro',
		},
		BossActions = {vector3(1042.81, 192.81, 80.99)},
		ParkirajAuto = {vector3(1038.51, 203.85, 79.00),},
	},

	crnogorci = {-- rijeseno
		Armories = {vector3(-802.88, 184.94, 72.61)},
		Vehicles = {vector3(-820.18, 184.51, 72.13)},
		MeniVozila = {
			Vozilo1 = 'revolter',
			Vozilo2 = 'rocoto',
			Vozilo3 = 'enduro',
		},
		BossActions = {vector3(-812.17, 175.16, 76.75)},
		ParkirajAuto = {vector3(-811.96, 187.43, 71.47),},
	},

	cartel = {-- rijeseno
		Armories = {vector3(-3007.37, 81.07, 11.60)},
		Vehicles = {vector3(-3018.97, 100.32, 11.64)},
		MeniVozila = {
			Vozilo1 = 'revolter',
			Vozilo2 = 'rocoto',
			Vozilo3 = 'enduro',
		},
		Brodovi = {vector3(-3009.32, -3.36, 3.23)},
		BrodoviMenu = {
			Brod1 = 'dinghy',
			Brod2 = 'seashark',
		},
		BossActions = {vector3(-3004.93, 79.61, 11.60)},
		ParkirajAuto = {vector3(-3009.55, 92.32, 10.60),},
	},

	gsf = {-- rijeseno
		Armories = {vector3(-18.13, -1432.57, 31.1)},
		Vehicles = {vector3(-25.04, -1437.39, 30.65)},
		MeniVozila = {
			Vozilo1 = 'revolter',
			Vozilo2 = 'rocoto',
			Vozilo3 = 'enduro',
		},
		BossActions = {vector3(-9.9, -1439.02, 31.1)},
		ParkirajAuto = {vector3(-25.22, -1428.07, 29.66),},
	},
}

Config.Oruzje = {
	novak = {
		{weapon = 'WEAPON_APPISTOL', components = {5000, 5000, 2000, 4000, nil}, price = 25000}
	},

	radnik = {
		{weapon = 'WEAPON_APPISTOL', components = {2000, 2000, 1000, 4000, nil}, price = 1},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {2000, 6000, 1000, 4000, 8000, nil}, price = 501000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 1}
	},

	zamjenik = {
		{weapon = 'WEAPON_APPISTOL', components = {2500, 2000, 1000, 4000, nil}, price = 25000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {8500, 6000, 1000, 4000, 8000, nil}, price = 125000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {6500, 6000, nil}, price = 75000}
	},

	boss = {
		{weapon = 'WEAPON_APPISTOL', components = {2500, 2000, 1000, 4000, nil}, price = 25000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {8500, 6000, 1000, 4000, 8000, nil}, price = 125000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {6500, 6000, nil}, price = 75000}
	}
}