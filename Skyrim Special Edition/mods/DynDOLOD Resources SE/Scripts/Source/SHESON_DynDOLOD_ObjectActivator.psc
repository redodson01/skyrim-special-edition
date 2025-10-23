Scriptname SHESON_DynDOLOD_ObjectActivator extends ObjectReference

Event OnLoad()
	if StorageUtil.GetIntValue(None, "DynDOLOD_Active", 0) == 1
		ObjectReference MyMaster = Game.GetFormFromFile(JsonUtil.IntListGet("DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", StringUtil.Substring(Game.GetPlayer().GetWorldspace() as string, 13, StringUtil.Find(Game.GetPlayer().GetWorldspace() as string, "(") - 14), "None") as string, "master", 0), "DynDOLOD.esp") As ObjectReference
		if MyMaster
			ObjectReference MyActiveFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", None) As ObjectReference
			if MyActiveFirstborn
				(MyMaster as SHESON_DynDOLOD_Master).IBowToTheev2(MyActiveFirstborn, (MyMaster as SHESON_DynDOLOD_Master).MyCurrentFirstbornList, (MyMaster as SHESON_DynDOLOD_Master).MyCurrentMinionList, TRUE, TRUE)
			endIf
		endIf
	endIf
endEvent

Event OnUnload()
	ObjectReference MyMaster = Game.GetFormFromFile(JsonUtil.IntListGet("DynDOLOD_" + JsonUtil.GetStringValue("DynDOLOD_Worlds", StringUtil.Substring(Game.GetPlayer().GetWorldspace() as string, 13, StringUtil.Find(Game.GetPlayer().GetWorldspace() as string, "(") - 14), "None") as string, "master", 0), "DynDOLOD.esp") As ObjectReference
	if MyMaster
		ObjectReference MyActiveFirstborn = StorageUtil.GetFormValue(MyMaster, "DynDOLOD_MyActiveFirstborn", None) As ObjectReference
		if MyActiveFirstborn
			(MyMaster as SHESON_DynDOLOD_Master).IBowToTheev2(MyActiveFirstborn, (MyMaster as SHESON_DynDOLOD_Master).MyCurrentFirstbornList, (MyMaster as SHESON_DynDOLOD_Master).MyCurrentMinionList, TRUE, TRUE)
		endIf
	endIf
endEvent
