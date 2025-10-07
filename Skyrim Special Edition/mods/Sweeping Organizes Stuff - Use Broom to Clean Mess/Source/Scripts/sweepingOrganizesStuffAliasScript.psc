Scriptname sweepingOrganizesStuffAliasScript extends ReferenceAlias  

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	If akBaseObject == broom01 && playerRef.GetCombatState() == 0
		Game.DisablePlayerControls(abCamSwitch=true)

		playerRef.SheatheWeapon()
		UnequipSlots()

		Utility.Wait(1)
		playerRef.PlayIdle(idleLooseSweepingStart)

		; Debug.ToggleCollisions()
		sweepingOrganizesStuffThreadAmmoQuest.Start()
		sweepingOrganizesStuffThreadArmorQuest.Start()
		sweepingOrganizesStuffThreadBookQuest.Start()
		sweepingOrganizesStuffThreadIngredientQuest.Start()
		sweepingOrganizesStuffThreadKeyQuest.Start()
		sweepingOrganizesStuffThreadMiscQuest.Start()
		sweepingOrganizesStuffThreadMovableStaticsQuest.Start()
		sweepingOrganizesStuffThreadPotionQuest.Start()
		sweepingOrganizesStuffThreadScrollQuest.Start()
		sweepingOrganizesStuffThreadSoulGemQuest.Start()
		sweepingOrganizesStuffThreadWeaponQuest.Start()
		sweepingOrganizesStuffThreadShelfQuest.Start()

		sweepingOrganizesStuffThreadAmmoQuest.Stop()
		sweepingOrganizesStuffThreadArmorQuest.Stop()
		sweepingOrganizesStuffThreadBookQuest.Stop()
		sweepingOrganizesStuffThreadIngredientQuest.Stop()
		sweepingOrganizesStuffThreadKeyQuest.Stop()
		sweepingOrganizesStuffThreadMiscQuest.Start()
		sweepingOrganizesStuffThreadMovableStaticsQuest.Stop()
		sweepingOrganizesStuffThreadPotionQuest.Stop()
		sweepingOrganizesStuffThreadScrollQuest.Stop()
		sweepingOrganizesStuffThreadSoulGemQuest.Stop()
		sweepingOrganizesStuffThreadWeaponQuest.Stop()
		sweepingOrganizesStuffThreadShelfQuest.Stop()

		sweepingOrganizesStuffThreadAmmoQuest.Reset()
		sweepingOrganizesStuffThreadArmorQuest.Reset()
		sweepingOrganizesStuffThreadBookQuest.Reset()
		sweepingOrganizesStuffThreadIngredientQuest.Reset()
		sweepingOrganizesStuffThreadKeyQuest.Reset()
		sweepingOrganizesStuffThreadMiscQuest.Reset()
		sweepingOrganizesStuffThreadMovableStaticsQuest.Reset()
		sweepingOrganizesStuffThreadPotionQuest.Reset()
		sweepingOrganizesStuffThreadScrollQuest.Reset()
		sweepingOrganizesStuffThreadSoulGemQuest.Reset()
		sweepingOrganizesStuffThreadWeaponQuest.Reset()
		sweepingOrganizesStuffThreadShelfQuest.Reset()

		While !sweepingOrganizesStuffThreadAmmoQuest.bDone && \
			!sweepingOrganizesStuffThreadArmorQuest.bDone && \
			!sweepingOrganizesStuffThreadBookQuest.bDone && \
			!sweepingOrganizesStuffThreadIngredientQuest.bDone && \
			!sweepingOrganizesStuffThreadKeyQuest.bDone && \
			!sweepingOrganizesStuffThreadMiscQuest.bDone && \
			!sweepingOrganizesStuffThreadMovableStaticsQuest.bDone && \
			!sweepingOrganizesStuffThreadPotionQuest.bDone && \
			!sweepingOrganizesStuffThreadScrollQuest.bDone && \
			!sweepingOrganizesStuffThreadSoulGemQuest.bDone && \
			!sweepingOrganizesStuffThreadWeaponQuest.bDone && \
			!sweepingOrganizesStuffThreadShelfQuest.bDone
			Utility.Wait(1)
		EndWhile

		; Debug.ToggleCollisions()
		Debug.Notification("Finished sweeping")

		Game.EnablePlayerControls()
		RegisterForAllKeys()
	EndIf
EndEvent

Function RegisterForAllKeys()
	int i = 281
	While i
		RegisterForKey(i)
		i -= 1
	EndWhile
EndFunction

Event OnKeyDown(int KeyCode)
	UnregisterForAllKeys()
	playerRef.PlayIdle(idleStop_Loose)
EndEvent

Function UnequipSlots()
	UnequipSlot(0)
	UnequipSlot(1)
EndFunction

Function UnequipSlot(int slot)
	int slotType = playerRef.GetEquippedItemType(slot)
	If slotType == 11 || slotType == 10
		playerRef.UnequipItem(playerRef.GetEquippedObject(slot))
	EndIf
EndFunction

MiscObject Property broom01 Auto
Idle Property idleLooseSweepingStart Auto
Idle Property idleStop_Loose Auto
Actor Property playerRef Auto

sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadAmmoQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadArmorQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadBookQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadIngredientQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadKeyQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadMiscQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadMovableStaticsQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadPotionQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadScrollQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadSoulGemQuest Auto
sweepingOrganizesStuffThreadScript Property sweepingOrganizesStuffThreadWeaponQuest Auto
sweepingOrganizesStuffShelfScript Property sweepingOrganizesStuffThreadShelfQuest Auto