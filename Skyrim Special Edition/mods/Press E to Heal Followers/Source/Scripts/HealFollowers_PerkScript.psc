;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname HealFollowers_PerkScript Extends Perk Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Utility.Wait(0.1)
HealFollowers_Spell.Cast(PlayerRef, aktargetref)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Utility.Wait(0.1)
HealFollowers_Spell.Cast(PlayerRef, aktargetref)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property HealFollowers_Spell Auto  

Actor Property PlayerRef  Auto  
