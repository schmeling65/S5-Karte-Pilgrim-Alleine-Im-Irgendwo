function CreateWolfs()
	local _wolfPos = GetPosition("WolfSpawn1")
	Logic.SetEntityName(Logic.CreateEntity(Entities.CU_AggressiveWolf,_wolfPos.X,_wolfPos.Y,0,5),"Wolf1")
	local _wolfPos = GetPosition("WolfSpawn2")
	Logic.SetEntityName(Logic.CreateEntity(Entities.CU_AggressiveWolf,_wolfPos.X,_wolfPos.Y,0,5),"Wolf2")
	local _wolfPos = GetPosition("WolfSpawn3")
	Logic.SetEntityName(Logic.CreateEntity(Entities.CU_AggressiveWolf,_wolfPos.X,_wolfPos.Y,0,5),"Wolf3")
	StartSimpleJob("CheckIfWolfsDead")
end

function CheckIfWolfsDead()
	if IsDead("Wolf1") and IsDead("Wolf2") and IsDead("Wolf3") then
		CreateLeonardoBriefing2()
		return true
	end
	return false
end

function CreateBanditCamp()
	Bandits = UnlimitedArmy:New(
		{
		Player = 3,
		Area = 2900,
 		AutoDestroyIfEmpty = true,
 		TransitAttackMove = true,
 		Formation = UnlimitedArmy.Formations.Chaotic,
 		PrepDefense = false,
 		DestroyBridges = false,
 		LeaderFormation = 4,
 		AIActive = true,
 		DefendDoNotHelpHeroes = false,
 		AutoRotateRange = 10000,
 		DoNotNormalizeSpeed = true,
		IgnoreFleeing = false,
 		HiResJob = false
			}
			)
	BanditenSpawner = UnlimitedArmySpawnGenerator:New(Bandits, {
		Position = GetPosition("BanditCampSpawn"),
		ArmySize = 6,
		SpawnCounter = 5,
		SpawnLeaders = 6,
		LeaderDesc = {
			{LeaderType = Entities.CU_BanditLeaderSword1, SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
			{LeaderType = Entities.PU_LeaderBow3, SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0}
		},
		RefillSoldiers = true
	})
	Bandits:AddCommandDefend(GetPosition("BanditCampSpawn"),2800,false)
end