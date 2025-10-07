;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _Talent_TakeABowNPC Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
If MyAlias.GetActorReference() == None
Debug.SendAnimationEvent(Buddy.GetActorRef(), "IdleStop")
else
Debug.SendAnimationEvent(Buddy.GetActorRef(), "IdleSilentBow")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
;Debug.notification("Clearing now")
Buddy.GetActorRef().ClearLookAt()
Buddy.Clear()
;SuperScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Buddy Auto
Scene Property SuperScene Auto
ReferenceAlias Property MyAlias Auto
