;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname aaIl_TIF__0503D6DB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Int GiftValue = akSpeaker.ShowGiftMenu(true, CaesiaGiftsList, true, false)

If GiftValue == 0
;
ElseIf GiftValue > 1000
(GetOwningQuest() as aaIlliaApprove).ap(3)
ElseIf GiftValue > 500
(GetOwningQuest() as aaIlliaApprove).ap(2)
Else
(GetOwningQuest() as aaIlliaApprove).ap(1)
EndIf

aaIlliaGiftValue.Value = GiftValue
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property CaesiaGiftsList  Auto  

GlobalVariable Property aaIlliaGiftValue  Auto  
