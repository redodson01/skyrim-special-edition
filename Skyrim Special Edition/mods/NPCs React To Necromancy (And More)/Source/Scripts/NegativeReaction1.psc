;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname NegativeReaction1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If Reactions_Guard.GetValue() == 0 && akspeaker.GetRelationshipRank(Game.GetPlayer()) == 0
akspeaker.SetRelationshipRank(Game.GetPlayer(), -1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Reactions_Guard Auto