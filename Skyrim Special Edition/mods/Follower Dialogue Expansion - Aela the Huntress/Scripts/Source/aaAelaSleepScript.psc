Scriptname aaAelaSleepScript extends Quest  

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	aaAelaSleepStart.Value = GameHour.Value
	aaAelaSleepLength.Value = (afDesiredSleepEndTime - afSleepStartTime)
EndEvent

Event OnSleepStop(bool abInterrupted)

	if AelaRef.GetDistance(PlayerRef) <= 1000 && abInterrupted == False
		if AelaRef.IsInFaction(CurrentFollowerFaction) || AelaRef.IsInFaction(PlayerMarriedFaction)
			aaAelaSleepStop.Value = GameHour.Value
			aaAela7SleepScene.Start()
		endif
	endif

EndEvent

Scene Property aaAela7SleepScene  Auto  

Actor Property PlayerRef  Auto  

Actor Property AelaRef  Auto  

Faction Property PlayerMarriedFaction  Auto  

Faction Property CurrentFollowerFaction  Auto  

GlobalVariable Property GameHour  Auto  

GlobalVariable Property aaAelaSleepStart  Auto  

GlobalVariable Property aaAelaSleepStop  Auto  

GlobalVariable Property aaAelaSleepLength  Auto  
