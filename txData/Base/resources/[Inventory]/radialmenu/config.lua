rootMenuConfig = {
    {
        id = "vehicle",
        displayName = "Veículo",
        icon = "#car",
        enableMenu = function()
            return true
        end,
        subMenus = { "engine", "moreoptionscar", "lock", "unlock" }
    },
    {
        id = "actions",
        displayName = "Ações",
        icon = "#bars",
        enableMenu = function()
            return true
        end,
        subMenus = { "skate", "limparskate", "cuffh", "cuffs", "uncuff", "putpersontrunk", "removepersontrunk", "entertrunk", "exittrunk" }
    },
    {
        id = "clothes",
        displayName = "Roupa",
        icon = "#shirt",
        enableMenu = function()
            return true
        end,
        subMenus = { "reset", "hat", "mask", "glasses", "bracelets", "watch", "tshirt",
            "pants", "shoes", "bag", "chain", "gloves", "vest" }
    },
    {
        id = "personal",
        displayName = "Pessoal",
        icon = "#personal",
        enableMenu = function()
            return true
        end,
        subMenus = { "mostrarcc", "mostrarcconducao", "mostrarportedearma",
            "vercc", "vercconducao", "verportedearma" }
    },
    {
        id = "police",
        displayName = "Ações DPLS",
        icon = "#police",
        enableMenu = function()
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job.name == "police" then
                return true
            end
        end,
        subMenus = { "drag", "putinvehicle", "outthevehicle", "mdt", "faturadpls", "licenca", "impressao" }
    },
    {
        id = "medic",
        displayName = "Ações SEM",
        icon = "#medic",
        enableMenu = function()
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job.name == "ambulance" then
                return true
            end
        end,
        subMenus = { "revive", "heal", "bigheal", "faturasem" }
    },
    {
        id = "mechanic",
        displayName = "Ações Benny's",
        icon = "#mechanic",
        enableMenu = function()
            PlayerData = ESX.GetPlayerData()

            if PlayerData.job.name == "mechanic" then
                return true
            end
        end,
        subMenus = { "fix", "clean", "destrancar", "faturabennys" }
    },
    {
        id = "lawyer",
        displayName = "Ações Saul Goodman",
        icon = "#lawyer",
        enableMenu = function()
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job.name == "lawyer" then
                return true
            end
        end,
        subMenus = { "faturalawyer" }
    },
    {
        id = "gato",
        displayName = "Ações UwU Café",
        icon = "#gato",
        enableMenu = function()
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job.name == "gato" then
                return true
            end
        end,
        subMenus = { "faturagato" }
    },
}

newSubMenus = {
    ["skate"] = {
        functionName = "longboard:start",
        icon = "#skate",
        title = "Skateboard",
        isClient = true
    },
    ["limparskate"] = {
        functionName = "longboard:clear",
        icon = "#skate",
        title = "Retirar Skateboard",
        isClient = true
    },
    ["engine"] = {
        functionName = "radial:engine",
        icon = "#engine",
        title = "Motor",
        isClient = true
    },
    ["moreoptionscar"] = {
        functionName = "vehcontrol:openExternal",
        icon = "#engine",
        title = "Mais Opções",
        isClient = true
    },
    ["lock"] = {
        functionName = "radial:lock",
        icon = "#lock",
        title = "Trancar",
        isClient = true
    },
    ["unlock"] = {
        functionName = "radial:unlock",
        icon = "#unlock",
        title = "Destrancar",
        isClient = true
    },
    ["moreop"] = {
        functionName = "radial:moreop",
        icon = "#moreop",
        title = "Mais opções",
        isClient = true
    },
    ["cuffh"] = {
        functionName = "radial:cuffh",
        icon = "#cuff",
        title = "Algemar (Forçado)",
        isClient = true
    },
    ["cuffs"] = {
        functionName = "radial:cuffs",
        icon = "#cuff",
        title = "Algemar",
        isClient = true
    },
    ["uncuff"] = {
        functionName = "radial:uncuff",
        icon = "#uncuff",
        title = "Desalgemar",
        isClient = true
    },
    ["putpersontrunk"] = {
        functionName = "radial:putpersontrunk",
        icon = "#putpersontrunk",
        title = "Colocar pessoa na bagageira",
        isClient = true
    },
    ["removepersontrunk"] = {
        functionName = "radial:removepersontrunk",
        icon = "#removepersontrunk",
        title = "Retirar pessoa da bagageira",
        isClient = true
    },
    ["entertrunk"] = {
        functionName = "radial:entertrunk",
        icon = "#entertrunk",
        title = "Entrar bagageira",
        isClient = true
    },
    ["exittrunk"] = {
        functionName = "radial:exittrunk",
        icon = "#exittrunk",
        title = "Sair bagageira",
        isClient = true
    },
    ["drag"] = {
        functionName = "radial:drag",
        icon = "#drag",
        title = "Arrastar",
        isClient = true
    },
    ["putinvehicle"] = {
        functionName = "radial:putinvehicle",
        icon = "#putinvehicle",
        title = "Colocar no veículo",
        isClient = true
    },
    ["outthevehicle"] = {
        functionName = "radial:outthevehicle",
        icon = "#outthevehicle",
        title = "Retirar do veículo",
        isClient = true
    },
    ["mdt"] = {
        functionName = "mdt:open",
        icon = "#mdt",
        title = "MDT",
        isClient = false
    },
    ["licenca"] = {
        functionName = "radial:licenca",
        icon = "#licenca",
        title = "Passar Licença",
        isClient = true
    },
    ["getname"] = {
        functionName = "radial:getName",
        icon = "#cc",
        title = "Obter nome",
        isClient = true
    },
    ["faturadpls"] = {
        functionName = "radial:sendBill:DPLS",
        icon = "#fatura",
        title = "Fatura",
        isClient = true
    },
    ["faturasem"] = {
        functionName = "radial:sendBill:SEM",
        icon = "#fatura",
        title = "Fatura",
        isClient = true
    },
    ["faturabennys"] = {
        functionName = "radial:sendBill:MEC",
        icon = "#fatura",
        title = "Fatura",
        isClient = true
    },
    ["faturalawyer"] = {
        functionName = "radial:sendBill:SAUL",
        icon = "#fatura",
        title = "Fatura",
        isClient = true
    },
    ["faturagato"] = {
        functionName = "radial:sendBill:GATO",
        icon = "#fatura",
        title = "Fatura",
        isClient = true
    },
    ["revive"] = {
        functionName = "radial:SEM:revive",
        icon = "#revive",
        title = "Reviver",
        isClient = true
    },
    ["heal"] = {
        functionName = "radial:SEM:heal",
        icon = "#heal",
        title = "Curar",
        isClient = true
    },
    ["reset"] = {
        functionName = "radial:clothes:reset",
        icon = "#reset",
        title = "Vestir tudo",
        isClient = true
    },
    ["hat"] = {
        functionName = "radial:clothing:chapeu",
        icon = "#hat",
        title = "Chapéu",
        isClient = true
    },
    ["glasses"] = {
        functionName = "radial:clothing:oculos",
        icon = "#glasses",
        title = "Óculos",
        isClient = true
    },
    ["mask"] = {
        functionName = "radial:clothing:mascara",
        icon = "#mask",
        title = "Máscara",
        isClient = true
    },
    ["bracelets"] = {
        functionName = "radial:clothing:bracelete",
        icon = "#bracelets",
        title = "Pulseira",
        isClient = true
    },
    ["bag"] = {
        functionName = "radial:clothing:mochila",
        icon = "#bag",
        title = "Bolsa",
        isClient = true
    },
    ["shoes"] = {
        functionName = "radial:clothing:sapatos",
        icon = "#shoes",
        title = "Sapatos",
        isClient = true
    },
    ["pants"] = {
        functionName = "radial:clothing:calcas",
        icon = "#pants",
        title = "Calças",
        isClient = true
    },
    ["tshirt"] = {
        functionName = "radial:clothing:tshirt",
        icon = "#tshirt",
        title = "Camiseta",
        isClient = true
    },
    ["vest"] = {
        functionName = "radial:clothing:casaco",
        icon = "#vest",
        title = "Colete",
        isClient = true
    },
    ["watch"] = {
        functionName = "radial:clothing:relogio",
        icon = "#watch",
        title = "Relógio",
        isClient = true
    },
    ["chain"] = {
        functionName = "radial:clothing:pescoco",
        icon = "#chain",
        title = "Acessórios de Pescoço",
        isClient = true
    },
    ["gloves"] = {
        functionName = "radial:clothing:luvas",
        icon = "#gloves",
        title = "Luvas",
        isClient = true
    },
    ["fix"] = {
        functionName = "esx_repairkit:onUse",
        icon = "#fix",
        title = "Reparar",
        isClient = false
    },
    ["clean"] = {
        functionName = "jobs_creator:actions:washVehicle",
        icon = "#clean",
        title = "Limpar",
        isClient = true
    },
    ["vercc"] = {
        functionName = "radial:cc:see",
        icon = "#cc",
        title = "Ver Cartão Cidadão",
        isClient = true 
    },
    ["vercconducao"] = {
        functionName = "radial:driver:see",
        icon = "#cc",
        title = "Ver Carta Condução",
        isClient = true 
    },
    ["verportedearma"] = {
        functionName = "radial:firearm:see",
        icon = "#cc",
        title = "Ver Porte Arma",
        isClient = true 
    },
    ["mostrarcc"] = {
        functionName = "radial:cc:show",
        icon = "#cc",
        title = "Mostrar Cartão Cidadão",
        isClient = true 
    },
    ["mostrarcconducao"] = {
        functionName = "radial:driver:show",
        icon = "#cc",
        title = "Mostrar Carta Condução",
        isClient = true 
    },
    ["mostrarportedearma"] = {
        functionName = "radial:firearm:show",
        icon = "#cc",
        title = "Mostrar Porte Arma",
        isClient = true 
    },
    ["impressao"] = {
        functionName = "radial:dpls:impressao",
        icon = "#impressao",
        title = "Usar impressão digital do sujeito",
        isClient = true 
    }
}
