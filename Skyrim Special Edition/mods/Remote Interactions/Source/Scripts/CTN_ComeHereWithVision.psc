;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CTN_ComeHereWithVision Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.PlayIdle(IdleStop_Loose)
Utility.Wait(0.1)

if PlayerRef.GetSitState() > 0 || PlayerRef.IsWeaponDrawn() == true
;no animations
else
playerref.playidle(idlecomethisway)
Utility.Wait(1.0)
endif

ComeToMeNPC.ForceRefTo(ChosenNPC.GetActorRef())
akspeaker.Disable()
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ChosenNPC Auto
ReferenceAlias Property ComeToMeNPC Auto
idle property idlecomethisway auto
idle property IdleStop_Loose auto
actor property playerref auto
