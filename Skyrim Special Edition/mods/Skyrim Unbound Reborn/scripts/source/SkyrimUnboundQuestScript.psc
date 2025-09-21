Scriptname SkyrimUnboundQuestScript extends Quest  

int Property ModVersion Auto Hidden
bool Property AreAddonsLoaded Auto Hidden
bool Property IsFullyInitialized Auto Hidden
bool Property IsRandomizingLocationOrGear Auto Hidden
bool Property GearWasGivenWithMCMOpen = false Auto Hidden

SkyrimUnboundMCMScript Property MCM Auto
FormList Property SkyrimUnboundModules Auto
SkyrimUnboundModuleDragons Property Dragons Auto
SkyrimUnboundModuleAbilities Property Abilities Auto
SkyrimUnboundModuleInventory Property Inventory Auto
SkyrimUnboundModuleLocations Property Locations Auto

Actor Property PlayerRef Auto
FormList Property CharGenOutfit Auto
Quest Property MQ101 Auto
Quest Property MQ103 Auto
Quest Property DialogueWhiterunGuardGateStop Auto
Quest Property PerksQuest Auto
Actor Property BalgruufTheGreaterREF Auto
GlobalVariable Property GameHour Auto
Faction Property Favor253QuestGiverFaction Auto
MiscObject Property Gold001 Auto
Message Property SkyrimUnboundPreviewModeMessage Auto
Message Property SkyrimUnboundNotFullyInitializedYetMessage Auto
Message Property SkyrimUnboundIsRandomizingStuffMessage Auto
Message Property SkyrimUnboundUpdatingNotSupportedMessage Auto
Message Property SkyrimUnboundUpdatingNotSupportedBeforeStartMessage Auto
GlobalVariable Property MQ102IntegrityReport Auto
GlobalVariable Property MQ103IntegrityReport Auto
GlobalVariable Property MQ104IntegrityReport Auto
GlobalVariable Property MQ105IntegrityReport Auto
GlobalVariable Property WhiterunThanePrerequisite Auto
MQKillDragonScript Property MQKillDragon Auto

Race Property ArgonianRace Auto
Race Property ArgonianRaceVampire Auto
Race Property BretonRace Auto
Race Property BretonRaceVampire Auto
Race Property DarkElfRace Auto
Race Property DarkElfRaceVampire Auto
Race Property HighElfRace Auto
Race Property HighElfRaceVampire Auto
Race Property ImperialRace Auto
Race Property ImperialRaceVampire Auto
Race Property KhajiitRace Auto
Race Property KhajiitRaceVampire Auto
Race Property NordRace Auto
Race Property NordRaceVampire Auto
Race Property OrcRace Auto
Race Property OrcRaceVampire Auto
Race Property RedguardRace Auto
Race Property RedguardRaceVampire Auto
Race Property WoodElfRace Auto
Race Property WoodElfRaceVampire Auto


int titleSequenceStage = -1
bool wasCharGenOutfitGiven = false


Event OnGameLoad()

	int newModVersion = 30002
	if ModVersion < newModVersion
		if ModVersion
			if ModVersion < 30002
				SkyrimUnboundUpdatingNotSupportedMessage.Show()
			elseif GetStage() < 100 && ModVersion < 30000
				SkyrimUnboundUpdatingNotSupportedBeforeStartMessage.Show()
			endif
		endif
		ModVersion = newModVersion
	endif

endEvent

bool function IsRunningOnSE()
	return SKSE.GetVersion() > 1
endFunction

int function GetGlobalSettingInt(string settingName)
	return JsonUtil.GetIntValue("../SkyrimUnbound/SkyrimUnbound.json", settingName)
endFunction

function SetGlobalSettingInt(string settingName, int value)
	JsonUtil.SetIntValue("../SkyrimUnbound/SkyrimUnbound.json", settingName, value)
	JsonUtil.Save("../SkyrimUnbound/SkyrimUnbound.json")
endFunction

string function GetGlobalSettingString(string settingName)
	return JsonUtil.GetStringValue("../SkyrimUnbound/SkyrimUnbound.json", settingName)
endFunction

function SetGlobalSettingString(string settingName, string value)
	JsonUtil.SetStringValue("../SkyrimUnbound/SkyrimUnbound.json", settingName, value)
	JsonUtil.Save("../SkyrimUnbound/SkyrimUnbound.json")
endFunction

function StartSkyrimUnbound()
	
	RegisterForMenu("Journal Menu")

	if !PapyrusUtil.GetVersion() || GetGlobalSettingInt("clothes_in_starting_room") > 0
		wasCharGenOutfitGiven = true

		int ImmEquipAnimGlobalPrevVal = -1
		GlobalVariable ImmEquipAnimGlobal
		if Game.GetModByName("Immersive Equipping Animations.esp") != 255
			ImmEquipAnimGlobal = Game.GetFormFromFile(0x806, "Immersive Equipping Animations.esp") as GlobalVariable
			ImmEquipAnimGlobalPrevVal = ImmEquipAnimGlobal.GetValueInt()
			ImmEquipAnimGlobal.SetValue(0)
		endif

		int i = CharGenOutfit.GetSize()
		while i > 0
			i -= 1
			Form armorPart = CharGenOutfit.GetAt(i)
			PlayerRef.AddItem(armorPart, 1, true)
			PlayerRef.EquipItem(armorPart, false, true)
		endwhile

		if ImmEquipAnimGlobalPrevVal > -1
			Utility.WaitMenuMode(1.0)
			ImmEquipAnimGlobal.SetValue(ImmEquipAnimGlobalPrevVal)
			ImmEquipAnimGlobalPrevVal = -1
		endif
	endif

	if GetGlobalSettingInt("black_screen") > 0
		Utility.WaitMenuMode(GetGlobalSettingInt("black_screen"))
	endif
	if !PapyrusUtil.GetVersion() || GetGlobalSettingInt("intro_titles") > 0
		if !PapyrusUtil.GetVersion() || GetGlobalSettingInt("intro_titles") == 1
			if IsRunningOnSE()
				Game.FadeOutGame(false, true, 14.0, 4.0)
			else
				Game.FadeOutGame(false, true, 28.0, 6.0)
			endif
			titleSequenceStage = 2
		else
			if IsRunningOnSE()
				Game.FadeOutGame(false, true, 14.0, 17.0) 
			else
				Game.FadeOutGame(false, true, 28.0, 30.0)
			endif
			titleSequenceStage = 0
		endif
		Game.ShowTitleSequenceMenu()
		RegisterForSingleUpdate(4.0)
	else
		;Game.FadeOutGame(false, true, 0.0, 3.0) / Game.FadeOutGame(false, true, 1.0, 1.0) is not required if we open RaceMenu right away
		ContinueSkyrimUnboundAfterTitles()
	endif

endFunction

Event OnUpdate()

	if titleSequenceStage == -1
		return
	elseif titleSequenceStage == 0
		Game.StartTitleSequence("Sequence1")
		titleSequenceStage = 1
		RegisterForSingleUpdate(5.0)
	elseif titleSequenceStage == 1
		Game.StartTitleSequence("Sequence2")
		titleSequenceStage = 2
		RegisterForSingleUpdate(8.0)
	elseif titleSequenceStage == 2
		Game.StartTitleSequence("Sequence3")
		titleSequenceStage = 3
		RegisterForSingleUpdate(5.0)
	elseif titleSequenceStage == 3
		Game.StartTitleSequence("Sequence4")
		titleSequenceStage = 4
		RegisterForSingleUpdate(8.3) ;8.5
	elseif titleSequenceStage == 4
		titleSequenceStage = -1
		Game.HideTitleSequenceMenu()
		ContinueSkyrimUnboundAfterTitles()
	endif

endEvent

function WaitUntilCharGenOutfitIsEquipped()
	if wasCharGenOutfitGiven
		float startTime = Utility.GetCurrentRealTime()
		int i = CharGenOutfit.GetSize()
		while i > 0
			i -= 1
			Form armorPart = CharGenOutfit.GetAt(i)
			while PlayerRef.GetItemCount(armorPart) > 0 && !PlayerRef.IsEquipped(armorPart)
				if !PapyrusUtil.GetVersion() || GetGlobalSettingInt("intro_titles") > 0 || (Utility.GetCurrentRealTime() - startTime) > 10.0
					Debug.Messagebox("Skyrim Unbound error: Some mod prevents the starting room clothes from getting equipped. To disable clothes in the starting room, set \"clothes in starting room\" : 0 in SkyrimUnbound.json (requires PapyrusUtil).")
					return
				endif
			endwhile
		endwhile
	endif
endFunction

function ContinueSkyrimUnboundAfterTitles()
			
	WaitUntilCharGenOutfitIsEquipped()
	OpenRaceMenu()
	Utility.Wait(0.1)
	SetStage(10)
	if GetGlobalSettingInt("auto_open_mcm")
		AutoOpenMCM()
	elseif GetGlobalSettingInt("auto_open_presets") && JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")
		ShowPresetMenu(true)
	else
		EnableControlsAndStuff()
		Autosave()
		RegisterForPresetMenuAndShowFirstObjective()
	endif
	; the player continues the start via the Begin Your Adventure option or the hotkey

	ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnControlsEnabled"))
	ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnControlsEnabledAfterRaceMenu")) ; for backward compatibility
	ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnRaceMenuClosed"))

	DialogueWhiterunGuardGateStop.SetStage(10)
	BalgruufTheGreaterREF.AddToFaction(Favor253QuestGiverFaction)

endFunction

function RegisterForPresetMenuAndShowFirstObjective()
	RegisterForSkyrimUnboundHotkey()
	Utility.Wait(0.001) ; so the objective is not displayed too early when loading the save
	SetObjectiveDisplayed(10)
	if PapyrusUtil.GetVersion() && JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")
		int keyCode = GetSkyrimUnboundHotkeyKeyCode()
		if keyCode == 28
			SetObjectiveDisplayed(11)
		elseif keyCode
			SetObjectiveDisplayed(12)
		endif
	endif
endFunction

function CheckIntegrityOnStartup()

	if !SkyrimUnboundIsRandomizingStuffMessage
		Debug.Messagebox("Skyrim Unbound: Integrity check failed\n\nThe versions of the SkyrimUnboundQuestScript.pex script and the SkyrimUnbound quest record (xx000D62) don't match.\nMost likely you have an oudated third-party patch or translation for Skyrim Unbound. Delete the outdated patch and start a new game.")
	endif

	string overwrittenScriptsString
	string overwrittenRecordsString
	if PlayerRef.GetItemCount(Gold001) == 140
		overwrittenRecordsString += "\nPlayer [NPC_:00000007]"
	endif
	if MQ102IntegrityReport.GetValueInt() == 0
		overwrittenScriptsString += "\nqf_mq102_0004e50d.pex"
	elseif MQ102IntegrityReport.GetValueInt() == 1
		overwrittenRecordsString += "\nMQ102 [QUST:0004E50D]"
	endif
	if MQ103IntegrityReport.GetValueInt() == 0
		overwrittenScriptsString += "\nqf_mq103_000d0800.pex"
	elseif MQ103IntegrityReport.GetValueInt() == 1
		overwrittenRecordsString += "\nMQ103 [QUST:000D0800]"
	endif
	if !MQKillDragon.SkyrimUnboundScriptWins
		overwrittenScriptsString += "\nMQKillDragonScript.pex"
	endif
	if overwrittenScriptsString || overwrittenRecordsString
		string messageText = "Skyrim Unbound: Integrity check failed\n"
		if overwrittenScriptsString
			messageText += "\nThe following scripts are overwritten:" + overwrittenScriptsString + \
			"\nOther mods must NOT overwrite these files unless they're compatible.\n"
		endif
		if overwrittenRecordsString
			messageText += "\nThe following records are overwritten:" + overwrittenRecordsString + \
			"\nMove Skyrim Unbound.esp (and plugins dependent on it) lower in the load order.\n"
		endif
		messageText += "\nWhen you fix this, start a new game."
		Debug.Messagebox(messageText)
	endif

endFunction

function CheckIntegrityAfterMainQuestStart()
	string overwrittenScriptsString
	string overwrittenRecordsString
	if MQ104IntegrityReport.GetValueInt() == 0
		overwrittenScriptsString += "\nqf_mq104b_0002610c.pex"
	elseif MQ104IntegrityReport.GetValueInt() == 1
		overwrittenRecordsString += "\nMQ104 [QUST:0002610C]"
	endif
	if MQ105IntegrityReport.GetValueInt() == 0
		overwrittenScriptsString += "\nqf_mq105_000242ba.pex"
	elseif MQ105IntegrityReport.GetValueInt() == 1
		overwrittenRecordsString += "\nMQ105 [QUST:000242BA]"
	endif
	if overwrittenScriptsString || overwrittenRecordsString
		string MessageText = "Skyrim Unbound: Integrity check failed\n"
		if overwrittenScriptsString
			MessageText += "\nThe following scripts are overwritten:" + overwrittenScriptsString + "\nOther mods must NOT overwrite these files unless they're compatible.\n"
		endif
		if overwrittenRecordsString
			MessageText += "\nThe following records are overwritten:" + overwrittenRecordsString + "\nMove Skyrim Unbound.esp (and plugins dependent on it) lower in the load order.\n"
		endif
		MessageText += "\nIf only scripts are overwritten, after you fix this, go back to a save before absorbing your first dragon soul and try again. If there are any overwritten records, you'll have to start a new game after fixing this."
		Debug.Messagebox(MessageText)
	endif
endFunction

Event OnMenuClose(string menuName)
	if menuName == "Journal Menu"
		if GetStage() == 10 && GetStageDone(5) && !IsObjectiveDisplayed(10)
			RegisterForPresetMenuAndShowFirstObjective()
		elseif GetStageDone(30)
			FixNotEquippedGear()
			if GetStage() == 30 && !IsObjectiveDisplayed(50) && !IsObjectiveDisplayed(51)
				Autosave()
				int keyCode = RegisterForSkyrimUnboundHotkey()
				Utility.Wait(0.001) ; so the objective is not displayed too early when loading the save
				if keyCode == 28
					SetObjectiveDisplayed(50)
				elseif keyCode
					SetObjectiveDisplayed(51)
				endif
			endif
		endif
	endif
endEvent

function FixNotEquippedGear() ; weapons don't get equipped while the MCM is open
	if GearWasGivenWithMCMOpen
		GearWasGivenWithMCMOpen = false
		Inventory.EquipGearInInventory()
	endif
endFunction

function OpenRaceMenu()
	Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState") ;fixes playing nude animations from EVG Conditional Idles and similar mods
	Game.ShowRaceMenu()
endFunction

function EnableControlsAndStuff()
	Game.EnablePlayerControls()
	PlayerRef.SetRestrained(false)
	Game.ShowFirstPersonGeometry(true)
	Game.SetPlayerAIDriven(false)
	Game.SetInChargen(false, false, false)
endFunction

function Autosave()
	if !PapyrusUtil.GetVersion() || GetGlobalSettingInt("autosave")
		Game.RequestSave()
	endif
endFunction

int function GetSkyrimUnboundHotkeyKeyCode()
	if PapyrusUtil.GetVersion()
		return GetGlobalSettingInt("hotkey")
	else
		return 28
	endif
endFunction

int function RegisterForSkyrimUnboundHotkey()
	int keyCode = GetSkyrimUnboundHotkeyKeyCode()
	if keyCode
		RegisterForKey(keyCode)
	endif
	return keyCode
endFunction

function AutoOpenMCM()
	Utility.Wait(GetGlobalSettingInt("auto_open_mcm_delay"))
	while !IsFullyInitialized
		Utility.Wait(1.0)
	endwhile
	; we don't have to wait for the initialization of MCM explicitly, since the MCM won't open unless OnConfigInit() returns (because it's called from the MCM's OnInit())
	MCM.OpenMCMIfHaventOpenedYet()
endFunction

function OnFirstMCMOpen()
	if GetGlobalSettingInt("auto_open_mcm")
		SetStage(5) ; the stage will be 10 since 10 was already set earlier
		RegisterForSkyrimUnboundHotkey()
	endif
endFunction

function PrepareForStart(bool previewMode = false)

	SetStage(20)
	UnregisterForAllKeys()
	if !previewMode
		UnregisterForMenu("Journal Menu")
		Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = True, abLooking = True, abSneaking = True, abMenu = True, abJournalTabs = True)
		Game.SetInChargen(true, true, false)
	endif
	SetObjectiveDisplayed(10, false)
	SetObjectiveDisplayed(11, false)
	SetObjectiveDisplayed(12, false)
	SelectLocation()
	GivePlayerStuff()
	if previewMode
		SetStage(30)
	endif

endFunction

function GivePlayerStuff()
	IsRandomizingLocationOrGear = true

	int ImmEquipAnimGlobalPrevVal = -1
	GlobalVariable ImmEquipAnimGlobal
	if Game.GetModByName("Immersive Equipping Animations.esp") != 255
		ImmEquipAnimGlobal = Game.GetFormFromFile(0x806, "Immersive Equipping Animations.esp") as GlobalVariable
		ImmEquipAnimGlobalPrevVal = ImmEquipAnimGlobal.GetValueInt()
		ImmEquipAnimGlobal.SetValue(0)
	endif

	if wasCharGenOutfitGiven
		int i = CharGenOutfit.GetSize()
		while i > 0
			i -= 1
			PlayerRef.RemoveItem(CharGenOutfit.GetAt(i), 1, true)
		endwhile
	endif

	Inventory.GivePlayerStuff()
	int i = 0
	int numberOfModules = SkyrimUnboundModules.GetSize()
	while i < numberOfModules
		(SkyrimUnboundModules.GetAt(i) as SkyrimUnboundModule).AfterGivingItems()
		i += 1
	endwhile

	if ImmEquipAnimGlobalPrevVal > -1
		Utility.WaitMenuMode(1.0)
		ImmEquipAnimGlobal.SetValue(ImmEquipAnimGlobalPrevVal)
		ImmEquipAnimGlobalPrevVal = -1
	endif

	IsRandomizingLocationOrGear = false
endFunction

function SelectLocation()
	IsRandomizingLocationOrGear = true

	Locations.SelectLocation()

	IsRandomizingLocationOrGear = false
endFunction

Event OnKeyDown(int keyCode)
	if !Utility.IsInMenuMode()
		if IsRandomizingLocationOrGear
			SkyrimUnboundIsRandomizingStuffMessage.Show()
		elseif GetStage() == 10
			ShowPresetMenu()
		elseif GetStage() == 30
			ShowPreviewModeMenu()
		endif
	endif
endEvent

function ShowPresetMenu(bool autoOpened = false)
	UnregisterForAllKeys()

	if autoOpened
		while !IsFullyInitialized
			Utility.Wait(1.0)
		endwhile
	else
		if !IsFullyInitialized
			SkyrimUnboundNotFullyInitializedYetMessage.Show()
			RegisterForSkyrimUnboundHotkey()
			return
		endif
	endif

	string[] userPresets = JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")
	if userPresets.Length
		int i = userPresets.Length
		while i > 0
			i -= 1
			userPresets[i] = StringUtil.Substring(userPresets[i], 0, StringUtil.GetLength(userPresets[i]) - 5)
		endwhile
	endif

	string menuName = "$SU_StartWithPreset"
	string cancelOptionText = "$SU_Cancel"
	string currentSettingsOptionText = "$SU_CurrentSettings"
	string randomPresetOptionText = "$SU_RandomPreset"
	if GetGlobalSettingString("preset_menu_header_text")
		menuName = GetGlobalSettingString("preset_menu_header_text")
	endif
	if GetGlobalSettingString("preset_menu_cancel_text")
		cancelOptionText = GetGlobalSettingString("preset_menu_cancel_text")
	endif
	if GetGlobalSettingString("preset_menu_current_settings_text")
		currentSettingsOptionText = GetGlobalSettingString("preset_menu_current_settings_text")
	endif
	if GetGlobalSettingString("preset_menu_random_text")
		randomPresetOptionText = GetGlobalSettingString("preset_menu_random_text")
	endif
	
	int randomPresetOptionIndex = 2
	int firstPresetOptionIndex = 3
	string[] menuOptions
	if userPresets.Length
		string[] firstElements
		if autoOpened || GetGlobalSettingInt("preset_menu_hide_current_settings")
			firstElements = new string[2]
			firstElements[1] = randomPresetOptionText
			randomPresetOptionIndex = 1
			firstPresetOptionIndex = 2
		else
			firstElements = new string[3]
			firstElements[1] = currentSettingsOptionText
			firstElements[2] = randomPresetOptionText
		endif
		firstElements[0] = cancelOptionText
		menuOptions = PapyrusUtil.MergeStringArray(firstElements, userPresets)
	else
		menuOptions = new string[2]
		menuOptions[0] = cancelOptionText
		menuOptions[1] = currentSettingsOptionText
	endif
	
	int selectedOptionIndex = ((Self as Form) as UILIB_1).ShowList(menuName, menuOptions, 1, 1)
	if selectedOptionIndex == 0
		if autoOpened
			EnableControlsAndStuff()
			RegisterForPresetMenuAndShowFirstObjective()
		else
			RegisterForSkyrimUnboundHotkey()
		endif
	else
		if selectedOptionIndex == randomPresetOptionIndex
			string presetName = JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")[Utility.RandomInt(0, userPresets.Length - 1)]
			Debug.Messagebox(StringUtil.Substring(presetName, 0, StringUtil.GetLength(presetName) - 5))
			while UI.IsMenuOpen("MessageBoxMenu")
			endwhile
			LoadPreset(presetName)
		elseif selectedOptionIndex >= firstPresetOptionIndex
			LoadPreset(JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")[selectedOptionIndex - firstPresetOptionIndex])
		endif
		FadeOutBeforeGameStart(false)
		PrepareForStart()
		CompleteSkyrimUnbound()
	endif
	
endFunction

function ShowPreviewModeMenu()

	int selectedOptionIndex = SkyrimUnboundPreviewModeMessage.Show()
	if selectedOptionIndex == 0 ; Start the Game
		FadeOutBeforeGameStart(true)
		CompleteSkyrimUnbound()
	elseif selectedOptionIndex == 1 ; Swap Gear
		GivePlayerStuff()
	elseif selectedOptionIndex == 2 ; Edit Character
		OpenRaceMenu()
		ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnControlsEnabledAfterRaceMenu")) ; for backward compatibility
		ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnRaceMenuClosed"))
	endif

endFunction

function FadeOutBeforeGameStart(bool onlyFinalStepsAreLeft)
	if onlyFinalStepsAreLeft
		Game.FadeOutGame(true, true, 0.0, 8.0)
	else
		Game.FadeOutGame(true, true, 0.0, 20.0)
	endif
endFunction

function CompleteSkyrimUnbound()

	FixNotEquippedGear()
	SetStage(90)
	UnregisterForMenu("Journal Menu")
	UnregisterForAllKeys()
	Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = True, abLooking = True, abSneaking = True, abMenu = True, abJournalTabs = True)
	Game.SetInChargen(false, true, false)
	SetObjectiveDisplayed(50, false)
	SetObjectiveDisplayed(51, false)
	
	Race playerRace = PlayerRef.GetRace()
	if playerRace == ImperialRace || playerRace == ImperialRaceVampire
		PerksQuest.SetStage(20) ; USKP fix from MQ102 stage 5 (Fragment_81)
	endif

	int i = 0
	int numberOfModules = SkyrimUnboundModules.GetSize()
	while i < numberOfModules
		(SkyrimUnboundModules.GetAt(i) as SkyrimUnboundModule).BeforeTeleportation()
		i += 1
	endwhile

	Autosave()

	RegisterForModEvent("SkyrimUnbound_OnPlayerTeleported", "OnPlayerTeleported")
	Locations.TeleportPlayer(false)

	i = 0
	numberOfModules = SkyrimUnboundModules.GetSize()
	while i < numberOfModules
		(SkyrimUnboundModules.GetAt(i) as SkyrimUnboundModule).AfterTeleportation()
		i += 1
	endwhile
	
	EnableControlsAndStuff()
	SetStage(100)

	Autosave()
	
	ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnAdventureBegun"))

	;/
	MQ101 must be advanced to stage 70+ only after USSEP_VersionTrackingScript is done, because they skip retroactive fixes only if MQ101.GetStage() < 70.
	Not skipping USSEP retroactive fixes may cause bugs, such as mods unable to change Heimskr outfit because of USKPRetroactive203Script.
	On my setup these scripts run pretty fast but i added waiting just in case.
	We can only wait for USLEEPVersionTracking, because USSEPVersionTracking never stops.
	And we can't do the same for USLEEP.esp because none of the quests in it ever stop.
	/;
	if Game.GetModByName("Unofficial Skyrim Special Edition Patch.esp") != 255
		Quest USLEEPVersionTracking = Game.GetFormFromFile(0xF458, "Unofficial Skyrim Special Edition Patch.esp") as Quest
		if USLEEPVersionTracking && USLEEPVersionTracking.IsRunning()
			int timesWaited = 0
			while USLEEPVersionTracking.IsRunning() && timesWaited < 6
				Utility.WaitMenuMode(10.0)
				timesWaited += 1
			endwhile
			Utility.WaitMenuMode(20.0)
		endif
	endif
 	MQ101.SetStage(1)
 	MQ101.CompleteQuest()
 	MQ103.SetStage(1)
	CheckIntegrityOnStartup()
	MQ101.Stop()
	
endFunction

Event OnPlayerTeleported()
	UnregisterForModEvent("SkyrimUnbound_OnPlayerTeleported")
	Utility.Wait(1.0)
	SetObjectiveDisplayed(100)
	SetObjectiveDisplayed(100, false)
	SetActive(false) ; without it the quest will stay active and the vanilla behavior when a new quest gets set as active if there are no active quests won't work
endEvent

string function GetPlayerRaceString()
	Race playerRace = PlayerRef.GetRace()
	if playerRace == ArgonianRace || playerRace == ArgonianRaceVampire || PlayerRef.HasKeywordString("ActorProxyArgonian") ; the keywords are from RaceCompatibility
		return "Argonian"
	elseif playerRace == BretonRace || playerRace == BretonRaceVampire || PlayerRef.HasKeywordString("ActorProxyBreton")
		return "Breton"
	elseif playerRace == DarkElfRace || playerRace == DarkElfRaceVampire || PlayerRef.HasKeywordString("ActorProxyDarkElf")
		return "Dark Elf"
	elseif playerRace == HighElfRace || playerRace == HighElfRaceVampire || PlayerRef.HasKeywordString("ActorProxyHighElf")
		return "High Elf"
	elseif playerRace == ImperialRace || playerRace == ImperialRaceVampire || PlayerRef.HasKeywordString("ActorProxyImperial")
		return "Imperial"
	elseif playerRace == KhajiitRace || playerRace == KhajiitRaceVampire || PlayerRef.HasKeywordString("ActorProxyKhajiit")
		return "Khajiit"
	elseif playerRace == NordRace || playerRace == NordRaceVampire || PlayerRef.HasKeywordString("ActorProxyNord")
		return "Nord"
	elseif playerRace == OrcRace || playerRace == OrcRaceVampire || PlayerRef.HasKeywordString("ActorProxyOrc")
		return "Orc"
	elseif playerRace == RedguardRace || playerRace == RedguardRaceVampire || PlayerRef.HasKeywordString("ActorProxyRedguard")
		return "Redguard"
	elseif playerRace == WoodElfRace || playerRace == WoodElfRaceVampire || PlayerRef.HasKeywordString("ActorProxyWoodElf")
		return "Wood Elf"
	else
		return ""
	endif
endFunction

function SavePreset(string presetName)

	string fileName = "../SkyrimUnbound/Presets/" + presetName
	UpdatePreset(fileName, false)
	JsonUtil.SetIntValue(fileName, "SavedOnVersion", ModVersion)

	int i = 0
	int numberOfModules = SkyrimUnboundModules.GetSize()
	while i < numberOfModules
		(SkyrimUnboundModules.GetAt(i) as SkyrimUnboundModule).SavePreset(fileName)
		i += 1
	endwhile

	JsonUtil.SetIntValue(fileName, "WhiterunThanePrerequisite", WhiterunThanePrerequisite.GetValueInt())

	JsonUtil.Unload(fileName, true)

endFunction

bool function LoadPreset(string presetName) ; returns false if there is any missing content, otherwise true

	string fileName = "../SkyrimUnbound/Presets/" + presetName
	UpdatePreset(fileName, true)

	bool missingContent = false
	int i = 0
	int numberOfModules = SkyrimUnboundModules.GetSize()
	while i < numberOfModules
		if !(SkyrimUnboundModules.GetAt(i) as SkyrimUnboundModule).LoadPreset(fileName)
			missingContent = true
		endif
		i += 1
	endwhile

	WhiterunThanePrerequisite.SetValue(JsonUtil.GetIntValue(fileName, "WhiterunThanePrerequisite"))

	JsonUtil.Unload(fileName, false)
	return !missingContent

endFunction

function UpdatePreset(string fileName, bool isLoadingPreset)
	
	int savedOnVersion = JsonUtil.GetIntValue(filename, "SavedOnVersion")

	if savedOnVersion < ModVersion

		if savedOnVersion < 20110
			if savedOnVersion < 20104
				if savedOnVersion < 20100
					if savedOnVersion < 11202
						if savedOnVersion < 11100
							if savedOnVersion < 1902
								if savedOnVersion < 1900
									if savedOnVersion < 1800
										if savedOnVersion < 1700
											if savedOnVersion < 1600
												if isLoadingPreset
													JsonUtil.SetIntValue(filename, "EntryLevelEquipment", JsonUtil.GetIntValue(filename, "OnlyLowLevelArmor"))
													JsonUtil.SetIntValue(filename, "WeaponSet", 0)
													if JsonUtil.GetIntValue(filename, "ArmorType") == 2 ;light armor
														int OutfitChoice = JsonUtil.GetIntValue(filename, "Outfit")
														if OutfitChoice == 10 ;hunter armor
															JsonUtil.SetIntValue(filename, "Outfit", 1)
														elseif OutfitChoice > 0
															JsonUtil.SetIntValue(filename, "Outfit", OutfitChoice + 1)
														endif
													endif
												endif
												JsonUtil.UnsetIntValue(filename, "OnlyLowLevelArmor")
												JsonUtil.UnsetIntValue(filename, "UnequipHeadwear")
												JsonUtil.UnsetIntValue(filename, "EquipGearInitially")
												JsonUtil.UnsetIntValue(filename, "CivilWarArmorChance")
												JsonUtil.UnsetIntValue(filename, "ForceArmorSet")
											endif
											int StartLocation1 = JsonUtil.GetIntValue(filename, "StartLocation1")
											FormList LocTypeList = JsonUtil.GetFormValue(filename, "LocTypeList") as FormList
											if StartLocation1 > 0 && !LocTypeList
												if (StartLocation1 == 1)
													LocTypeList = Locations.Markers_Cities
												elseif (StartLocation1 == 2)
													LocTypeList = Locations.Markers_Towns
												elseif (StartLocation1 == 3)
													LocTypeList = Locations.Markers_Inns
												elseif (StartLocation1 == 4)
													LocTypeList = Locations.HoldLists
												elseif (StartLocation1 == 5)
													LocTypeList = Locations.Markers_Wilderness
												elseif (StartLocation1 == 6)
													LocTypeList = Locations.Markers_Borders
												elseif (StartLocation1 == 10)
													LocTypeList = Locations.Markers_Docks
												elseif (StartLocation1 == 7)
													LocTypeList = Locations.Markers_Temples
												elseif (StartLocation1 == 99)
													LocTypeList = Locations.Markers_Other
												endif
												JsonUtil.SetFormValue(filename, "LocTypeList", LocTypeList)
											endif
											int StartLocation2 = JsonUtil.GetIntValue(filename, "StartLocation2")
											Form ListItem = JsonUtil.GetFormValue(filename, "ListItem")
											JsonUtil.UnsetFormValue(filename, "ListItem")
											if ListItem
												JsonUtil.SetFormValue(filename, "LocationForm", ListItem)
											elseif StartLocation2 > 0 && LocTypeList && StartLocation2 <= LocTypeList.GetSize()
												JsonUtil.SetFormValue(filename, "LocationForm", LocTypeList.GetAt(StartLocation2 - 1))
											endif
										endif
										if isLoadingPreset
											int ArmorType = JsonUtil.GetIntValue(filename, "ArmorType")
											int OutfitChoice = JsonUtil.GetIntValue(filename, "Outfit")
											if ArmorType == 2 ;light armor
												if OutfitChoice >= 6
													JsonUtil.SetIntValue(filename, "Outfit", OutfitChoice + 1)
												endif
											elseif ArmorType == 3 ;heavy armor
												if OutfitChoice >= 4
													JsonUtil.SetIntValue(filename, "Outfit", OutfitChoice + 1)
												endif
											endif
										endif		
									endif
									if isLoadingPreset
										int ArmorType = JsonUtil.GetIntValue(filename, "ArmorType")
										int OutfitChoice = JsonUtil.GetIntValue(filename, "Outfit")
										if OutfitChoice && ArmorType == 2 ;light armor
											if OutfitChoice == 10
												OutfitChoice = 0
											elseif OutfitChoice > 10
												OutfitChoice -= 1
											endif
										endif
										if OutfitChoice
											Form ArmorSet
											if ArmorType == 1
												ArmorSet = Inventory.ArmorsClothes.GetAt(OutfitChoice - 1)
											elseif ArmorType == 2
												ArmorSet = Inventory.ArmorsLight.GetAt(OutfitChoice - 1)
											elseif ArmorType == 3
												ArmorSet = Inventory.ArmorsHeavy.GetAt(OutfitChoice - 1)
											endif
											JsonUtil.SetFormValue(filename, "ArmorSet", ArmorSet)
										endif
										int OneHandedChoice = JsonUtil.GetIntValue(filename, "OneHandedChoice")
										if OneHandedChoice
											JsonUtil.SetFormValue(filename, "OneHandedTypeList", Inventory.WeaponTypes1H.GetAt(OneHandedChoice - 2))
										endif
										int TwoHandedChoice = JsonUtil.GetIntValue(filename, "TwoHandedChoice")
										if TwoHandedChoice
											JsonUtil.SetFormValue(filename, "TwoHandedTypeList", Inventory.WeaponTypes2H.GetAt(TwoHandedChoice - 1))
										endif
										int RangedChoice = JsonUtil.GetIntValue(filename, "RangedChoice")
										if RangedChoice
											JsonUtil.SetFormValue(filename, "RangedTypeList", Inventory.WeaponTypesRanged.GetAt(0))
										endif
										JsonUtil.SetIntValue(filename, "StaffSchool", (JsonUtil.GetIntValue(filename, "ToggleStaff") as bool) as int)
										int WeaponMaterial = JsonUtil.GetIntValue(filename, "WeaponMaterial")
										if WeaponMaterial
											JsonUtil.SetFormValue(filename, "WeaponSetList", Inventory.WeaponSets.GetAt(WeaponMaterial - 1))
										endif
										JsonUtil.SetIntValue(filename, "OnlyEntryLevelArmors", JsonUtil.GetIntValue(filename, "EntryLevelEquipment"))
										JsonUtil.SetIntValue(filename, "Lantern", JsonUtil.GetIntValue(filename, "ReplaceTheTorchWithALantern"))
									endif
									JsonUtil.UnsetIntValue(filename, "Outfit")
									JsonUtil.UnsetFormValue(filename, "OutfitList")
									JsonUtil.UnsetIntValue(filename, "OneHandedChoice")
									JsonUtil.UnsetIntValue(filename, "TwoHandedChoice")
									JsonUtil.UnsetIntValue(filename, "BowChoice")
									JsonUtil.UnsetIntValue(filename, "StaffChoice")
									JsonUtil.UnsetIntValue(filename, "WeaponMaterial")
									JsonUtil.UnsetIntValue(filename, "EntryLevelEquipment")
									JsonUtil.UnsetIntValue(filename, "AlchemistsJournal")
									JsonUtil.UnsetIntValue(filename, "ReplaceTheTorchWithALantern")
								endif
								JsonUtil.UnsetIntValue(filename, "AddonItemsDisabled")
							endif
							JsonUtil.UnsetIntValue(filename, "AggressiveEnemySoliders")
						endif
						if isLoadingPreset
							if JsonUtil.GetIntValue(filename, "LocalInhabitant") == 2
								JsonUtil.SetIntValue(filename, "LocalInhabitant", 3)
							endif
						endif
					endif
					if isLoadingPreset
						int dragonborn = JsonUtil.GetIntValue(fileName, "DragonSouls")
						if dragonborn == 2 && JsonUtil.GetIntValue(fileName, "NonDragonbornShouts")
							dragonborn = 3
						endif
						JsonUtil.SetIntValue(fileName, "Dragonborn", dragonborn)
						JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.Markers_Cities)
						JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.Markers_Towns)
						JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.Markers_Inns)
						if JsonUtil.GetIntValue(fileName, "JailChance")
							JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.HoldLists)
						endif
						if JsonUtil.GetIntValue(fileName, "WildernessChance")
							JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.Markers_Wilderness)
						endif
						if JsonUtil.GetIntValue(fileName, "BorderDocksChance")
							JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.Markers_Borders)
							JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.Markers_Docks)
						endif
						if JsonUtil.GetIntValue(fileName, "Bounty") == 0
							JsonUtil.SetIntValue(fileName, "Bounty", -1)
						endif
					endif
					JsonUtil.UnsetIntValue(filename, "DragonSouls")
					JsonUtil.UnsetIntValue(filename, "NonDragonbornShouts")
					JsonUtil.UnsetIntValue(filename, "JailChance")
					JsonUtil.UnsetIntValue(filename, "WildernessChance")
					JsonUtil.UnsetIntValue(filename, "BorderDocksChance")
				endif
				if isLoadingPreset
					if JsonUtil.GetFormValue(fileName, "LocTypeList") == Locations.HoldLists
						JsonUtil.SetFormValue(fileName, "LocTypeList", Locations.HoldsWithJail)
					endif
					if JsonUtil.FormListCount(fileName, "LocTypeLists") && JsonUtil.FormListHas(fileName, "LocTypeLists", Locations.HoldLists)
						JsonUtil.FormListRemove(fileName, "LocTypeLists", Locations.HoldLists, true)
						JsonUtil.FormListAdd(fileName, "LocTypeLists", Locations.HoldsWithJail, false)
					endif
				endif
			endif
			if isLoadingPreset
				if JsonUtil.GetIntValue(fileName, "ToggleRandomWeapon")
					JsonUtil.SetIntValue(fileName, "OneHanded", 0)
					JsonUtil.SetIntValue(fileName, "OneHandedCombo", 0)
					JsonUtil.SetIntValue(fileName, "TwoHanded", 0)
					JsonUtil.SetIntValue(fileName, "Ranged", 0)
					JsonUtil.SetIntValue(fileName, "StaffSchool", 0)
					JsonUtil.UnsetFormValue(fileName, "OneHandedTypeList")
					JsonUtil.UnsetFormValue(fileName, "TwoHandedTypeList")
					JsonUtil.UnsetFormValue(fileName, "RangedTypeList")
					JsonUtil.UnsetFormValue(fileName, "StaffForm")
				else
					if JsonUtil.GetIntValue(fileName, "ToggleOneHanded")
						if JsonUtil.HasFormValue(fileName, "OneHandedTypeList")
							JsonUtil.UnsetIntValue(fileName, "OneHanded")
						else
							JsonUtil.SetIntValue(fileName, "OneHanded", JsonUtil.GetIntValue(fileName, "OneHanded") + 1)
						endif
					else
						JsonUtil.SetIntValue(fileName, "OneHanded", 0)
						JsonUtil.SetIntValue(fileName, "OneHandedCombo", 0)
						JsonUtil.UnsetFormValue(fileName, "OneHandedTypeList")
					endif
					if JsonUtil.GetIntValue(fileName, "ToggleTwoHanded")
						if !JsonUtil.HasFormValue(fileName, "TwoHandedTypeList")
							JsonUtil.SetIntValue(fileName, "TwoHanded", 1)
						endif
					else
						JsonUtil.SetIntValue(fileName, "TwoHanded", 0)
						JsonUtil.UnsetFormValue(fileName, "TwoHandedTypeList")
					endif
					if JsonUtil.GetIntValue(fileName, "ToggleRanged")
						if !JsonUtil.HasFormValue(fileName, "RangedTypeList")
							JsonUtil.SetIntValue(fileName, "Ranged", 1)
						endif
					else
						JsonUtil.SetIntValue(fileName, "Ranged", 0)
						JsonUtil.UnsetFormValue(fileName, "RangedTypeList")
					endif
					if JsonUtil.GetIntValue(fileName, "ToggleStaff")
						JsonUtil.SetIntValue(fileName, "StaffSchool", JsonUtil.GetIntValue(fileName, "StaffSchool") + 1)
					else
						JsonUtil.SetIntValue(fileName, "StaffSchool", 0)
						JsonUtil.UnsetFormValue(fileName, "StaffForm")
					endif
				endif
				JsonUtil.SetIntValue(fileName, "TimeOfDay", JsonUtil.GetIntValue(fileName, "GameTime"))
				JsonUtil.SetIntValue(fileName, "Season", JsonUtil.GetIntValue(fileName, "GameSeason"))
				JsonUtil.SetIntValue(fileName, "Month", JsonUtil.GetIntValue(fileName, "GameMonth"))
			endif
			JsonUtil.UnsetIntValue(fileName, "ToggleOneHanded")
			JsonUtil.UnsetIntValue(fileName, "ToggleTwoHanded")
			JsonUtil.UnsetIntValue(fileName, "ToggleRanged")
			JsonUtil.UnsetIntValue(fileName, "ToggleStaff")
			JsonUtil.UnsetIntValue(fileName, "GameTime")
			JsonUtil.UnsetIntValue(fileName, "GameSeason")
			JsonUtil.UnsetIntValue(fileName, "GameMonth")
		endif

		JsonUtil.SetIntValue(filename, "SavedOnVersion", ModVersion)
		JsonUtil.Save(filename)
	endif

endFunction
