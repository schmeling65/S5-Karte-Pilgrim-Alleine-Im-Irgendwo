function StartQuestHelpOthers()
	Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)
	Logic.SetQuestType(1, 2, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 3, MAINQUEST_OPEN, "Kapitel 3: Den Einwohnern helfen","Die Prinzessing hat euch aufgetragen den Bewohnern ihrer Stadt und der Region zu helfen. Im Gegenzug werden euch sowohl die Menschen als auch sie selbst vertrauen. @cr @cr Tipp: Fangt, so wie die Prinzessin es gesagt hat, zuerst mit der alleinigen Person im Süden an. Sie könnte vermutlich die längste Zeit brauchen.",1)
	Helped = 0
	GUIQuestTools.StartQuestInformation("Serf", "Geholfenen Personen:", 1, 1)
	function GUIQuestTools.UpdateQuestInformationTooltip()
		XGUIEng.SetText("QuestInformationTooltipText", "Geholfenen Personen:")
	end
	_bandittowerPos = GetPosition("Banditenturm")
	_banditenDef1 = GetPosition("BanditenDef1")
	_banditenDef2 = GetPosition("BanditenDef2")
	GUIQuestTools.UpdateQuestInformationString(Helped  .. " / 5")
	CreateBriefingHermitHouseGone()
	CreateNPCDogAway()
	CreateStoneNPC()
	CreateCaptainNPC()
	CreateGeldMeisterNPC()
end

function KarrenFollowPilgrim()
	GeldOrte = {}
	GeldOrte["Bank1"] = false
	GeldOrte["Bank2"] = false
	GeldOrte["Bank3"] = false
	GeldOrte["Bank4"] = false
	GeldOrte["Bank5"] = false
	GeldOrte["Kirche1"] = false
	GeldOrte["Kirche2"] = false
	GeldOrte["Kirche3"] = false
	StartSimpleJob("FollowPilgrim")
end

function FollowPilgrim()
	local _beenCount = 0
	for _builidng,_been in pairs(GeldOrte) do
		if GetDistance("Steuerkarren",_builidng)<= 900 and not _been then
			GeldOrte[_builidng] = true
			Sound.PlayGUISound(Sounds["OnKlick_PB_Bank1"], 200)
			Message("Geld abgeholt!")
		end
		if _been then
			_beenCount = _beenCount + 1
		end
	end
	if Counter.Tick2("Steuerkarren",10) then
		local pilgrimPos = GetPosition("Pilgrim")
		Logic.MoveSettler(GetID("Steuerkarren"),pilgrimPos.X,pilgrimPos.Y)
	end
	if _beenCount >= 8 then
		return WaitForKarrenToBeBack()
	end
	return false
end

function WaitForKarrenToBeBack()
	if GetDistance("Steuerkarren","geldmeister") <= 800 then
		CreateGeldMeisterGoldBroughtBriefing()
		return true
	end
	return false
end

function PlayerMustViewBanditCamp()
	local _scoutPos = GetPosition("militaer")
	scoutID = Logic.CreateEntity(Entities.PU_Scout,_scoutPos.X,_scoutPos.Y,180,1)
	StartSimpleJob("CheckForViewOnBandits")
end

function CheckForViewOnBandits()
	if IsDead(scoutID) then
		Defeat()
		return true
	end

	if Logic.IsMapPositionExplored(1, _bandittowerPos.X, _bandittowerPos.Y) == 1 and Logic.IsMapPositionExplored(1, _banditenDef1.X, _banditenDef1.Y) == 1 and Logic.IsMapPositionExplored(1, _banditenDef2.X, _banditenDef2.Y) == 1 then
		CreateScoutedBriefing()
		return true
	end
	return false
end

function establishHouseDone()
	CreateHermitHutHouseBuiltBriefing()
	Logic.DestroyEffect(_arrowID)
	--GUIQuestTools.UpdateQuestInformationString(Helped  .. " / 5")
end

function IncreaseHelpedPeople()
	Helped = Helped + 1
	GUIQuestTools.UpdateQuestInformationString(Helped  .. " / 5")
	if Helped >= 5 then
		CreateNPCPrincessOthersHelped()
		GUIQuestTools.DisableQuestInformation()
		--Chapter 4
	end
end

function PilgirmNearDog()
	if GetDistance("Pilgrim","Hund") <= 1000 then
		CreateDogFoundBriefing()
		return true
	end
	return false
end

function DogFollowPilgrim()
	if GetDistance("Hund","serfWolfGone") <= 700 then
		CreateBriefingDogBroughtBack()
		Logic.SettlerStand(GetID("Hund"))
		return true
	end
	if Counter.Tick2("DogFollow",10) then
		Logic.GroupGuard(GetID("Hund"),GetID("Pilgrim"))
	end
	return false
end

function CheckStonesExploded()
	NotHideAbilities = true 
	XGUIEng.ShowWidget(XGUIEng.GetWidgetID("Commands_Hero2"), 1)
	Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_DESTROYED,nil,"StonesDestroied",1,nil,nil)
end

Rocks = 0
function StonesDestroied()
	local _entID = Event.GetEntityID()
	if Logic.GetEntityType(_entID) == Entities.XD_RockDestroyableMedium1 then
		Rocks = Rocks + 1
		if Rocks >= 3 then
			XGUIEng.ShowWidget(XGUIEng.GetWidgetID("Commands_Hero2"), 0)
			IncreaseHelpedPeople()
			return true
		end
	end
	return false
end