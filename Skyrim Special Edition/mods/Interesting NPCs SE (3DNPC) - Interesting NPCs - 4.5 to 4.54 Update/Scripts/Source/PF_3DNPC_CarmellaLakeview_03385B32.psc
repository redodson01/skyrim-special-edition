;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_3DNPC_CarmellaLakeview_03385B32 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
DialogueCarmella.SetStage(10)
akActor.RemoveFromFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueCarmella  Auto  

Faction Property CaptiveFaction  Auto  
