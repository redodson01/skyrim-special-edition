Scriptname randomQuestGatherPlayerScript extends ReferenceAlias

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	randomQuestGatherScript q = GetOwningQuest() as randomQuestGatherScript
	If q.GetStage() == 50
		q.UpdateCount()
	EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	randomQuestGatherScript q = GetOwningQuest() as randomQuestGatherScript
	If q.GetStage() == 50
		q.UpdateCount()
	EndIf
EndEvent
