Scriptname _Talent_Givespell extends ObjectReference  

Spell property InstrumentEquipped auto
Actor property PlayerRef auto
Globalvariable property _Talent_IsPerformingGood auto
Globalvariable property _Talent_IsPerformingterrible auto


Event OnEquipped(Actor akActor)

if akActor == PlayerRef

If PlayerRef.HasSpell(InstrumentEquipped)
PlayerRef.RemoveSpell(InstrumentEquipped)
endif
		_Talent_IsPerformingGood.SetValue(0)
		_Talent_IsPerformingTerrible.SetValue(0)

		PlayerRef.AddSpell(InstrumentEquipped, false)
		; Have fun playing, my good milords and myladies
endif
EndEvent
