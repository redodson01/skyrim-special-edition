Scriptname ccBGSSSE001_ReelLineScript extends ObjectReference

ccBGSSSE001_FishingSystemScript Property FishingSystem Auto

Function ReturnToOrigin()
	self.MoveTo(self.GetLinkedRef())
EndFunction

Auto State Waiting

	Function OnActivate(ObjectReference akActivatorRef)
		self.GotoState("busy")

		if akActivatorRef == Game.GetPlayer()
			if FishingSystem.GetCurrentFishingRodType() == -1
				SLF_UtilityScript SLF = Quest.GetQuest("SLF_MainQuest") as SLF_UtilityScript
				SLF.ChooseRod()
			endif

			FishingSystem.OnFishingTriggerActivated()
		endif

		self.GotoState("Waiting")
	EndFunction

EndState

State busy
EndState
