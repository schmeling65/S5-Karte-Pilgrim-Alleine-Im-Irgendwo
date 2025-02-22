function CreateWoodNPCs()
	-- setup table for npcs
	NPCHermit			=	{}
	NPCHermit.name 		=	"Hermit"
	NPCHermit.callback	=	CreateNPCHermitBriefing
	
	NPCLeonardo			=	{}
	NPCLeonardo.name 		=	"Leonardo"
	NPCLeonardo.callback	=	CreateNPCLeonardoBriefing
	
	NPCWache1			=	{}
	NPCWache1.name 		=	"Wache1"
	NPCWache1.callback	=	CreateNPCWache1Briefing
	
	NPCWache2			=	{}
	NPCWache2.name 		=	"Wache2"
	NPCWache2.callback	=	CreateNPCWache3Briefing
	
	NPCWache3			=	{}
	NPCWache3.name 		=	"Wache3"
	NPCWache3.callback	=	CreateNPCWache2Briefing
	        
	-- create npcs
	CreateNPC(NPCHermit)
	CreateNPC(NPCLeonardo)
	CreateNPC(NPCWache1)
	CreateNPC(NPCWache2)
	CreateNPC(NPCWache3)
	
	-- Check for Player near Banditcamp
	-- One Second Trigger (10 ticks)
	StartSimpleJob("CheckForPlayerInBanditEnry")
end

function QuestFindAllInteractions()
	Logic.AddQuest(1, 1, MAINQUEST_OPEN, "Kapitel 1: Finde mehr heraus", "Ihr seid irgendwo in einem Waldgebiet unterwegs. Findet heraus, was sich in dieser Region abspielt und sprecht alle Leute an, die ihr ansprechen könnt.", 1)
	InteractionsFound = 0
end

function InteractionsFoundFinished()
	if InteractionsFound >= 4 then
		CreateBriefingGoToLighthouse()
		return true
	end
	return false
end

function DelayBisFeindlich()
	if Counter.Tick2("ZeitBisBanditenFeindlich",60) then
		SetHostile(1,3)
		InteractionsFound = InteractionsFound + 1
		InteractionsFoundFinished()
		return true
	end
	return false
end

function CheckForPlayerInBanditEnry()
	if IsNear("Pilgrim","BanditCampEntry",600) then
		CreateBanditCampBriefing()
		return true
	end
	return false
end

function GoToLighthouse()
	if IsNear("Pilgrim","Leuchtturm",1000) then
		CreateBriefingActivateLighthouse()
		return true
	end
	return false
end