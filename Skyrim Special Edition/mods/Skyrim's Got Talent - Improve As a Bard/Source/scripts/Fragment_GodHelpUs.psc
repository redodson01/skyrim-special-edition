;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Fragment_GodHelpUs Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If akSpeaker.GetSitState() == 0
akSpeaker.SetLookAt(Game.GetPlayer(), true)
utility.wait(0.5)
Debug.SendanimationEvent(akSpeaker, "idlechildapologize")
utility.wait(1.5)
akSpeaker.ClearLookAt()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
