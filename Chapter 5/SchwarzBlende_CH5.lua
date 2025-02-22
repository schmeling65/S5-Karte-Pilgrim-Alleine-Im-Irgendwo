function StartSchwarzBlende(_func)
	Logic.SetQuestType(1, 4, MAINQUEST_CLOSED, 0)
	Logic.AddQuest(1, 5, MAINQUEST_OPEN, "Kapitel 5: Das Gespräch im Garten", "Pilgrim hat mit der Prinzessin in der nächtlichen Gartenanlage gesprochen. Dabei hat sie euch ihre Vergangenheit erzählt und auch gesagt, warum sie euch vertraut. @cr @cr Er sieht ihrem verstorbenen Bruder sehr ähnlich. Sie hat euch die ganze Nacht darüber erzählt und sich euch anvertraut.",1)
	XGUIEng.ShowWidget("PauseScreen", 1)
	XGUIEng.ShowWidget("PauseScreenBG", 1)
	XGUIEng.ShowWidget("PauseScreen_Message", 0)
	for i = 1,5,1 do
		XGUIEng.SetMaterialColor("PauseScreenBG", i, 0, 0, 0, 0)
	end
	counter = 1
	assert(TriggerFix,"TriggerFix wird benötigt")
	StartSimpleHiResJob("ControllSchwarzBlende",_func)
end
function ControllSchwarzBlende(_func) 
	if not testswitch then
		if counter <= 51 then
			for i = 1,5,1 do
				XGUIEng.SetMaterialColor("PauseScreenBG", i, 0, 0, 0, counter * 5)
			end
			counter = counter + 1
		else
			testswitch = not testswitch
			if _func then
				_func()
			end
		end
	else
		if waitingdone or Counter.Tick2("schwarzbild",30) then
			if not waitingdone then
				waitingdone = true
				counter = counter - 1
			end
			if counter >= 1 then
				for i = 1,5,1 do
					XGUIEng.SetMaterialColor("PauseScreenBG", i, 0, 0, 0, counter * 5)
				end
				counter = counter - 1
			else
				XGUIEng.ShowWidget("PauseScreen_Message", 1)
				XGUIEng.ShowWidget("PauseScreen", 0)
				XGUIEng.ShowWidget("PauseScreenBG", 1)
				for i = 1,5,1 do
					XGUIEng.SetMaterialColor("PauseScreenBG", i, 0, 0, 0, 160)
				end
				counter = 1
				waitingdone = nil
				testswitch = nil
				return true
			end
		end
	end
	return false 
end