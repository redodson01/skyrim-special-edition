;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CTN_StopCombatFollower Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ChosenNPC.GetActorRef().StopCombat()
ChosenNPC.GetActorRef().StopCombatAlarm()
ChosenNPC.GetActorRef().ResetAI()

akspeaker.Disable()
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Actor Property PlayerRef Auto
ReferenceAlias Property ChosenNPC Auto
quest property ctn_quest auto
