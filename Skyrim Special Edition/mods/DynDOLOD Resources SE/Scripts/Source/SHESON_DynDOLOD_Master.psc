Scriptname SHESON_DynDOLOD_Master extends ObjectReference
;this probably should be a quest but I like being at the center of the map doing things
;this looks spaghetti but it is about performance, lets call it Stringent logic

ObjectReference Property MyCurrentFirstborn = None Auto
ObjectReference MyOldFirstborn = None
String MyWorld = "None"
String MyImportFileName = "None"
Int Property MyCurrentFirstbornList = 0 Auto
Int Property MyCurrentMinionList = 0 Auto
Int MyOldFirstbornList = 0
Int MyOldMinionList = 0
Int MyCurrent = 0
Int ThrottleThreshold = 100
Bool MyCurrentAttach
Bool MyRun = False

Function IBowToTheev2(ObjectReference MyFirstborn, Int FirstbornList, Int MinionList, Bool MyAttach, Bool MyActivateAll)
	GotoState("Updating")
	if (StorageUtil.GetIntValue(None, "DynDOLOD_Active", 0) == 0)
		Utility.Wait(3)
	EndIf
	MyWorld = StringUtil.SubString(self.GetWorldspace() As String, 13, StringUtil.Find(self.GetWorldspace() As String, "(") - 14)
	MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
	if !JsonUtil.Load(MyImportFileName)
		Debug.Notification(MyImportFileName + ".json file not found")
		StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", MyImportFileName + ".json file not found")
		GotoState("Missing")
	else
		Int MaxCurrent = JsonUtil.IntListCount(MyImportFileName, "f" + FirstbornList)
		if MaxCurrent == 0
			Debug.Notification("DynDOLOD missing data for cell id " + FirstbornList)
			StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "Missing data for cell id " + FirstbornList)
			GotoState("EmptyState")
			Utility.Wait(3)
		else
			MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + "_Objects"
			GotoState("Updating")
			Int Index = JsonUtil.StringListCount(MyImportFileName, "reset")
			While Index
				Index -= 1
				ObjectReference CurrentRef = Game.GetFormFromFile(StringUtil.SubString(JsonUtil.StringListGet(MyImportFileName, "reset", Index), StringUtil.Find(JsonUtil.StringListGet(MyImportFileName, "reset", Index), ";") +1, 0) As int, StringUtil.SubString(JsonUtil.StringListGet(MyImportFileName, "reset", Index), 0, StringUtil.Find(JsonUtil.StringListGet(MyImportFileName, "reset", Index), ";", 0))) As ObjectReference
				if (CurrentRef) && !CurrentRef.IsDisabled()
					CurrentRef.Reset()
				endIf
			endWhile
			StorageUtil.SetIntValue(self, "Reset", 1)
			MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
			GotoState("Running")
			StorageUtil.SetIntValue(None, "DynDOLOD_Active", 1)
			IBowToTheev2(MyFirstborn, FirstbornList, MinionList, MyAttach, MyActivateAll)
			if (MyWorld == "Tamriel") && (Game.GetModByName("notice board.esp") != 255)
				LeveledItem Notes = Game.GetFormFromFile(36705, "notice board.esp") As LeveledItem
				if (Notes)
					Form MyNote = Game.GetFormFromFile(2316, "DynDOLOD.esp")
					if (MyNote)
						Notes.AddForm(MyNote, 1, 1)
						MyNote = None
					endIf
					Notes = None
				endIf
			endIf
			Debug.Notification("DynDOLOD successfully initialized")
			StorageUtil.SetStringValue(None, "DynDOLOD_Last_Message", "Successfully initialized")
	        endIf
	endIf
EndFunction

State Running
	Function IBowToTheev2(ObjectReference MyFirstborn, Int FirstbornList, Int MinionList, Bool MyAttach, Bool MyActivateAll)
		GotoState("Updating")
		MyCurrentFirstborn = MyFirstborn
		MyCurrentAttach = MyAttach
		MyCurrentFirstbornList = FirstbornList
		MyCurrentMinionList = MinionList
		if (MyImportFileName == "None")
			MyWorld = StringUtil.SubString(self.GetWorldspace() As String, 13, StringUtil.Find(self.GetWorldspace() As String, "(") - 14)
			MyImportFileName = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld)
		endIf
		if MyCurrentAttach
			StorageUtil.SetFormValue(self, "DynDOLOD_MyActiveFirstborn", MyCurrentFirstborn)
			MyOldFirstborn = MyCurrentFirstborn
			if (MyCurrentMinionList != MyOldMinionList) || MyActivateAll
				if MyActivateAll
					Self.Activate(self)
				endIf
				Int MaxCurrent = JsonUtil.IntListCount(MyImportFileName, "m" + MyCurrentMinionList)
				Int MaxOld = 0
				if (MyOldMinionList != "None")
					MaxOld = JsonUtil.IntListCount(MyImportFileName, "m" + MyOldMinionList)
				endIf
				Int Index = MaxOld
				if (MaxCurrent > MaxOld)
					Index = MaxCurrent
				endIf
				Int ThrottleCount = 0
				While Index
					Index -= 1
					if (Index < MaxCurrent)
						MyCurrent = JsonUtil.IntListGet(MyImportFileName, "m" + MyCurrentMinionList, Index)
						ObjectReference CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
						if CurrentRef
							if MyActivateAll
								CurrentRef.Activate(self)
							elseif (StorageUtil.GetIntValue(CurrentRef, "GridState") == 0) && (!JsonUtil.IntListHas(MyImportFileName, "m" + MyOldMinionList, MyCurrent) || (MyOldMinionList == 0))
								StorageUtil.SetIntValue(CurrentRef, "GridState", 1)
								CurrentRef.Activate(self)
							endIf
						endIf
					endIf
					if (Index < MaxOld) && !MyActivateAll
						MyCurrent = JsonUtil.IntListGet(MyImportFileName, "m" + MyOldMinionList, Index)
						ObjectReference CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
						if CurrentRef
							if (StorageUtil.GetIntValue(CurrentRef, "GridState") > 0) && (!JsonUtil.IntListHas(MyImportFileName, "m" + MyCurrentMinionList, MyCurrent) || (MyCurrentMinionList == 0))
								StorageUtil.UnsetIntValue(CurrentRef, "GridState")
								StorageUtil.UnsetIntValue(CurrentRef, "CellState")
								CurrentRef.Activate(self)
								ThrottleCount += 1
								if (ThrottleCount > ThrottleThreshold)
									Utility.Wait(1)
									ThrottleCount = 0
								endIf
							endIf
						endIf
					endIf
				endWhile
				MyOldMinionList = MyCurrentMinionList
			endIf
			if (MyCurrentFirstbornList != MyOldFirstbornList) || MyActivateAll
				Int MaxCurrent = JsonUtil.IntListCount(MyImportFileName, "f" + MyCurrentFirstbornList)
				Int MaxOld = 0
				if (MyOldFirstbornList != 0)
					MaxOld = JsonUtil.IntListCount(MyImportFileName, "f" + MyOldFirstbornList)
				endIf
				Int Index = MaxOld
				if (MaxCurrent > MaxOld)
					Index = MaxCurrent
				endIf
				Int ThrottleCount = 0
				While Index
					Index -= 1
					if (Index < MaxCurrent)
						MyCurrent = JsonUtil.IntListGet(MyImportFileName, "f" + MyCurrentFirstbornList, Index)
						ObjectReference CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
						if MyActivateAll
							CurrentRef.Activate(self)
						elseif CurrentRef
							if (StorageUtil.GetIntValue(CurrentRef, "GridState") == 0) && (!JsonUtil.IntListHas(MyImportFileName, "f" + MyOldFirstbornList, MyCurrent) || (MyOldFirstbornList == 0))
								StorageUtil.SetIntValue(CurrentRef, "GridState", 1)
								CurrentRef.Activate(self)
							endIf
						endIf
					endIf
					if (Index < MaxOld) && !MyActivateAll
						MyCurrent = JsonUtil.IntListGet(MyImportFileName, "f" + MyOldFirstbornList, Index)
						ObjectReference CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
						if CurrentRef
							if (StorageUtil.GetIntValue(CurrentRef, "GridState") > 0) && (!JsonUtil.IntListHas(MyImportFileName, "f" + MyCurrentFirstbornList, MyCurrent) || (MyCurrentFirstbornList == 0))
								StorageUtil.UnsetIntValue(CurrentRef, "GridState")
								StorageUtil.UnsetIntValue(CurrentRef, "CellState")
								CurrentRef.Activate(self)
								ThrottleCount += 1
								if (ThrottleCount > ThrottleThreshold)
									Utility.Wait(1)
									ThrottleCount = 0
								endIf
							endIf
						endIf
					endIf
				endWhile
				MyOldFirstbornList = MyCurrentFirstbornList
			endIf
		else
			if (MyCurrentFirstborn == MyOldFirstborn)
				MyRun = True
				StorageUtil.UnsetFormValue(self, "DynDOLOD_MyActiveFirstborn")
				Int Index = JsonUtil.IntListCount(MyImportFileName, "m" + MyOldMinionList)
				Int ThrottleCount = 0
				While MyRun && Index
					Index -= 1
					MyCurrent = JsonUtil.IntListGet(MyImportFileName, "m" + MyOldMinionList, Index)
					ObjectReference CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
					if CurrentRef && (StorageUtil.GetIntValue(CurrentRef, "GridState") > 0)
						StorageUtil.UnsetIntValue(CurrentRef, "GridState")
						StorageUtil.UnsetIntValue(CurrentRef, "CellState")
						CurrentRef.Activate(self)
						ThrottleCount += 1
						if (ThrottleCount > ThrottleThreshold)
							Utility.Wait(1)
							ThrottleCount = 0
						endIf
					endIf
				endWhile
				Index = JsonUtil.IntListCount(MyImportFileName, "f" + MyOldFirstbornList)
				ThrottleCount = 0
				While MyRun && Index
					Index -= 1
					MyCurrent = JsonUtil.IntListGet(MyImportFileName, "f" + MyOldFirstbornList, Index)
					ObjectReference CurrentRef = Game.GetFormFromFile(MyCurrent, "DynDOLOD.esp") As ObjectReference
					if CurrentRef && (StorageUtil.GetIntValue(CurrentRef, "GridState") > 0)
						StorageUtil.UnsetIntValue(CurrentRef, "GridState")
						StorageUtil.UnsetIntValue(CurrentRef, "CellState")
						CurrentRef.Activate(self)
						ThrottleCount += 1
						if (ThrottleCount > ThrottleThreshold)
							Utility.Wait(1)
							ThrottleCount = 0
						endIf
					endIf
				endWhile
				MyOldFirstbornList = 0
				MyOldMinionList = 0
				MyOldFirstborn = None
				MyRun = False
			endIf
		endIf
		if StorageUtil.GetIntValue(self, "Reset", 0) == 0
			string MyObjects = "DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", MyWorld, MyWorld) + "_Objects"
			Int Index = JsonUtil.StringListCount(MyObjects, "reset")
			While Index
				Index -= 1
				ObjectReference CurrentRef = Game.GetFormFromFile(StringUtil.SubString(JsonUtil.StringListGet(MyObjects, "reset", Index), StringUtil.Find(JsonUtil.StringListGet(MyObjects, "reset", Index), ";") +1, 0) As int, StringUtil.SubString(JsonUtil.StringListGet(MyObjects, "reset", Index), 0, StringUtil.Find(JsonUtil.StringListGet(MyObjects, "reset", Index), ";", 0))) As ObjectReference
				if (CurrentRef) && !CurrentRef.IsDisabled()
					CurrentRef.Reset()
				endIf
			endWhile
			StorageUtil.SetIntValue(self, "Reset", 1)
		endIf
		GotoState("Running")
	EndFunction
EndState

State Updating
	Function IBowToTheev2(ObjectReference MyFirstborn, Int FirstbornList, Int MinionList, Bool MyAttach, Bool MyActivateAll)
		;debug.trace(self + " updating - slow down " + MyFirstborn + " " + MyAttach)
		if MyAttach
			if MyRun
				MyRun = False
				Utility.Wait(0.1)
				GotoState("Running")
				IBowToTheev2(MyFirstborn, FirstbornList, MinionList, MyAttach, MyActivateAll)
			else

				StorageUtil.SetFormValue(self, "DynDOLOD_MyActiveFirstborn", MyFirstborn)
			endIf
		else
			StorageUtil.UnsetFormValue(self, "DynDOLOD_MyActiveFirstborn")
		endIf
	EndFunction
EndState

State Missing
	Function IBowToTheev2(ObjectReference MyFirstborn, Int FirstbornList, Int MinionList, Bool MyAttach, Bool MyActivateAll)
	EndFunction
EndState
