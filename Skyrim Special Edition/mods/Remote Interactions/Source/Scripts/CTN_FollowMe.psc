;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CTN_FollowMe Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.PlayIdle(IdleStop_Loose)
Utility.Wait(0.1)

if PlayerRef.GetSitState() > 0
;no animations

elseif PlayerRef.IsWeaponDrawn() == true
playerref.playidle(voicestart)
utility.wait(0.6)
playerref.playidle(voicereleaseweaponout)

else

PlayerRef.PlayIdle(idlegetattention)
Utility.Wait(2.8)
PlayerRef.PlayIdle(IdleStop_Loose)
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
idle property IdleStop_Loose auto
idle property idlegetattention auto
actor property playerref auto
idle property voicereleaseweaponout auto
idle property voicestart auto
