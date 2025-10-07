;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname Lute_Plus_Drum Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
_Talent_FollowerPlays.SetValue(2)
Utility.Wait(0.2)
akspeaker.UnequipItemSlot(39)
Buddy.ForceRefTo(akspeaker)
SuperScene.Start()
Utility.Wait(0.4)
PlayerRef.AddSpell(DrumSpell, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.SetLookAt(Game.GetPlayer(), True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef Auto
Spell Property Drumspell Auto
ReferenceAlias Property Buddy Auto
GlobalVariable Property _Talent_FollowerPlays Auto
Scene Property SuperScene Auto
