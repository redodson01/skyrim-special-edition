;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname aaAr_QF_aaAranea2a_050059D9 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;no romance
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE aaAranea2aScript
Quest __temp = self as Quest
aaAranea2aScript kmyQuest = __temp as aaAranea2aScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForSingleUpdateGameTime(72)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;romance
AraneaREF.AddToFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialMarriageFaction  Auto  

Actor Property AraneaREF  Auto  
