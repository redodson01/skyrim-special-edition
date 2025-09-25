;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname ImmersiveHuntingPerk Extends Perk Hidden
ImmersiveHuntingFunctions Property ihFunctions Auto

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ihFunctions.CheckAnimal(akActor, akTargetRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

