;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BardFragment Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FluteGlobal.SetValue(FluteGlobal.GetValue() + 10)
LuteGlobal.SetValue(LuteGlobal.GetValue() + 10)
DrumGlobal.SetValue(DrumGlobal.GetValue() + 10)
Game.GetPlayer().RemoveItem(Gold, 100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property Gold  Auto  
GlobalVariable Property FluteGlobal Auto
GlobalVariable Property LuteGlobal Auto
GlobalVariable Property DrumGlobal Auto
