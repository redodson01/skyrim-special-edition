Scriptname CTN_Givespell extends ReferenceAlias  

Event OnInIt()

;Hello curious person! This is done here and not in Alias Spells cause the quest needs to be stopped at differenet times, removing the spell from the player

;If PlayerRef.HasSpell(CTN_Call_NPC_Spell)
;nothing
;else
;PlayerRef.AddSpell(CTN_Call_NPC_Spell)
;endif

iShoutKey = Input.GetMappedKey("Shout")
RegisterForKey(iShoutKey)
EndEvent


Event OnKeyDown(Int KeyCode)
	If keycode == iShoutKey && PlayerRef.GetEquippedSpell(2) == CTN_Call_NPC_Spell && PlayerRef.GetSitState() == 3 && !UI.IsTextInputEnabled() && !Utility.IsInMenuMode() && !UI.IsMenuOpen("Crafting Menu")
		CTN_Call_NPC_Spell.cast(playerref)
	EndIf
EndEvent


Int iShoutKey
Actor Property PlayerRef Auto
Spell property CTN_Call_NPC_Spell Auto