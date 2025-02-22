function CreateNPCPrincessOthersHelped()
	NPCPrincessOthersHelped = {}
	NPCPrincessOthersHelped.name = "princess"
	NPCPrincessOthersHelped.callback = CreatePrincessBriefingOthersHelped
	
	CreateNPC(NPCPrincessOthersHelped)
end

function CreatePrincessBriefingOthersHelped()
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil, 8,GetPosition("innererRing").X,GetPosition("innererRing").Y,0,1,0,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil, 8,GetPosition("innererRing").X,GetPosition("innererRing").Y,0,1,0,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil, 8,GetPosition("innererRing").X,GetPosition("innererRing").Y,0,1,0,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil, 8,GetPosition("innererRing").X,GetPosition("innererRing").Y,0,1,0,8)
	
	AI.Entity_CreateFormation(1,Entities.PU_LeaderBow4,nil, 8,GetPosition("Waypoint8").X,GetPosition("Waypoint8").Y,0,1,0,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderBow4,nil, 8,GetPosition("Waypoint8").X,GetPosition("Waypoint8").Y,0,1,0,8)

	BriefingPrincessOthersHelped = {}
	BriefingPrincessOthersHelped.finished = BriefingPrincessOthersHelpedFinished
	local page = 1
	
	BriefingPrincessOthersHelped[page] = {}
	BriefingPrincessOthersHelped[page].title = "Prinzessin"
	BriefingPrincessOthersHelped[page].text = "Ihr habt meinem Volk geholfen und dafür bin ich euch sehr dankbar. Es ist gut zu wissen, dass es jemandem gibt, der sich um mein Volk sorgt."
	BriefingPrincessOthersHelped[page].position = GetPosition("princess")
	
	page = page + 1
	
	BriefingPrincessOthersHelped[page] = {}
	BriefingPrincessOthersHelped[page].title = "Prinzessin"
	BriefingPrincessOthersHelped[page].text = "Doch einer Person müsst ihr noch aushelfen, und dabei handelt es sich um mich. Wir erwarten bald eine Lieferung aus der Nachbarstadt."
	
	page = page + 1
	
	BriefingPrincessOthersHelped[page] = {}
	BriefingPrincessOthersHelped[page].title = "Prinzessin"
	BriefingPrincessOthersHelped[page].text = "Allerdings muss der Karren den Waren über den Weg außerhalb unserer Mauern nehmen und kann dort von Banditen angegriffen werden, die momentan sehr aggressiv sind."
	
	page = page + 1
	
	BriefingPrincessOthersHelped[page] = {}
	BriefingPrincessOthersHelped[page].title = "Prinzessin"
	BriefingPrincessOthersHelped[page].text = "Bescnützt den Karren und begleitet ihn sicher in unsere Stadt! Nehmt hierzu einige meiner Truppen. Sie werden euch begleiten und dabei helfen."
	BriefingPrincessOthersHelped[page].position = GetPosition("Waypoint8")
	
	StartBriefing(BriefingPrincessOthersHelped)
end

function BriefingPrincessOthersHelpedFinished()
	TimerBisKarrenAufMap()
end