;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname aaRa_TIF__05024282 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS10.FailAllObjectives()
MS10.CompleteQuest()
MS10.Stop()
(GetOwningQuest() as aaRayyaApprove).ap(3)
aaRayyaMS10SO.Value = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS10  Auto  

GlobalVariable Property aaRayyaMS10SO  Auto  
