scriptname BYOHCoffinActivateInUseScript extends ObjectReference

event onActivate(objectReference a_activateRef)
	if (a_activateRef == Game.GetPlayer() && IsFurnitureInUse(true))
		PlayAnimation("Open")
	endif
endevent