;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname aaRa_QF_aaRayya_05000810 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BYOHHousecarlFalkreathRef.AddToFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE aaRayyaApprove
Quest __temp = self as Quest
aaRayyaApprove kmyQuest = __temp as aaRayyaApprove
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForSingleUpdateGameTime(24)
BYOHHousecarlFalkreathRef.RemoveFromFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialMarriageFaction  Auto  

Actor Property BYOHHousecarlFalkreathRef  Auto  
