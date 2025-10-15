;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname aaFa_TIF__05019E26 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.SetRelationshipRank(PlayerRef, -1)
akSpeaker.RemoveFromFaction(PotentialFollowerFaction)
aaFaendalUnfriendly.Value = 1
aaFaendalCamillaSO.Value = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Faction Property PotentialFollowerFaction  Auto  

GlobalVariable Property aaFaendalCamillaSO  Auto  

GlobalVariable Property aaFaendalUnfriendly  Auto  
