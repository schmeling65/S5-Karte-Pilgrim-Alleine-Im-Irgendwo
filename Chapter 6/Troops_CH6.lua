function CreatePrincessTroops()
	Logic.SetQuestType(1, 5, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 6, MAINQUEST_OPEN, "Kapitel 6: Die Banditen vernichten","Nachdem Pilgrim mit der Prinzessin in der Nacht gesprochen hatte, hat sie ihren Mut zusammen gefasst und möchte die Banditen ein für alle Mal vertreiben. Sie stellt Truppen zur Verfügung, die Pilgrim befehligen kann.",1)
	
	local _swordSpawnPos = GetPosition("SwordSpawn")
	local _cannonSpawnPos = GetPosition("CannonSpawn")
	local _bowSpawnPos = GetPosition("BowSpawn")
	local _sharpSpawnPos = GetPosition("SharpSpawn")
	local _poleSpawnPos = GetPosition("PoleSpawn")
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil,8,_swordSpawnPos.X,_swordSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil,8,_swordSpawnPos.X,_swordSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil,8,_swordSpawnPos.X,_swordSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderSword4,nil,8,_swordSpawnPos.X,_swordSpawnPos.Y,0,1,3,8)
	
	AI.Entity_CreateFormation(1,Entities.PU_LeaderPoleArm4,nil,8,_poleSpawnPos.X,_poleSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderPoleArm4,nil,8,_poleSpawnPos.X,_poleSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderPoleArm4,nil,8,_poleSpawnPos.X,_poleSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderPoleArm4,nil,8,_poleSpawnPos.X,_poleSpawnPos.Y,0,1,3,8)
	
	AI.Entity_CreateFormation(1,Entities.PU_LeaderBow4,nil,8,_bowSpawnPos.X,_bowSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderBow4,nil,8,_bowSpawnPos.X,_bowSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderBow4,nil,8,_bowSpawnPos.X,_bowSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderBow4,nil,8,_bowSpawnPos.X,_bowSpawnPos.Y,0,1,3,8)
	
	AI.Entity_CreateFormation(1,Entities.PU_LeaderRifle1,nil,8,_sharpSpawnPos.X,_sharpSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderRifle1,nil,8,_sharpSpawnPos.X,_sharpSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderRifle1,nil,8,_sharpSpawnPos.X,_sharpSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PU_LeaderRifle1,nil,8,_sharpSpawnPos.X,_sharpSpawnPos.Y,0,1,3,8)
	
	AI.Entity_CreateFormation(1,Entities.PV_Cannon3,nil,8,_cannonSpawnPos.X,_cannonSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PV_Cannon3,nil,8,_cannonSpawnPos.X,_cannonSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PV_Cannon4,nil,8,_cannonSpawnPos.X,_cannonSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PV_Cannon4,nil,8,_cannonSpawnPos.X,_cannonSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PV_Cannon4,nil,8,_cannonSpawnPos.X,_cannonSpawnPos.Y,0,1,3,8)
	AI.Entity_CreateFormation(1,Entities.PV_Cannon4,nil,8,_cannonSpawnPos.X,_cannonSpawnPos.Y,0,1,3,8)
	
	UpgradeBanditTowers()
	DestroyBanditSpawner()
	StartSimpleJob("IsPlayer3Dead")
end

function DestroyBanditSpawner()
	BanditenSpawner:Remove()
end

function UpgradeBanditTowers()
	Logic.DEBUG_UpgradeBuilding(GetID("BanditenDef1"))
	Logic.DEBUG_UpgradeBuilding(GetID("BanditenDef2"))
end

function IsPlayer3Dead()
	local _P3Entities = {Logic.GetPlayerEntities(3,nil,16)}
	if _P3Entities[1] <= 0 then
		CreateBriefingBanditsGone()
		return true
	end
	return false
end