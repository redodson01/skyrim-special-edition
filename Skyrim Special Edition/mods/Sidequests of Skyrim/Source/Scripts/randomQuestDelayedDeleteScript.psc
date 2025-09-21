Scriptname randomQuestDelayedDeleteScript extends Actor  

State ReadyToDespawn
	Event OnCellDetach()
		DoDespawn()
	EndEvent
EndState

Function Despawn()
	If !Is3DLoaded()
		DoDespawn()
	Else
		GoToState("ReadyToDespawn")
	EndIf
EndFunction

Function DoDespawn()
	Delete()
EndFunction