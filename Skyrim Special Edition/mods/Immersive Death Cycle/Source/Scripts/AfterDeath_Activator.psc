Scriptname AfterDeath_Activator extends ObjectReference  

Ingredient Property BoneMeal Auto
Actor Property PlayerRef Auto
FormList Property CurrentObjects Auto

Event OnActivate(ObjectReference akActionRef)
  Playerref.AddItem(BoneMeal, 1)
  CurrentObjects.RemoveAddedForm(Self)
  Self.Disable(True)
  Self.Delete()
EndEvent

Event OnCellDetach()
If Self.IsEnabled()
	Int Chance = Utility.RandomInt(1, 3)
	If Chance == 1
	  CurrentObjects.RemoveAddedForm(Self)
	Self.Disable()
	Self.Delete()
endif
endif
Endevent