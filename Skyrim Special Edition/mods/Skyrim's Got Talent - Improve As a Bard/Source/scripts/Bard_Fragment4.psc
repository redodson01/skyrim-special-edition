;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Bard_Fragment4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FluteGlobal.SetValue(FluteGlobal.GetValue() + 10)
LuteGlobal.SetValue(LuteGlobal.GetValue() + 10)
DrumGlobal.SetValue(DrumGlobal.GetValue() + 10)
Game.GetPlayer().RemoveItem(Gold, 100)
Utility.Wait(0.5)
Game.FadeOutGame(false, true, 3.0, 1.0)
Utility.Wait(0.5)
Debug.Notification("Your musical talent increases")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  
GlobalVariable Property FluteGlobal Auto
GlobalVariable Property LuteGlobal Auto
GlobalVariable Property DrumGlobal Auto
