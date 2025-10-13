;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname aaJe_QF_aaJenassa_05000810 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Jenassa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jenassa Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Jenassa.GetActorRef().AddToFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If Alias_Jenassa.GetActorRef().IsInFaction(MarriageAskedFaction) == 0
Alias_Jenassa.GetActorRef().RemoveFromFaction(PotentialMarriageFaction)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialMarriageFaction  Auto  

Faction Property MarriageAskedFaction  Auto  
