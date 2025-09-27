Scriptname SoSeedingQuestScript extends Quest  

bool Function ShowPlanterClearMessage(ObjectReference plantRef)
	plantAlias.ForceRefTo(plantRef)
	bool bResult = SoSeedingPlanterClearMessage.Show() == 0
	plantAlias.Clear()
	Return bResult
EndFunction

Message Property SoSeedingPlanterClearMessage Auto
ReferenceAlias Property plantAlias Auto