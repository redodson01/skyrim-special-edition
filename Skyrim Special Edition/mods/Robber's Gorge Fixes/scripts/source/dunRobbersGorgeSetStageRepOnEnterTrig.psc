scriptname dunRobbersGorgeSetStageRepOnEnterTrig extends objectReference

Quest Property myQuest Auto	

int Property stage Auto


Event OnTriggerEnter(ObjectReference triggerRef)
	if triggerRef == Game.GetPlayer()
		myQuest.SetStage(stage)
	endif
endEvent
