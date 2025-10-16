;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CTN_StartCombat7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.PlayIdle(IdleStop_Loose)
Utility.Wait(0.1)

if PlayerRef.GetSitState() > 0
; no animations
ChosenNPC.GetActorReference().StartCombat(playerref)

elseif PlayerRef.IsWeaponDrawn() == true 
ChosenNPC.GetActorReference().StartCombat(playerref)
TauntingMatters_PlayerSpell.Cast(PlayerRef, PlayerRef)

else

PlayerRef.PlayIdle(idlegetattention)
Utility.Wait(2.8)
PlayerRef.PlayIdle(IdleStop_Loose)
ChosenNPC.GetActorReference().StartCombat(playerref)
endif
akspeaker.Disable()
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ChosenNPC Auto
idle property IdleStop_Loose auto
idle property idlegetattention auto
actor property playerref auto
spell property TauntingMatters_PlayerSpell auto
