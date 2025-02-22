function ExploreCity()
	--Logic.SetQuestType(1, 2, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 2, MAINQUEST_OPEN, "Kapitel 2: Die Stadt erkunden","Nachdem die Wachen euch der Prinzessin vorgeführt haben, gab sie euch eine Aufgabe. @cr Bevor ihr euch ihr als vertrauenswürdig erweißt, müsst ihr die Stadt mit allen ihren Distrikten erkunden. @cr Lauft durch die Stadt und findet jeden Distrikt um zu wissen wie die Stadt aufgebaut ist.",1)
	CityAreas = {}
	CityAreas["innererRing"] = false
	--CityAreas["Administration"] = false
	CityAreas["wohnung"] = false
	CityAreas["Admin"] = false
	CityAreas["militaer"] = false
	CityAreas["geistlich"] = false
	CityAreas["lehm"] = false
	CityAreas["holz"] = false
	CityAreas["waffenproduktion"] = false
	Visited = 0
	
	GUIQuestTools.StartQuestInformation("Serf", "Bereits besuchte Stadtgebiete", 1, 1)
	function GUIQuestTools.UpdateQuestInformationTooltip()
		XGUIEng.SetText("QuestInformationTooltipText", "Bereits besuchte Stadtgebiete")
	end
	XGUIEng.SetText("QuestInformationTooltipText", "Bereits besuchte Stadtgebiete")
	GUIQuestTools.UpdateQuestInformationString(Visited  .. " / 8")
	StartSimpleJob("CheckIfPilgriminAreaInCity")
end

function CheckIfPilgriminAreaInCity()
	for _places,_been in pairs(CityAreas) do
		if IsNear("Pilgrim",_places,2000) and not _been then
			CityAreas[_places] = true
			Visited = Visited + 1
			GUIQuestTools.StartQuestInformation("Serf", "Bereits besuchte Stadtgebiete", 1, 1)
		
			GUIQuestTools.UpdateQuestInformationString(Visited  .. " / 8")
		end
	end
	if Visited >= 8 then
		GoBackToPrincess()
		return true
	end
	return false
end

function GoBackToPrincess()
	NPCPrincess = {}
	
	NPCPrincess.name = "princess"
	NPCPrincess.callback = CreateBriefingPrincessExploringDone
	CreateNPC(NPCPrincess)
end