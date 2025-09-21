;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
ScriptName DAK_IngredientPerkScript extends Perk

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
    ;BEGIN CODE
    If akTargetRef.IsOffLimits()
        akTargetRef.SendStealAlarm(akActor)
    Endif
    AkTargetRef.ApplyHavokImpulse(0.0, 0.0, 1.0, 1.0)
    akActor.AddItem(akTargetRef)
    akActor.EquipItem(akTargetRef.GetBaseObject(), abSilent = true)
    ;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
    ;BEGIN CODE
    
    ;END CODE
EndFunction
;END FRAGMENT
    
;END FRAGMENT CODE - Do not edit anything between this and the begin comment