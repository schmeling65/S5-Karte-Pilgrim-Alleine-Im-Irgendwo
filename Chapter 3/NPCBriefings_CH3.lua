function CreateBriefingHermitHouseGone()
	Logic.HurtEntity(GetID("HermitHut"), 450) --HermitHut has 500HP
	NPCHermitHouseGone			=	{}
	NPCHermitHouseGone.name 		=	"Hermit"
	NPCHermitHouseGone.callback	=	CreateNPCHermitHouseGoneBriefing
	
	CreateNPC(NPCHermitHouseGone)
end

function CreateNPCDogAway()
	WolfGoneNPC = {}
	WolfGoneNPC.name = "serfWolfGone"
	WolfGoneNPC.callback = CreateWolfGoneBriefing
	CreateNPC(WolfGoneNPC)
end

function CreateCaptainNPC()
	NPCCaptain = {}
	NPCCaptain.name = "Captain"
	NPCCaptain.callback = CreateCaptainBriefing
	
	CreateNPC(NPCCaptain)
end

function CreateGeldMeisterNPC()
	GeldNPC = {}
	GeldNPC.name = "geldmeister"
	GeldNPC.callback = CreateGeldmeisterBriefing
	
	CreateNPC(GeldNPC)
end

function CreateGeldMeisterGoldBroughtBriefing()
	GeldMeisterGoldBrought = {}
	GeldMeisterGoldBrought.finished = GeldMeisterGoldBroughtBriefingFinished
	local page = 1
	
	GeldMeisterGoldBrought[page] = {}
	GeldMeisterGoldBrought[page].title = "Steuereintreiber"
	GeldMeisterGoldBrought[page].text = "Ah Geld, herrlich. Mit diesem Bein hätte ich das niemals schaffen könnne. Ich lasse die Regentin wissen, dass ihr mir geholfen habt. @cr Gehabt euch wohl"
	GeldMeisterGoldBrought[page].position = GetPosition("geldmeister")
	
	StartBriefing(GeldMeisterGoldBrought)
end

function GeldMeisterGoldBroughtBriefingFinished()
	IncreaseHelpedPeople()
end

function CreateGeldmeisterBriefing()
	local _karrenSpawnPos = GetPosition("geldspawn")
	Logic.SetEntityName(Logic.CreateEntity(Entities.PU_Travelling_Salesman,_karrenSpawnPos.X,_karrenSpawnPos.Y,180,2),"Steuerkarren")
	GeldmeisterBriefing = {}
	GeldmeisterBriefing.finished = GeldmeisterBriefingFinished
	local page = 1
	
	GeldmeisterBriefing[page] = {}
	GeldmeisterBriefing[page].title = "Steuereintreiber"
	GeldmeisterBriefing[page].text = "Ah Willkommen! Ein zahlungswürdiger Bürger, der mir sein Geld vermachten will."
	GeldmeisterBriefing[page].position = GetPosition("geldmeister")
	
	page = page + 1
	
	GeldmeisterBriefing[page] = {}
	GeldmeisterBriefing[page].title = "Pilgrim"
	GeldmeisterBriefing[page].text = "Tut mir Leid, aber ich habe kein Geld. Ich bin hier um euch zu fragen, ob ihr bei etwas Hilfe bräuchtet."
	GeldmeisterBriefing[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	
	GeldmeisterBriefing[page] = {}
	GeldmeisterBriefing[page].title = "Steuereintreiber"
	GeldmeisterBriefing[page].text = "Schade. Ich dachte schon ihr hättet einige Münzen für mich. @cr @cr Aber in der Tat könnt ihr mir helfen. Ich hab ein gebrochenes Bein und kann dem Bein nur langsam durch die Stadt laufen und den Leuten ihre Steuern abnehmen."
	GeldmeisterBriefing[page].position = GetPosition("geldmeister")
	
	page = page + 1
	
	GeldmeisterBriefing[page] = {}
	GeldmeisterBriefing[page].title = "Steuereintreiber"
	GeldmeisterBriefing[page].text = "Vielleicht könnt ihr ja mit meinem Karren die Steuern aus den Banken (5) und die Kollekten aus den kirchlichen (3) Gebäuden holen und sie hier her zurück bringen."
	
	page = page + 1
	
	GeldmeisterBriefing[page] = {}
	GeldmeisterBriefing[page].title = "Pilgrim"
	GeldmeisterBriefing[page].text = "Ich bin zwar nicht der Beste, was Geldabholen belangt, aber das sollte ich schon schaffen. Ich komme dann mit dem Karren zurück zu euch."
	GeldmeisterBriefing[page].position = GetPosition("Pilgrim")
	
	StartBriefing(GeldmeisterBriefing)
end

function GeldmeisterBriefingFinished()
	KarrenFollowPilgrim()
end

function CreateScoutedBriefing()
	ScoutedBriefing = {}
	ScoutedBriefing.finished = ScoutedBriefingFinished
	local page = 1
	
	ScoutedBriefing[page] = {}
	ScoutedBriefing[page].title = "Captain"
	ScoutedBriefing[page].text = "Gute Arbeit! Jetzt wissen wir, mit was für Gegenwehr wir bei ihnen Rechnen müssen. Ihr habt uns einen guten Dienst erwiesen!"
	ScoutedBriefing[page].position = GetPosition("Captain")
	
	StartBriefing(ScoutedBriefing)
end

function ScoutedBriefingFinished()
	Logic.DestroyEntity(scoutID)
	IncreaseHelpedPeople()
end

function CreateCaptainBriefing()
	BriefingCaptain = {}
	BriefingCaptain.finished = BriefingCaptainFinished
	local page = 1
	
	BriefingCaptain[page] = {}
	BriefingCaptain[page].title = "Leutnant"
	BriefingCaptain[page].text = "Guten Tag. Wir hätten da ein Anliegen an euch. @cr Die Banditen haben sind zunehmend eine immer größer werdende Bedrohnung. Wir müssen bald etwas gegen sie unternehmen."
	BriefingCaptain[page].position = GetPosition("Captain")
	
	page = page + 1
	
	BriefingCaptain[page] = {}
	BriefingCaptain[page].title = "Leutnant"
	BriefingCaptain[page].text = "Doch bevor wir gegen die Banditen vorgehen, müssen wir wissen, wie es um ihr Lager und um ihre militärischen Bestände aussieht. @cr Nehmt einen unserer Kundschafter und versucht Informationen über ihre Stellung zu bringen."
	
	StartBriefing(BriefingCaptain)	
end

function BriefingCaptainFinished()
	PlayerMustViewBanditCamp()
end

function CreateWolfGoneBriefing()
	WolfGoneBriefing = {}
	WolfGoneBriefing.finished = WolfGoneBriefingFinished
	local page = 1
	
	WolfGoneBriefing[page] = {}
	WolfGoneBriefing[page].title = "Sägewerkarbeiter"
	WolfGoneBriefing[page].text = "Wo ist er? Wo ist er hin?"
	WolfGoneBriefing[page].position = GetPosition("serfWolfGone")
	
	page = page + 1
	
	WolfGoneBriefing[page] = {}
	WolfGoneBriefing[page].title = "Pilgrim"
	WolfGoneBriefing[page].text = "Sucht ihr wen?"
	WolfGoneBriefing[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	
	WolfGoneBriefing[page] = {}
	WolfGoneBriefing[page].title = "Sägewerkarbeiter"
	WolfGoneBriefing[page].text = "Mein Hund ist weg und ich weiß nicht wo er hin ist. @cr Wir sind vorhin noch durch das Waldstück mit den Nadelbäumen gelaufen und plötzlich war er nicht mehr bei mir. Könnt ihr ihn für mich suchen?"
	WolfGoneBriefing[page].position = GetPosition("serfWolfGone")
	
	page = page + 1
	
	WolfGoneBriefing[page] = {}
	WolfGoneBriefing[page].title = "Pilgrim"
	WolfGoneBriefing[page].text = "Natürlich. Für Haustiere helfe ich doch immer gerne."
	WolfGoneBriefing[page].position = GetPosition("Pilgrim")
	
	StartBriefing(WolfGoneBriefing)
end

function WolfGoneBriefingFinished()
	local _dogPos = GetPosition("DogSpawn")
	Logic.SetEntityName(Logic.CreateEntity(Entities.CU_AggressiveWolf,_dogPos.X,_dogPos.Y,180,4),"Hund")
	StartSimpleJob("PilgirmNearDog")
end

function CreateBriefingDogBroughtBack()
	BriefingDogBack = {}
	BriefingDogBack.finished = BriefingDogBackFinished
	local page = 1
	
	BriefingDogBack[page] = {}
	BriefingDogBack[page].title = "Sägewerkarbeiter"
	BriefingDogBack[page].text = "Ihr habt ihn gefunden! Vielen vielen Dank für! Ich war schon ganz in Sorge um ihn."
	BriefingDogBack[page].position = GetPosition("serfWolfGone")
	
	StartBriefing(BriefingDogBack)
end

function BriefingDogBackFinished()
	IncreaseHelpedPeople()
end

function CreateDogFoundBriefing()
	BriefingWolfFound = {}
	BriefingWolfFound.finished = BriefingWolfFoundFinished
	local page = 1
	
	BriefingWolfFound[page] = {}
	BriefingWolfFound[page].title = "Pilgrim"
	BriefingWolfFound[page].text = "Hab ich dich gefunden. Dann komm mal mit mir mit, ich bring dich zurück zu deinem Herrchen."
	BriefingWolfFound[page].position = GetPosition("Pilgrim")
	
	StartBriefing(BriefingWolfFound)
end

function CreateStoneNPC()
	StoneNPC = {}
	StoneNPC.name = "Steinmeister"
	StoneNPC.callback = CreateStoneNeededBriefing
	
	CreateNPC(StoneNPC)
end

function CreateStoneNeededBriefing()
	BriefingStoneNeeded = {}
	BriefingStoneNeeded.finished = BriefingStoneNeededFinished
	local page = 1
	
	BriefingStoneNeeded[page] = {}
	BriefingStoneNeeded[page].title = "Steinmetz"
	BriefingStoneNeeded[page].text = "Hallo, vielleicht könnt ihr uns helfen. Uns gehen momentan die Steine aus und wir bekommen momentan keinen Nachschub."
	BriefingStoneNeeded[page].position = GetPosition("Steinmeister")
	
	page = page + 1
	
	BriefingStoneNeeded[page] = {}
	BriefingStoneNeeded[page].title = "Steinmetz"
	BriefingStoneNeeded[page].text = "Findet in dieser Region einige (3) offen liegende Steine und sprengt sie in kleinere Stücke, damit wir sie nutzen können. @cr Ihr könnt sie daran erkennen, dass sie Risse haben."
	
	page = page + 1
	
	BriefingStoneNeeded[page] = {}
	BriefingStoneNeeded[page].title = "Steinmetz"
	BriefingStoneNeeded[page].text = "Wir werden die Steine selbst holen, mach euch darum keine Sorgen."
	
	StartBriefing(BriefingStoneNeeded)
end

function BriefingStoneNeededFinished()
	CheckStonesExploded()
end

function BriefingWolfFoundFinished() 
	StartSimpleJob("DogFollowPilgrim")
end

function CreateNPCMasterBuilderForHouse()
	NPCMasterBuilder = {}
	NPCMasterBuilder.name = "Masterbuilder"
	NPCMasterBuilder.callback = createNPCMasterBuilderBriefing
	CreateNPC(NPCMasterBuilder)
end

function createNPCMasterBuilderBriefing()
	MasterBuilderBriefing = {}
	MasterBuilderBriefing.finished = MasterBuilderBriefingFinished
	local page = 1
	
	MasterBuilderBriefing[page] = {}
	MasterBuilderBriefing[page].title = "Pilgrim"
	MasterBuilderBriefing[page].text = "Guten Tag. Könntet ihr mir bei etwas behilflich sein? Ein Einsiedler im südlichen Wald hat sein Haus verloren und ich habe ihm angeboten ein neues zu bauen."
	MasterBuilderBriefing[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	MasterBuilderBriefing[page] = {}
	MasterBuilderBriefing[page].title = "Pilgrim"
	MasterBuilderBriefing[page].text = "Allerdings habe ich weder Handwerker, noch die Rohstoffe um ein Haus bauen zu können.  Könntet ihr mir da vielleicht ein helfendes Händchen reichen?"
	
	page = page + 1
	MasterBuilderBriefing[page] = {}
	MasterBuilderBriefing[page].title = "Architekt"
	MasterBuilderBriefing[page].text = "Ja, das ließe sich schon einrichten. Meine Arbeiter haben gerade sowieso keine Arbeit zu tätigen, weshalb ich sie vorläufig in eure Obhut geben kann."
	MasterBuilderBriefing[page].position = GetPosition("Masterbuilder")
	
	page = page + 1
	MasterBuilderBriefing[page] = {}
	MasterBuilderBriefing[page].title = "Architekt"
	MasterBuilderBriefing[page].text = "Nur die Materialien habe ich nicht, weshalb ihr sie selbst beschaffen müsst... oder beschaffen lasst durch meine Arbeiter. Sie stehen euch frei zur Verfügung. Viel Glück."
	
	StartBriefing(MasterBuilderBriefing)
end

function MasterBuilderBriefingFinished()
	for i = 1,4,1 do
		_serfSpawnPos = GetPosition("Serf"..i)
		local serfID = Logic.CreateEntity(Entities.PU_Serf,_serfSpawnPos.X,_serfSpawnPos.Y,180,1)
		Logic.SetEntityName(serfID,"HelpingSerf"..i)
	end
end

function CreateNPCHermitHouseGoneBriefing()
	HermitHouseGone = {}
	HermitHouseGone.finished = HermitHouseGoneFinished
	local page = 1
	
	HermitHouseGone[page] = {}
	HermitHouseGone[page].title = "Einsiedler"
	HermitHouseGone[page].text = "Meine Hütte... meine kleine schöne Hütte, einfach niedergebrannt. Dabei habe ich ihnen doch gar nichts getan."
	HermitHouseGone[page].position = GetPosition("Hermit")
	
	page = page + 1
	
	HermitHouseGone[page] = {}
	HermitHouseGone[page].title = "Einsiedler"
	HermitHouseGone[page].text = "Warum müssen diese Banditen immer alles zerstören, was ihnen in die Quere kommt? Wo soll ich denn jetzt nur wohnen?"
	
	page = page + 1
	
	HermitHouseGone[page] = {}
	HermitHouseGone[page].title = "Pilgrim"
	HermitHouseGone[page].text = "Lasst mich euch helfen. Ich werde euch ein neues Haus bauen. @cr Ich muss dafür nur noch ein paar Arbeiter finden, die mir die Baumaterialien beschaffen und dann das Haus bauen."
	HermitHouseGone[page].position = GetPosition("Pilgrim")
	
	StartBriefing(HermitHouseGone)
end

function HermitHouseGoneFinished()

	local _hutPos = GetPosition("HermitHut")
	_arrowID = Logic.CreateEffect(GGL_Effects.FXTerrainPointer,_hutPos.X,_hutPos.Y,1)
	Logic.SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity,_hutPos.X,_hutPos.Y,0,2),"HermitHutOrt")
	
	local quest 		= {}
	quest.AreaPos 		= 	"HermitHutOrt"
	quest.AreaSize 		= 	1000	
	quest.EntityTypes 	=	{	{Entities.PB_Residence1,1}	}
	quest.Callback 		= 	establishHouseDone

	SetupEstablish(quest)
	
	Logic.HurtEntity(GetID("HermitHut"), 50)
	CreateNPCMasterBuilderForHouse()
end

function CreateHermitHutHouseBuiltBriefing()
	HermitHouseRebuilt = {}
	HermitHouseRebuilt.finished = HermitHouseRebuiltBriefingDone
	local page = 1
	
	HermitHouseRebuilt[page] = {}
	HermitHouseRebuilt[page].title = "Einsiedler"
	HermitHouseRebuilt[page].text = "Habt vielen Dank. Dank euch habe ich nun wieder ein Zuhause und kann weiterhin hier leben.@cr Und so geräumig und kuschlig ist es auch."
	HermitHouseRebuilt[page].position = GetPosition("Hermit")
	
	StartBriefing(HermitHouseRebuilt)
end

function HermitHouseRebuiltBriefingDone()
	for i = 1,4,1 do
		Logic.DestroyEntity(GetID("HelpingSerf"..i))
	end
	local _number, _reshous = Logic.GetEntitiesInArea(Entities.PB_Residence1, GetPosition("Hermit").X, GetPosition("Hermit").Y, 2000, 5, 10)
	Logic.ChangeEntityPlayerID(_reshous,4)
	IncreaseHelpedPeople()
end