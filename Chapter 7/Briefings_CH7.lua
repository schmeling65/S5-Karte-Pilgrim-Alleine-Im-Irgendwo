function CreateBriefingBanditsGone()
	 BriefingBanditsGone = {}
	 BriefingBanditsGone.finished = BriefingBanditsGoneFinished
	 local page = 1
	 
	 BriefingBanditsGone[page] = {}
	 BriefingBanditsGone[page].title = "Pilgrim"
	 BriefingBanditsGone[page].text = "Endlich sind die Banditen besiegt und in dem Land kann Frieden einkehren. @cr Männer, lasst uns zurückkehren und unseren Sieg auf dem Marktplatz feiern."
	 BriefingBanditsGone[page].position = GetPosition("Pilgrim")
	 
	 page = page + 1
	 
	 BriefingBanditsGone[page] = {}
	 BriefingBanditsGone[page].title = "Pilgrim"
	 BriefingBanditsGone[page].text = "Geht ihr schon mal vorraus, Männer, ich werde noch alle Leute in diesem Land dazu einladen; und dann feiern wir ein großes Fest."
	 
	 StartBriefing(BriefingBanditsGone)
end

function BriefingBanditsGoneFinished()
	CreateNPCsToGoToMarket()
end

NPCGoToMarketBriefingAnswerTable = {}
NPCGoToMarketBriefingAnswerTable[1] = "Ihr habt die Banditen bezwungen? Welch eine Überraschung. Natürlich komme ich zur Feier!"
NPCGoToMarketBriefingAnswerTable[2] = "Ich habe bereits von diesen Neuhigkeiten gehört und ich komme sehr gerne zu der Feier."
NPCGoToMarketBriefingAnswerTable[3] = "Ihr habt es wahrhaftig geschaft. Ich werde da sein."
NPCGoToMarketBriefingAnswerTable[4] = "Welch ein Wunder. Ich werde auf dem Marktplatz auf euch warten."
NPCGoToMarketBriefingAnswerTable[5] = "Ich hätte nicht gedacht, dass ihr das hinbekommt. Auf mich könnt ihr zählen!"
NPCGoToMarketBriefingAnswerTable[6] = "Bei Gott, die Prinzessin hatte recht behalten mit euch. Lasst uns das groß feiern."
NPCGoToMarketBriefingAnswerTable[7] = "Keine Banditen mehr? Wie auch immer ihr das bewerkstelligt habt, wir danken euch. Auf zum Marktplatz!"
NPCGoToMarketBriefingAnswerTable[8] = "Wir sind befreit von diesem Unheil und das nur durch euch. Mit meiner Anwesenheit könnt ihr rechnen."
NPCGoToMarketBriefingAnswerTable[9] = "Wir stehen in eurer Schuld und können uns gar nicht genug erkenntlich zeigen. Mögen wir uns auf dem Fest wiedersehen."
NPCGoToMarketBriefingAnswerTable[10] = "Ohne euch hätte es nicht gut gestanden um unsere schöne Stadt. Möge das Glück der Welt euch weiter begleiten. Wir sehen uns auf dem Marktplatz."
NPCGoToMarketBriefingAnswerTableCounter = 0

NPCSkriptNameZuTitleName = {}
NPCSkriptNameZuTitleName["monk"] = "Mönch"
NPCSkriptNameZuTitleName["smelter"] = "Lehmarbeiter"
NPCSkriptNameZuTitleName["serfWolfGone"] = "Sägewerkarbeiter"
NPCSkriptNameZuTitleName["Leonardo"] = "Leonardo"
NPCSkriptNameZuTitleName["Hermit"] = "Einsiedler"
NPCSkriptNameZuTitleName["geldmeister"] = "Steuereintreiber"
NPCSkriptNameZuTitleName["Masterbuilder"] = "Architekt"
NPCSkriptNameZuTitleName["gardendude"] = "Gärtner"
NPCSkriptNameZuTitleName["Steinmeister"] = "Steinmetz"
NPCSkriptNameZuTitleName["Captain"] = "Captain"

function CreateNPCGoToMarketBriefing(_npcTable,_heroID)
	NPCGoToMarketBriefingAnswerTableCounter = NPCGoToMarketBriefingAnswerTableCounter + 1
	NPCGoToMarketBriefing = {}
	NPCGoToMarketBriefing.finished = NPCGoToMarketBriefingFinished
	NPCGoToMarketBriefing.NPCname = _npcTable.name
	local page = 1
	
	NPCGoToMarketBriefing[page] = {}
	NPCGoToMarketBriefing[page].title = "Pilgrim"
	NPCGoToMarketBriefing[page].text = "Wir haben die Banditen besiegt und wollen das groß feiern. Wir treffen uns auf dem großen Marktplatz. Machst du bei der Feier mit?"
	NPCGoToMarketBriefing[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	
	NPCGoToMarketBriefing[page] = {}
	NPCGoToMarketBriefing[page].title = NPCSkriptNameZuTitleName[_npcTable.name]
	NPCGoToMarketBriefing[page].text = NPCGoToMarketBriefingAnswerTable[NPCGoToMarketBriefingAnswerTableCounter]
	
	StartBriefing(NPCGoToMarketBriefing)
end

function NPCGoToMarketBriefingFinished()
	local _festPos = GetPosition("Fest"..NPCGoToMarketBriefingAnswerTableCounter)
	Logic.MoveSettler(GetID(briefingBook[1].NPCname), _festPos.X, _festPos.Y)
	if NPCGoToMarketBriefingAnswerTableCounter >= 10 then
		StartSimpleJob("WaitForPilgrimAtMarket")
	end
end

function WaitForPilgrimAtMarket()
	if GetDistance("Pilgrim","Fest3") <= 1000 then
		VictoryCounter = 0
		CreateEndBriefing()
		StartSimpleJob("MarktplatzFirework")
		return true
	end
	return false
end

function MarktplatzFirework()
	VictoryCounter = VictoryCounter + 1
	if VictoryCounter == 3 then
		local _firework1Pos = GetPosition("Fest3")
		Logic.CreateEffect(GGL_Effects.FXYukiFireworksJoy , _firework1Pos.X, _firework1Pos.Y,0)
	end
	if VictoryCounter == 5 then
		local _firework2Pos = GetPosition("Waypoint6")
		Logic.CreateEffect(GGL_Effects.FXYukiFireworksJoy , _firework2Pos.X, _firework2Pos.Y,0)
		return true
	end
	return false
end

function CreateEndBriefing()
	EndBriefingEnd = {}
	EndBriefingEnd.finished = EndBriefingFinished
	local page = 1
	
	EndBriefingEnd[page] = {}
	EndBriefingEnd[page].title = "Erzähler"
	EndBriefingEnd[page].text = "Und so feierten sie bis in die Nacht und alle waren glücklich. Die Einwohner der Stadt und der Umgebung lebten bis in die ferne Zukunft in Frieden und Wohlstand."
	EndBriefingEnd[page].position = GetPosition("Fest3")
	
	page = page + 1
	
	EndBriefingEnd[page] = {}
	EndBriefingEnd[page].title = "Erzähler"
	EndBriefingEnd[page].text = "Pilgrim und die Prinzessin kamen sich im Laufe der Jahre immer näher und begannen eine Beziehung aufzubauen. @cr Bis heute sind sie glücklich mit einander zusammen und regieren die Stadt in Einigkeit."
	StartBriefing(EndBriefingEnd)
end

function EndBriefingFinished()
	MapDone()
end

function MapDone()
	Victory()
	return true
end