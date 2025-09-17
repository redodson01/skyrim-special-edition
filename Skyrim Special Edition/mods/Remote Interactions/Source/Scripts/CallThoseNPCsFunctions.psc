Scriptname CallThoseNPCsFunctions extends Quest  

Actor Property PlayerRef Auto
ReferenceAlias Property ChosenNPC Auto

Function TalkToNPC()
utility.wait(5)
ChosenNPC.GetActorReference().Activate(PlayerRef, true)
EndFunction