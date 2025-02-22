function PricessHelped()
	PrincessHelpedBriefing = {}
	PrincessHelpedBriefing.finished = PrincessHelpedBriefingFinished
	local page = 1
	
	PrincessHelpedBriefing[page] = {}
	PrincessHelpedBriefing[page].title = "Prinzessin"
	PrincessHelpedBriefing[page].text = "Der Karren ist erfolgreich angekommen und die Waren konnten an meine Bevölkerung verteilt werden. @cr Damit habt ihr auch mir geholfen und sowohl das Vertrauen von mir als auch meinem Volk erlangt."
	PrincessHelpedBriefing[page].position = GetPosition("princess")
	
	page = page + 1
	
	PrincessHelpedBriefing[page] = {}
	PrincessHelpedBriefing[page].title = "Prinzessin"
	PrincessHelpedBriefing[page].text = "Ihr habt euch eine Verschnaufspause verdient. Ruht euch aus und ich werde euch mich wieder an euch wenden, sobald es weitere Aufgaben gibt."
	--PrincessHelpedBriefing[page].position = GetPosition("princess")
	
	StartBriefing(PrincessHelpedBriefing)
end

function PrincessHelpedBriefingFinished()
	MakeItNight()
end

function MakeItNight()
	IsNight = true
	StartSchwarzBlende(SetNightGFX)
end

function SetNightGFX()
	Display.GfxSetSetSkyBox(1, 0.0, 1.0, "YSkyBox09")
	Display.GfxSetSetRainEffectStatus(1, 0.0, 1.0, 0)
	Display.GfxSetSetSnowStatus(1, 0, 1.0, 0)
	Display.GfxSetSetSnowEffectStatus(1, 0.0, 0.8, 0)
	Display.GfxSetSetFogParams(1, 0.0, 1.0, 1, 52,82,92, 3500,32000)
	Display.GfxSetSetLightParams(1,  0.0, 1.0, 40, -15, -50,  80,90,80,  1,1,1)
	
	CreateBriefingInGarden()
	
	--DelayInitBriefingInGarden()
end

function CreateBriefingInGarden()
	local _gardenSpawnPrincess = GetPosition("Princessgarden")
	local _gardenSpawnPilgrim = GetPosition("gardenPilgrimSpawn")
	Logic.SetEntityName(Logic.CreateEntity(Entities.CU_Princess,_gardenSpawnPrincess.X,_gardenSpawnPrincess.Y,270,2),"GardenPrincess")
	Logic.SetEntityName(Logic.CreateEntity(Entities.PU_Hero2,_gardenSpawnPilgrim.X,_gardenSpawnPilgrim.Y,270,2),"GardenPilgrim")
	local _movePilgrim = GetPosition("PilgrimMove1")
	Camera.ScrollSetLookAt(_movePilgrim.X, _movePilgrim.Y)
	Camera.ScrollSetBorderFlag(0)
	
	StartSimpleJob("DelayInitGardenBriefing")
end

function DelayInitGardenBriefing()
	if Counter.Tick2("WaitForFadeEnd",5) then
		local _movePilgrim = GetPosition("PilgrimMove1")
		Logic.GroupAttackMove(GetID("GardenPilgrim"),_movePilgrim.X,_movePilgrim.Y,0)
		Camera.ScrollSetBorderFlag(1)
		StartBriefingInGarden()
		return true
	end
	return false
end

function StartBriefingInGarden()
	BothInGardenBriefing = {}
	BothInGardenBriefing.finished = BothInGardenBriefingFinished
	local page = 1
	
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Was macht ihr hier?! Ich dachte ihr würdet euch in eurer Unterkunft ausruhen."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Pilgrim"
	BothInGardenBriefing[page].text = "Ich wollte die Schönheit dieser Blumen hier begutachten. Bei Nacht und sternenklarem Himmel wie heute sehen die Blumen besonders schön aus. @cr Und was treibt euch hier her?"
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].mc                		=	{}
    BothInGardenBriefing[page].mc.title			= 	"Prinzessin"
	BothInGardenBriefing[page].mc.text			=	"Ich... Ich..."
	BothInGardenBriefing[page].mc.firstText		=	"Ihr braucht nicht antworten, wenn ihr nicht wollt."
	BothInGardenBriefing[page].mc.secondText		=	"Vielleicht ist es am Besten, wenn ihr euch mir öffnet."
	BothInGardenBriefing[page].mc.firstSelected		=	4
	BothInGardenBriefing[page].mc.secondSelected		=	5
	
	page = 4
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Nein, ist schon in Ordnung. Es bedrückt mich schon eine Weile und ich fresse es in mich hinein."
	
	page = 5
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Ich werde es euch sagen. Schließlich seid ihr da mit involviert @cr Ich wollte nicht umsonst euch vertrauen können. Ihr erinnert mich an eine bestimmte Person."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Ich werde es euch sagen. Schließlich seid ihr da mit involviert @cr Ich wollte nicht umsonst euch vertrauen können. Ihr erinnert mich an eine bestimmte Person."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Ihr erinnert mich an meinen Bruder. Sein Verhalten und seine Treue sowie seine Hilfsbereitschaft haben die selbe Stärke, wie ihr sie habt und ich sehe in euch meinen Bruder."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Er war ein begeisterter Reiter und machte mit mir in regelmäßigen Abständen ausritte mit Pferden, die in unserem Stall standen. @cr Vielleicht habt ihr den Stall bereits gesehen zwischen der Lehm- und der Holzproduktion."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Pilgrim"
	BothInGardenBriefing[page].text = "Gewiss. Ich hatte mich schon gewundert, wem die Reiterei gehört. @cr Was ist denn mit ihm passiert, dass ihr so um ihn trauert?"
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Eines Tages auf einem Ausritt wurden wir von Banditen überfallen; den selben Banditen, wie die, die südlich der Berge hausen. @cr Ich konnte mich zwar aus dem Staub machen, aber mein Bruder wurde geschnappt und sie haben ihn getötet."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Prinzessin"
	BothInGardenBriefing[page].text = "Seit je her komme ich regelmäßig an diesen Ort hier um an ihn zu gedenken."
	
	page = page + 1
	BothInGardenBriefing[page] = {}
	BothInGardenBriefing[page].title = "Pilgrim"
	BothInGardenBriefing[page].text = "Dann lasst mich mit euch an ihn gedenken. Auch ihr braucht mal jemanden, dem ihr euch ausschütten könnt, und wenn ich das bin, dann höre ich euch zu. @cr Und wenn es die ganze Nacht dauern wird..."
	
	StartBriefing(BothInGardenBriefing)
end

function BothInGardenBriefingFinished()
	StartSchwarzBlende(SetEverythingBack)
end

function SetEverythingBack()
	IsNight = false
	Logic.DestroyEntity(GetID("GardenPilgrim"))
	Logic.DestroyEntity(GetID("GardenPrincess"))
	SetupNormalWeatherGfxSet()
	--Chapter 6
	StartSimpleJob("WaitForBlendeFertig")
end

function WaitForBlendeFertig()
	if Counter.Tick2("BlendeWarten",5) then
		local _princessPos = GetPosition("princess")
		Camera.ScrollSetLookAt(_princessPos.X,_princessPos.Y)
		CreatePrincessBanditAttack()
		return true
	end
	return false
end