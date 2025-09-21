Scriptname randomQuestMCMScript extends SKI_ConfigBase

Event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("Quests")
	optionEnabled = AddToggleOption("Quests enabled", randomQuestEnabled.GetValueInt())
	optionAllowUnvoicedDialog = AddToggleOption("Allow unvoiced dialog", randomQuestAllowUnvoicedDialog.GetValueInt())
	optionGoldRewardMultiplier = AddSliderOption("Gold reward multiplier", randomQuestGoldRewardMultiplier.GetValueInt())
	optionChanceNoQuest = AddSliderOption("Chance of no quest", randomQuestChanceNoQuest.GetValueInt(), "{0}%")
	optionDispositionEnabled = AddToggleOption("Quests improve disposition", randomQuestDispositionEnabled.GetValueInt())
	optionLimitToUnique = AddToggleOption("Limit quest givers to unique NPCs", randomQuestLimitToUnique.GetValueInt())

	AddHeaderOption("Follower")
	optionFollowerEnabled = AddToggleOption("Additional potential follower candidates", randomQuestFollowerEnabled.GetValueInt())
	optionFollowerMinConfidence = AddSliderOption("Minimum confidence", randomQuestFollowerMinConfidence.GetValueInt())

	AddHeaderOption("Barter")
	optionBarterEnabled = AddToggleOption("Friends give discounts", randomQuestBarterEnabled.GetValueInt())

	AddHeaderOption("Marriage")
	optionMarriageEnabled = AddToggleOption("Additional potential marriage candidates", randomQuestMarriageEnabled.GetValueInt())
	optionMarriageIgnore = AddToggleOption("Ignore existing relationships", randomQuestMarriageIgnore.GetValueInt())

	SetCursorPosition(1)

	AddHeaderOption("Quest Types Enabled")
	optionsEnabledQuest = new Quest[128]
	AddQuestEnabledOption(randomQuestDelivery)
	AddQuestEnabledOption(randomQuestDungeon)
	AddQuestEnabledOption(randomQuestGather)
	AddQuestEnabledOption(randomQuestShopping)
	AddQuestEnabledOption(randomQuestTemper)
	AddQuestEnabledOption(randomQuestShipment)
	AddQuestEnabledOption(randomQuestRescue)


	AddHeaderOption("Quest Status")
	optionsQuest = new Quest[128]
	AddQuestOption(randomQuestDelivery)
	AddQuestOption(randomQuestDungeon)
	AddQuestOption(randomQuestGather)
	AddQuestOption(randomQuestShopping)
	AddQuestOption(randomQuestTemper)
	AddQuestOption(randomQuestShipment)
	AddQuestOption(randomQuestRescue)
EndEvent

int Function AddQuestOption(Quest q)
	optionsQuest[AddTextOption(GetQuestName(q), GetQuestStatus(q))] = q
EndFunction

int Function AddQuestEnabledOption(Quest q)
	GlobalVariable gv = GetQuestEnabledVariable(q)
	optionsEnabledQuest[AddToggleOption(GetQuestName(q), gv.GetValueInt())] = q
EndFunction

GlobalVariable Function GetQuestEnabledVariable(Quest q)
	If q == randomQuestDelivery
		return randomQuestEnabledDelivery
	ElseIf q == randomQuestDungeon
		return randomQuestEnabledDungeon
	ElseIf q == randomQuestGather
		return randomQuestEnabledGather
	ElseIf q == randomQuestShopping
		return randomQuestEnabledShopping
	ElseIf q == randomQuestTemper
		return randomQuestEnabledTemper
	ElseIf q == randomQuestShipment
		return randomQuestEnabledShipment
	ElseIf q == randomQuestRescue
		return randomQuestEnabledRescue
	Else
		return None
	EndIf
EndFunction

string Function GetQuestStatus(Quest q)
	If q.IsRunning()
		Return "Running"
	ElseIf q.IsStarting()
		Return "Starting"
	ElseIf q.IsStopped()
		Return "Stopped"
	ElseIf q.IsStopping()
		Return "Stopping"
	EndIf
EndFunction

string Function GetQuestName(Quest q)
	If q == randomQuestDelivery
		return "Delivery"
	ElseIf q == randomQuestDungeon
		return "Retrieve item"
	ElseIf q == randomQuestGather
		return "Gather ingredients"
	ElseIf q == randomQuestShopping
		return "Shopping"
	ElseIf q == randomQuestTemper
		return "Temper weapon"
	ElseIf q == randomQuestShipment
		return "Shipment"
	ElseIf q == randomQuestRescue
		return "Rescue"
	EndIf
EndFunction

Function CheckEnabledQuest(Quest q)
	If q == randomQuestTemper || q == randomQuestShopping || q == randomQuestGather
		GlobalVariable gv1 = GetQuestEnabledVariable(randomQuestTemper)
		GlobalVariable gv2= GetQuestEnabledVariable(randomQuestShopping)
		GlobalVariable gv3 = GetQuestEnabledVariable(randomQuestGather)
		If !gv1.GetValueInt() && !gv2.GetValueInt() && !gv3.GetValueInt()
			Debug.MessageBox("You have disabled all location-independent quests. This may cause unimmersive dialog in certain locations if no enabled quests are available for that location.")
		EndIf
	EndIf
EndFunction

Function ClickEnabledQuest(int option)
	Quest q = optionsEnabledQuest[option]
	GlobalVariable gv = GetQuestEnabledVariable(q)
	If gv
		bool newValue = !gv.GetValueInt()
		gv.SetValueInt(newValue as int)
		SetToggleOptionValue(option, gv.GetValueInt())
		CheckEnabledQuest(q)
	EndIf
EndFunction

Function ClickQuest(int option)
	Quest q = optionsQuest[option]
	If q
		If q.IsRunning() && ShowMessage("Stop quest " + GetQuestName(q) + "?")
			q.SetStage(300)
			SetTextOptionValue(option, GetQuestStatus(q))
		EndIf
	EndIf
EndFunction

Event OnOptionSelect(int option)
	If option == optionAllowUnvoicedDialog
		bool oldValue = randomQuestAllowUnvoicedDialog.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestAllowUnvoicedDialog.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestAllowUnvoicedDialog.GetValueInt())
	ElseIf option == optionEnabled
		bool oldValue = randomQuestEnabled.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestEnabled.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestEnabled.GetValueInt())
	ElseIf option == optionMarriageEnabled
		bool oldValue = randomQuestMarriageEnabled.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestMarriageEnabled.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestMarriageEnabled.GetValueInt())
	ElseIf option == optionFollowerEnabled
		bool oldValue = randomQuestFollowerEnabled.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestFollowerEnabled.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestFollowerEnabled.GetValueInt())
	ElseIf option == optionMarriageIgnore
		bool oldValue = randomQuestMarriageIgnore.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestMarriageIgnore.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestMarriageIgnore.GetValueInt())
	ElseIf option == optionDispositionEnabled
		bool oldValue = randomQuestDispositionEnabled.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestDispositionEnabled.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestDispositionEnabled.GetValueInt())
	ElseIf option == optionBarterEnabled
		bool oldValue = randomQuestBarterEnabled.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestBarterEnabled.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestBarterEnabled.GetValueInt())
	ElseIf option == optionLimitToUnique 
		bool oldValue = randomQuestLimitToUnique.GetValueInt() as bool
		bool newValue = !oldValue
		randomQuestLimitToUnique.SetValueInt(newValue as int)
		SetToggleOptionValue(option, randomQuestLimitToUnique.GetValueInt())
	Else
		ClickQuest(option)
		ClickEnabledQuest(option)
	EndIf
EndEvent

Function SetQuestInfoText(int option)
	Quest q = optionsQuest[option]
	If q
		If q.IsRunning()
			SetInfoText(GetQuestName(q) + " quest is running. Click to fail this quest.")
		Else
			SetInfoText(GetQuestName(q) + " quest is " + GetQuestStatus(q))
		EndIf
	EndIf
EndFunction

Function SetEnabledQuestInfoText(int option)
	Quest q = optionsEnabledQuest[option]
	string notice = ""
	If q == randomQuestTemper || q == randomQuestShopping || q == randomQuestGather
		notice = "This is a location-independent quest. Disabling all location-independent quests may cause unimmersive dialog in certain locations if no enabled quests are available for that location."
	EndIf
	GlobalVariable gv = GetQuestEnabledVariable(q)
	If gv
		If gv.GetValueInt()
			SetInfoText("Uncheck to disable " + GetQuestName(q) + ". " +  notice)
		Else
			SetInfoText("Check to enable " + GetQuestName(q) + ". " + notice)
		EndIf
	EndIf
EndFunction

Event OnOptionHighlight(int option)
	If option == optionAllowUnvoicedDialog
		If randomQuestAllowUnvoicedDialog.GetValueInt()
			SetInfoText("Uncheck to prevent non-vanilla NPC from giving you quests using silent voice.")
		Else
			SetInfoText("Check to allow non-vanilla NPC to give you quests using silent voice.")
		EndIf
	ElseIf option == optionEnabled
		If randomQuestEnabled.GetValueInt()
			SetInfoText("Uncheck to prevent future quests from starting. This setting won't fail current quests.")
		Else
			SetInfoText("Check to allow future quests to start. This setting won't fail current quests.")
		EndIf
	ElseIf option == optionMarriageEnabled
		If randomQuestMarriageEnabled.GetValueInt()
			SetInfoText("Uncheck to disable additional potential marriage candidates. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		Else
			SetInfoText("Check to enable additional potential marriage candidates when disposition reaches level 4. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		EndIf
	ElseIf option == optionFollowerEnabled
		If randomQuestFollowerEnabled.GetValueInt()
			SetInfoText("Uncheck to disable additional potential follower candidates. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		Else
			SetInfoText("Check to enable additional potential follower candidates when disposition reaches level 2 - 4 depending on their Assistance level (willingness to assist friends and allies). This setting only affects future interactions upon quest completion and won't apply retroactively.")
		EndIf
	ElseIf option == optionDispositionEnabled
		If randomQuestDispositionEnabled.GetValueInt()
			SetInfoText("Uncheck to disable disposition (relationship rank) increases upon quest completion. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		Else
			SetInfoText("Check to enable disposition (relationship rank) increases upon quest completion. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		EndIf
	ElseIf option == optionBarterEnabled
		If randomQuestBarterEnabled.GetValueInt()
			SetInfoText("Uncheck to disable better barter price with friends. 2.5% per relationship rank. This setting applies retroactively with all friendly merchants.")
		Else
			SetInfoText("Check to enable better barter price with friends. 2.5% per relationship rank. This setting applies retroactively with all friendly merchants.")
		EndIf
	ElseIf option == optionMarriageIgnore
		If randomQuestMarriageIgnore.GetValueInt()
			SetInfoText("Uncheck to disable additional potential marriage candidates who are already in a relationship. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		Else
			SetInfoText("Uncheck to enable additional potential marriage candidates who are already in a relationship. This setting only affects future interactions upon quest completion and won't apply retroactively.")
		EndIf
	ElseIf option == optionGoldRewardMultiplier
		SetInfoText("Controls how much gold reward you get from completing quests.")
	ElseIf option == optionFollowerMinConfidence
		SetInfoText("Minimum confidence (willingness to fight tough enemies) an NPC needs to have in order to become an additional potential follower. This setting only affects future interactions upon quest completion and won't apply retroactively.")
	ElseIf option == optionChanceNoQuest
		SetInfoText("Chance that an NPC has no quest to give you.")
	ElseIf option == optionLimitToUnique 
		SetInfoText("Limit quest givers to unique NPCs.")
	Else
		SetQuestInfoText(option)
		SetEnabledQuestInfoText(option)
	EndIf
EndEvent

Event OnOptionSliderAccept(int option, float value)
	If option == optionGoldRewardMultiplier
		randomQuestGoldRewardMultiplier.SetValueInt(value as int)
		SetSliderOptionValue(option, randomQuestGoldRewardMultiplier.GetValueInt())
	ElseIf option == optionFollowerMinConfidence
		randomQuestFollowerMinConfidence.SetValueInt(value as int)
		SetSliderOptionValue(option, randomQuestFollowerMinConfidence.GetValueInt())
	ElseIf option == optionChanceNoQuest
		randomQuestChanceNoQuest.SetValueInt(value as int)
		SetSliderOptionValue(option, randomQuestChanceNoQuest.GetValueInt(), "{0}%")
	EndIf
EndEvent

Event OnOptionSliderOpen(int option)
	If option == optionGoldRewardMultiplier
		SetSliderDialogStartValue(randomQuestGoldRewardMultiplier.GetValueInt())
		SetSliderDialogDefaultValue(10)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	ElseIf option == optionFollowerMinConfidence
		SetSliderDialogStartValue(randomQuestFollowerMinConfidence.GetValueInt())
		SetSliderDialogDefaultValue(2)
		SetSliderDialogRange(0, 5)
		SetSliderDialogInterval(1)
	ElseIf option == optionChanceNoQuest
		SetSliderDialogStartValue(randomQuestChanceNoQuest.GetValueInt())
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	EndIf
EndEvent

Event OnOptionDefault(int option)
	If option == optionAllowUnvoicedDialog
		randomQuestAllowUnvoicedDialog.SetValueInt(0)
		SetToggleOptionValue(option, randomQuestAllowUnvoicedDialog.GetValueInt())
	ElseIf option == optionEnabled
		randomQuestEnabled.SetValueInt(1)
		SetToggleOptionValue(option, randomQuestEnabled.GetValueInt())
	ElseIf option == optionGoldRewardMultiplier
		randomQuestGoldRewardMultiplier.SetValueInt(10)
		SetSliderOptionValue(option, randomQuestGoldRewardMultiplier.GetValueInt())
	ElseIf option == optionChanceNoQuest
		randomQuestChanceNoQuest.SetValueInt(50)
		SetSliderOptionValue(option, randomQuestChanceNoQuest.GetValueInt(), "{0}%")
	ElseIf option == optionMarriageEnabled
		randomQuestMarriageEnabled.SetValueInt(1)
		SetToggleOptionValue(option, randomQuestMarriageEnabled.GetValueInt())
	ElseIf option == optionFollowerEnabled
		randomQuestFollowerEnabled.SetValueInt(1)
		SetToggleOptionValue(option, randomQuestFollowerEnabled.GetValueInt())
	ElseIf option == optionDispositionEnabled
		randomQuestDispositionEnabled.SetValueInt(1)
		SetToggleOptionValue(option, randomQuestDispositionEnabled.GetValueInt())
	ElseIf option == optionBarterEnabled
		randomQuestBarterEnabled.SetValueInt(1)
		SetToggleOptionValue(option, randomQuestBarterEnabled.GetValueInt())
	ElseIf option == optionMarriageIgnore
		randomQuestMarriageIgnore.SetValueInt(0)
		SetToggleOptionValue(option, randomQuestMarriageIgnore.GetValueInt())
	ElseIf option == optionFollowerMinConfidence
		randomQuestFollowerMinConfidence.SetValueInt(2)
		SetSliderOptionValue(option, randomQuestFollowerMinConfidence.GetValueInt())
	ElseIf option == optionLimitToUnique
		randomQuestLimitToUnique.SetValueInt(0)
		SetToggleOptionValue(option, randomQuestLimitToUnique.GetValueInt())
	EndIf
EndEvent

int optionAllowUnvoicedDialog
int optionEnabled
int optionGoldRewardMultiplier
int optionMarriageEnabled
int optionFollowerEnabled
int optionMarriageIgnore
int optionFollowerMinConfidence
int optionDispositionEnabled
int optionBarterEnabled
int optionChanceNoQuest
int optionLimitToUnique 

Quest[] optionsQuest
Quest[] optionsEnabledQuest

GlobalVariable Property randomQuestAllowUnvoicedDialog Auto
GlobalVariable Property randomQuestEnabled Auto
GlobalVariable Property randomQuestGoldRewardMultiplier Auto
GlobalVariable Property randomQuestMarriageEnabled Auto
GlobalVariable Property randomQuestFollowerEnabled Auto
GlobalVariable Property randomQuestMarriageIgnore Auto
GlobalVariable Property randomQuestFollowerMinConfidence Auto
GlobalVariable Property randomQuestDispositionEnabled Auto
GlobalVariable Property randomQuestBarterEnabled Auto
GlobalVariable Property randomQuestChanceNoQuest Auto
GlobalVariable Property randomQuestLimitToUnique Auto

GlobalVariable Property randomQuestEnabledDelivery Auto
GlobalVariable Property randomQuestEnabledDungeon Auto
GlobalVariable Property randomQuestEnabledGather Auto
GlobalVariable Property randomQuestEnabledShopping Auto
GlobalVariable Property randomQuestEnabledTemper Auto
GlobalVariable Property randomQuestEnabledShipment Auto
GlobalVariable Property randomQuestEnabledRescue Auto

Quest Property randomQuestDelivery Auto
Quest Property randomQuestDungeon Auto
Quest Property randomQuestGather Auto
Quest Property randomQuestShopping Auto
Quest Property randomQuestTemper Auto
Quest Property randomQuestShipment Auto
Quest Property randomQuestRescue Auto