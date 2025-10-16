;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CTN_Surrender Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.disablePlayerControls()
If PlayerRef.IsWeaponDrawn()
PlayerRef.SheatheWeapon()
Utility.Wait(2.1)
endif
playerref.playidle(IdleSurrender)
Utility.Wait(3.5)
Game.EnablePlayerControls()
PlayerRef.StopCombatAlarm()
CTN_Quest.Stop()
Utility.Wait(0.1)
CTN_Quest.Start()
akspeaker.Disable()
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef Auto
Idle Property IdleSurrender Auto
quest property ctn_quest auto
