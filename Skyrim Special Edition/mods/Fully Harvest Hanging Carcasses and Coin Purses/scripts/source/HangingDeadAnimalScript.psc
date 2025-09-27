Scriptname HangingDeadAnimalScript extends ObjectReference  

int Property ClearArrowsRadius Auto

;/ Notes:
	1. SetCollisionLayer() resets when the cell is detached or the save is loaded after closing the game. Doesn't reset when waiting. 
		Persists even when loading an earlier save where this function wasn't used yet.
	2. Apparently the object doesn't reset when you just wait in the same cell.
/;


Event OnActivate(ObjectReference akActionRef)
	ClearArrows(akActionRef)
	SetCollisionEnabled(false)
	ClearArrows(akActionRef)
endEvent

Event OnCellAttach()
	RegisterForModEvent("FHHC_OnPlayerLoadGame", "OnPlayerLoadGame")
	RegisterForSingleUpdate(1.0)
endEvent

Event OnPlayerLoadGame()
	RegisterForSingleUpdate(1.0)
endEvent

Event OnCellDetach()
	UnregisterForModEvent("FHHC_OnPlayerLoadGame")
	UnregisterForUpdate()
endEvent

Event OnUnload()
	UnregisterForUpdate()
endEvent

Event OnUpdate()
	; Sometimes 3d is not loaded immediately. Run from Riverwood to the fisherman camp behind the Guardian Stones and you'll see Papyrus log error "has no 3D"
	if IsEnabled()
		if Is3DLoaded()
			UpdateCollision()
		else
			RegisterForSingleUpdate(1.0)
		endif
	endif
endEvent

function UpdateCollision()
	SetCollisionEnabled(!IsHarvested())
endFunction

function SetCollisionEnabled(bool enableCollision)
	if IsEnabled() ; Otherwise Papyrus log error "has no 3D" for disabled refs
		if enableCollision
			PO3_SKSEFunctions.SetCollisionLayer(self, "", 4) ; kClutter
		else
			PO3_SKSEFunctions.SetCollisionLayer(self, "", 42) ; kPathingPick (not kNonCollidable because then "NoNail" salmons will endlessly fall through the ground)
		endif
	endif
endFunction

function ClearArrows(ObjectReference akActionRef)
	if ClearArrowsRadius > 0
		ObjectReference[] arrows = PO3_SKSEFunctions.FindAllReferencesOfFormType(self, 50, ClearArrowsRadius*GetScale()) ; 50 = kProjectile
		int iArrow = arrows.Length
		while iArrow > 0
			iArrow -= 1
			arrows[iArrow].Activate(akActionRef)
		endwhile
	endif
endFunction
