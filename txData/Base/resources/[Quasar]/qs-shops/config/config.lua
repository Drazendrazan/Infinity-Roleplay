Config = {}


--░██████╗██╗░░██╗░█████╗░██████╗░░██████╗
--██╔════╝██║░░██║██╔══██╗██╔══██╗██╔════╝
--╚█████╗░███████║██║░░██║██████╔╝╚█████╗░
--░╚═══██╗██╔══██║██║░░██║██╔═══╝░░╚═══██╗
--██████╔╝██║░░██║╚█████╔╝██║░░░░░██████╔╝
--╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═════╝░

Config.WeaponLicense = 'license' -- Select between 'item' (qs-licenses) or 'license' (esx_license) system
Config.esx_licensecheckLicense = "esx_license:checkLicense"

Config.InteractSound = true -- Use InteractSound script for sounds.

Config.Shops = {

    ['Market'] = {
        label = "24/7",
        coords = {
            vector3(373.875, 325.896, 102.566 + 1),
            vector3(2557.458, 382.282, 107.622 + 1),
            vector3(-3038.939, 585.954, 6.908 + 1),
            vector3(-3241.927, 1001.462, 11.830 + 1),
            vector3(547.431, 2671.710, 41.156 + 1),
            vector3(1961.464, 3740.672, 31.343 + 1),
            vector3(2678.916, 3280.671, 54.241 + 1),
            vector3(1729.216, 6414.131, 34.037 + 1),
            vector3(1135.808, -982.281, 45.415 + 1),
            vector3(-1222.915, -906.983, 11.326 + 1),
            vector3(-1487.553, -379.107, 39.163 + 1),
            vector3(-2968.243, 390.910, 14.043 + 1),
            vector3(1166.024, 2708.930, 37.157 + 1),
            vector3(1392.562, 3604.648, 33.980 + 1),
            vector3(-48.519, -1757.514, 28.421 + 1),
            vector3(1163.373, -323.801, 68.205 + 1),
            vector3(-707.501, -914.260, 18.215 + 1),
            vector3(-1820.523, 792.518, 137.118 + 1),
            vector3(1698.388, 4924.404, 41.063 + 1),
            vector3(25.723, -1346.966, 28.497 + 1),
        },
        Shop = {
            items = {
                [1] = { name = 'bread', label = "Pão", price = 25, amount = 100, type = 'item', slot = 1 },
                [2] = { name = 'water', label = "Água", price = 25, amount = 100, type = 'item', slot = 2 },
                [3] = { name = 'sandes', label = "Sandes", price = 25, amount = 100, type = 'item', slot = 3 },
                [4] = { name = 'sumo', label = "Sumo", price = 25, amount = 100, type = 'item', slot = 4 },
                [5] = { name = 'cola', label = "Cola", price = 25, amount = 100, type = 'item', slot = 5 },
                [6] = { name = 'icetea', label = "Ice Tea", price = 25, amount = 100, type = 'item', slot = 6 },
                [7] = { name = 'fanta', label = "Fanta", price = 25, amount = 100, type = 'item', slot = 7 },
                [8] = { name = 'chocolate', label = "Chocolate", price = 25, amount = 100, type = 'item', slot = 8 },
                [9] = { name = 'pizza', label = "Pizza", price = 25, amount = 100, type = 'item', slot = 9 },
                [10] = { name = 'compal', label = "Compal", price = 25, amount = 100, type = 'item', slot = 10 },
                [11] = { name = 'beer', label = "Cerveja", price = 40, amount = 100, type = 'item', slot = 11 },
                [12] = { name = 'cigarro', label = "Cigarro", price = 5, amount = 100, type = 'item', slot = 12 },
                [13] = { name = 'onca', label = "Onça", price = 50, amount = 100, type = 'item', slot = 13 },
                [14] = { name = 'filtro', label = "Filtro", price = 10, amount = 100, type = 'item', slot = 14 },
                [15] = { name = 'mortalha', label = "Mortalha", price = 10, amount = 100, type = 'item', slot = 15 },
                [16] = { name = 'isqueiro', label = "Isqueiro", price = 10, amount = 100, type = 'item', slot = 16 },
                [17] = { name = 'phone', label = "Telemóvel", price = 500, amount = 100, type = 'item', slot = 17 },
                [18] = { name = 'dopebag', label = "Saco de plástico", price = 25, amount = 100, type = 'item',
                    slot = 18 },
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - 24/7',
            blip = { id = 59, scale = 0.6, color = 2, title = '24/7' }, --or false,
            job = { 'all' },
            grade = { 'all' },
            license = false,
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['YouTools'] = {
        label = "YouTools",
        coords = {
            vector3(2747.6775, 3472.9373, 54.6719)
        },
        Shop = {
            items = {
                [1] = { name = 'weapon_hammer', label = "Martelo", price = 2000, amount = 100, type = 'weapon', slot = 1 },
                [2] = { name = 'weapon_wrench', label = "Ferramenta", price = 3000, amount = 100, type = 'weapon', slot = 2 },
                [3] = { name = 'weapon_crowbar', label = "Pé de cabra", price = 2500, amount = 100, type = 'weapon',
                    slot = 3 },
                [4] = { name = 'weapon_battleaxe', label = "Picareta", price = 2500, amount = 100, type = 'weapon',
                    slot = 4 },
                [5] = { name = 'weapon_hatchet', label = "Machado", price = 2500, amount = 100, type = 'weapon', slot = 5 },
                [6] = { name = 'fixkit', label = "Kit de Reparação", price = 750, amount = 100, type = 'item', slot = 6 },
                [7] = { name = 'sponge', label = "Esponja", price = 50, amount = 100, type = 'item', slot = 7 },
                [8] = { name = 'simcard', label = "Cartão SIM", price = 50, amount = 100, type = 'item', slot = 8 },
                [9] = { name = 'ducttape', label = "Fita cola", price = 30, amount = 100, type = 'item', slot = 9 },
                [10] = { name = 'screwdriver', label = "Chave de fendas", price = 25, amount = 100, type = 'item',
                    slot = 10 },
                [11] = { name = 'blowtorch', label = "Maçarico", price = 1500, amount = 100, type = 'item', slot = 11 },
                [12] = { name = 'radio', label = "Rádio", price = 100, amount = 100, type = 'item', slot = 12 },
                [13] = { name = 'seringa', label = "Seringa", price = 10000, amount = 100, type = 'item', slot = 13 },
                [14] = { name = 'plastico', label = "Plástico", price = 100, amount = 100, type = 'item', slot = 14 },
                [15] = { name = 'nail', label = "Prego", price = 75, amount = 100, type = 'item', slot = 15 },
                [16] = { name = 'screw', label = "Parafuso", price = 75, amount = 100, type = 'item', slot = 16 },
                [17] = { name = 'vidro', label = "Vidro", price = 150, amount = 100, type = 'item', slot = 17 },
                [18] = { name = 'foice', label = "Foice", price = 300, amount = 100, type = 'item', slot = 18 },
                [19] = { name = 'vaso', label = "Vaso", price = 5000, amount = 100, type = 'item', slot = 19 },
                [20] = { name = 'fertilizante', label = "Fertilizante", price = 500, amount = 100, type = 'item',
                    slot = 20 },
                [21] = { name = 'agua_purificada', label = "Água Purificada", price = 40, amount = 100, type = 'item',
                    slot = 21 },
                [22] = { name = 'regador', label = "Regador", price = 500, amount = 100, type = 'item', slot = 22 },
                [23] = { name = 'acetone', label = "Acetona", price = 100, amount = 100, type = 'item', slot = 23 },
                [24] = { name = 'lithium', label = "Lítio", price = 100, amount = 100, type = 'item', slot = 24 },
                [25] = { name = 'gasmask', label = "Mácara de Gás", price = 7000, amount = 100, type = 'item',
                    slot = 25 },
                [26] = { name = 'bag', label = "Saco de transporte", price = 2000, amount = 100, type = 'item', slot = 26 },
                [27] = { name = 'oxygen_mask', label = "Máscara de oxigénio", price = 5000, amount = 100, type = 'item',
                    slot = 27 },
                [28] = { name = 'fishingknife', label = "Faca Utilitária", price = 175, amount = 100, type = 'item',
                    slot = 28 },
                [29] = { name = 'rubber', label = "Borracha", price = 500, amount = 100, type = 'item', slot = 29 },
                [30] = { name = 'contract', label = "Contrato", price = 100, amount = 100, type = 'item', slot = 30 },
                [31] = { name = 'backpack', label = "Mochila", price = 2500, amount = 100, type = 'item', slot = 31 },
                [32] = { name = 'weapon_briefcase', label = "Pasta", price = 2500, amount = 100, type = 'weapon', slot = 32 },
            },
            markerType = 27,
            markerSize = vector3(0.5, 0.5, 0.5),
            markerColour = { r = 255, g = 255, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - YouTools',
            blip = { id = 402, scale = 0.7, color = 1, title = 'YouTools' }, --or false,
            job = { 'all' },
            grade = { 'all' },
            license = false,
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['Ammunation'] = {
        label = "Ammunation",
        coords = {
            vector3(-662.1, -935.3, 20.8 + 1),
            vector3(810.2, -2157.3, 28.6 + 1),
            vector3(1693.4, 3760.5, 33.7 + 1),
            vector3(-330.2, 6083.8, 30.4 + 1),
            vector3(252.3, -50.0, 68.9 + 1),
            vector3(22.0, -1107.2, 28.8 + 1),
            vector3(2567.6, 294.3, 107.7 + 1),
            vector3(-1117.5, 2698.6, 17.5 + 1),
            vector3(842.4, -1033.4, 27.1 + 1),
        },
        Shop = {
            items = {
                [1] = { name = 'WEAPON_BAT', label = "Bastão", price = 2500, amount = 100, info = {}, type = 'weapon',
                    slot = 1 },
                [2] = { name = 'WEAPON_SWITCHBLADE', label = "Faca", price = 3000, amount = 100, info = {},
                    type = 'weapon',
                    slot = 2 },
                [3] = { name = 'WEAPON_FLARE', label = "Flare", price = 5000, amount = 100, info = {}, type = 'weapon',
                    slot = 3 },
                [4] = { name = 'weapon_luxeskin', label = "Skin Luxe", price = 10000, amount = 100, type = 'item',
                    slot = 4 },
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - Ammunation',
            blip = { id = 110, scale = 0.8, color = 26, title = 'Ammunation' }, --or false,
            job = { 'all' },
            grade = { 'all' },
            license = false, -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['Ammunation Premium'] = {
        label = "Ammu-Nation",
        coords = {
            vector3(-664.5056, -939.2343, 21.8292), --
            vector3(812.3737, -2153.5178, 29.6190),
            vector3(1694.9169, 3755.5227, 34.7053),
            vector3(-329.0616, 6079.4565, 31.4548),
            vector3(249.7641, -46.7994, 69.9410),
            vector3(18.5241, -1110.1100, 29.7970), --
            vector3(2570.1353, 297.9718, 108.7349),
            vector3(-1117.0167, 2694.1604, 18.5541),
            vector3(844.7728, -1029.6798, 28.1948),
        },
        Shop = {
            items = {
                [1] = { name = 'WEAPON_MUSKET', label = "Musquete", price = 10000, amount = 100, info = {},
                    type = 'weapon',
                    slot = 1 },
                [2] = { name = 'shotgun_ammo', label = "Munição Calibre 12", price = 250, amount = 100, info = {},
                    type = 'item', slot = 2 },
                [3] = { name = 'WEAPON_KNIFE', label = "Faca", price = 3000, amount = 100, info = {}, type = 'weapon',
                    slot = 3 },
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - Ammunation (Caça)',
            blip = false, --or {id = 110, scale = 0.8, color = 26, title = 'Ammunation'},
            job = { 'all' },
            grade = { 'all' },
            license = false, -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['DPLS'] = {
        label = "DPLS",
        coords = {
            vector3(482.5028, -995.4987, 29.7396 + 1),
        },
        Shop = {
            items = {
                [1] = { type = 'item', label = "Algemas", name = 'cuff', price = 0, amount = 100, slot = 1 },
                [2] = { type = 'item', label = "Chaves de Algemas", name = 'key', price = 0, amount = 100, slot = 2 },
                [3] = { type = 'item', label = "Munição 5.56×45mm", name = 'rifle_ammo', price = 0, amount = 100,
                    slot = 3 },
                [4] = { type = 'item', label = "Munição Calibre 12", name = 'shotgun_ammo', price = 0, amount = 100,
                    slot = 4 },
                [5] = { type = 'item', label = "Munição 9mm", name = 'pistol_ammo', price = 0, amount = 100,
                    slot = 5 },
                [6] = { type = 'item', label = "Munição 7.62x39mm", name = 'smg_ammo', price = 0, amount = 100,
                    slot = 6 },
                [7] = { type = 'item', label = "Silenciador de Rifle", name = 'rifle_suppressor', price = 0, amount = 100,
                    slot = 7 },
                [8] = { type = 'item', label = "Silenciador de Pistola", name = 'pistol_suppressor', price = 0,
                    amount = 100,
                    slot = 8 },
                [9] = { type = 'item', label = "Silenciador de SMG", name = 'smg_suppressor', price = 0, amount = 100,
                    slot = 9 },
                [10] = { type = 'item', label = "Colete", name = 'colete', price = 0, amount = 100, slot = 10 },
                [11] = { type = 'item', label = "Gazua", name = 'lockpick', price = 0, amount = 100,
                    slot = 11 },
                [12] = { type = 'item', label = "Kit de Reparação", name = 'fixkit', price = 0, amount = 100,
                    slot = 12 },
                [13] = { type = 'item', label = "Rádio", name = 'radio', price = 0, amount = 100, slot = 13 },
                [14] = { type = 'weapon', label = "Lanterna", name = 'weapon_flashlight', price = 0,
                    amount = 100, slot = 14 },
                [15] = { type = 'weapon', label = "Cacetete", name = 'weapon_nightstick', price = 0,
                    amount = 100, slot = 15 },
                [16] = { type = 'weapon', label = "Tazer", name = 'weapon_stungun', price = 0, amount = 100,
                    slot = 16 },
                [17] = { type = 'weapon', label = "Pistola de Combate", name = 'weapon_combatpistol', price = 0,
                    amount = 100, slot = 17 },
                [18] = { type = 'weapon', label = "SMG", name = 'weapon_smg', price = 0, amount = 100,
                    slot = 18 },
                [19] = { type = 'weapon', label = "Pumpshotgun MK2", name = 'weapon_pumpshotgun_mk2', price = 0,
                    amount = 100, slot = 19 },
                [20] = { type = 'weapon', label = "Rifle Tática", name = 'weapon_tacticalrifle', price = 0,
                    amount = 100, slot = 20 },
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - DPLS',
            blip = false, --or {id = 521, scale = 0.5, color = 3, title = 'LSPD Weapons Market'},
            job = { 'police' },
            grade = { 'all' },
            license = false, -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['DPLSCaca'] = {
        label = "DPLS",
        coords = {
            vector3(482.4977, -998.5415, 30.7396),
        },
        Shop = {
            items = {
                [1] = { type = 'weapon', label = "Pistola SNS", name = 'WEAPON_SNSPISTOL', price = 0, amount = 100,
                    slot = 1 },
                [2] = { type = 'item', label = "Munição 9mm", name = 'pistol_ammo', price = 0, amount = 100, slot = 2 }
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - DPLS',
            blip = false, --or {id = 521, scale = 0.5, color = 3, title = 'LSPD Weapons Market'},
            job = { 'police' },
            grade = { 8,9 },
            license = false, -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['SEM'] = {
        label = "SEM",
        coords = {
            vector3(306.3004, -601.5495, 43.2841),
        },
        Shop = {
            items = {
                [1] = { type = 'item', label = "Bandagem", name = 'bandage', price = 0, amount = 100, slot = 1 },
                [2] = { type = 'item', label = "Kit Médico", name = 'medikit', price = 0, amount = 100, slot = 2 },
                [3] = { type = 'item', label = "Mala", name = 'paramedicbag', price = 0, amount = 100, slot = 3 },
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - SEM',
            blip = false, --or {id = 521, scale = 0.5, color = 3, title = 'LSPD Weapons Market'},
            job = { 'ambulance' },
            grade = { 'all' },
            license = false, -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['Caca'] = {
        label = "Caça",
        coords = {
            vector3(-768.7873, 5596.8247, 33.6050),
        },
        Shop = {
            items = {
                [1] = { type = 'weapon', label = "Musquete", name = 'WEAPON_MUSKET', price = 10000, amount = 100,
                    slot = 1 },
                [2] = { type = 'item', label = "Munição Calibre 12", name = 'shotgun_ammo', price = 1000, amount = 100,
                    slot = 2 }
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - Caça',
            blip = false, --or {id = 521, scale = 0.5, color = 3, title = 'LSPD Weapons Market'},
            job = { 'all' },
            grade = { 'all' },
            license = "caca", -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },

    ['CafeDosGatos'] = {
        label = "Cafe Dos Gatos",
        coords = {
            vector3(-585.8752, -1055.9277, 22.3442),
        },
        Shop = {
            items = {
                [1] = { type = 'item', label = "Ficha", name = 'ficha', method = 'bank', price = 0, amount = 100,
                    slot = 1 },
                [2] = { type = 'item', label = "UwU Happy Meal", name = 'uwubentobox', method = 'bank', price = 0,
                    amount = 100, slot = 2 },
                [3] = { type = 'item', label = "UwU Sumo de Mirtilo", name = 'uwububbleteablueberry', method = 'bank',
                    price = 0, amount = 100, slot = 3 },
                [4] = { type = 'item', label = "UwU Sumo de Menta", name = 'uwububbleteamint', method = 'bank', price = 0,
                    amount = 100, slot = 4 },
                [5] = { type = 'item', label = "UwU Sumo de Rosas", name = 'uwububbletearose', method = 'bank', price = 0,
                    amount = 100, slot = 5 },
                [6] = { type = 'item', label = "UwU Salada", name = 'uwubudhabowl', method = 'bank', price = 0,
                    amount = 100, slot = 6 },
                [7] = { type = 'item', label = "UwU Sandes de chocolate", name = 'uwuchocsandy', method = 'bank',
                    price = 0, amount = 100, slot = 7 },
                [8] = { type = 'item', label = "UwU Cupcake", name = 'uwucupcake', method = 'bank', price = 0,
                    amount = 100, slot = 8 },
                [9] = { type = 'item', label = "UwU Sopa", name = 'uwumisosoup', method = 'bank', price = 0, amount = 100,
                    slot = 9 },
                [10] = { type = 'item', label = "UwU Pancake", name = 'uwupancake', method = 'bank', price = 0,
                    amount = 100, slot = 10 },
                [11] = { type = 'item', label = "UwU Sushi", name = 'uwushushi', method = 'bank', price = 0, amount = 100,
                    slot = 11 },
                [12] = { type = 'item', label = "UwU Sandes", name = 'uwuvanillasandy', method = 'bank', price = 0,
                    amount = 100, slot = 12 },
            },
            markerType = 2,
            markerSize = vector3(0.2, 0.2, 0.1),
            markerColour = { r = 71, g = 181, b = 255 },
            use3dtext = true,
            type = 'bank', --'black_money', 'money' or 'bank'.
            msg = '[E] - Cafe Dos Gatos',
            blip = false, --or {id = 521, scale = 0.5, color = 3, title = 'LSPD Weapons Market'},
            job = { 'all' },
            grade = { 'all' },
            license = false, -- Require license or not (false or the name of the license)
            distanceMarker = 10.0,
            distanceText = 1.5,
        }
    },
}

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
    if type == 'inform' then

        exports["okokNotify"]:Alert("LOJA", msg, 2000, "info")
        --SetNotificationTextEntry('STRING')
        --AddTextComponentString(msg)
        --DrawNotification(0,1)

        --MORE EXAMPLES OF NOTIFICATIONS.
        --exports['qs-core']:Notify(msg, "primary")
        --exports['mythic_notify']:DoHudText('inform', msg)
    end
    if type == 'error' then
        exports["okokNotify"]:Alert("LOJA", msg, 2000, "error")
        --SetNotificationTextEntry('STRING')
        --AddTextComponentString(msg)
        --DrawNotification(0,1)

        --MORE EXAMPLES OF NOTIFICATIONS.
        --exports['qs-core']:Notify(msg, "error")
        --exports['mythic_notify']:DoHudText('error', msg)
    end
    if type == 'success' then
        exports["okokNotify"]:Alert("LOJA", msg, 2000, "success")
        --SetNotificationTextEntry('STRING')
        --AddTextComponentString(msg)
        --DrawNotification(0,1)

        --MORE EXAMPLES OF NOTIFICATIONS.
        --exports['qs-core']:Notify(msg, "success")
        --exports['mythic_notify']:DoHudText('success', msg)
    end
end

DrawText3DQS = function(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
