Scriptname aaAranea2aScript extends Quest  

Event OnUpdateGameTime()
If GetStage() == 1 && AraneaRef.IsInFaction(CurrentFollowerFaction)
	SetStage(10)
Else
	RegisterForSingleUpdateGameTime(72)
EndIf
EndEvent
Faction Property CurrentFollowerFaction  Auto  

Actor Property AraneaREF  Auto  
