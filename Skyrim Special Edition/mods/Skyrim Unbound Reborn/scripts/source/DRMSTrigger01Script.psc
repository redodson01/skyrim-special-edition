Scriptname DRMSTrigger01Script extends ObjectReference  Conditional

int Property pDone Auto Conditional
Quest Property pDRMSQuest  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDone == 0
			if pDRMSQuest.GetStage() < 10 && (pDRMSQuest as DRMSQuestScript).pGo < 1
				pDRMSQuest.SetStage(10)
			endif
			pDone = 1
			Disable()
		endif
	endif

endEvent
