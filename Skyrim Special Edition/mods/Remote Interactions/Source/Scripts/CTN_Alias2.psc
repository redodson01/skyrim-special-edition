;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CTN_Alias2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ChosenNPC.ForceRefTo(NearByNPC2.GetActorRef())
akspeaker.Disable()
Utility.wait(0.1)
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property ChosenNPC Auto
ReferenceAlias Property NearByNPC2 Auto
Actor Property PlayerRef Auto
