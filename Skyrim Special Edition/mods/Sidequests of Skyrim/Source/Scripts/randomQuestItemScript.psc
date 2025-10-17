Scriptname randomQuestItemScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(60)
	EndIf
EndEvent