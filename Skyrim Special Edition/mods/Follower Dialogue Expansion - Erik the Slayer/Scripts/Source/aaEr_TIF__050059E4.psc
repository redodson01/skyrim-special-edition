;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname aaEr_TIF__050059E4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.RemoveItem(SkyforgeSteelGreatsword, 1)
akSpeaker.AddItem(SkyforgeSteelGreatsword, 1)
akSpeaker.EquipItem(SkyforgeSteelGreatsword)
aaErikSkyforge.Value = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property SkyforgeSteelGreatsword  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property aaErikSkyforge  Auto  
