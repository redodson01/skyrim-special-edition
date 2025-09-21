Scriptname randomQuestShoppingPlayerScript extends ReferenceAlias  

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	randomQuestShoppingScript q = GetOwningQuest() as randomQuestShoppingScript
	If q.GetStage() == 50
		q.UpdateCount()
	EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	randomQuestShoppingScript q = GetOwningQuest() as randomQuestShoppingScript
	If q.GetStage() == 50
		q.UpdateCount()
	EndIf
EndEvent
