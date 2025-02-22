function LetPrincessTalk()
	NPCPrincess = {}
	NPCPrincess.name = "princess"
	NPCPrincess.callback = CreatePrincessBriefing
	
	CreateNPC(NPCPrincess)
end

function CreatePrincessBriefing()
	PrincessBriefing = {}
	PrincessBriefing.finished = PrincessBriefingFinished
	local page = 1
	
	PrincessBriefing[page] = {}
	PrincessBriefing[page].title = "Prinzessin"
	PrincessBriefing[page].text = "Wenn bringt ihr da mit euch, General? Ein neues mir unbekanntes Gesicht."
	PrincessBriefing[page].position = GetPosition("princess")
	
	page = page + 1
	
	PrincessBriefing[page] = {}
	PrincessBriefing[page].title = "General"
	PrincessBriefing[page].text = "Dieser Herr hier hat das Leuchtfeuer auf dem Hügel im Süden entzündet, welches seit längerer Zeit erloschen war. @cr Und nun möchte er mehr über diese Stadt und euch erfahren, Herrin."
	PrincessBriefing[page].position = GetPosition("General")
	
	page = page + 1
	
	PrincessBriefing[page] = {}
	PrincessBriefing[page].title = "Prinzessin"
	PrincessBriefing[page].text = "So so, ihr wollt also mehr über mehr das Leben hier erfahren. @cr Dann macht euch schon mal mit den Distrikten der Stadt vertraut und kommt zu mir zurück, sobald ihr mehr über den Bau der Stadt wisst."
	PrincessBriefing[page].position = GetPosition("princess")
	
	StartBriefing(PrincessBriefing)
	
end

function PrincessBriefingFinished()
	ExploreCity()
end

function CreateGuardBriefing()
	CreateGuardTroops()
		
	GuardsBriefing =  {}
	GuardsBriefing.finished = GuardsBriefingFinished
	local page = 1
	
	GuardsBriefing[page] = {}
	GuardsBriefing[page].title = "General"
	GuardsBriefing[page].text = "Halt! Keine Bewegung! Wer seid ihr und warum habt ihr das Leuchtfeuer entzündet?"
	GuardsBriefing[page].position = GetPosition("General")
	GuardsBriefing[page].npc				=	{}
	GuardsBriefing[page].npc.id			=	GetID("General")
	GuardsBriefing[page].npc.isObserved	=	true
	
	page = page + 1
	
	GuardsBriefing[page] = {}
	GuardsBriefing[page].title = "Pilgrim"
	GuardsBriefing[page].text = "Ganz ruhig mit dem Schwert! Ich habe das Leuchtfeuer entzündet, um auf mich aufmerksam zu machen. @cr Ich bin auf der Reise und habe von einer Stadt im Norden erfahren und wollte mich deren genauer erkunden, zumal die Tore in den Norden verschlossen sind."
	GuardsBriefing[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	
	GuardsBriefing[page] = {}
	GuardsBriefing[page].title = "General"
	GuardsBriefing[page].text = "Nun gut. Seitdem sich Banditen herum treiben, wurden die Tore zur Sicherheit geschlossen. @cr Wir können euch zu unserer Regentin bringen, wenn ihr danach wünscht. @cr Ob sie euch freundlich entgegen kommt ist eine andere Frage."
	GuardsBriefing[page].position = GetPosition("General")
	GuardsBriefing[page].npc				=	{}
	GuardsBriefing[page].npc.id			=	GetID("General")
	GuardsBriefing[page].npc.isObserved	=	true
	
	page = page + 1
	
	GuardsBriefing[page] = {}
	GuardsBriefing[page].title = "Pilgrim"
	GuardsBriefing[page].text = "Das Angebot nehme ich dankend an."
	GuardsBriefing[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	
	GuardsBriefing[page] = {}
	GuardsBriefing[page].title = "General"
	GuardsBriefing[page].text = "Dann folgt uns auf Schritt und Tritt. Wir werden euch den Weg zu ihr zeigen."
	GuardsBriefing[page].position = GetPosition("General")
	GuardsBriefing[page].npc				=	{}
	GuardsBriefing[page].npc.id			=	GetID("General")
	GuardsBriefing[page].npc.isObserved	=	true
	
	StartBriefing(GuardsBriefing)
end

function GuardsBriefingFinished()
	DisableNpcMarker("General")
	LetPilgrimFollowGuards()
end

function CreateBriefingPrincessExploringDone()
	GUIQuestTools.DisableQuestInformation()
	Logic.SetQuestType(1, 2, MAINQUEST_CLOSED, 0)
	
	PrincessBriefingExploreDone = {}
	PrincessBriefingExploreDone.finished = PrincessBriefingExploreDoneFinished
	local page = 1
	
	PrincessBriefingExploreDone[page] = {}
	PrincessBriefingExploreDone[page].title = "Pinzessin"
	PrincessBriefingExploreDone[page].text = "Ihr wisst nun, wie die Stadt aufgebaut ist und welche Distrike welche Besonerheiten haben."
	PrincessBriefingExploreDone[page].position = GetPosition("princess")
	
	page = page + 1
	
	PrincessBriefingExploreDone[page] = {}
	PrincessBriefingExploreDone[page].title = "Pinzessin"
	PrincessBriefingExploreDone[page].text = "Nun möchte ich, dass ihr meiner Bevölkerung helft und so deren, wie auch mein Vertrauen, erlangt."
	PrincessBriefingExploreDone[page].position = GetPosition("princess")
	
	page = page + 1
	
	PrincessBriefingExploreDone[page] = {}
	PrincessBriefingExploreDone[page].title = "Pilgrim"
	PrincessBriefingExploreDone[page].text = "Ich soll jedem Einzelnen in der Stadt helfen?!"
	PrincessBriefingExploreDone[page].position = GetPosition("Pilgrim")
	
	page = page + 1
	
	PrincessBriefingExploreDone[page] = {}
	PrincessBriefingExploreDone[page].title = "Prinzessin"
	PrincessBriefingExploreDone[page].text = "Nein, nicht allen. Helft insgesamt 5 Bürgern meiner Stadt und ihr habt unser Vertrauen. @cr Am Besten helft ihr als erstes einer einsamen Person im südlichen Wald. Wir haben von dort ein Hilfegsuch erhalten."
	PrincessBriefingExploreDone[page].position = GetPosition("Pilgrim")
	
	StartBriefing(PrincessBriefingExploreDone)
end

function PrincessBriefingExploreDoneFinished()
	--Chapter 3
	StartQuestHelpOthers()
end