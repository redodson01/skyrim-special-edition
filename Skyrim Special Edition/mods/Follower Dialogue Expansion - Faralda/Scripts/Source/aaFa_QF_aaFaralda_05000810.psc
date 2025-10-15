;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname aaFa_QF_aaFaralda_05000810 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Faralda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faralda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShrineofAkatosh
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShrineofAkatosh Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Faralda.GetActorRef().SetRelationshipRank(PlayerRef, 1)
Alias_Faralda.GetActorRef().AddToFaction(PotentialFollowerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialFollowerFaction  Auto  

Actor Property PlayerRef  Auto  
