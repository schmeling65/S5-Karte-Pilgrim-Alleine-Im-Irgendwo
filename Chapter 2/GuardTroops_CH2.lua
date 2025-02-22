function CreateGuardTroops()
	local _generalPos = GetPosition("GeneralSpawn")
	Logic.SetEntityName(Logic.CreateEntity(Entities.PU_LeaderSword4,_generalPos.X,_generalPos.Y,180,2),"General")
	local _movePos = GetPosition("GuardsMovePos")
	Logic.GroupAttackMove(GetID("General"),_movePos.X ,_movePos.Y, 0)
	for i = 1,4,1 do
		local _soldierPos = GetPosition("Soldier"..i.."Spawn")
		Logic.SetEntityName(Logic.CreateEntity(Entities.PU_LeaderSword3,_soldierPos.X,_soldierPos.Y,180,2),"Soldier"..i)
	end
	CallFuncWithLinePositions({X=_movePos.X-400,Y=_movePos.Y+400},{X=_movePos.X-400,Y=_movePos.Y-400},MoveToLighthouse,200)
end

SoldierNumber = 0
function MoveToLighthouse(_pos)
	SoldierNumber = SoldierNumber + 1
	Logic.GroupAttackMove(GetID("Soldier"..SoldierNumber), _pos.X, _pos.Y, 0)
end

function LetPilgrimFollowGuards()
	DisableNpcMarker("Wache1")
	DisableNpcMarker("Wache2")
	DisableNpcMarker("Wache3")
	OpenDoors()
	Logic.SetQuestType(1, 1, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 2, MAINQUEST_OPEN, "Kapitel 2: Die große Stadt","Ihr wurdet von den Truppen der Regentin in Gewahrsam genommen und sollt ihnen nun folgen. Verliert sie nicht aus den Augen!",1)
	_newPoss = {}
	local _waypointNumber = 1
	CallFuncWithCirclePositions("Waypoint".._waypointNumber, 500, 72, ReturnCirclePosToTable)
	Logic.GroupAttackMove(GetID("General"), _newPoss[1].X, _newPoss[1].Y, 0)
	for i =1,4,1 do
		Logic.GroupAttackMove(GetID("Soldier"..i), _newPoss[i+1].X, _newPoss[i+1].Y, 72*i)	
	end
	_newPoss = nil
	StartSimpleJob("WaitForPilgrimThenMoveToNext",_waypointNumber)
end

function WaitForPilgrimThenMoveToNext(_waypointNumber)
	if GetDistance("Pilgrim","Waypoint".._waypointNumber) <=1000 then
		if _waypointNumber+1 >= 9 then
			Logic.GroupAttackMove(GetID("General"), GetPosition("GeneralLastPos").X, GetPosition("GeneralLastPos").Y, 90)
			for i = 1 ,4, 1 do
				Logic.GroupAttackMove(GetID("Soldier"..i), GetPosition("Soldier"..i.."LastPos").X, GetPosition("Soldier"..i.."LastPos").Y, 270)
			end
			LetPrincessTalk()
			return true
		end
		_newPoss = {}
		CallFuncWithCirclePositions("Waypoint".._waypointNumber+1, 500, 72, ReturnCirclePosToTable)
		Logic.GroupAttackMove(GetID("General"), _newPoss[1].X, _newPoss[1].Y, 0)
		for i =1,4,1 do
			Logic.GroupAttackMove(GetID("Soldier"..i), _newPoss[i+1].X, _newPoss[i+1].Y, 72*i)	
		end
		_newPoss = nil
		StartSimpleJob("WaitForPilgrimThenMoveToNext",_waypointNumber + 1)
		return true
	end
	return false
end

function ReturnCirclePosToTable(_pos)
	table.insert(_newPoss,_pos)
end

function OpenDoors()
	ReplaceEntity("gate1",Entities.XD_DarkWallStraightGate)
	ReplaceEntity("gate2",Entities.XD_DarkWallStraightGate)
	ReplaceEntity("gate3",Entities.XD_DarkWallStraightGate)
end