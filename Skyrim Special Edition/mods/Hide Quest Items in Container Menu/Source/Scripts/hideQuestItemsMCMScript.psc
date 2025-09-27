Scriptname hideQuestItemsMCMScript extends SKI_ConfigBase

event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Toggle feature on/off")
	optionDisable = AddToggleOption("Hide quest items", !hideQuestItemsDisabled.GetValueInt())
endEvent

event OnOptionSelect(int option)
	if option == optionDisable
		hideQuestItemsDisabled.SetValueInt((!hideQuestItemsDisabled.GetValueInt()) as int)
		SetToggleOptionValue(option, !hideQuestItemsDisabled.GetValueInt())
	endIf
endEvent

event OnOptionHighlight(int option)
	if option == optionDisable
		SetInfoText("Temporarily enable or disable hiding quest items in container menu.")
	endIf
endEvent

int optionDisable
GlobalVariable Property hideQuestItemsDisabled Auto