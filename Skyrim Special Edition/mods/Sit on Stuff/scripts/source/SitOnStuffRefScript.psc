ScriptName SitOnStuffRefScript extends ObjectReference

FormList Property InvisibleChairMarkers Auto


Event OnActivate(ObjectReference triggerRef)
	ObjectReference closestMarker = Game.FindClosestReferenceOfAnyTypeInListFromRef(InvisibleChairMarkers, self, 1000.0)
	if closestMarker
		if closestMarker.IsFurnitureInUse(false)
			Debug.Notification(Game.GetGameSettingString("sObjectInUse"))
		else
			closestMarker.Activate(triggerRef)
		endif
	else
		Debug.Notification("Sit on Stuff error: can't find the sitting marker")
	endif
EndEvent
