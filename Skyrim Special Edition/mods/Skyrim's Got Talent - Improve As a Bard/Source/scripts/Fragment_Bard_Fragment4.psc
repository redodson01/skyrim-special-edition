;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Fragment_Bard_Fragment4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FluteGlobal.SetValue(FluteGlobal.GetValue() + 10)
LuteGlobal.SetValue(LuteGlobal.GetValue() + 10)
DrumGlobal.SetValue(DrumGlobal.GetValue() + 10)
Game.GetPlayer().RemoveItem(Gold, 100)
	FadeToBlackImod.Apply()
	utility.wait(2.5)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
		int instanceID = _Talent_BardTeachingAudio.play(akspeaker)     
		Sound.SetInstanceVolume(instanceID, 1.5)
	utility.wait(2.8)
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	FadeToBlackHoldImod.Remove()
Debug.Notification("Your musical talent increases")
	utility.wait(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  
GlobalVariable Property FluteGlobal Auto
GlobalVariable Property LuteGlobal Auto
GlobalVariable Property DrumGlobal Auto
ImageSpaceModifier Property FadeToBlackHoldImod Auto  
ImageSpaceModifier Property FadeToBlackImod Auto  
ImageSpaceModifier Property FadeToBlackBackImod Auto  
sound property _Talent_BardTeachingAudio auto
