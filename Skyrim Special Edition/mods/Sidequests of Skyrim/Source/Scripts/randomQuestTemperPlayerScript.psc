Scriptname randomQuestTemperPlayerScript extends ReferenceAlias  

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If GetOwningQuest().GetStage() >= 60
		Return
	EndIf
	Sync(akBaseItem)
	If akBaseItem == randomQuestTemperIronIngot || akBaseItem == randomQuestTemperSteelIngot
		GetOwningQuest().SetStage(60)
	EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	Sync(akBaseItem)
EndEvent

Function Sync(Form akBaseItem)
	GoToState("busy")
	If akBaseItem == IngotIron
		PlayerRef.RemoveItem(randomQuestTemperIronIngot, PlayerRef.GetItemCount(randomQuestTemperIronIngot), true)
		PlayerRef.AddItem(randomQuestTemperIronIngot, PlayerRef.GetItemCount(IngotIron), true)
	ElseIf akBaseItem == IngotSteel
		PlayerRef.RemoveItem(randomQuestTemperSteelIngot, PlayerRef.GetItemCount(randomQuestTemperSteelIngot), true)
		PlayerRef.AddItem(randomQuestTemperSteelIngot, PlayerRef.GetItemCount(IngotSteel), true)
	ElseIf akBaseItem == randomQuestTemperIronIngot
		PlayerRef.RemoveItem(IngotIron, PlayerRef.GetItemCount(IngotIron), true)
		PlayerRef.AddItem(IngotIron, PlayerRef.GetItemCount(randomQuestTemperIronIngot), true)
	ElseIf akBaseItem == randomQuestTemperSteelIngot
		PlayerRef.RemoveItem(IngotSteel, PlayerRef.GetItemCount(IngotSteel), true)
		PlayerRef.AddItem(IngotSteel, PlayerRef.GetItemCount(randomQuestTemperSteelIngot), true)
	EndIf
	GoToState("")
EndFunction

State busy
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	EndEvent
	Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	EndEvent
EndState

MiscObject Property randomQuestTemperIronIngot Auto
MiscObject Property randomQuestTemperSteelIngot Auto

MiscObject Property IngotIron Auto
MiscObject Property IngotSteel Auto

Actor Property PlayerRef Auto