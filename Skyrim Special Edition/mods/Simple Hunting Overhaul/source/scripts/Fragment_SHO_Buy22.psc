;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Fragment_SHO_Buy22 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If PlayerRef.GetItemCount(Carcass) > 0
PlayerRef.RemoveItem(Carcass, 1, true)

elseif PlayerRef.GetItemCount(Carcass1) > 0
PlayerRef.RemoveItem(Carcass1, 1, true)

elseif PlayerRef.GetItemCount(Carcass2) > 0
PlayerRef.RemoveItem(Carcass2, 1, true)

elseif PlayerRef.GetItemCount(Carcass3) > 0
PlayerRef.RemoveItem(Carcass3, 1, true)

elseif PlayerRef.GetItemCount(Carcass4) > 0
PlayerRef.RemoveItem(Carcass2, 4, true)

elseif PlayerRef.GetItemCount(Carcass5) > 0
PlayerRef.RemoveItem(Carcass5, 1, true)

else
PlayerRef.RemoveItem(Carcass6, 1, true)
endif

PlayerRef.AddItem(Gold001, Sho_.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Actor Property PlayerRef Auto
MiscObject Property Gold001 Auto
MiscObject Property Carcass Auto
MiscObject Property Carcass1 Auto
MiscObject Property Carcass2 Auto
MiscObject Property Carcass3 Auto
MiscObject Property Carcass4 Auto
MiscObject Property Carcass5 Auto
MiscObject Property Carcass6 Auto
GlobalVariable Property Sho_ Auto