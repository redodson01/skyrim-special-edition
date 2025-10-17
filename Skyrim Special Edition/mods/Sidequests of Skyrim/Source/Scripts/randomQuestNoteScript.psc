Scriptname randomQuestNoteScript extends ReferenceAlias

Event OnRead()
	Quest q = GetOwningQuest()
	If q.GetStage() >= 50
		If randomQuestCancelMessage.Show() == 0
			Game.DisablePlayerControls(\
				abMovement=False,\
				abFighting=False,\
				abCamSwitch=False,\
				abLooking=False,\
				abSneaking=False,\
				abMenu=True,\
				abActivate=False,\
				abJournalTabs=False\
			)
			q.SetStage(300)
			Utility.Wait(0.1)
			Game.EnablePlayerControls(\
				abMovement=False,\
				abFighting=False,\
				abCamSwitch=False,\
				abLooking=False,\
				abSneaking=False,\
				abMenu=True,\
				abActivate=False,\
				abJournalTabs=False\
			)
		EndIf
	Else
		q.SetStage(50)
	EndIf
EndEvent

Message Property randomQuestCancelMessage Auto