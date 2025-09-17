;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Fragment_GiveGoldOutside Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Int GoldNum = Utility.RandomInt(3,9)
Utility.Wait(1.1)
Debug.SendanimationEvent(Game.GetPlayer(), "idlesilentbow")
Utility.Wait(0.5)
Game.GetPlayer().AddItem(Gold, GoldNum)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold Auto
