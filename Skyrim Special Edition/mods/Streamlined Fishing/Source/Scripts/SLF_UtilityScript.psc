Scriptname SLF_UtilityScript extends Quest

Actor Property PlayerRef Auto
FormList Property ccBGSSSE001_FishingRods Auto
QuickItemMenu Property SLF_ItemMenu Auto

Function ChooseRod()
	SLF_ItemMenu.ResetMenu()

	Form equippedRod = GetEquippedRod()

	int i = 0
	while i < ccBGSSSE001_FishingRods.GetSize()
		Form fishingRod = ccBGSSSE001_FishingRods.GetAt(i)
		if PlayerRef.GetItemCount(fishingRod) != 0
			; Don't show L/R for fishing, we just want to know which rod is active
			int equipState = SLF_ItemMenu.EQUIPPED_NONE
			if fishingRod == equippedRod
				equipState = SLF_ItemMenu.EQUIPPED_WORN
			endif

			SLF_ItemMenu.AddEntryItem(fishingRod, equipState)
		endif

		i += 1
	endwhile

	Form selectedRod = SLF_ItemMenu.Show()
	if selectedRod != None && selectedRod != equippedRod
		; Unequip from left hand first
		if PlayerRef.GetEquippedWeapon(true) == selectedRod
			PlayerRef.UnequipItem(selectedRod, abSilent = true)
		endif

		; Game should default to right hand if it's not equipped already
		PlayerRef.EquipItem(selectedRod)

		; Equip function doesn't block, so wait until it's done
		int counter = 0
		while counter < 5 && PlayerRef.GetEquippedWeapon(false) != selectedRod
			Utility.Wait(0.1)
			counter += 1
		endwhile
	endif
EndFunction

Form Function GetEquippedRod()
	; Same logic as ccBGSSSE001_FishingSystemScript.GetCurrentFishingRodType()
	Weapon equippedWeaponRightHand = PlayerRef.GetEquippedWeapon(false)
	if equippedWeaponRightHand
		if ccBGSSSE001_FishingRods.Find(equippedWeaponRightHand) > -1
			return equippedWeaponRightHand
		endIf
	endIf

	Weapon equippedWeaponLeftHand = PlayerRef.GetEquippedWeapon(true)
	if equippedWeaponLeftHand
		if ccBGSSSE001_FishingRods.Find(equippedWeaponLeftHand) > -1
			return equippedWeaponLeftHand
		endif
	endif

	return None
EndFunction
