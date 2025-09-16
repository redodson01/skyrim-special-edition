Scriptname SHESON_DynDOLOD_Quest extends Quest

Event OnInit()
	Initialize()
EndEvent

Function Initialize()
	if SKSE.GetScriptVersionRelease() >= 53
		if PapyrusUtil.GetVersion() >= 33
			if (Game.GetFormFromFile(0x00000910, "DynDOLOD.esp") As Keyword).GetString() != "" && Math.RightShift((Game.GetFormFromFile(0x00000910, "DynDOLOD.esp") As Form).GetFormID(), 24) < 0xFE
				if (StringUtil.Find(Game.GetModDescription(Game.GetModByName(JsonUtil.GetStringValue("DynDOLOD_Worlds", "plugin", "DynDOLOD.esp"))), "2.45", 0) != -1 && StringUtil.Find(Game.GetModDescription(Game.GetModByName("DynDOLOD.esp")), "2.45", 0) != -1) || ((Game.GetFormFromFile(0x00000912, "DynDOLOD.esp") As Keyword).GetString() == "2.45" && (Game.GetFormFromFile(0x00000912, JsonUtil.GetStringValue("DynDOLOD_Worlds", "plugin", "DynDOLOD.esp")) As Keyword).GetString() == "2.45")
					StorageUtil.UnsetIntValue(None, "DynDOLOD_Checks")
					String MyWorld = (Game.GetForm(0x00000014) As Actor).GetWorldspace() As String
					if MyWorld != "None"
						MyWorld = StringUtil.SubString(MyWorld, 13, StringUtil.Find(MyWorld, "(") - 14)
					EndIf
					Debug.Trace(self + " Load DynDOLOD_Worlds.json " + JsonUtil.Load("DynDOLOD_Worlds") + " " + MyWorld)
					if JsonUtil.GetStringValue("DynDOLOD_Worlds", "masters", "None") As String != "None"
						Int Index = StringUtil.Split(JsonUtil.GetStringValue("DynDOLOD_Worlds", "masters", "None") As String, ",").Length
						While Index
							Index -= 1
							StorageUtil.UnsetIntValue(Game.GetFormFromFile(StringUtil.Split(JsonUtil.GetStringValue("DynDOLOD_Worlds", "masters", "None") As String, ",")[index] As Int, "DynDOLOD.esp") As ObjectReference, "Reset")
						endWhile
					endIf
					String MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, "None")
					if MyImportFileName != ""
						if MyImportFileName != "DynDOLOD_None"
							Debug.Trace(self + " Load " + MyImportFileName + ".json " + JsonUtil.Load(MyImportFileName))
							Debug.Trace(self + " Load " + MyImportFileName + "_Objects.json " + JsonUtil.Load(MyImportFileName + "_Objects"))
						endIf
						if JsonUtil.GetStringValue("DynDOLOD_Worlds", "bunchofnumbers", "N/A") != "N/A"
							Utility.Wait(0.666)
							Debug.Trace(self + " Assigning INI values " + JsonUtil.GetFloatValue("DynDOLOD_Worlds", "fminsecondsforloadfadein", 2.66))
							Utility.SetINIfloat("fminsecondsforloadfadein:Interface", StorageUtil.GetFloatValue(none, "DynDOLOD_FadeTime", JsonUtil.GetFloatValue("DynDOLOD_Worlds", "fminsecondsforloadfadein", 2.66)))
							Utility.SetINIfloat("fSkyCellRefFadeDistance", StorageUtil.GetFloatValue(none, "fskycellreffadedistance", Utility.GetINIfloat("fskycellreffadedistance")))
							Utility.SetINIfloat("fBlockLevel0Distance:TerrainManager", StorageUtil.GetFloatValue(none, "fblocklevel0distance", Utility.GetINIfloat("fBlockLevel0Distance:TerrainManager")))
							Utility.SetINIfloat("fBlockLevel1Distance:TerrainManager", StorageUtil.GetFloatValue(none, "fblocklevel1distance", Utility.GetINIfloat("fBlockLevel1Distance:TerrainManager")))
							Utility.SetINIfloat("fBlockMaximumDistance:TerrainManager",StorageUtil.GetFloatValue(none, "fblockmaximumdistance", Utility.GetINIfloat("fBlockMaximumDistance:TerrainManager")))
							Utility.SetINIfloat("fTreeLoadDistance:TerrainManager", StorageUtil.GetFloatValue(none, "ftreeloaddistance", Utility.GetINIfloat("fTreeLoadDistance:TerrainManager")))
							Utility.SetINIfloat("fSplitDistanceMult:TerrainManager", StorageUtil.GetFloatValue(none, "fsplitdistancemult", Utility.GetINIfloat("fSplitDistanceMult:TerrainManager")))
							Debug.Trace(self + " INI values assigned")
						else
							StorageUtil.SetIntValue(None, "DynDOLOD_Checks", 0)
							StorageUtil.SetIntValue(None, "DynDOLOD_Active", 0)
							Debug.MessageBox("DynDOLOD could not read DynDOLOD_Worlds")
							Debug.Trace("DynDOLOD could not read DynDOLOD_Worlds")
							StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD could not read DynDOLOD_Worlds")
						endIf
					else
						StorageUtil.SetIntValue(None, "DynDOLOD_Checks", 0)
						StorageUtil.SetIntValue(None, "DynDOLOD_Active", 0)
						Debug.MessageBox("DynDOLOD papyrus error")
						Debug.Trace("DynDOLOD papyrus error MyWorld=" + MyWorld + " MyImportFileName=" + MyImportFileName)
						StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD papyrus error MyWorld=" + MyWorld + " MyImportFileName=" + MyImportFileName)
					endIf
				else
					StorageUtil.SetIntValue(None, "DynDOLOD_Checks", 0)
					StorageUtil.SetIntValue(None, "DynDOLOD_Active", 0)
					Debug.MessageBox("DynDOLOD papyrus scripts are the wrong version")
					Debug.Trace("DynDOLOD papyrus scripts are the wrong version")
					StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD papyrus scripts are the wrong version")
				endIf
			else
				StorageUtil.SetIntValue(None, "DynDOLOD_Checks", 0)
				StorageUtil.SetIntValue(None, "DynDOLOD_Active", 0)
				Debug.Notification("DynDOLOD.esp not found or too high in the load order")
				Debug.Trace("DynDOLOD.esp not found or too high in the load order")
				StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD.esp not found or too high in the load order")
			endIf
		else
			StorageUtil.SetIntValue(None, "DynDOLOD_Checks", 0)
			StorageUtil.SetIntValue(None, "DynDOLOD_Active", 0)
			Debug.MessageBox("DynDOLOD requires PapyrusUtil")
			Debug.Trace("DynDOLOD requires PapyrusUtil")
			StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD requires PapyrusUtil")
		endIf
		if SKSE.GetPluginVersion("skee") < 1 || NiOverride.GetScriptVersion() < 6
			StorageUtil.UnsetIntValue(none, "DynDOLOD_UseNiOverride")
		endIf
	else
		StorageUtil.SetIntValue(None, "DynDOLOD_Checks", 0)
		StorageUtil.SetIntValue(None, "DynDOLOD_Active", 0)
		Debug.MessageBox("DynDOLOD requires SKSE")
		Debug.Trace("DynDOLOD requires SKSE")
		StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "DynDOLOD requires SKSE")
	endIf
endFunction
