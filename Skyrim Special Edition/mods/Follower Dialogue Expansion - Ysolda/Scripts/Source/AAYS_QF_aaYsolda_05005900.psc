;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname AAYS_QF_aaYsolda_05005900 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ysolda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ysolda Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Ysolda.GetActorRef().RemoveFromFaction(PotentialMarriageFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Ysolda.GetActorRef().AddToFaction(PotentialFollowerFaction)
Alias_Ysolda.GetActorRef().AddToFaction(PotentialMarriageFaction)
Alias_Ysolda.GetActorRef().SetAV("Aggression", 1)
Alias_Ysolda.GetActorRef().SetAV("Confidence", 3)
Alias_Ysolda.GetActorRef().AddSpell(aaYsoldaBuff)
Alias_Ysolda.GetActorRef().AddPerk(Armsman60)
Alias_Ysolda.GetActorRef().AddPerk(AgileDefender60)
Alias_Ysolda.GetActorRef().AddPerk(Overdraw60)
Alias_Ysolda.GetActorRef().AddPerk(DualFlurry50)
Alias_Ysolda.GetActorRef().AddPerk(DualSavagery)
Alias_Ysolda.GetActorRef().AddItem(HuntingBow, 1)
Alias_Ysolda.GetActorRef().AddItem(HuntingArrow, 12)
PlayerRef.AddSpell(aaYsoldaSpeechSpell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialMarriageFaction  Auto  

Faction Property PotentialFollowerFaction  Auto  

Actor Property PlayerRef  Auto  

SPELL Property aaYsoldaBuff  Auto  

Perk Property AgileDefender60  Auto  

Perk Property Armsman60  Auto  

Perk Property DualFlurry50  Auto  

Perk Property DualSavagery  Auto  

Perk Property Overdraw60  Auto  

WEAPON Property HuntingBow  Auto  

Ammo Property HuntingArrow  Auto  

SPELL Property aaYsoldaSpeechSpell  Auto  
