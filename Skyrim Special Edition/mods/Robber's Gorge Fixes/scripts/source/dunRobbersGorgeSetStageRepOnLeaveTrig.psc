scriptname dunRobbersGorgeSetStageRepOnLeaveTrig extends objectReference

Quest Property myQuest Auto

int Property stage Auto


Event OnTriggerLeave(ObjectReference triggerRef)
	if triggerRef == Game.GetPlayer()
		myQuest.SetStage(stage)
	endif
endEvent
