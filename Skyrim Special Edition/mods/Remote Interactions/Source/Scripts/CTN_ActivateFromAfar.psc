;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CTN_ActivateFromAfar Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.EquipItem(CTN_PotionBackground, false, true)
Utility.Wait(0.1)
CTN_quest.Stop()
Utility.Wait(0.1)
CTN_quest.Start()
akspeaker.Disable()
akspeaker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property CTN_PotionBackground Auto
Actor Property PlayerRef Auto
ReferenceAlias Property ChosenNPC Auto
quest property ctn_quest auto
