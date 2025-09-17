;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname _PickUpPerk Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
SHO.PickUpCarCass()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SHO_PickUpCarCass Property SHO Auto
   			
Formlist property _VanillaPelts Auto
Formlist property _BrumaPelts Auto
Formlist property _CustomPelts Auto
Formlist property _IngredientsAndMeats Auto
