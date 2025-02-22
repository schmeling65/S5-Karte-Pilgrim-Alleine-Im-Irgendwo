function TimerBisKarrenAufMap()
	Logic.SetQuestType(1, 3, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 4, MAINQUEST_OPEN, "Kapitel 4: Die Waren beschützen","Ihr habt dem Volk der Prinzessin geholfen. Nun möchte sie, dass ihr auch ihr helft. @cr Sie erwartet einen Karren mit Waren, der auf der südlichen Straße von Westen ankommen soll. Nehmt ihre bereitgestellen Truppen und beschützt den Karren auf dem Weg in die Stadt. @cr @cr Der Karren darf nicht vernichtet werden!",1)
	StartSimpleJob("ControlTimerKarren")

    -- start timer
    GUIQuestTools.ToggleStopWatch(300,1)
end

function ControlTimerKarren()
	if Counter.Tick2("KarrenArrives",300) then
		local _karrenSpawnpos = GetPosition("KarrenSpawn")
		Logic.SetEntityName(Logic.CreateEntity(Entities.PU_Travelling_Salesman,_karrenSpawnpos.X,_karrenSpawnpos.Y,290,2),"KarrenMitWaren")
		StartSimpleJob("CreateUeberfallBanditen",{1,10})
		StartSimpleJob("CreateUeberfallBanditen",{2,30})
		StartSimpleJob("CreateUeberfallBanditen",{3,30})
		StartSimpleJob("ControllKarren")
		Logic.MoveSettler(GetID("KarrenMitWaren"),GetPosition("Karrenwaypoint1").X,GetPosition("Karrenwaypoint1").Y)
		GUIQuestTools.ToggleStopWatch(0,0)
		return true
	end
	return false
end

function ControllKarren()
	if IsDead("KarrenMitWaren") then
		Defeat()
	end
	if IsNear("KarrenMitWaren","Karrenwaypoint1",1000) then
		if Counter.Tick2("KarrenAnWaypoint1",20) then
			Logic.MoveSettler(GetID("KarrenMitWaren"),GetPosition("Karrenwaypoint2").X,GetPosition("Karrenwaypoint2").Y)
		end
	end
	if IsNear("KarrenMitWaren","Karrenwaypoint2",1000) then
		if Counter.Tick2("KarrenAnWaypoint2",10) then
			Logic.MoveSettler(GetID("KarrenMitWaren"),GetPosition("wohnung").X,GetPosition("wohnung").Y)
		end
	end
	if IsNear("KarrenMitWaren","wohnung",1000) then
		Logic.DestroyEntity(GetID("KarrenMitWaren"))
		--Chapter 5
		PricessHelped()
		return true
	end
	return false
end

function CreateUeberfallBanditen(_table)
	if Counter.Tick2("BanditenspawnLocation".._table[1],_table[2]) then
		local _spawnpos = GetPosition("Banditen".._table[1])
		local troopID
		if _table[1] ~= 3 then
			troopID = AI.Entity_CreateFormation(3, Entities.CU_BanditLeaderSword1, nil, 8, _spawnpos.X, _spawnpos.Y, 0, 1, 0, 8)
		else
			troopID = AI.Entity_CreateFormation(3, Entities.PU_LeaderBow3, nil, 8, _spawnpos.X, _spawnpos.Y, 0, 1, 0, 8)
		end
		local _karrenpos = GetPosition("KarrenMitWaren")
		Logic.GroupAttackMove(troopID, _karrenpos.X, _karrenpos.Y, 305)
		return true
	end
	return false
end