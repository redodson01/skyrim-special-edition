;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CTN_ScareBandits3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.PlayIdle(IdleStop_Loose)
Utility.Wait(0.1)

if PlayerRef.GetSitState() > 0 || Game.GetCameraState() == 0 && PlayerRef.IsWeaponDrawn() == false
; no animations
CTN_FearSpell.cast(ChosenNPC.GetActorReference(), ChosenNPC.GetActorReference())
ChosenNPC.GetActorReference().StartCombat(playerref)

elseif PlayerRef.IsWeaponDrawn() == true || Game.GetCameraState() == 0 && PlayerRef.IsWeaponDrawn() == true
CTN_FearSpell.cast(ChosenNPC.GetActorReference(), ChosenNPC.GetActorReference())
ChosenNPC.GetActorReference().StartCombat(playerref)
TauntingMatters_PlayerSpell.Cast(PlayerRef, PlayerRef)

else

PlayerRef.PlayIdle(idlepointfar_02)
Utility.Wait(2.2)
PlayerRef.PlayIdle(IdleStop_Loose)
CTN_FearSpell.cast(ChosenNPC.GetActorReference(), ChosenNPC.GetActorReference())
ChosenNPC.GetActorReference().StartCombat(playerref)
endif
akspeaker.Disable()
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

spell property ctn_fearspell auto
ReferenceAlias Property ChosenNPC Auto
idle property IdleStop_Loose auto
idle property idlepointfar_02 auto
actor property playerref auto
spell property TauntingMatters_PlayerSpell auto
