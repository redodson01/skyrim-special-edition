;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CTN_Alias1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ChosenNPC.ForceRefTo(NearByNPC1.GetActorRef())
akspeaker.Disable()
Utility.wait(0.1)
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ChosenNPC Auto
ReferenceAlias Property NearByNPC1 Auto
Actor Property PlayerRef Auto
