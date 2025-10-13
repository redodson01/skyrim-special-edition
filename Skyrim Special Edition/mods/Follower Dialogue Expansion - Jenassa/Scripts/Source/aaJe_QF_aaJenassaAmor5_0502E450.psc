;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname aaJe_QF_aaJenassaAmor5_0502E450 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;romance done

HirelingJenassaRef.AddToFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE aaJenassaApprove
Quest __temp = self as Quest
aaJenassaApprove kmyQuest = __temp as aaJenassaApprove
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForSingleUpdateGameTime(24)

; if HirelingJenassaRef.IsInFaction(PlayerMarriedFaction)
; SetStage(5)
; endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property HirelingJenassaREF  Auto  

Faction Property PotentialMarriageFaction  Auto  

Faction Property PlayerMarriedFaction  Auto  
