;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CTB_Fugitive_ComeWithMe Extends TopicInfo Hidden

Faction property _CTB_BanditWaitingCapture Auto
FavorDialogueScript Property pFDS  Auto  

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.RemoveFromAllFactions()
akspeaker.AddtoFaction(_CTB_BanditWaitingCapture)
pFDS.Persuade(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment