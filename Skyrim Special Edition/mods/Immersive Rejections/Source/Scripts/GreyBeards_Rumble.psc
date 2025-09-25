;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname GreyBeards_Rumble Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Utility.Wait(0.2)
QSTGreybeardRumble.Play(akSpeaker)
game.shakeCamera(NONE, 0.1, 1.0)
game.shakeController(0.1, 0.1, 1.0)
Utility.Wait(1.7)
QSTGreybeardRumble.Play(akSpeaker)
game.shakeCamera(NONE, 0.1, 1.0)
game.shakeController(0.1, 0.1, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTGreybeardRumble  Auto  
