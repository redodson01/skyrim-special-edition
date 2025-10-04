Scriptname MG02PlayerScript extends ReferenceAlias  

Location Property WinterholdCollegeLocation  Auto  

Quest Property MG02  Auto

Event OnLocationChange(Location OldLoc, Location NewLoc)

;	if MG02.GetStage() == 10
;		if OldLoc == WinterholdCollegeLocation
;			MG02.SetStage(11)
;		endif
;	endif

EndEvent

Event OnSpellCast(Form akSpell)

	if MG02.IsObjectiveDisplayed(35)
		if MG02.IsObjectiveCompleted(35)
			GoToState("Done")
			return
		endif
		if akSpell as Spell
			int spellType = PO3_SKSEFunctions.GetSpellType(akSpell as Spell)
			if spellType == 0 || spellType == 11
				ReferenceAlias wallAlias = MG02.GetAliasByName("MG02WallAlias") as ReferenceAlias
				if Math.Abs(GetReference().GetHeadingAngle(wallAlias.GetReference())) <= 15
					GoToState("Done")
					Utility.Wait(0.25)
					wallAlias.OnMagicEffectApply(GetReference(), None)
				endif
			endif
		endif
	endif

EndEvent

State Done
	Event OnSpellCast(Form akSpell)
	EndEvent
EndState