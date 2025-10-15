Scriptname aaAelaRomanceScript extends Quest  

Event OnUpdateGameTime()
	If AelaRef.IsInFaction(CurrentFollowerFaction)
		If GetStage() == 2
			SetStage(3)
		ElseIf GetStage() == 4
			SetStage(5)
		ElseIf GetStage() == 6
			SetStage(7)
		ElseIf GetStage() == 8
			SetStage(9)
		ElseIf GetStage() == 10
			SetStage(11)
		EndIf
	EndIf
	RegisterForSingleUpdateGameTime(24)
EndEvent
Faction Property CurrentFollowerFaction  Auto  

Actor Property AelaRef  Auto  
