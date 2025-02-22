--------------------------------------------------------------------------------
-- MapName: XXX
--
-- Author: schmeling65
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
Script.Load(Folders.Map.."s5CommunityLib/packer/devLoad.lua")
mcbPacker.Paths = {{Folders.Map,".lua"}}
mcbPacker.require("s5CommunityLib/lib/UnlimitedArmy")
mcbPacker.require("S5CommunityLib/comfort/pos/CallFuncWithCirclePositions")
mcbPacker.require("S5CommunityLib/comfort/pos/CallFuncWithLinePositions")
mcbPacker.require("S5CommunityLib/comfort/number/round")
mcbPacker.require("s5CommunityLib/lib/UnlimitedArmySpawnGenerator")
Script.LoadFolder(Folders.Map.."Chapter 1/")
Script.LoadFolder(Folders.Map.."Chapter 2/")
Script.LoadFolder(Folders.Map.."Chapter 3/")
Script.LoadFolder(Folders.Map.."Chapter 4/")
Script.LoadFolder(Folders.Map.."Chapter 5/")
Script.LoadFolder(Folders.Map.."Chapter 6/")
Script.LoadFolder(Folders.Map.."Chapter 7/")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function InitDiplomacy()
	SetHostile(1,5)
	SetHostile(2,3)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function InitResources()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function InitTechnologies()
	ForbidTechnology(Technologies.B_Farm)
	ForbidTechnology(Technologies.B_Village)
	ForbidTechnology(Technologies.B_University)
	ForbidTechnology(Technologies.B_Claymine)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function InitWeatherGfxSets()
	if not IsNight then
		SetupNormalWeatherGfxSet()
	else
		Display.GfxSetSetSkyBox(9, 0.0, 1.0, "YSkyBox09")
		Display.GfxSetSetRainEffectStatus(9, 0.0, 1.0, 0)
		Display.GfxSetSetSnowStatus(9, 0, 1.0, 0)
		Display.GfxSetSetSnowEffectStatus(9, 0.0, 0.8, 0)
		Display.GfxSetSetFogParams(9, 0.0, 1.0, 1, 52,82,92, 3500,32000)
		Display.GfxSetSetLightParams(9,  0.0, 1.0, 40, -15, -50,  80,90,80,  1,1,1)
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function InitWeather()
	AddPeriodicSummer(300)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(1,1)
	Display.SetPlayerColorMapping(2,2)
	Display.SetPlayerColorMapping(3,11)
	Display.SetPlayerColorMapping(4,6)
	Display.SetPlayerColorMapping(5,5)
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function FirstMapAction()
	function HidePilgrimAbilities()
		if not NotHideAbilities then
			XGUIEng.ShowWidget(XGUIEng.GetWidgetID("Commands_Hero2"), 0)
		else
			XGUIEng.ShowWidget(XGUIEng.GetWidgetID("Commands_Hero2"), 1)
		end
		
	end
	AddMapStartAndSaveLoadedCallback(HidePilgrimAbilities)
	TriggerFix.AllScriptsLoaded()
	
	GetAllEntitiesOfPlayerOfType(2, Entities.PB_Farm2)
	GetAllEntitiesOfPlayerOfType(2, Entities.PB_Farm3)
	--Chapter 1
	local _startCameraPos = GetPosition("Pilgrim")
	Camera.ScrollSetLookAt(_startCameraPos.X,_startCameraPos.Y)
	MainDefeatCondition()
	QuestFindAllInteractions()
	CreateWoodNPCs()
	CreateBanditCamp()
end

function MainDefeatCondition()
	StartSimpleJob("PilgrimDead")
end

function PilgrimDead()
	if IsDead("Pilgrim") then
		Defeat()
	end
	return false
end

function GetAllEntitiesOfPlayerOfType(_player, _type)
    local n, first = Logic.GetPlayerEntities(_player, _type, 1);
    if n > 0 then
        local entity = first;
        repeat
		--here
			Logic.SetCurrentMaxNumWorkersInBuilding(entity, 1)
            entity = Logic.GetNextEntityOfPlayerOfType(entity);
        until entity == first;
    end;
end;