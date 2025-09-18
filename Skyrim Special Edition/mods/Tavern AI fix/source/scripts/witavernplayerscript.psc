Scriptname WITavernPlayerScript Extends ReferenceAlias
{Script on Player Alias in WITavern quest}

Keyword Property FurnitureSpecial Auto

event OnSit(ObjectReference a_furniture)
	;USKP 2.0.6 Bug #16725 - Keeps cooking pots from triggering tavern server behavior. 
	;USLEEP 3.0.1 Bug #19502 - Expanded fix to cover all special furniture so that it only triggers when sitting on normal stuff.
	if (FurnitureSpecial && a_furniture.HasKeyword(FurnitureSpecial))
		return
	EndIf

	; exclude beds
	if (GetActorRef().GetSleepState() != 0)
		return
	endif

	(GetOwningQuest() as WITavernScript).PlayerSatDown()
endevent

event OnGetUp(ObjectReference a_furniture)
	(GetOwningQuest() as WITavernScript).PlayerGotUp()
endevent

event OnLocationChange(Location akOldLoc, Location akNewLoc)
	(GetOwningQuest() as WITavernScript).PlayerChangedLocation()
endevent