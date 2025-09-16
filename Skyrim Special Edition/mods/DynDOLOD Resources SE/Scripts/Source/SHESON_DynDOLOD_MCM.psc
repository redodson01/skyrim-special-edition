Scriptname SHESON_DynDOLOD_MCM extends SKI_ConfigBase

ObjectReference MyMaster = None
ObjectReference CurrentRef = None
ObjectReference MyCurrentFirstborn = None
ObjectReference MyActiveFirstborn = None
String MyWorld = "None"
String MyImportFileName = "None"
Int MyFirstbornList = 0
Int MyMinionList = 0
Int MyActiveID
Int MyLargeRefID
String MyFormID
Int flags
Int MyCurrent = 0
Int Index = 0
Int FadeInTime_S
Int NearMultiple_S
Int FarMultiple_S
Int NeverMultiple_S
Int fSkyCellRefFadeDistance_S
Int fBlockLevel0Distance_S
Int fBlockLevel1Distance_S
Int fBlockMaximumDistance_S
Int fSplitDistanceMult_S
Int fTreeLoadDistance_S
Int NiOverrideID

Bool MyActiveValue = TRUE
Bool NiOverrideValue = FALSE

Int Function GetVersion()
	return 147
EndFunction

Event OnConfigInit()
	Pages = new String[3]
	Pages[0] = "Main"
	Pages[1] = "You Are Here"
	Pages[2] = "Settings"
endEvent

Event OnVersionUpdate(int NewVersion)
	if NewVersion >= 147 && CurrentVersion < 147
		Pages = new String[4]
		Pages[0] = "Main"
		Pages[1] = "You Are Here"
		Pages[2] = "Settings"
		Pages[3] = "Information"
	endIf
endEvent

event OnGameReload()
	Utility.Wait(1)
	parent.OnGameReload()
endEvent

Int Function PositionToCell(Float pos)
	Int num1 = (Pos / 4096) As Int
	If pos < 0
		num1 -= 1
	endIf
	return num1
EndFunction

Int Function PositionToSubBlock(Float pos)
	Int num1 = PositionToCell(pos) / 8
	If pos < 0 && PositionToCell(pos) % 8 != 0
		num1 -= 1
	endIf
	return num1
EndFunction

Int Function PositionToBlock(Float pos)
	Int num1 = PositionToSubBlock(pos) / 4
	if pos < 0 && PositionToSubBlock(pos) % 4 != 0
		num1 -= 1
	endIf
	return num1
EndFunction

Int Function CellQuad(Float pos, Int Level, Int Origin)
	Float offset = pos - ((Origin % 4) * 4096)
	Int num1 = (offset / (Level * 16384)) As Int
	if offset < 0
		num1 -= 1
	endIf
	return num1 * Level * 4 + Origin % 4
EndFunction

String function IntToHex (int dec)
	String hex = ""
	int rest = dec
	while (rest > 0)
		int m16 = rest % 16
		rest = rest / 16
		String temp = ""
		if m16 == 1
			temp = "1"
		elseif m16 == 2
			temp = "2"
		elseif m16 == 3
			temp = "3"
		elseif m16 == 4
			temp = "4"
		elseif m16 == 5
			temp = "5"
		elseif m16 == 6
			temp = "6"
		elseif m16 == 7
			temp = "7"
		elseif m16 == 8
			temp = "8"
		elseif m16 == 9
			temp = "9"
		elseif m16 == 10
			temp = "A"
		elseif m16 == 11
			temp = "B"
		elseif m16 == 12
			temp = "C"
		elseif m16 == 13
			temp = "D"
		elseif m16 == 14
			temp = "E"
		elseif m16 == 15
			temp = "F"
		else
			temp = "0"
		endif
		hex = temp + hex
	endWhile
	return hex
endFunction

String Function PluginVersion(String plugin)
	if StringUtil.Find(Game.GetModDescription(Game.GetModByName(plugin)), "Version ") != -1
		return StringUtil.SubString(Game.GetModDescription(Game.GetModByName(plugin)), StringUtil.Find(Game.GetModDescription(Game.GetModByName(plugin)), "Version ") + 8, 0)
	else
		return (Game.GetFormFromFile(0x00000912, plugin) As Keyword).GetString()
	endIf
endFunction

event OnOptionSliderOpen(int option)
	if option == FadeInTime_S
		SetSliderDialogStartValue(Utility.GetINIfloat("fminsecondsforloadfadein:Interface"))
		SetSliderDialogDefaultValue(JsonUtil.GetFloatValue("DynDOLOD_Worlds", "fminsecondsforloadfadein", 2.66))
		SetSliderDialogRange(0.0, 5.0)
		SetSliderDialogInterval(0.01)
	elseIf option == NeverMultiple_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "DynDOLOD_NeverMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NeverMultiple", 1.75)))
		SetSliderDialogDefaultValue(JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NeverMultiple", 1.75))
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	elseIf option == NearMultiple_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "DynDOLOD_NearMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NearMultiple", 1.25)))
		SetSliderDialogDefaultValue(JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NearMultiple", 1.25))
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	elseIf option == FarMultiple_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "DynDOLOD_FarMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "FarMultiple", 1.5)))
		SetSliderDialogDefaultValue(JsonUtil.GetFloatValue("DynDOLOD_Worlds", "FarMultiple", 1.5))
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	elseIf option == fSkyCellRefFadeDistance_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "fskycellreffadedistance", Utility.GetINIfloat("fskycellreffadedistance")))
		SetSliderDialogDefaultValue(Utility.GetINIfloat("fSkyCellRefFadeDistance"))
		SetSliderDialogRange(0.0, 500000.0)
		SetSliderDialogInterval(1)
	elseIf option == fBlockLevel0Distance_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "fblocklevel0distance", Utility.GetINIfloat("fBlockLevel0Distance:TerrainManager")))
		SetSliderDialogDefaultValue(Utility.GetINIfloat("fBlockLevel0Distance:TerrainManager"))
		SetSliderDialogRange(0.0, 500000.0)
		SetSliderDialogInterval(1)
	elseIf option == fBlockLevel1Distance_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "fblocklevel1distance", Utility.GetINIfloat("fBlockLevel1Distance:TerrainManager")))
		SetSliderDialogDefaultValue(Utility.GetINIfloat("fBlockLevel1Distance:TerrainManager"))
		SetSliderDialogRange(0.0, 500000.0)
		SetSliderDialogInterval(1)
	elseIf option == fBlockMaximumDistance_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "fblockmaximumdistance", Utility.GetINIfloat("fBlockMaximumDistance:TerrainManager")))
		SetSliderDialogDefaultValue(Utility.GetINIfloat("fBlockMaximumDistance:TerrainManager"))
		SetSliderDialogRange(0.0, 500000.0)
		SetSliderDialogInterval(1)
	elseIf option == fTreeLoadDistance_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "ftreeloaddistance", Utility.GetINIfloat("fTreeLoadDistance:TerrainManager")))
		SetSliderDialogDefaultValue(Utility.GetINIfloat("fTreeLoadDistance:TerrainManager"))
		SetSliderDialogRange(0.0, 500000.0)
		SetSliderDialogInterval(1)
	elseIf option == fSplitDistanceMult_S
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none, "fsplitdistancemult", Utility.GetINIfloat("fSplitDistanceMult:TerrainManager")))
		SetSliderDialogDefaultValue(Utility.GetINIfloat("fSplitDistanceMult:TerrainManager"))
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	endIf
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == FadeInTime_S
		StorageUtil.SetFloatValue(none, "DynDOLOD_FadeTime", value)
		Utility.SetINIfloat("fminsecondsforloadfadein:Interface", value)
		SetSliderOptionValue(FadeInTime_S, Utility.GetINIfloat("fminsecondsforloadfadein:Interface"), "{2} seconds")
	elseIf option == NeverMultiple_S
		StorageUtil.SetFloatValue(none, "DynDOLOD_NeverMultiple", value)
		SetSliderOptionValue(NeverMultiple_S, StorageUtil.GetFloatValue(none, "DynDOLOD_NeverMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NeverMultiple", 1.75)), "{2}")
	elseIf option == FarMultiple_S
		StorageUtil.SetFloatValue(none, "DynDOLOD_FarMultiple", value)
		SetSliderOptionValue(FarMultiple_S, StorageUtil.GetFloatValue(none, "DynDOLOD_FarMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "FarMultiple", 1.5)), "{2}")
	elseIf option == NearMultiple_S
		StorageUtil.SetFloatValue(none, "DynDOLOD_NearMultiple", value)
		SetSliderOptionValue(NearMultiple_S, StorageUtil.GetFloatValue(none, "DynDOLOD_NearMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NearMultiple", 1.25)), "{2}")
	elseIf option == fSkyCellRefFadeDistance_S
		StorageUtil.SetFloatValue(none, "fskycellreffadedistance", value)
		Utility.SetINIfloat("fSkyCellRefFadeDistance", value)
		SetSliderOptionValue(fSkyCellRefFadeDistance_S, Utility.GetINIfloat("fSkyCellRefFadeDistance"), "{4}")
	elseIf option == fBlockLevel0Distance_S
		StorageUtil.SetFloatValue(none, "fblocklevel0distance", value)
		Utility.SetINIfloat("fBlockLevel0Distance:TerrainManager", value)
		SetSliderOptionValue(fBlockLevel0Distance_S, Utility.GetINIfloat("fBlockLevel0Distance:TerrainManager"), "{4}")
	elseIf option == fBlockLevel1Distance_S
		StorageUtil.SetFloatValue(none, "fblocklevel1distance", value)
		Utility.SetINIfloat("fBlockLevel1Distance:TerrainManager", value)
		SetSliderOptionValue(fBlockLevel1Distance_S, Utility.GetINIfloat("fBlockLevel1Distance:TerrainManager"), "{4}")
	elseIf option == fBlockMaximumDistance_S
		StorageUtil.SetFloatValue(none, "fblockmaximumdistance", value)
		Utility.SetINIfloat("fBlockMaximumDistance:TerrainManager", value)
		SetSliderOptionValue(fBlockMaximumDistance_S, Utility.GetINIfloat("fBlockMaximumDistance:TerrainManager"), "{4}")
	elseIf option == fSplitDistanceMult_S
		StorageUtil.SetFloatValue(none, "fsplitdistancemult", value)
		Utility.SetINIfloat("fSplitDistanceMult:TerrainManager", value)
		SetSliderOptionValue(fSplitDistanceMult_S, Utility.GetINIfloat("fSplitDistanceMult:TerrainManager"), "{4}")
	elseIf option == fTreeLoadDistance_S
		StorageUtil.SetFloatValue(none, "ftreeloaddistance", value)
		Utility.SetINIfloat("fTreeLoadDistance:TerrainManager", value)
		SetSliderOptionValue(fTreeLoadDistance_S, Utility.GetINIfloat("fTreeLoadDistance:TerrainManager"), "{4}")
	endIf
endEvent

Event OnPageReset(String Page)
	if SKSE.GetScriptVersionRelease() >= 53
		if PapyrusUtil.GetVersion() >= 33
			MyWorld = (Game.GetForm(0x00000014) As Actor).GetWorldspace() As String
			if MyWorld != "None"
				MyWorld = StringUtil.SubString(MyWorld, 13, StringUtil.Find(MyWorld, "(") - 14)
			endIf
			MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
			if MyImportFileName != "DynDOLOD_None"
				MyMaster = Game.GetFormFromFile(JsonUtil.IntListGet(MyImportFileName, "master", 0), "DynDOLOD.esp") As ObjectReference
				MyCurrentFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyCurrentFirstborn", None) As ObjectReference
				MyActiveFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", None) As ObjectReference
			else
				MyMaster = None
				MyCurrentFirstborn = None
				MyActiveFirstborn = None
			endIf
			SetCursorFillMode(LEFT_TO_RIGHT)
			if Page == ""
				LoadCustomContent("DynDOLOD\\DynDOLOD.dds", 120, 159)
			elseIf Page == "Information"
				UnloadCustomContent()
				SetCursorPosition(0)
				AddHeaderOption("Grid Diameters")
				SetCursorPosition(2)
				AddTextOption("Grid: " + (JsonUtil.GetFloatValue("DynDOLOD_Worlds", "uGrid", 22528)) * 2, "")
				SetCursorPosition(4)
				AddTextOption("Large Grid: " + (JsonUtil.GetFloatValue("DynDOLOD_Worlds", "uLargeGrid", 22528)) * 2, "")
				SetCursorPosition(6)
				AddTextOption("Near Grid: " + (JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NearGrid", 22528)) * 2, "")
				SetCursorPosition(8)
				AddTextOption("Far Grid: " + (JsonUtil.GetFloatValue("DynDOLOD_Worlds", "FarGrid", 22528)) * 2, "")
				SetCursorPosition(12)
				AddHeaderOption("Current Activator")
				SetCursorPosition(14)
				if MyCurrentFirstborn
					AddTextOption(IntToHex(MyCurrentFirstborn.GetFormID()), "")
				endIf
				SetCursorPosition(16)
				AddHeaderOption("Active Activator")
				SetCursorPosition(18)
				if MyActiveFirstborn
					AddTextOption(IntToHex(MyActiveFirstborn.GetFormID()), "")
				endIf
				SetCursorPosition(22)
				AddTextOption("Activator Trigger Count: " + StorageUtil.GetIntValue(None, "DynDOLOD_CellTriggerCount", 0), "")
				SetCursorPosition(1)
				AddHeaderOption("DynDOLOD Plugins")
				SetCursorPosition(3)
				if JsonUtil.GetStringValue("DynDOLOD_Worlds", "plugin", "DynDOLOD.esp") == "DynDOLOD.esm"
					AddTextOption("ESM Version: " + PluginVersion("DynDOLOD.esm") + ", ESP Version: " + PluginVersion("DynDOLOD.esp"), "")
					SetCursorPosition(5)
					AddTextOption("ESM: " + (Game.GetFormFromFile(0x00000910, "DynDOLOD.esm") As Keyword).GetString(), "")
					SetCursorPosition(7)
					AddTextOption("ESP: " + (Game.GetFormFromFile(0x00000910, "DynDOLOD.esp") As Keyword).GetString(), "")
				else
					AddTextOption("ESP Version: " + PluginVersion("DynDOLOD.esp"), "")
					SetCursorPosition(5)
					AddTextOption("ESP: " + (Game.GetFormFromFile(0x00000910, "DynDOLOD.esp") As Keyword).GetString(), "")
				endIf
				SetCursorPosition(9)
				AddHeaderOption("DynDOLOD_Worlds.json")
				SetCursorPosition(11)
				AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", "bunchofnumbers", "N/A"), "")
				if MyImportFileName != "DynDOLOD_None"
					SetCursorPosition(13)
					AddHeaderOption(MyImportFileName + ".json")
					SetCursorPosition(15)
					AddTextOption(JsonUtil.GetStringValue(MyImportFileName, "bunchofnumbers", "N/A"), "")
					SetCursorPosition(17)
					AddHeaderOption(MyImportFileName + "_Objects.json")
					SetCursorPosition(19)
					AddTextOption(JsonUtil.GetStringValue(MyImportFileName + "_Objects", "bunchofnumbers", "N/A"), "")
				endIf
				SetCursorPosition(23)
				AddTextOption("Cell Attach Count: " + StorageUtil.GetIntValue(None, "DynDOLOD_UniqueCellAttachCount", 0) + " unique / " + StorageUtil.GetIntValue(None, "DynDOLOD_GlobalCellAttachCount", 0) + " total", "")
			elseIf Page == "Settings"
				UnloadCustomContent()
				SetCursorPosition(0)
				AddHeaderOption("Time for fade-in from black")
				SetCursorPosition(2)
				FadeInTime_S = AddSliderOption("fMinSecondsForLoadFadeIn", Utility.GetINIfloat("fminsecondsforloadfadein:Interface"), "{2} seconds")
				SetCursorPosition(6)
				AddHeaderOption("Neverfade Maximum")
				SetCursorPosition(8)
				fSkyCellRefFadeDistance_S = AddSliderOption("fSkyCellRefFadeDistance", StorageUtil.GetFloatValue(none, "fskycellreffadedistance", Utility.GetINIfloat("fSkyCellRefFadeDistance")), "{4}")
				SetCursorPosition(12)
				AddHeaderOption("Window Glow Multipliers")
				SetCursorPosition(14)
				if SKSE.GetPluginVersion("skee") >= 1 && NiOverride.GetScriptVersion() >= 6
					NiOverrideID = AddToggleOption("Use Racemenu NiOverride", NiOverrideValue, OPTION_FLAG_None)
					SetCursorPosition(16)
					NearMultiple_S = AddSliderOption("Near Grid Multiple", StorageUtil.GetFloatValue(none, "DynDOLOD_NearMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NearMultiple", 1.25)), "{2}")
					SetCursorPosition(18)
					FarMultiple_S = AddSliderOption("Far Grid Multiple", StorageUtil.GetFloatValue(none, "DynDOLOD_FarMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "FarMultiple", 1.5)), "{2}")
					SetCursorPosition(20)
					NeverMultiple_S = AddSliderOption("Neverfade Multiple", StorageUtil.GetFloatValue(none, "DynDOLOD_NeverMultiple", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "NeverMultiple", 1.75)), "{2}")
				else
					NiOverrideID = AddToggleOption("Use Racemenu NiOverride", NiOverrideValue, OPTION_FLAG_DISABLED)
					SetCursorPosition(16)
					AddTextOption("Racemenu NiOverride not installed", "")
				endIf

				SetCursorPosition(1)
				AddHeaderOption("Static Object LOD")
				SetCursorPosition(3)
				fBlockLevel0Distance_S = AddSliderOption("fBlockLevel0Distance", StorageUtil.GetFloatValue(none, "fblocklevel0distance", Utility.GetINIfloat("fBlockLevel0Distance:TerrainManager")), "{4}")
				SetCursorPosition(5)
				fBlockLevel1Distance_S = AddSliderOption("fBlockLevel1Distance", StorageUtil.GetFloatValue(none, "fblocklevel1distance", Utility.GetINIfloat("fBlockLevel1Distance:TerrainManager")), "{4}")
				SetCursorPosition(7)
				fBlockMaximumDistance_S = AddSliderOption("fBlockMaximumDistance", StorageUtil.GetFloatValue(none, "fblockmaximumdistance", Utility.GetINIfloat("fBlockMaximumDistance:TerrainManager")), "{4}")
				SetCursorPosition(11)
				AddHeaderOption("Terrain LOD Multiplier")
				SetCursorPosition(13)
				fSplitDistanceMult_S = AddSliderOption("fSplitDistanceMult", StorageUtil.GetFloatValue(none, "fsplitdistancemult", Utility.GetINIfloat("fSplitDistanceMult:TerrainManager")), "{4}")
				SetCursorPosition(17)
				AddHeaderOption("Tree LOD")
				SetCursorPosition(19)
				fTreeLoadDistance_S = AddSliderOption("fTreeLoadDistance", StorageUtil.GetFloatValue(none, "ftreeloaddistance", Utility.GetINIfloat("fTreeLoadDistance:TerrainManager")), "{4}")

			elseIf Page == "You Are Here"
				UnloadCustomContent()
				Int x = 0
				Int y = 0
				if MyImportFileName != "DynDOLOD_None"
					x = JsonUtil.IntListGet(MyImportFileName, "x", 0)
					y = JsonUtil.IntListGet(MyImportFileName, "y", 0)
				endIf
				Float a = Game.GetPlayer().GetPositionX()
				Float b = Game.GetPlayer().GetPositionY()
				Int x4 = CellQuad(a, 1, x)
				Int x8 = CellQuad(a, 2, x)
				Int x16 = CellQuad(a, 4, x)
				Int x32 = CellQuad(a, 8, x)
				Int y4 = CellQuad(b, 1, y)
				Int y8 = CellQuad(b, 2, y)
				Int y16 = CellQuad(b, 4, y)
				Int y32 = CellQuad(b, 8, y)

				SetCursorPosition(0)
				AddHeaderOption("Player")
				SetCursorPosition(2)
				AddTextOption("X " + a + ", Y " + b, "")
				SetCursorPosition(4)
				AddTextOption("Z " + Game.GetPlayer().GetPositionZ(), "")
				SetCursorPosition(6)
				AddTextOption("Cell " + PositionToCell(a) + "," + PositionToCell(b) + "    Block " + PositionToBlock(a) + "," + PositionToBlock(b) + "    SubBlock " + PositionToSubBlock(a) + "," + PositionToSubBlock(b), "")

				if MyWorld != "" && MyWorld != "None"
					SetCursorPosition(10)
					AddHeaderOption("Meshes\\Terrain\\" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + "\\Objects")
					SetCursorPosition(12)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".4." + x4 + "." + y4 + ".bto", "")
					SetCursorPosition(14)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".8." + x8 + "." + y8 + ".bto", "")
					SetCursorPosition(16)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".16." + x16 + "." + y16 + ".bto", "")

					SetCursorPosition(20)
					AddHeaderOption("Meshes\\Terrain\\" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + "\\Trees")
					SetCursorPosition(22)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".4." + x4 + "." + y4 + ".btt", "")

					SetCursorPosition(1)
					AddHeaderOption("Meshes\\Terrain\\" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld))
					SetCursorPosition(3)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".4." + x4 + "." + y4 + ".btr", "")
					SetCursorPosition(5)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".8." + x8 + "." + y8 + ".btr", "")
					SetCursorPosition(7)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".16." + x16 + "." + y16 + ".btr", "")
					SetCursorPosition(9)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".32." + x32 + "." + y32 + ".btr", "")

					SetCursorPosition(13)
					AddHeaderOption("Textures\\Terrain\\" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld))
					SetCursorPosition(15)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".4." + x4 + "." + y4 + ".dds", "")
					SetCursorPosition(17)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".8." + x8 + "." + y8 + ".dds", "")
					SetCursorPosition(19)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".16." + x16 + "." + y16 + ".dds", "")
					SetCursorPosition(21)
					AddTextOption(JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".32." + x32 + "." + y32 + ".dds", "")
				endIf
			elseIf Page == "Main"
				UnloadCustomContent()
				if !MyCurrentFirstborn || StorageUtil.GetIntValue(None, "DynDOLOD_Active", 1) == 99
					flags = OPTION_FLAG_DISABLED
					SetCursorPosition(4)
					if StorageUtil.GetIntValue(None, "DynDOLOD_Active", 1) == 99
						AddTextOption("(Resetting like everything)", "")
					endIf
				else
					flags = OPTION_FLAG_None
				endIf
				if !MyActiveFirstborn
					MyActiveValue = FALSE
				else
					MyActiveValue = TRUE
				endIf
				SetCursorPosition(0)
				AddHeaderOption("Options")
				SetCursorPosition(2)
				MyActiveID = AddToggleOption("DynDOLOD is active", MyActiveValue, flags)
				if JsonUtil.GetStringValue("DynDOLOD_Worlds", "plugin", "DynDOLOD.esm") == "DynDOLOD.esm"
					SetCursorPosition(4)
					MyLargeRefID = AddToggleOption("Large References Fix", StorageUtil.GetIntValue(None, "DynDOLOD_LargeRefFix", JsonUtil.GetIntValue("DynDOLOD_Worlds", "largereffix", 0)) As Bool, OPTION_FLAG_None)
				else
					StorageUtil.SetIntValue(none, "DynDOLOD_LargeRefFix", -1)
				endIf

				String LastMessage = StorageUtil.GetStringValue(None, "DynDOLOD_Last_Message", "No data in DynDOLOD plugins for this location")
				SetCursorPosition(10)
				AddHeaderOption("Last Message")
				SetCursorPosition(12)
				AddTextOption(LastMessage, "")

				SetCursorPosition(16)
				AddHeaderOption("Important")
				SetCursorPosition(18)
				AddTextOption("While DynDOLOD can be turned off here,", "")
				SetCursorPosition(20)
				AddTextOption("it is imperative to be in an interior space", "")
				SetCursorPosition(22)
				AddTextOption("before updating DynDOLOD plugins", "")
				SetCursorPosition(1)
				AddHeaderOption("Updating DynDOLOD")
				SetCursorPosition(3)
				AddTextOption("Before updating deactivate old DynDOLOD here.", "")
				SetCursorPosition(5)
				AddTextOption("Close menu and wait for deactivated message.", "")
				SetCursorPosition(9)
			        AddTextOption("Go inside a house and check here", "")
				SetCursorPosition(11)
				AddTextOption("that old DynDOLOD is still not active.", "")
				SetCursorPosition(15)
				AddTextOption("Save.", "")
				SetCursorPosition(17)
				AddTextOption("Start without old DynDOLOD plugins, load last save.", "")
				SetCursorPosition(21)
				AddTextOption("Save again.", "")
				SetCursorPosition(23)
				AddTextOption("Start with new DynDOLOD plugins, load last save.", "")
				SetInfoText(LastMessage)
			endIf	
		else
			UnloadCustomContent()
			SetCursorPosition(0)
			AddHeaderOption("Requirements")
			SetCursorPosition(2)
			AddTextOption("PapyrusUtil is required", "")
		endIf	
	endIf	
endEvent

Event OnOptionHighlight(int Option)
	String LastMessage = StorageUtil.GetStringValue(None, "DynDOLOD_Last_Message", "No data in DynDOLOD plugins for this location")
	MyWorld = (Game.GetForm(0x00000014) As Actor).GetWorldspace() As String
	if MyWorld != "None"
		MyWorld = StringUtil.SubString(MyWorld, 13, StringUtil.Find(MyWorld, "(") - 14)
	endIf
	MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
	if MyImportFileName != "DynDOLOD_None"
		MyMaster = Game.GetFormFromFile(JsonUtil.IntListGet(MyImportFileName, "master", 0), "DynDOLOD.esp") As ObjectReference
		MyCurrentFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyCurrentFirstborn", None) As ObjectReference
		MyActiveFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", None) As ObjectReference
	else
		MyMaster = None
		MyCurrentFirstborn = None
		MyActiveFirstborn = None
	endIf
	if MyActiveFirstborn
		SetInfoText(LastMessage + "\nDynDOLOD active world " + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + ".")
	else
		SetInfoText(LastMessage + "\nNo data for this location")
	endIf
endEvent

Event OnOptionSelect(int Option)
	if Option == MyActiveID
		MyWorld = (Game.GetForm(0x00000014) As Actor).GetWorldspace() As String
		if MyWorld != "None"
			MyWorld = StringUtil.SubString(MyWorld, 13, StringUtil.Find(MyWorld, "(") - 14)
		endIf
		MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
		if MyImportFileName != "DynDOLOD_None"
			MyMaster = Game.GetFormFromFile(JsonUtil.IntListGet(MyImportFileName, "master", 0), "DynDOLOD.esp") As ObjectReference
			MyCurrentFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyCurrentFirstborn", None) As ObjectReference
			MyActiveFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", None) As ObjectReference
		else
			MyMaster = None
			MyCurrentFirstborn = None
			MyActiveFirstborn = None
		endIf
		if MyCurrentFirstborn
			MyActiveValue = !MyActiveValue
			SetToggleOptionValue(MyActiveID, MyActiveValue)
			SwitchDynDOLOD(MyActiveValue)
		endIf
	endIf
	if Option == MyLargeRefID
		if StorageUtil.GetIntValue(none, "DynDOLOD_LargeRefFix", JsonUtil.GetIntValue("DynDOLOD_Worlds", "largereffix", 0)) == 1
			StorageUtil.SetIntValue(none, "DynDOLOD_LargeRefFix", 0)
		else
			StorageUtil.SetIntValue(none, "DynDOLOD_LargeRefFix", 1)
		endIf
		SetToggleOptionValue(MyLargeRefID, StorageUtil.GetIntValue(none, "DynDOLOD_LargeRefFix", JsonUtil.GetIntValue("DynDOLOD_Worlds", "largereffix", 0)) As Bool)
	endIf
	if Option == NiOverrideID
		NiOverrideValue = !NiOverrideValue
		SetToggleOptionValue(NiOverrideID, NiOverrideValue)
		if NiOverrideValue
			StorageUtil.SetIntValue(none, "DynDOLOD_UseNiOverride", 1)
		else
			StorageUtil.UnsetIntValue(none, "DynDOLOD_UseNiOverride")
		endIf
	endIf
endEvent

Function SwitchDynDOLOD(Bool MyAttach)
	MyWorld = (Game.GetForm(0x00000014) As Actor).GetWorldspace() As String
	if MyWorld != "None"
		MyWorld = StringUtil.SubString(MyWorld, 13, StringUtil.Find(MyWorld, "(") - 14)
	endIf
	MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
	if MyImportFileName != "DynDOLOD_None"
		MyMaster = Game.GetFormFromFile(JsonUtil.IntListGet(MyImportFileName, "master", 0), "DynDOLOD.esp") As ObjectReference
		MyCurrentFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyCurrentFirstborn", None) As ObjectReference
		MyActiveFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", None) As ObjectReference
	else
		MyMaster = None
		MyCurrentFirstborn = None
		MyActiveFirstborn = None
	endIf
	if MyAttach && !MyActiveFirstborn
		MyActiveFirstborn = MyCurrentFirstborn
	endIf
	if MyActiveFirstborn
		MyFormID = Math.LogicalAnd(0x00FFFFFF, MyActiveFirstborn.GetFormID()) As String
		MyFirstbornList = StringUtil.SubString(JsonUtil.StringListGet(MyImportFileName, MyFormID, 0), 1, 0) As int
		MyMinionList = StringUtil.SubString(JsonUtil.StringListGet(MyImportFileName, MyFormID, 1), 1, 0) As int
		if MyActiveValue
			StorageUtil.SetIntValue(None, "DynDOLOD_Active", 1)
		endIf
		(MyMaster As SHESON_DynDOLOD_Master).IBowToTheev2(MyActiveFirstborn, MyFirstbornList, MyMinionList, MyAttach, FALSE)
		Index = JsonUtil.IntListCount(MyImportFileName, "m" + MyMinionList)
		While Index
			Index -= 1
			MyCurrent = JsonUtil.IntListGet(MyImportFileName, "m" + MyMinionList, Index) As Int
			CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
			if CurrentRef
				if MyActiveValue
					CurrentRef.Reset()
					CurrentRef.EnableNoWait(FALSE)
				else
					CurrentRef.Reset()
					CurrentRef.DisableNoWait(FALSE)
				endIf
			endIf
		endWhile
		Index = JsonUtil.IntListCount(MyImportFileName, "myfirstbornlist" + MyFirstbornList)
		While Index
			Index -= 1
			MyCurrent = JsonUtil.IntListGet(MyImportFileName, "f" + MyFirstbornList, Index) As Int
			CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
			if CurrentRef
				if MyActiveValue
					CurrentRef.Reset()
					CurrentRef.EnableNoWait(FALSE)
				else
					CurrentRef.Reset()
					CurrentRef.DisableNoWait(FALSE)
				endIf
			endIf
		endWhile
		MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + "_Objects"
		Index = JsonUtil.StringListCount(MyImportFileName, "reset")
		While Index
			Index -= 1
			CurrentRef = Game.GetFormFromFile(StringUtil.SubString(JsonUtil.StringListGet(MyImportFileName, "reset", Index), StringUtil.Find(JsonUtil.StringListGet(MyImportFileName, "reset", Index), ";") +1, 0) As int, StringUtil.SubString(JsonUtil.StringListGet(MyImportFileName, "reset", Index), 0, StringUtil.Find(JsonUtil.StringListGet(MyImportFileName, "reset", Index), ";", 0))) As ObjectReference
			if CurrentRef && !CurrentRef.IsDisabled()
				CurrentRef.Reset()
			endIf
		endWhile
		MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
		if MyActiveValue
			StorageUtil.SetIntValue(None, "DynDOLOD_Active", 1)
			StorageUtil.SetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", MyCurrentFirstborn)
			Debug.MessageBox("DynDOLOD activated")
			StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD activated")
		else
			StorageUtil.UnsetIntValue(None, "DynDOLOD_Active")
			StorageUtil.UnsetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn")
			Debug.MessageBox("DynDOLOD deactivated")
			StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD deactivated")
		endIf
	endIf
EndFunction
