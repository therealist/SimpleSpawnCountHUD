ips = 0
hunt = 0
prop = 0

function spawncount()
	for k, v in pairs( ents.FindByClass( "info_player_start" ) ) do
		ips = ips + 1
	end

	for k, v in pairs( ents.FindByClass( "info_player_counterterrorist" ) ) do
		hunt = hunt + 1
	end
	
	for k, v in pairs( ents.FindByClass( "info_player_combine" ) ) do
		hunt = hunt + 1
	end
	
	for k, v in pairs( ents.FindByClass( "info_player_deathmatch" ) ) do
		ips = ips + 1
	end
	
	for k, v in pairs( ents.FindByClass( "info_player_axis" ) ) do
		hunt = hunt + 1
	end

	for k, v in pairs( ents.FindByClass( "info_player_terrorist" ) ) do
		prop = prop + 1
	end
	
	for k, v in pairs( ents.FindByClass( "info_player_rebel" ) ) do
		prop = prop + 1
	end
	
	for k, v in pairs( ents.FindByClass( "info_player_allies" ) ) do
		prop = prop + 1
	end
	
	for _, v in pairs (player.GetAll() ) do
		v:SetNWInt ('ipsnw', ips)
		v:SetNWInt ('huntnw', hunt)
		v:SetNWInt ('propnw', prop)
	end
	print ("BOTH:", ips)
	print ("HUNT:", hunt)
	print ("PROPS:", prop)
	
end
hook.Add("PlayerSpawn", "spawncount", spawncount)

function spawncountd()
	local ipsc = LocalPlayer():GetNWInt("ipsnw")
	local huntc = LocalPlayer():GetNWInt("huntnw")
	local propc = LocalPlayer():GetNWInt("propnw")
	local total = ipsc + huntc + propc
	draw.SimpleTextOutlined("Hunters: " .. huntc .. " | Props: " .. propc .. " | Either: " .. ipsc .. " | TOTAL: " .. total .. " | MAP: " .. game.GetMap(), "DermaLarge",30,30, Color( 255,255,255,255 ), TEXT_ALIGN_LEFT, 0, 1, Color( 0,0,0,255 ))
end
hook.Add("HUDPaint", "spawncountd", spawncountd)
