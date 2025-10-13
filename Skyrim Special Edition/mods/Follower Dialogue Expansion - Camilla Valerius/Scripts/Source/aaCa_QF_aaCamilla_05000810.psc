;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname aaCa_QF_aaCamilla_05000810 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Camilla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Camilla Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Camilla.GetActorRef().AddToFaction(PotentialFollowerFaction)
Alias_Camilla.GetActorRef().SetAV("Aggression", 1)
Alias_Camilla.GetActorRef().SetAV("Confidence", 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialFollowerFaction  Auto  
