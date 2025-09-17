Scriptname ShovelBodyAliasScript extends ReferenceAlias  

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	If (akBaseObject == Shovel01 || akBaseObject == Shovel02) && playerRef.GetCombatState() == 0
		ObjectReference objr = Game.GetCurrentCrosshairRef()
		Actor a = objr as Actor
		If a && a.IsDead()
			If PO3_SKSEFunctions.GetQuestItems(a).Length == 0
				ShovelBody(a)
			ElseIf ShovelBodyQuestItemMessage.Show() == 0
				ShovelBody(a)
			EndIf
		ElseIf ShovelBodyAshPiles.HasForm(objr.GetBaseObject())
			ShovelAshPile(objr)
		EndIf
	EndIf
EndEvent

Function ShovelBody(Actor a)
	bool abMovement = Game.IsMovementControlsEnabled()
	bool abFighting = Game.IsFightingControlsEnabled()
	bool abCamSwitch = Game.IsCamSwitchControlsEnabled()
	bool abLooking = Game.IsLookingControlsEnabled()
	bool abSneaking = Game.IsSneakingControlsEnabled()
	bool abMenu = Game.IsMenuControlsEnabled()
	bool abActivate = Game.IsActivateControlsEnabled()
	bool abJournalTabs = Game.IsJournalControlsEnabled()

	Game.DisablePlayerControls(\
		abMovement=True,\
		abFighting=True,\
		abCamSwitch=True,\
		abLooking=True,\
		abSneaking=True,\
		abMenu=True,\
		abActivate=True,\
		abJournalTabs=True\
	)

	ObjectReference ShovelAnimationRef = PlayerRef.PlaceAtMe(ShovelAnimationMarker)
	ShovelAnimationRef.Activate(PlayerRef)

	float timeTotal = ShovelBodyQuest.delay
	float timeRemaining = timeTotal

	While timeRemaining > 0
		Utility.Wait(0.5)
		timeRemaining -= 0.5
		a.SetAlpha(timeRemaining / timeTotal)
	EndWhile

	a.MoveTo(ShovelBodyMarker)
	a.SetAlpha(1)

	Game.EnablePlayerControls(\
		abMovement=abMovement,\
		abFighting=abFighting,\
		abCamSwitch=abCamSwitch,\
		abLooking=abLooking,\
		abSneaking=abSneaking,\
		abMenu=abMenu,\
		abActivate=abActivate,\
		abJournalTabs=abJournalTabs\
	)

	ShovelAnimationRef.Activate(PlayerRef)

	ShovelAnimationRef.Disable()
	ShovelAnimationRef.Delete()
EndFunction

Function ShovelAshPile(ObjectReference a)
	bool abMovement = Game.IsMovementControlsEnabled()
	bool abFighting = Game.IsFightingControlsEnabled()
	bool abCamSwitch = Game.IsCamSwitchControlsEnabled()
	bool abLooking = Game.IsLookingControlsEnabled()
	bool abSneaking = Game.IsSneakingControlsEnabled()
	bool abMenu = Game.IsMenuControlsEnabled()
	bool abActivate = Game.IsActivateControlsEnabled()
	bool abJournalTabs = Game.IsJournalControlsEnabled()

	Game.DisablePlayerControls(\
		abMovement=True,\
		abFighting=True,\
		abCamSwitch=True,\
		abLooking=True,\
		abSneaking=True,\
		abMenu=True,\
		abActivate=True,\
		abJournalTabs=True\
	)

	ObjectReference ShovelAnimationRef = PlayerRef.PlaceAtMe(ShovelAnimationMarker)
	ShovelAnimationRef.Activate(PlayerRef)

	float timeTotal = ShovelBodyQuest.delay
	float timeRemaining = timeTotal
	float originalScale = a.GetScale()

	While timeRemaining > 0
		Utility.Wait(0.5)
		timeRemaining -= 0.5
		a.SetScale(originalScale * timeRemaining / timeTotal)
	EndWhile

	a.MoveTo(ShovelBodyMarker)
	a.SetScale(originalScale)

	Game.EnablePlayerControls(\
		abMovement=abMovement,\
		abFighting=abFighting,\
		abCamSwitch=abCamSwitch,\
		abLooking=abLooking,\
		abSneaking=abSneaking,\
		abMenu=abMenu,\
		abActivate=abActivate,\
		abJournalTabs=abJournalTabs\
	)

	ShovelAnimationRef.Activate(PlayerRef)

	ShovelAnimationRef.Disable()
	ShovelAnimationRef.Delete()
EndFunction

ObjectReference Property ShovelBodyMarker Auto

MiscObject Property Shovel01 Auto
MiscObject Property Shovel02 Auto

Message Property ShovelBodyQuestItemMessage Auto

Furniture Property ShovelAnimationMarker Auto
Actor Property PlayerRef Auto
ShovelBodyMCMScript Property ShovelBodyQuest Auto
FormList Property ShovelBodyAshPiles Auto