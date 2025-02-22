function CreateNPCsToGoToMarket()
	Logic.SetQuestType(1, 6, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 7, MAINQUEST_OPEN, "Kapitel 7: Die Feier auf dem Marktplatz","Die Banditen sind bezwungen. Pilgrim möchte nun ein Fest auf dem Marktplatz veranstalten. Dafür muss er alle Leute aus der Region zusammen trommeln. @cr Lauft mit Pilgrim zu ihnen und sprecht sie darauf an.",1)
	
	local HermitNPCEnd = {}
	HermitNPCEnd.name = "Hermit"
	HermitNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(HermitNPCEnd)
	
	local LeonardoNPCEnd = {}
	LeonardoNPCEnd.name = "Leonardo"
	LeonardoNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(LeonardoNPCEnd)
	
	local SawmillNPCEnd = {}
	SawmillNPCEnd.name = "serfWolfGone"
	SawmillNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(SawmillNPCEnd)
	
	local MonkNPCEnd = {}
	MonkNPCEnd.name = "monk"
	MonkNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(MonkNPCEnd)
	
	local SmelterNPCEnd = {}
	SmelterNPCEnd.name = "smelter"
	SmelterNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(SmelterNPCEnd)
	
	local GeldmeisterNPCEnd = {}
	GeldmeisterNPCEnd.name = "geldmeister"
	GeldmeisterNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(GeldmeisterNPCEnd)
	
	local CaptainNPCEnd = {}
	CaptainNPCEnd.name = "Captain"
	CaptainNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(CaptainNPCEnd)
	
	local SteinmeisterNPCEnd = {}
	SteinmeisterNPCEnd.name = "Steinmeister"
	SteinmeisterNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(SteinmeisterNPCEnd)
	
	local MasterBuilderNPCEnd = {}
	MasterBuilderNPCEnd.name = "Masterbuilder"
	MasterBuilderNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(MasterBuilderNPCEnd)
	
	local GardenDudeNPCEnd = {}
	GardenDudeNPCEnd.name = "gardendude"
	GardenDudeNPCEnd.callback = CreateNPCGoToMarketBriefing
	CreateNPC(GardenDudeNPCEnd)
end