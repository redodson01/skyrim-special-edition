scriptName ToggleSpellP3BBB extends activemagiceffect

mus3baddonmcm property MCM auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MCM.PlayerSMP()
	Return
;/
	if akCaster.GetItemCount(MCM.SMPONObjectP48) != 0 && MCM.SlotList[MCM.PsTIndex] == MCM.S48
		akCaster.UnequipItem(MCM.SMPONObjectP48, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP48, 99, true, none)
		debug.Notification("Player 3BA CBPC Mode")
	elseIf akCaster.GetItemCount(MCM.SMPONObjectP50) != 0 && MCM.SlotList[MCM.PsTIndex] == MCM.S50
		akCaster.UnequipItem(MCM.SMPONObjectP50, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP50, 99, true, none)
		debug.Notification("Player 3BA CBPC Mode")
	elseIf akCaster.GetItemCount(MCM.SMPONObjectP51) != 0 && MCM.SlotList[MCM.PsTIndex] == MCM.S51
		akCaster.UnequipItem(MCM.SMPONObjectP51, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP51, 99, true, none)
		debug.Notification("Player 3BA CBPC Mode")
	elseIf akCaster.GetItemCount(MCM.SMPONObjectP60) != 0 && MCM.SlotList[MCM.PsTIndex] == MCM.S60
		akCaster.UnequipItem(MCM.SMPONObjectP60, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP60, 99, true, none)
		debug.Notification("Player 3BA CBPC Mode")
	else
		akCaster.UnequipItem(MCM.SMPONObjectP48, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP48, 99, true, none)
		akCaster.UnequipItem(MCM.SMPONObjectP50, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP50, 99, true, none)
		akCaster.UnequipItem(MCM.SMPONObjectP51, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP51, 99, true, none)
		akCaster.UnequipItem(MCM.SMPONObjectP60, false, true)
		akCaster.RemoveItem(MCM.SMPONObjectP60, 99, true, none)
		if MCM.SlotList[MCM.PsTIndex] == MCM.S48
			akCaster.AddItem(MCM.SMPONObjectP48, 1, true)
			akCaster.EquipItem(MCM.SMPONObjectP48, true, true)
			debug.Notification("Player 3BA SMP Mode")
		elseIf MCM.SlotList[MCM.PsTIndex] == MCM.S50
			akCaster.AddItem(MCM.SMPONObjectP50, 1, true)
			akCaster.EquipItem(MCM.SMPONObjectP50, true, true)
			debug.Notification("Player 3BA SMP Mode")
		elseIf MCM.SlotList[MCM.PsTIndex] == MCM.S51
			akCaster.AddItem(MCM.SMPONObjectP51, 1, true)
			akCaster.EquipItem(MCM.SMPONObjectP51, true, true)
			debug.Notification("Player 3BA SMP Mode")
		elseIf MCM.SlotList[MCM.PsTIndex] == MCM.S60
			akCaster.AddItem(MCM.SMPONObjectP60, 1, true)
			akCaster.EquipItem(MCM.SMPONObjectP60, true, true)
			debug.Notification("Player 3BA SMP Mode")
		endIf
	endIf
/;
endEvent
