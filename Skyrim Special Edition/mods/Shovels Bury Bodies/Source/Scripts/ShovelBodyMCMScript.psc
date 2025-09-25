Scriptname ShovelBodyMCMScript extends ski_configbase  

Event OnPageReset(string page)
	displayedActors = new ObjectReference[128]
	displayedIndices = new int[128]

	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("Configuration")
	delayIndex = AddSliderOption("Burial Duration", delay, "{1}s")

	AddHeaderOption("Buried Bodies")

	int n = ShovelBodyCell.GetNumRefs(43)
	int i = 0
	While n
		n -= 1
		ObjectReference akActor = ShovelBodyCell.GetNthRef(n, 43)
		displayedActors[i] = akActor
		int iIndex = AddTextOption(akActor.GetDisplayName(), "")
		If iIndex == 126
			SetCursorPosition(1)
		ElseIf iIndex == 127
			Return
		EndIf
		displayedIndices[i] = iIndex
		i += 1
	EndWhile

	n = ShovelBodyCell.GetNumRefs(24)
	While n
		n -= 1
		ObjectReference akActor = ShovelBodyCell.GetNthRef(n, 24)
		displayedActors[i] = akActor
		int iIndex = AddTextOption(akActor.GetDisplayName(), "")
		If iIndex == 126
			SetCursorPosition(1)
		ElseIf iIndex == 127
			Return
		EndIf
		displayedIndices[i] = iIndex
		i += 1
	EndWhile
EndEvent

Event OnOptionSelect(int a_option)
	int iIndex = displayedIndices.Find(a_option)
	If iIndex < 0
		Return
	EndIf
	ObjectReference akActor = displayedActors[iIndex]

	While(Utility.IsInMenuMode())
		Input.TapKey(1)
		Utility.WaitMenuMode(0.1)
	EndWhile

	int iSelected = ShovelBodyMCMMessage.Show()
	If iSelected == 0
		akActor.Activate(PlayerRef)
	ElseIf iSelected == 1
		akActor.MoveTo(PlayerRef)
		ForcePageReset()
	ElseIf iSelected == 2
		akActor.MoveTo(ShovelBodyDeletedMarker)
		ForcePageReset()
	EndIf
EndEvent

Event OnOptionHighlight(int a_option)
	If a_option == delayIndex
		SetInfoText("How many seconds it takes to bury bodies")
		Return
	EndIf

	int iIndex = displayedIndices.Find(a_option)
	If iIndex < 0
		Return
	EndIf
	ObjectReference akActor = displayedActors[iIndex]
	SetInfoText("Click this option to search, move, or delete " + akActor.GetDisplayName())
EndEvent

Event OnOptionSliderOpen(int a_option)
	If a_option == delayIndex
		SetSliderDialogInterval(0.5)
		SetSliderDialogRange(1, 300)
		SetSliderDialogDefaultValue(14)
		SetSliderDialogStartValue(delay)
	EndIf
EndEvent

Event OnOptionSliderAccept(int a_option, float a_value)
	If a_option == delayIndex
		delay = a_value
		SetSliderOptionValue(a_option, delay, "{1}s")
	EndIf
EndEvent

ObjectReference[] displayedActors
int[] displayedIndices
int delayIndex

Cell Property ShovelBodyCell Auto
Actor Property PlayerRef Auto
Message Property ShovelBodyMCMMessage Auto
ObjectReference Property ShovelBodyDeletedMarker Auto
float Property delay Auto