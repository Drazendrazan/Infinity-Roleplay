Config = {}

local Prefix = "[Infinity Roleplay] "
Config.DiscordServerID = 1035256934753915001 -- Discord Server ID
Config.DiscordBotToken = "" -- Discord Bot Token. You can create one on https://discord.com/developers/applications
Config.maxServerSlots = 64

Config.Roles = {
	Owner = {
		roleID = "1035263226629337269",
		points = 100,
		name = "Owner"
	},

	["Head Admin"] = {
		roleID = "1035263801840369695",
		points = 75,
		name = "Head Admin"
	},

	Admin = {
		roleID = "1035264061606215700",
		points = 50,
		name = "Admin"
	},

	Moderator = {
		roleID = "1035264415362199622",
		points = 30,
		name = "Moderator"
	},

	Support = {
		roleID = "1035264635349254254",
		points = 15,
		name = "Support"
	},
}

Config.Colors = {
	"accent",
	"good",
	"warning",
	"attention",
}

Config.NoDiscord = Prefix .. "Verifique se tem o Discord aberto."
Config.NoSteam = Prefix .. "Verifique se tem a Steam aberta."

Config.Error = Prefix .. "Erro. Tente novamente mais tarde."
Config.HandshakingWith = Prefix .. "A juntar-se à fila..."
