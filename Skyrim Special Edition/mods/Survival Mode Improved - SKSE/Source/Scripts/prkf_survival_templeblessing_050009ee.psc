scriptName PRKF_Survival_TempleBlessing_050009EE extends Perk hidden

;-- Properties --------------------------------------
miscobject property Gold001 auto
message property Survival_ShrineNotEnoughGoldMessage auto
globalvariable property Survival_ShrineGoldOfferingAmount auto
message property Survival_ShrineGoldOfferingMessage auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------


function Fragment_2(ObjectReference akTargetRef, Actor akActor)
	bool SKSEInstalled = false
	if(SKSE.GetVersion())
		SKSEInstalled = true
	Endif

	Int choice = 0
	Int offeringAmount = 0
	
	MAG_BlessingStorageScript LastBlessingStorageScript
	if(SKSEInstalled)
		LastBlessingStorageScript = Quest.GetQuest("MAG_PilgrimPriestQuest") as MAG_BlessingStorageScript
	else
		LastBlessingStorageScript = Game.GetFormFromFile(0x00126443, "Pilgrim.esp") as MAG_BlessingStorageScript
	endif
	
	if(!LastBlessingStorageScript)
		offeringAmount = Survival_ShrineGoldOfferingAmount.GetValueInt()
		choice = Survival_ShrineGoldOfferingMessage.Show(offeringAmount as Float)
	endif

	if choice == 0
		
		if(!LastBlessingStorageScript)
			if akActor.GetItemCount(Gold001 as form) < offeringAmount
				Survival_ShrineNotEnoughGoldMessage.Show()
				return 
			endIf
			akActor.RemoveItem(Gold001 as form, offeringAmount, false, none)
		endif

		templeblessingscript baseShrine = akTargetRef as templeblessingscript
		dlc2templeshrinescript dlc2Shrine = akTargetRef as dlc2templeshrinescript
		if baseShrine
			baseShrine.TempleBlessing.Cast(akActor as ObjectReference, akActor as ObjectReference)
			
			if(LastBlessingStorageScript)   ;Null check just in case this script is somehow run on a shrine without the quest present
				if !game.GetPlayer().HasSpell(LastBlessingStorageScript.Prayer as form)
					game.GetPlayer().AddSpell(LastBlessingStorageScript.Prayer, true)
				endIf
				LastBlessingStorageScript.LastBlessing = baseShrine.TempleBlessing
				LastBlessingStorageScript.LastMessage = baseShrine.BlessingMessage
			Endif
			baseShrine.AltarRemoveMsg.Show()
			baseShrine.BlessingMessage.Show()
		elseIf dlc2Shrine
			dlc2Shrine.TempleBlessing.Cast(akActor as ObjectReference, akActor as ObjectReference)
			if(LastBlessingStorageScript)   ;Null check just in case this script is somehow run on a shrine without the quest present
				if !game.GetPlayer().HasSpell(LastBlessingStorageScript.Prayer as form)
					game.GetPlayer().AddSpell(LastBlessingStorageScript.Prayer, true)
				endIf
				LastBlessingStorageScript.LastBlessing = dlc2Shrine.TempleBlessing
				LastBlessingStorageScript.LastMessage = dlc2Shrine.BlessingMessage
			Endif
			dlc2Shrine.AltarRemoveMsg.Show()
			dlc2Shrine.BlessingMessage.Show()
		endIf
	endIf
endFunction
