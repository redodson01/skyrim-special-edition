;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Fragment_GoldPresentKhajiit Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.PathToReference(Game.GetPlayer(), 1.0)
utility.wait(0.2)
Debug.SendanimationEvent(akSpeaker, "idlegive")
Game.GetPlayer().AddItem(Gold, 5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property Gold  Auto  
