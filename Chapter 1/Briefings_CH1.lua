function CreateNPCHermitBriefing()
	BriefingHermit = {}
	BriefingHermit.finished = BriefingHermitFinished
	local page = 1
	
	BriefingHermit[page] = {}
	BriefingHermit[page].title = "Einsiedler"
	BriefingHermit[page].text = "Seid gegrüßt! @cr Ein fremdes Gesicht in diesem einsamen Wald, wer hätte das Gedacht. @cr Nun, ihr wirkt ziemlich verloren in dieser einsamen Gegend."
	BriefingHermit[page].position = GetPosition("Hermit")
	
	page = page+ 1
	
	BriefingHermit[page] = {}
	BriefingHermit[page].title = "Einsiedler"
	BriefingHermit[page].text = "Lasst mich euch etwas über diese Region erzählen. In diesem Wald werdet ihr wenig Zivilisation finden; nur Stein, Holz und mich. Ich bezweifle, dass es mehr Leute gibt als mich hehe... @cr Allerdings im Norden von hier liegt eine große Stadt, regiert von einer schönen Prinzessin. @cr Es gibt nur ein kleines Problem dabei: Die Wachen werden weder euch, noch mich durchlassen."
	--BriefingHermit[page].position = GetPosition("Hermit")
	
	page = page+ 1
	
	BriefingHermit[page] = {}
	BriefingHermit[page].title = "Einsiedler"
	BriefingHermit[page].text = "Es gab in letzter Zeit einige Ungereimtheiten in der Gegend, von denen ich allerdings nichts weiß. Nur, dass die Wachen deshalb niemanden mehr durch die Tore lassen. @cr Wenn ihr hinter die Mauern wollt, müsst ihr es schon irgendwie anders probieren als lieb fragen."
	--BriefingHermit[page].position = GetPosition("Hermit")
	
	StartBriefing(BriefingHermit)
end

function BriefingHermitFinished()
	DisableNpcMarker("Hermit")
	InteractionsFound = InteractionsFound + 1
	InteractionsFoundFinished()
end

function CreateNPCLeonardoBriefing()
	BriefingLeonardo = {}
	BriefingLeonardo.finished = BriefingLeonardoFinished
	local page = 1
	
	BriefingLeonardo[page] = {}
	BriefingLeonardo[page].title = "Erfinder"
	BriefingLeonardo[page].text = "Willkommen, Fremder! Wenn ich mich vorstellen darf, mein Name ist Leonardo; ein Erfinder, den du nirgendwo anders siehst. @cr Ich arbeite zur Zeit an einer Flüssigkeit, die Bäume verändert. Das Ergebniss lässt sich hinter mir begutachten. Leider gibt es dabei eine negative Seite. @cr Im veränderten Waldstück haben sich Wölfe angesiedelt und ich bin zu alt und zu schwach um sie zur Strecke zu bringen, können sie mir dabei helfen? Vielleicht kann ich euch dann auch helfen im Gegenzeug."
	BriefingLeonardo[page].position = GetPosition("Leonardo")
	
	page = page + 1
	BriefingLeonardo[page] = {}
	BriefingLeonardo[page].title = "Aufgabe"
	BriefingLeonardo[page].text = "Tötet die Wölfe in Leonardos mutiertem Waldstück!"
	
	StartBriefing(BriefingLeonardo)
end

function BriefingLeonardoFinished()
	DisableNpcMarker("Leonardo")
	CreateWolfs()
end

function CreateLeonardoBriefing2()
	BriefingLeonardo = {}
	BriefingLeonardo.finished = BriefingLeonardo2Finished
	local page = 1
	
	BriefingLeonardo[page] = {}
	BriefingLeonardo[page].title = "Leonardo"
	BriefingLeonardo[page].text = "Habt Dank, mein Freund! Nun kann ich wieder in meinem kleinen Waldstück arbeiten und weitere Versuche vornehmen. @cr Im Gegenzug verrate ich euch ein Geheimniss."
	BriefingLeonardo[page].position = GetPosition("Leonardo")
	BriefingLeonardo[page].explore = 1000
	
	page = page + 1
	BriefingLeonardo[page] = {}
	BriefingLeonardo[page].title = "Leonardo"
	BriefingLeonardo[page].text = "Auf dem Berg im Süden ist befindet sich ein längst erloschener Leuchtturm. Der Pfad auf den Berg ist aber durch einen Erdrutsch blockiert. @cr Glücklicherweiße habe ich etwas Schießpulver bei mir dabei und ich räume damit den Weg für euch frei."
	
	page = page + 1
	BriefingLeonardo[page] = {}
	BriefingLeonardo[page].title = "Leonardo"
	BriefingLeonardo[page].text = "Achtung, es knallt!1"
	BriefingLeonardo[page].position = GetPosition("stein4")
	BriefingLeonardo[page].explore = 1000
	
	StartBriefing(BriefingLeonardo)
end

function BriefingLeonardo2Finished()
	ResolveBriefing(BriefingLeonardo[3])
	ResolveBriefing(BriefingLeonardo[1])
	for i = 1,6,1 do
		local _stonepos = GetPosition("stein"..i)
		Logic.DestroyEntity(GetID("stein"..i))
		Logic.CreateEffect(GGL_Effects.FXExplosion, _stonepos.X, _stonepos.Y,0)
	end
	InteractionsFound = InteractionsFound + 1
	InteractionsFoundFinished()
	return true
end

function CreateNPCWache1Briefing()
	BriefingWache1 = {}
	BriefingWache1.finished = BriefingWacheFinished
	local page = 1
	
	BriefingWache1[page] = {}
	BriefingWache1[page].title = "Wache"
	BriefingWache1[page].text = "Hier kommt keiner durch! Verschwindet!"
	BriefingWache1[page].position = GetPosition("Wache1")
	
	StartBriefing(BriefingWache1)
end

function CreateNPCWache2Briefing()
	BriefingWache2 = {}
	BriefingWache2.finished = BriefingWacheFinished
	local page = 1
	
	BriefingWache2[page] = {}
	BriefingWache2[page].title = "Wache"
	BriefingWache2[page].text = "Auf Befehl der Regentin bleibt das Tor für außen stehende geschlossen."
	BriefingWache2[page].position = GetPosition("Wache2")
	
	StartBriefing(BriefingWache2)
end

function CreateNPCWache3Briefing()
	BriefingWache3 = {}
	BriefingWache3.finished = BriefingWacheFinished
	local page = 1
	
	BriefingWache3[page] = {}
	BriefingWache3[page].title = "Wache"
	BriefingWache3[page].text = "Durch dieses Tor darf keiner hindurch tretten!"
	BriefingWache3[page].position = GetPosition("Wache3")
	
	StartBriefing(BriefingWache3)
end

function BriefingWacheFinished()
	if TalkedToWache then
		return
	end
	TalkedToWache = true
	InteractionsFound = InteractionsFound + 1
	InteractionsFoundFinished()
end

function CreateBanditCampBriefing()
	BriefingBandits = {}
	BriefingBandits.finished = BriefingBanditsFinished
	local page = 1
	
	BriefingBandits[page] = {}
	BriefingBandits[page].title = "Banditen"
	BriefingBandits[page].text = "So so, sieht aus als hätten wir hier ein neues Gesicht. @cr Ich sage es gleich direkt: Wir mögen keine Eindringlinge und Neulinge. @cr Deshalb sage ich es frei raus: Verzieh dich auf die andere Flussseite innerhalb der nächsten 60 Sekunden! Das ist unser Gebiet und wir dulden keine Fremden!"
	BriefingBandits[page].position = GetPosition("BanditCampSpawn")
	
	StartBriefing(BriefingBandits)
end

function BriefingBanditsFinished()
	StartSimpleJob("DelayBisFeindlich")
end

function CreateBriefingGoToLighthouse()
	BriefingGoToLighthouse = {}
	BriefingGoToLighthouse.finished = BriefingGoToLighthouseFinished
	local page = 1
	
	BriefingGoToLighthouse[page] = {}
	BriefingGoToLighthouse[page].title = "Pilgrim"
	BriefingGoToLighthouse[page].text = "Ich habe nun genug Informationen über diese Region. Jetzt wäre es klug noch mehr über die Stadt herauszufinden. @cr Vielleicht kann ich den Leuchtturm oben auf dem Berg im Süden nutzen um die Aufmerksamkeit der Prinzessin auf mich zu richten."
	BriefingGoToLighthouse[page].position = GetPosition("Pilgrim")
	
	StartBriefing(BriefingGoToLighthouse)
end

function BriefingGoToLighthouseFinished()
	StartSimpleJob("GoToLighthouse")
end

function CreateBriefingActivateLighthouse()
	BriefingActivateLighthouse = {}
	BriefingActivateLighthouse.finished = BriefingActivateLighthouseFinished
	local page = 1
	
	BriefingActivateLighthouse[page] = {}
	BriefingActivateLighthouse[page].title = "Pilgrim"
	BriefingActivateLighthouse[page].text = "Dann entzünden wir mal das Feuer im Leuchtturm und schauen was passiert; ob sich jemand darauf melden wird."
	BriefingActivateLighthouse[page].position = GetPosition("Leuchtturm")
	
	StartBriefing(BriefingActivateLighthouse)
end

function BriefingActivateLighthouseFinished()
	ReplaceEntity("Leuchtturm", Entities.CB_LighthouseActivated)
	--StartCutscene("LighthouseCutscene")
	--Chapter 2
	CreateGuardBriefing()
end