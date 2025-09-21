;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname randomQuestMasterStartScript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
randomQuest.SetStage(10)
(GetOwningQuest() as randomQuestMasterScript).SetDelay(akSpeaker)
(GetOwningQuest() as randomQuestMasterScript).CleanUp()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property randomQuest  Auto  
