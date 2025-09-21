;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
ScriptName DAK_BooksPerkScript extends Perk

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
    ;BEGIN CODE
    If akTargetRef.IsOffLimits()
        akTargetRef.SendStealAlarm(akActor)
    Endif
    AkTargetRef.ApplyHavokImpulse(0.0, 0.0, 1.0, 1.0)
    akActor.AddItem(akTargetRef)
    ;END CODE
EndFunction
;END FRAGMENT
    
;END FRAGMENT CODE - Do not edit anything between this and the begin comment