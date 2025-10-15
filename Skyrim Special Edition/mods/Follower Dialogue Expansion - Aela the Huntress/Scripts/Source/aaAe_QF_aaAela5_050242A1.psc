;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname aaAe_QF_aaAela5_050242A1 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
AelaRef.RemoveFromFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE aaAelaRomanceScript
Quest __temp = self as Quest
aaAelaRomanceScript kmyQuest = __temp as aaAelaRomanceScript
;END AUTOCAST
;BEGIN CODE
;done first dialogue

kmyQuest.RegisterForSingleUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
AelaRef.AddToFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;end romance
AelaRef.RemoveFromFaction(PotentialMarriageFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialMarriageFaction  Auto  

Actor Property AelaRef  Auto  
