
--░██╗░░░░░░░██╗███████╗██████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--░╚██╗████╗██╔╝█████╗░░██████╦╝███████║██║░░██║██║░░██║█████═╝░╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║██╔═██╗░░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██████╦╝██║░░██║╚█████╔╝╚█████╔╝██║░╚██╗██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

Config.Webhooks = { -- Place your Discord webhooks here.
    ["drop"] = 'https://discord.com/api/webhooks/1057479351886684222/CJgHso5sw7BszTRxejP3ZX5Bha4AQNLuEhULzTmsFC0gHpY53ScIYxYn_VMI7-GpyTkH',              --- @param When the player drop a item
    ["shops"] = 'https://discord.com/api/webhooks/1057479446094946334/sVx5wJdwc3uq-W8wJ3tt98yrpiMLlcMwESSK2DpYWLLJT2VfcJMYhcHDz8fBoZnD0lHi',             --- @param When the player buy into qs-shops or trigger of shop
    ["vehicles"] = 'https://discord.com/api/webhooks/1057479493444440124/FW2PGLvjTCI0gL2ZZxSiZeI94yYcNI0fr2euBWvAdK3LYAbHA9Nyn4oCrRntGhSXG40r',          --- @param When the save a item into trunk
    ["stash"] = 'https://discord.com/api/webhooks/1057479548859588628/O2Sn8P1W9YMal7LrjpTD6-SHiuEs8XLyqesXoJ817wG6EhuL9iigc7xk_1fAVO1sH4Lp',             --- @param When the save a item into stash
    ["steal"] = 'https://discord.com/api/webhooks/1057479605805658215/H3Vij2_BIFOM38AwAFwOfQoUP3azlfyOf2JgQ6K4F5VE1LuxNpTPzN56cE8EhhxS20EN',             --- @param Show the stealed items when one player steal
    ["garbage"] = '',           --- @param When pick a item from garbage
    ["giveitem"] = 'https://discord.com/api/webhooks/1057479679952564224/zoDrkTdivJqWah9VMCoLBQ0PIb0iGrsa24sTnLbcxBytJlpeEwwPSs-aTkospzteeoQn',          --- @param Give item command
    ["giveitem_admin"] = 'https://discord.com/api/webhooks/1057479748437155952/KHKwBBTneAbvnaBP8liGmXgZq7aA4CxmrVcgzRVEaB7Hv7dEYcwrRoIcgM4mRLoJ6lRj',    --- @param Give item command
    ["giveweapon_admin"] = 'https://discord.com/api/webhooks/1057479806461157396/W5DdI1tKN2k7wluFgWg5r0m7fy8B2KTM2dbMppHTP9HWyI3C_We7B1zk73HKyu6xdFMB',  --- @param Give weapon command
    ["distance_check"] = 'https://discord.com/api/webhooks/1057479854762766397/r5IJYnVZ51X14RQGm9-u6404orU8OCfvKLhte0M8xgW0S240UQRyf-xMbhVAugoNl_9w',    --- @param Steal distance checks
}