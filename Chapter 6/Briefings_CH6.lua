function CreatePrincessBanditAttack()
	PrincessBanditBriefing = {} 
	PrincessBanditBriefing.finished = PrincessBanditBriefingFinished
	local page = 1
	
	PrincessBanditBriefing[page] = {}
	PrincessBanditBriefing[page].title = "Prinzessin"
	PrincessBanditBriefing[page].text = "Die letzte Nacht hat mir die Augen geöffnet. Es tut nioht gut, wenn ich meinem Bruder hinterher trauer. @cr Stattdessen sollte ich in die Zukunft schauen; und die sehe ich mit euch. "
	
	page = page + 1
	PrincessBanditBriefing[page] = {}
	PrincessBanditBriefing[page].title = "Prinzessin"
	PrincessBanditBriefing[page].text = "Doch zuerst müssen wir uns um ein weitaus größeres Problem kümmern. @cr Die Banditen sind aggressiver denn je und bedrohen unsere Stadt. Sie haben bereits versucht unsere Handelsrouten zu überfallen; mehr oder weniger mit Erfolg und unterdrücken außen stehende Siedler."
	
	page = page + 1
	PrincessBanditBriefing[page] = {}
	PrincessBanditBriefing[page].title = "Prinzessin"
	PrincessBanditBriefing[page].text = "Mit meinen Truppen und eurer Führungsstärke können wir die Banditen ein für alle mal aus der Region vertreiben und so Frieden in diesem Land herbei führen."
	
	page = page + 1
	PrincessBanditBriefing[page] = {}
	PrincessBanditBriefing[page].title = "Prinzessin"
	PrincessBanditBriefing[page].text = "Nehmt diese Truppen und marschiert gegen die Banditen!"
	
	StartBriefing(PrincessBanditBriefing)
end

function PrincessBanditBriefingFinished()
	CreatePrincessTroops()
end
