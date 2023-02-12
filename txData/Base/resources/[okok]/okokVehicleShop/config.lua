Config = {}

Config.SetVisibility = true -- true = player will be invisible when chosing a vehicle

Config.SetInvincibility = true -- true = player will not die while test driving

Config.CheckForOfflineOrdersEvery = 0.5 -- In minutes | it'll check every x minutes for offline players with orders accepted, if someone is offline it'll cancel the order

Config.ShowVehicleShopBlip = true -- Activate/Deactivate Vehicle shop blips

Config.ShowOwnerBlip = true -- Activate/Deactivate owner blips

Config.ShowBuyVehicleShopBlip = true -- Activate/Deactivate buy shop blip

Config.ShowHasOwnerShopBlip = true -- Activate/Deactivate blip of shops with "hasOwner = false"

Config.TestDrive = true -- Activate/Deactivate test drive

Config.DevMode = false -- Allows you to restart the script (IMPORTANT: only set this to true if you are configuring the script)

Config.EventPrefix = "okokVehicleShop" -- this will change the prefix of the events name so if Config.EventPrefix = "example" the events will be "example:event"

Config.ESXPrefix = "esx" -- this will change the prefix of esx events such as esx:onPlayerDeath

Config.onPlayerDeath = "onPlayerDeath"

Config.playerLoaded = "playerLoaded"

Config.getSharedObject = "getSharedObject"

Config.TestDrivePlate = "TEST"

Config.UseOkokTextUI = true -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.UseokokRequests = true -- true = use okokRequests for hiring people | false = don't use okokRequests - https://okok.tebex.io/package/4724985

Config.UseSameImageForVehicles = false -- true = use the same image for all vehicles (vehicle.png) | false = use different images for each vehicle (vehicle_id.png)

Config.HideMinimap = true -- If true it'll hide the minimap when the vehicle shop menu is opened

Config.TimeBetweenTransition = 7000 -- how much time it stays in a camera before changing, in miliseconds

Config.TransitionTime = 4000 -- how much time it takes to go from one camera to another (camera movement), in miliseconds

Config.ShakeAmplitude = 0.2 -- camera shake

Config.UseKMh = true -- true = use KM/h | false = use miles/h

Config.MaxVehiclesSpeed = 450 -- Max speed a vehicle can go at (it is only used for UI purposes, it does NOT change the speed of a vehicle)

Config.TestDriveTime = 40 -- In seconds

Config.StopTestDriveCmd = "cancelar" -- command to stop the test drive

Config.PlateLetters  = 3 -- How many letters the plate has

Config.PlateNumbers  = 3 -- How many numbers the plate has

Config.PlateUseSpace = true	-- If the plate uses spaces between letters and numbers

Config.OrderCompletedPercentage = 10 -- When a employee completes the misson he will get this percentage as a reward, 10 = 10%

Config.HireRange = 3 -- How close a player needs to be to be in the hiring range

Config.AdminCommand = "vsadmin" -- command to open the admin menu

Config.OwnerBuyVehiclePercentage = 10 -- How much of a discount the owner has to order a vehicle (bases on the min. price)

Config.SellBusinessReceivePercentage = 50 -- How much a player will receive for selling his business (in percentage, 50 = 50%)

Config.ClearMoneyWhenBusinessIsSold = false -- true = remove the money from the society when sold | false = do not remove the money

Config.MaxDealershipsPerPlayer = 2 -- How many vehicle shops a player can own

Config.MaxEmployeesPerDealership = 10 -- How many employees a vehicle shop can hire

Config.EnableSellVehicle = false -- Allows players to sell their vehicles for a percentage of the vehicle's min price

Config.VehicleShopBuyVehicle = false -- true = when selling a bought vehicle the money will be discounted from the vehicle shop and the vehicle added to the stock | false = vehicle shop will not be charged or receive the vehicle

Config.VehicleSellPercentage = 40 -- 40 = seller will receive 40% of the vehicle min. price

Config.EnableOkokBankingTransactions = false -- true = when you buy a vehicle a transaction is added (okokBanking)

Config.AdminGroups = { -- Admin groups that can access the admin menu
	"admin",
	"mod"
}

Config.JobRanks = { -- These are the ranks available on the vehicle shops, you can add or remove as many as you want but leave at least 1
	"Newbie",		-- ID: 1
	"Experienced",	-- ID: 2
	"Expert",		-- ID: 3
	"Sub-Owner"		-- ID: 4 
}

Config.SubOwnerRank = 4 -- ID of the rank that will work as a secondary owner

Config.MissionForStock = true -- false = when you order a vehicle, the vehicle shop will instantly receive it without doing any order/mission

Config.TruckBlip = {blipId = 67, blipColor = 2, blipScale = 0.9, blipText = "Truck"} -- Blip of the truck when someone accepts an order

Config.TrailerBlip = {blipId = 515, blipColor = 2, blipScale = 0.9, blipText = "Trailer"} -- Blip of the trailer when someone accepts an order (for vehicle shops with big vehicles)

Config.OrderBlip = {blipId = 478, blipColor = 5, blipText = "Order"}  -- Blip of the ordered vehicle when someone accepts an order

Config.TowMarker = {id = 27, size = {x = 0.5, y = 0.5, z = 0.5}, color = {r = 255, g = 255, b = 255, a = 90}, bobUpAndDown = 0, faceCamera = 0, rotate = 0, drawOnEnts = 0} -- The marker to tow a vehicle when someone accepts an order

Config.SmallTowTruckID = "flatbed"

Config.BigTowTruckID = "Hauler"

Config.TrailerID = "TRFlat"

Config.Stands = { -- Vehicle shops informations
	{
		name = "Concessionaria", -- name of the vehicle shop
		licenseType = "", -- if you want to use a license system you'll need to set it up on sv_utils.lua
		currency = "bank", -- used to buy/sell the business and buy vehicle
		hasOwner = false, -- true = this vehicle shop can have a owner and will need maintenance to have stock | false = no owner and with vehicles all the time, price = max_price set on the database
		coords = {x = -57.50, y = -1096.73, z = 25.50}, -- Marker/Shop position
		sellVehicleCoords = {x = -44.72, y = -1082.12, z = 25.50},
		sellVehicleMarker = {id = 1, color = {r = 255, g = 0, b = 0, a = 90}, size = {x = 4.0, y = 4.0, z = 1.5}, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the sell vehicle marker
		ownerCoords = {x = -31.66, y = -1114.00, z = 26.42}, -- Marker/Shop position for owner/employees
		spawnFlatbedPos = {x = -16.95, y = -1105.34, z = 26.67, h = 160.0}, -- Where the flatbed/truck is spawned for the orders
		towCoords = {bone = 20, xPos = -0.5, yPos = -5.0, zPos = 1.0},
		missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			{x = -465.99, y = -618.22, z = 31.17, h = 100.0},
			--{x = 218.46, y = -850.71, z = 30.16, h = 100.0},
		},
		radius = 1, -- Interaction radius for the markers
		price = 10000, -- Price of the vehicle shop
		blip = {blipId = 225, blipColor = 3, blipScale = 0.7, blipText = "Concessionaria"}, -- Blip informations for vehicleshop blip
		ownerBlip = {blipId = 225, blipColor = 2, blipScale = 0.9, blipText = "Vehicleshop Panel"}, -- Blip informations for shops you own/work for
		buyBlip = {blipId = 225, blipColor = 1, blipScale = 0.9, blipText = "Vehicleshop to buy"}, -- Blip informations for shop on sale
		marker = {id = 27, color = {r = 255, g = 255, b = 255, a = 150}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 1, rotate = 0, drawOnEnts = 0}, -- Marker informations for the vehicle shop
		ownerMarker = {id = 21, color = {r = 31, g = 94, b = 255, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the owning menu
		bigVehicles = false, -- Set to true if it's airplanes/helicopters/etc... it'll use a truck instead of a flatbed to get the ordered vehicles
		type = "vehicles", -- Type of shop (will change displayed vehicles) | CAN be repeated on other shops
		id = "vehicles1", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	{
		name = "Concessionaria DPLS", -- name of the vehicle shop
		licenseType = "", -- if you want to use a license system you'll need to set it up on sv_utils.lua
		currency = "bank", -- used to buy/sell the business and buy vehicle
		hasOwner = false, -- true = this vehicle shop can have a owner and will need maintenance to have stock | false = no owner and with vehicles all the time, price = max_price set on the database
		coords = {x = 435.4082, y = -976.1725, z = 24.6998}, -- Marker/Shop position
		sellVehicleCoords = {x = -44.72, y = -1082.12, z = 25.50},
		sellVehicleMarker = {id = 1, color = {r = 255, g = 0, b = 0, a = 90}, size = {x = 4.0, y = 4.0, z = 1.5}, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the sell vehicle marker
		ownerCoords = {x = -31.66, y = -1114.00, z = 26.42}, -- Marker/Shop position for owner/employees
		spawnFlatbedPos = {x = -16.95, y = -1105.34, z = 26.67, h = 160.0}, -- Where the flatbed/truck is spawned for the orders
		towCoords = {bone = 20, xPos = -0.5, yPos = -5.0, zPos = 1.0},
		missionsVehicleSpawn = { -- Locations where someone who accepted an order will have to go (it is random)
			{x = -465.99, y = -618.22, z = 31.17, h = 100.0},
			--{x = 218.46, y = -850.71, z = 30.16, h = 100.0},
		},
		radius = 1, -- Interaction radius for the markers
		price = 10000, -- Price of the vehicle shop
		blip = {blipId = false, blipColor = 3, blipScale = 0.7, blipText = "Concessionaria"}, -- Blip informations for vehicleshop blip
		ownerBlip = {blipId = 225, blipColor = 2, blipScale = 0.9, blipText = "Vehicleshop Panel"}, -- Blip informations for shops you own/work for
		buyBlip = {blipId = 225, blipColor = 1, blipScale = 0.9, blipText = "Vehicleshop to buy"}, -- Blip informations for shop on sale
		marker = {id = 27, color = {r = 255, g = 255, b = 255, a = 150}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 1, rotate = 0, drawOnEnts = 0}, -- Marker informations for the vehicle shop
		ownerMarker = {id = 21, color = {r = 31, g = 94, b = 255, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0}, -- Marker informations for the owning menu
		bigVehicles = false, -- Set to true if it's airplanes/helicopters/etc... it'll use a truck instead of a flatbed to get the ordered vehicles
		type = "dpls", -- Type of shop (will change displayed vehicles) | CAN be repeated on other shops
		id = "dpls", -- ID of the shop, it's used to get what shop is opened | needs to be DIFFERENT for each shop
	},
	--{
	--	name = "Water Shop",
	--	licenseType = "boat",
	--	currency = "bank",
	--	hasOwner = false,
	--	coords = {x = -720.77, y = -1324.92, z = 1.6},
	--	sellVehicleCoords = {x = -721.56, y = -1306.7, z = 3.82},
	--	sellVehicleMarker = {id = 1, color = {r = 255, g = 0, b = 0, a = 90}, size = {x = 4.0, y = 4.0, z = 1.5}, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0},
	--	ownerCoords = {x = -712.16, y = -1298.88, z = 5.1},
	--	spawnFlatbedPos = {x = -719.77, y = -1286.15, z = 5.0, h = 120.0},
	--	towCoords = {bone = 0, xPos = 0.0, yPos = -2.0, zPos = 0.9},
	--	missionsVehicleSpawn = {
	--		{x = -758.15, y = -1488.26, z = 5.0, h = 280.0},
	--	},
	--	radius = 1,
	--	price = 14000,
	--	blip = {blipId = 427, blipColor = 3, blipScale = 0.7, blipText = "Water shop"},
	--	ownerBlip = {blipId = 427, blipColor = 2, blipScale = 0.9, blipText = "Water shop Panel"},
	--	buyBlip = {blipId = 427, blipColor = 1, blipScale = 0.9, blipText = "Water shop to buy"},
	--	marker = {id = 20, color = {r = 31, g = 94, b = 255, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0},
	--	ownerMarker = {id = 21, color = {r = 31, g = 94, b = 255, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0},
	--	bigVehicles = true,
	--	type = "water",
	--	id = "water1",
	--},
}

Config.ShowVehicle = { -- Display vehicle
	["vehicles1"] = { -- ID of the vehicle shop
		position = {x = -44.21, y = -1097.06, z = 26.42, h = 160.0}, -- Where to spawn the display vehicles
		playerOffsetVehiclePreview = {x = 0.0, y = 0.0, z = -1.0}, -- Coordinations offset of where the player will be set when opening the shop
		noVehicleCam = {x = -44.21-1.49, y = -1097.06-7.65, z = 26.42+1.15}, -- Camera position when there is no vehicle to be displayed
		testDrive = {x = -1733.25, y = -2901.43, z = 13.94, h = 330.0}, -- Where to start the test drive
		vehicleSpawn = { -- Where the vehicle spawns when bought
			{x = -27.65, y = -1082.03, z = 26.64, h = 70.0},
			{x = -13.61, y = -1092.4, z = 26.67, h = 340.0},
			{x = -12.16, y = -1082.49, z = 26.68, h = 84.0},
		},
	},
	["dpls"] = { -- ID of the vehicle shop
		position = {x = 435.5601, y = -976.1330, z = 25.6998, h = 270.4067}, -- Where to spawn the display vehicles
		playerOffsetVehiclePreview = {x = 0.0, y = 0.0, z = -1.0}, -- Coordinations offset of where the player will be set when opening the shop
		noVehicleCam = {x = 435.560-1.49, y = -976.1330-7.65, z = 25.6998+1.15}, -- Camera position when there is no vehicle to be displayed
		testDrive = {x = -1733.25, y = -2901.43, z = 13.94, h = 330.0}, -- Where to start the test drive
		vehicleSpawn = { -- Where the vehicle spawns when bought
			{x = 437.4602, y = -986.1063, z = 25.6998, h = 83.5217},
		},
	},
	["water1"] = {
		position = {x = -828.54, y = -1448.08, z = -0.5, h = 70.0},
		playerOffsetVehiclePreview = {x = 0.0, y = 0.0, z = 0.0},
		noVehicleCam = {x = -828.54-12.49, y = -1448.08-0.65, z = -0.5+3.15},
		testDrive = {x = -878.02, y = -1360.32, z = 2.0, h = 330.0},
		vehicleSpawn = {
			{x = -706.78, y = -1333.57, z = 2.0, h = 70.0},
		},
	},
}

Config.TransitionCamerasOffset = { -- Cameras positions, you can add as many as you wish
	["vehicles1"] = { -- ID of the vehicle shop
		{x = 1.49, y = 7.65, z = 1.15}, 
		{x = 14.0, y = 5.0, z = 0.6},
		{x = 7.0, y = -5.0, z = 1.5},
		{x = -15.0, y = -3.0, z = 1.6},
	},
	["dpls"] = { -- ID of the vehicle shop
		{x = 1.49, y = 7.65, z = 1.15},
		{x = 14.0, y = 5.0, z = 0.6},
		{x = 7.0, y = -5.0, z = 1.5},
		{x = -15.0, y = -3.0, z = 1.6},
	},
	["water1"] = {
		{x = 12.49, y = 0.65, z = 3.15}, 
		{x = 9.0, y = 20.0, z = 2.6},
		{x = -13.5, y = 8.0, z = 3.5},
		{x = -4.0, y = -13.0, z = 3.6},
	},
}

Config.VehicleshopsCategories = { -- Categories shown on the vehicle shops, this is used to set the vehicles category
	["vehicles"] = { -- TYPE of the vehicle shop
		--{display = "COMERCIAIS", id = "commercial"},
		{display = "SUPER", id = "super"},
		{display = "COMPACTOS", id = "compacts"},
		{display = "COUPÉ", id = "coupes"},
		{display = "MOTAS", id = "motorcycles"},
		{display = "MUSCLE", id = "muscle"},
		{display = "TODO-TERRENO", id = "offroads"},
		{display = "CARRINHAS", id = "sedans"},
		{display = "DESPORTIVOS", id = "sports"},
		{display = "DESPORTIVOS CLÁSSICOS", id = "sportsclassic"},
		{display = "SUVs", id = "suvs"},
		{display = "VANs", id = "vans"},
		{display = "Carros Importados", id = "importcars"},
		{display = "Motas Importadas", id = "importbikes"},
	},
	["dpls"] = { -- TYPE of the vehicle shop
		--{display = "COMERCIAIS", id = "commercial"},
		{display = "DPLS", id = "dpls"},
	},
	["water"] = {
		{display = "BOATS", id = "boats"},
		{display = "SUBMARINE", id = "submarine"},
	},

}

Config.UseColorID = true -- Will set the vehicle color based on the color ID: https://wiki.rage.mp/index.php?title=Vehicle_Colors

Config.colors = { -- The vehicle colors, this will update the UI as well (it needs to be 10 colors, do NOT remove, add or change the color names)
	color1 = {255, 255, 255, id = 134}, -- The 4th number is the color id for the car if Config.UseColorID = true
	color2 = {0, 0, 0, id = 0},
	color3 = {150, 150, 150, id = 4},
	color4 = {255, 0, 0, id = 27},
	color5 = {255, 150, 0, id = 41},
	color6 = {255, 230, 0, id = 89},
	color7 = {0, 255, 0, id = 55},
	color8 = {0, 0, 255, id = 79},
	color9 = {76, 0, 255, id = 145},
	color10 = {255, 0, 255, id = 137},
}

Config.TextUI = { -- Text UI texts
	['open_shop'] = { 			text = '[E] Abrir ${shop_name}', 										color = 'darkblue', side = 'right'},
	['buy_business'] = { 		text = '[E] Comprar ${name} por ${price}€', 								color = 'darkblue', side = 'right'},
	['access_business'] = { 	text = '[E] Aceder ${name}', 										color = 'darkblue', side = 'right'},
	['tow'] = { 				text = '[E] Rebocar', 													color = 'darkblue', side = 'right'},
	['sell_vehicle'] = { 		text = '[E] Vender veículo', 											color = 'darkblue', side = 'right'},
}

Config.HelpNotification = { -- Used when Config.UseTextUI = false
	['open_shop'] = { 			text = '~INPUT_CONTEXT~ To open ${shop_name}'},
	['buy_business'] = { 		text = '~INPUT_CONTEXT~ to buy ${name} for ${price}€'},
	['access_business'] = { 	text = '~INPUT_CONTEXT~ to access ${name}'},
	['tow'] = { 				text = '~INPUT_CONTEXT~ To tow'},
	['sell_vehicle'] = { 		text = '~INPUT_CONTEXT~ To sell vehicle'},
}

Config.NotificationsText = { -- Notifications texts
	['success_cancel'] = {		title = "Stand", 		text = "Successfully canceled the order",											time = 2000, type = "success"},
	['fail_cancel'] = {			title = "Stand", 		text = "Failed to cancel the order",												time = 2000, type = "error"},
	['cant_access'] = {			title = "Stand", 		text = "You don't have permission to access this shop",								time = 2000, type = "error"},
	['no_license'] = {			title = "Stand", 		text = "You have no license to buy this vehicle",									time = 2000, type = "error"},
	['all_occupied'] = {		title = "Stand", 		text = "All vehicle entrances are occupied",										time = 2000, type = "error"},
	['failed_to_load'] = {		title = "Stand", 		text = "Failed to load the vehicle", 												time = 2000, type = "error"},
	['bus_no_money'] = {		title = "Stand", 		text = "This business doesn't have enough money", 									time = 2000, type = "error"},
	['success_sell'] = {		title = "Stand", 		text = "You sold ${vehicle_name} for ${price}€ successfully", 						time = 2000, type = "success"},
	['not_in_correct_v'] = {	title = "Stand", 		text = "You are not in the correct vehicle", 										time = 2000, type = "error"},
	['dont_sell'] = {			title = "Stand", 		text = "This vehicle shop don't buy this vehicle", 									time = 2000, type = "error"},
	['not_your_vehicle'] = {	title = "Stand", 		text = "You don't own this vehicle", 												time = 2000, type = "error"},
	['not_in_vehicle'] = {		title = "Stand", 		text = "You need to be on a vehicle", 												time = 2000, type = "error"},
	['not_admin'] = {			title = "Stand", 		text = "You don't have permission to access the admin menu", 						time = 2000, type = "error"},
	['inside_vehicle'] = {		title = "Stand", 		text = "You can't access the vehicle shop inside a vehicle", 						time = 2000, type = "error"},
	['load_vehicle'] = {		title = "Stand", 		text = "Loading vehicle, please wait", 												time = 2000, type = "info"},
	['stop_testdrive'] = {		title = "Stand", 		text = "Stopping the test drive", 													time = 2000, type = "success"},
	['not_testdriving'] = {		title = "Stand", 		text = "You are not on a test drive", 												time = 2000, type = "error"},
	['fill_fields'] = {			title = "Stand", 		text = "Please fill the input field", 												time = 2000, type = "error"},
	['already_accepted'] = {	title = "Stand", 		text = "You already accepted an order, complete it before accepting another",		time = 2000, type = "error"},
	['not_selected_hire'] = {	title = "Stand", 		text = "No one was selected", 														time = 2000, type = "error"},
	['ordered_success'] = {		title = "Stand", 		text = "You ordered x${amount} ${vehicle_name} successfully!", 						time = 2000, type = "success"},
	['some_wrong'] = {			title = "Stand", 		text = "Something went wrong!", 													time = 2000, type = "error"},
	['not_enough_money'] = {	title = "Stand", 		text = "You don't have enough money", 												time = 2000, type = "error"},
	['not_enough_money_s'] = {	title = "Stand", 		text = "Your society doesn't have enough money", 									time = 2000, type = "error"},
	['accepted_order'] = {		title = "Stand", 		text = "You accepted an order successfully", 										time = 2000, type = "success"},
	['someone_accepted'] = {	title = "Stand", 		text = "Someone has already accepted this order", 									time = 2000, type = "error"},
	['finished_order'] = {		title = "Stand", 		text = "You successfully finished the order and received ${reward}€", 				time = 2000, type = "success"},
	['no_ads_cancel'] = {		title = "Stand", 		text = "You don't have any ads to cancel", 											time = 2000, type = "error"},
	['veh_not_available'] = {	title = "Stand", 		text = "This vehicle isn't available", 												time = 2000, type = "error"},
	['price_not_valid'] = {		title = "Stand", 		text = "This is not a valid price", 												time = 2000, type = "error"},
	['employee_not_exist'] = {	title = "Stand", 		text = "This employee does not exist", 												time = 2000, type = "error"},
	['not_enough_to_sell'] = {	title = "Stand", 		text = "You don't have enough vehicles to sell", 									time = 2000, type = "error"},
	['got_hired'] = {			title = "Stand", 		text = "You got hired by ${shop_name}", 											time = 2000, type = "info"},
	['got_fired'] = {			title = "Stand", 		text = "You got fired by ${shop_name}", 											time = 2000, type = "info"},
	['success_hired'] = {		title = "Stand", 		text = "You successfully hired ${hired_name}", 										time = 2000, type = "success"},
	['success_fired'] = {		title = "Stand", 		text = "You successfully fired ${fired_name}", 										time = 2000, type = "success"},
	['success_added_ad'] = {	title = "Stand", 		text = "Added x${amount} ${vehicle_name} ads", 										time = 2000, type = "success"},
	['deposited'] = {			title = "Stand", 		text = "Deposited ${amount}€ successfully", 										time = 2000, type = "success"},
	['withdrawn'] = {			title = "Stand", 		text = "Whitdrawn ${amount}€ successfully", 										time = 2000, type = "success"},
	['bought_veh'] = {			title = "Stand", 		text = "Bought ${vehicle_name} for ${vehiclePrice}€", 								time = 2000, type = "success"},
	['change_money'] = {		title = "Stand", 		text = "Changed the ${shop_name} money to ${money} successfully", 					time = 2000, type = "success"},
	['change_info'] = {			title = "Stand", 		text = "Changed the ${vehicle_name} informations successfully", 					time = 2000, type = "success"},
	['remove_veh'] = {			title = "Stand", 		text = "Removed the ${vehicle_name} successfully", 									time = 2000, type = "success"},
	['created_veh'] = {			title = "Stand", 		text = "Created a ${vehicle_name} successfully", 									time = 2000, type = "success"},
	['cancel_ads'] = {			title = "Stand", 		text = "Canceled x${amount} ${vehicle_name} ads", 									time = 2000, type = "success"},
	['updated_price'] = {		title = "Stand", 		text = "Updated price of ${vehicle_name} to ${amount}€", 							time = 2000, type = "success"},
	['change_rank'] = {			title = "Stand", 		text = "${name} is now a ${job}", 													time = 2000, type = "success"},
	['already_rank'] = {		title = "Stand", 		text = "${name} is already a ${job}", 												time = 2000, type = "error"},
	['already_employee'] = {	title = "Stand", 		text = "${name} is your employee already", 											time = 2000, type = "error"},
	['max_shops'] = {			title = "Stand", 		text = "You can't buy more dealerships",											time = 2000, type = "error"},
	['got_to_truck'] = {		title = "Stand", 		text = "Go get the order marked in your minimap", 									time = 2000, type = "info"},
	['not_towing'] = {			title = "Stand", 		text = "You need to be closer to the ordered vehicle", 								time = 2000, type = "error"},
	['towed'] = {				title = "Stand",		text = "You successfully towed the ordered vehicle", 								time = 2000, type = "success"},
	['sold_business'] = {		title = "Stand", 		text = "You successfully sold ${shop} for ${amount}€", 								time = 2000, type = "success"},
	['leave_business'] = {		title = "Stand", 		text = "You successfully left ${shop}", 											time = 2000, type = "success"},
	['min_max_price'] = {		title = "Stand", 		text = "The minimum price needs to be less than the maximum price", 				time = 2000, type = "error"},
	['owner_changed'] = {		title = "Stand", 		text = "${owner} is now the owner of ${shop}", 										time = 2000, type = "success"},
	['max_employees'] = {		title = "Stand", 		text = "You can only hire ${employees} employees", 									time = 2000, type = "error"},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to webhook.lua, line 1

Config.BotName = 'Logs Stand' -- Write the desired bot name

Config.ServerName = 'Infinity Roleplay' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.BuyBusinessWebhook = true
Config.BuyBusinessWebhookColor = '65280'

Config.SellBusinessWebhook = true
Config.SellBusinessWebhookColor = '16711680'

Config.DepositWebhook = true
Config.DepositWebhookColor = '16776960'

Config.WithdrawWebhook = true
Config.WithdrawWebhookColor = '16776960'

Config.StartOrderWebhook = true
Config.StartOrderWebhookColor = '16742656'

Config.EndOrderWebhook = true
Config.EndOrderWebhookColor = '16742656'

Config.HireWebhook = true
Config.HireWebhookColor = '4223487'

Config.FireWebhook = true
Config.FireWebhookColor = '4223487'

Config.BuyVehicleWebhook = true
Config.BuyVehicleWebhookColor = '65535'

Config.ADStockWebhook = true
Config.ADStockWebhookColor = '7209071'

Config.CancelStockWebhook = true
Config.CancelStockWebhookColor = '7209071'

Config.BuyStockWebhook = true
Config.BuyStockWebhookColor = '7209071'

Config.EditEmployeeRankWebhook = true
Config.EditEmployeeRankWebhookColor = '4223487'

Config.QuitJobWebhook = true
Config.QuitJobWebhookColor = '16711680'