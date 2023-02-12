notifications = {}

notifications.driveway_full = "Você não pode iniciar o trabalho porque a entrada da garagem está cheia."

cfg = {}

cfg.framework = "esx" --esx,qbcore,vrp,vrpex,nunoradioman,standalone | Check server/functions.lua

cfg.updateserverside = true -- this makes sure the player has the correct list, IF YOU HAVE 500+ PLAYERS AND RUNNING ALL OF THE SCRIPTS PUT THIS "FALSE"

cfg.job = {
	blips = {
		--{x,y,z,sprite,colour,text,scale}
		{-321.71185302734,-1546.2280273438,31.019916534424,318,17,"Centro de Reciclagem",0.7},
	},
	service = {
		ped_pos = {-321.71185302734,-1546.2280273438,31.019916534424 - 1,3.08}, -- position of the ped where yo usign up.
		ped = "s_m_y_construct_01", -- ped where you sign up for the job.

		vehicle_pos = {-316.923828125,-1524.7534179688,27.558387756348,265.35}, -- Postion for the vehicle of the job.
		vehicle = "trash", -- vehicle of the job. "TRASH" TRUCK DEFAULT.

		payment_item = "bank", -- this is the payment per trash bag [ITEM]. -- check in server/Functions.lua for more information.
		payment_amount = 100, -- this is the payment per trash bag [AMOUNT].

		enter_job_text = "[E] Iniciar trabalho", 
		enter_job_key = 51, 
		exit_job_text = "[E] Finalizar trabalho", 
		exit_job_key = 51,
		grab_trash_text = "[G] Pegar",
		grab_trash_key = 47,
		deliver_trash_text = "[G] Atirar",
		deliver_trash_key = 47,
	},
	interactables = {
		{
			pos = {96.108619689941,-1687.54296875,29.21005821228,142.69},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-243.64572143555,-1344.0526123047,31.235046386719,358.82},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-240.28063964844,-1343.966796875,31.258136749268,350.97},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-234.49993896484,-1300.5048828125,31.295961380005,356.79},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-87.374900817871,-1287.333984375,29.298109054565,266.55},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-87.296920776367,-1278.2858886719,29.298120498657,281.76},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-87.376884460449,-1298.6820068359,29.30108833313,263.96},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-87.232704162598,-1330.2619628906,29.293519973755,272.29},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-50.632717132568,-1350.6647949219,29.326940536499,359.73},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-38.880451202393,-1351.9750976562,29.330513000488,351.93},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-28.103246688843,-1352.21484375,29.317893981934,358.9},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {2.3360121250153,-1351.4271240234,29.351293563843,4.29},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {120.33337402344,-1327.8327636719,29.367744445801,225.39},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {122.09613037109,-1326.3990478516,29.394771575928,218.47},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {104.14925384521,-1318.0247802734,29.251667022705,31.47},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {106.02255249023,-1317.0914306641,29.226585388184,17.91},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {155.05935668945,-1309.0552978516,29.202283859253,251.62},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {156.12707519531,-1307.0993652344,29.202293395996,253.64},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {166.17727661133,-1293.9345703125,29.451707839966,337.45},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {165.00779724121,-1286.6275634766,29.298595428467,238.97},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {146.73797607422,-1289.4631347656,29.329389572144,215.16},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {144.62294006348,-1290.6431884766,29.356580734253,212.71},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-166.98503112793,-1413.5179443359,30.970712661743,42.62},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {0.65114617347717,-1386.3627929688,29.292133331299,169.43},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {3.4631206989288,-1386.5192871094,29.290397644043,162.7},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {48.988941192627,-1386.4219970703,29.327884674072,187.96},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {49.059314727783,-1400.1530761719,29.360851287842,182.82},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {66.591636657715,-1408.6715087891,29.352184295654,265.85},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {55.090934753418,-1435.734375,29.311738967896,223.61},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {53.286865234375,-1437.9410400391,29.311738967896,223.22},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {39.997524261475,-1453.71875,29.311700820923,245.36},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-5.9349064826965,-1475.7567138672,30.55090713501,224.83},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-7.9583559036255,-1478.1929931641,30.504625320435,245.32},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-9.7664995193481,-1478.3614501953,30.494207382202,133.24},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-33.430858612061,-1471.9033203125,31.328399658203,182.72},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-48.543849945068,-1476.5217285156,31.991819381714,267.81},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-93.372619628906,-1470.8215332031,33.073204040527,130.29},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-350.36972045898,-1072.7717285156,22.934671401978,45.8},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-348.4147644043,-1071.0533447266,22.951583862305,44.31},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-346.40335083008,-1068.8919677734,22.98175239563,50.29},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-4.7167525291443,-1084.4149169922,26.672080993652,278.4},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-3.5329711437225,-1081.4755859375,26.672065734863,226.59},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {121.37512207031,-1087.5798339844,29.213842391968,194.16},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {125.8903427124,-1087.3469238281,29.201076507568,173.44},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {115.51630401611,-1049.5776367188,29.20404624939,339.71},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {127.90625,-1054.3361816406,29.192350387573,347.11},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {130.64323425293,-1054.9719238281,29.192356109619,359.71},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {151.86921691895,-1065.5965576172,29.192384719849,337.98},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {154.48123168945,-1066.5339355469,29.192367553711,7.7},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {172.66027832031,-1073.7689208984,29.192375183105,248.42},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {172.25128173828,-1076.5788574219,29.192367553711,277.89},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {153.85334777832,-1048.5799560547,29.243202209473,67.22},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {154.73501586914,-1045.9301757812,29.283622741699,86.04},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {307.56469726562,-1033.7346191406,29.209686279297,178.02},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {301.82482910156,-1033.6456298828,29.211753845215,184.7},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {468.51455688477,-948.52630615234,27.81484413147,3.61},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {453.40362548828,-931.98724365234,28.484996795654,277.97},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {453.00033569336,-917.3173828125,28.472274780273,281.48},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {424.91937255859,-685.01434326172,29.285718917847,9.85},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-562.47943115234,-707.91735839844,33.007278442383,86.41},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-561.65161132812,-709.908203125,32.98348236084,189.04},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-518.02288818359,-867.93792724609,29.338663101196,92.43},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-518.00695800781,-870.57849121094,29.121547698975,77.11},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-559.12603759766,-821.88897705078,27.583240509033,27.56},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-562.29840087891,-821.76800537109,27.363807678223,344.19},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-570.07568359375,-858.58160400391,26.462514877319,270.77},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-573.01306152344,-903.81335449219,25.691217422485,184.37},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-655.67895507812,-894.38336181641,24.727212905884,176.7},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-658.05242919922,-890.30627441406,24.682193756104,11.58},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-660.76837158203,-890.42022705078,24.629543304443,346.89},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-688.86016845703,-891.28198242188,24.499053955078,97.03},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-672.44201660156,-950.24743652344,21.268039703369,352.34},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-3.3368790149689,-52.677024841309,63.28536605835,68.09},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {2.8111755847931,-55.124572753906,63.285106658936,345.45},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {5.5076837539673,-55.781246185303,63.284961700439,350.94},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-101.49794769287,45.981903076172,71.631172180176,221.94},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-81.120407104492,91.364250183105,71.563087463379,337.88},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-120.38324737549,217.94035339355,94.612457275391,84.89},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-120.45232391357,215.71995544434,94.162101745605,41.04},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-216.6820526123,276.44909667969,92.05052947998,353.13},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-214.18128967285,276.3268737793,92.044792175293,10.93},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-518.56488037109,270.66461181641,83.073905944824,84.58},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-547.14453125,286.53616333008,83.020355224609,85.21},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-548.35675048828,297.10775756836,83.01537322998,171.7},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-468.14361572266,273.58453369141,83.274055480957,351.54},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-622.85101318359,294.55953979492,82.137939453125,270.4},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-622.87133789062,292.47378540039,81.985145568848,267.7},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-619.89068603516,300.58596801758,82.320655822754,190.06},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-622.78204345703,301.63192749023,82.239822387695,84.16},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-622.62579345703,304.85888671875,82.244110107422,91.23},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-580.37915039062,192.64660644531,71.383567810059,260.29},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-580.05584716797,189.68876647949,71.299667358398,298.92},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-483.01126098633,-55.288063049316,39.994232177734,351.32},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-480.15188598633,-55.300285339355,39.994216918945,2.63},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-241.39530944824,-1471.3135986328,31.499216079712,45.54},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-242.8415222168,-1473.3488769531,31.476488113403,53.21},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-244.00694274902,-1475.2860107422,31.454977035522,73.3},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-171.87655639648,-1459.5551757812,31.681545257568,317.89},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-228.58689880371,-1636.7559814453,33.716564178467,197.2},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-235.4280090332,-1682.822265625,33.759731292725,275.57},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-235.49409484863,-1685.4034423828,33.723705291748,264.48},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-235.59617614746,-1687.0439453125,33.708358764648,207.38},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-201.97833251953,-1692.8902587891,34.120197296143,302.49},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-168.08079528809,-1662.6219482422,33.467475891113,14.43},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-139.01145935059,-1626.2403564453,32.758941650391,54.11},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-122.76184082031,-1621.4833984375,32.133331298828,230.73},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-106.08425140381,-1605.5258789062,31.786460876465,227.9},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-101.49974060059,-1582.0364990234,31.701875686646,49.71},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-99.752342224121,-1579.984375,31.661531448364,66.47},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {-10.311966896057,-1563.8900146484,29.295433044434,244.57},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {128.05863952637,-1485.9692382812,29.141393661499,157.65},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {130.0454864502,-1487.6041259766,29.139322280884,140.17},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {177.74601745605,-1518.5739746094,29.141628265381,229.68},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
		{
			pos = {179.56704711914,-1516.6149902344,29.141616821289,220.01},
			status = false, -- dont change
			resettimer = 15, -- minutes
		},
	},
}