scriptName ToggleSpellNPC3BBBMultiple extends activemagiceffect

mus3baddonmcm property MCM auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MCM.MultilpleSMP(akTarget)
	Return
;/
	if akTarget.GetItemCount(MCM.SMPONObjectFA48) != 0 && MCM.SlotList[MCM.NPCsTIndex] == MCM.S48
		akTarget.UnequipItem(MCM.SMPONObjectFA48, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA48, 99, true, none)
		debug.Notification(akTarget.GetActorBase().GetName() + " 3BA CBPC Mode")
	elseIf akTarget.GetItemCount(MCM.SMPONObjectFA50) != 0 && MCM.SlotList[MCM.NPCsTIndex] == MCM.S50
		akTarget.UnequipItem(MCM.SMPONObjectFA50, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA50, 99, true, none)
		debug.Notification(akTarget.GetActorBase().GetName() + " 3BA CBPC Mode")
	elseIf akTarget.GetItemCount(MCM.SMPONObjectFA51) != 0 && MCM.SlotList[MCM.NPCsTIndex] == MCM.S51
		akTarget.UnequipItem(MCM.SMPONObjectFA51, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA51, 99, true, none)
		debug.Notification(akTarget.GetActorBase().GetName() + " 3BA CBPC Mode")
	elseIf akTarget.GetItemCount(MCM.SMPONObjectFA60) != 0 && MCM.SlotList[MCM.NPCsTIndex] == MCM.S60
		akTarget.UnequipItem(MCM.SMPONObjectFA60, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA60, 99, true, none)
		debug.Notification(akTarget.GetActorBase().GetName() + " 3BA CBPC Mode")
	else
		akTarget.UnequipItem(MCM.SMPONObjectFA48, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA48, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFA50, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA50, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFA51, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA51, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFA60, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFA60, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFB48, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFB48, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFB50, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFB50, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFB51, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFB51, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFB60, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFB60, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFC48, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFC48, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFC50, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFC50, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFC51, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFC51, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFC60, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFC60, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFD48, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFD48, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFD50, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFD50, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFD51, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFD51, 99, true, none)
		akTarget.UnequipItem(MCM.SMPONObjectFD60, false, true)
		akTarget.RemoveItem(MCM.SMPONObjectFD60, 99, true, none)
		if MCM.SlotList[MCM.NPCsTIndex] == MCM.S48
			akTarget.AddItem(MCM.SMPONObjectFA48, 1, true)
			akTarget.EquipItem(MCM.SMPONObjectFA48, true, true)
			debug.Notification(akTarget.GetActorBase().GetName() + " 3BA SMP Mode")
		elseIf MCM.SlotList[MCM.NPCsTIndex] == MCM.S50
			akTarget.AddItem(MCM.SMPONObjectFA50, 1, true)
			akTarget.EquipItem(MCM.SMPONObjectFA50, true, true)
			debug.Notification(akTarget.GetActorBase().GetName() + " 3BA SMP Mode")
		elseIf MCM.SlotList[MCM.NPCsTIndex] == MCM.S51
			akTarget.AddItem(MCM.SMPONObjectFA51, 1, true)
			akTarget.EquipItem(MCM.SMPONObjectFA51, true, true)
			debug.Notification(akTarget.GetActorBase().GetName() + " 3BA SMP Mode")
		elseIf MCM.SlotList[MCM.NPCsTIndex] == MCM.S60
			akTarget.AddItem(MCM.SMPONObjectFA60, 1, true)
			akTarget.EquipItem(MCM.SMPONObjectFA60, true, true)
			debug.Notification(akTarget.GetActorBase().GetName() + " 3BA SMP Mode")
		endIf
	endIf
/;
endEvent
