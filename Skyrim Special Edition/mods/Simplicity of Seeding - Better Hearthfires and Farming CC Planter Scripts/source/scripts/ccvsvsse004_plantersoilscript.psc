;/ Decompiled by Champollion V1.0.1
Source   : ccVSVSSE004_PlanterSoilScript.psc
Modified : 2021-08-19 08:15:45
Compiled : 2021-08-25 03:33:45
User     : builds
Computer : RKVBGSGPUVM04
/;
scriptName ccVSVSSE004_PlanterSoilScript extends ObjectReference

;-- Properties --------------------------------------
message property msgClearPlanter auto
Bool property IsPlanted auto hidden
ccvsvsse004_plantercontainerscript property PlanterContainer auto hidden
formlist property listPlantableItems auto

;-- Variables ---------------------------------------
Bool loaded

;-- Functions ---------------------------------------

function SetPlanted()

	self.GotoState("Planted")
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Function UpdateName()
	String sState
	If PlanterContainer.myPlantedFloraBase
		sState = PlanterContainer.myPlantedFloraBase.GetName()
	Else
		sState = Game.GetGameSettingString("sEmpty")
	EndIf
	SetDisplayName(GetBaseObject().GetName() + " (" + sState + ")")
	PO3_SKSEFunctions.UpdateCrosshairs()
EndFunction

function OnCellAttach()

	if !loaded
		PlanterContainer = self.GetLinkedRef(none) as ccvsvsse004_plantercontainerscript
		PlanterContainer.mySoilRef = self
		loaded = true
	endIf
	PlanterContainer.GrowPlantedItem()
	UpdateName()
	If IsPlanted 
		playAnimation("PlayAnim02")
	Else
		playAnimation("PlayAnim01")
	EndIf
endFunction

;-- State -------------------------------------------
auto state Empty

	function OnActivate(ObjectReference TriggerRef)

		actor containerActor = PlanterContainer as actor
		if containerActor
			ForceSingleDeposit()
			containerActor.ShowGiftMenu(true, listPlantableItems, true, false)
		else
			PlanterContainer.Activate(game.GetPlayer() as ObjectReference, false)
		endIf
	endFunction
endState

;-- State -------------------------------------------
state Planted

	function OnActivate(ObjectReference TriggerRef)

		if TriggerRef == game.GetPlayer() as ObjectReference
			SoSeedingQuestScript SoSeedingQuest = Game.GetFormFromFile(0x800, "Simplicity of Seeding.esp") as SoSeedingQuestScript
			SoSeedingQuest.Stop()
			SoSeedingQuest.Start()
			if SoSeedingQuest.ShowPlanterClearMessage((PlanterContainer as ccvsvsse004_plantercontainerscript).myPlantedFloraRef)
				(PlanterContainer as ccvsvsse004_plantercontainerscript).myPlantedFloraRef.Delete()
				(PlanterContainer as ccvsvsse004_plantercontainerscript).myPlantedFloraRef = none
				(PlanterContainer as ccvsvsse004_plantercontainerscript).myPlantedFloraBase = none
				self.playAnimation("PlayAnim01")
				self.GotoState("Empty")
				PlanterContainer.Activate(game.GetPlayer() as ObjectReference, false)
				UpdateName()
			endIf
		endIf
	endFunction

	function onEndState()

		IsPlanted = false
	endFunction

	function onBeginState()

		IsPlanted = true
	endFunction
endState

Function ForceSingleDeposit()
	RegisterForMenu("GiftMenu")
EndFunction

Event OnMenuOpen(String MenuName)
	If MenuName == "GiftMenu"
		UnregisterForMenu("GiftMenu")
		Utility.WaitMenuMode(0.1)
		UI.SetInt("GiftMenu", "_root.Menu_mc._quantityMinCount", -12878323)

		While UI.IsMenuOpen("GiftMenu")
			Utility.Wait(0.1)
		EndWhile
		UpdateName()
	EndIf
EndEvent