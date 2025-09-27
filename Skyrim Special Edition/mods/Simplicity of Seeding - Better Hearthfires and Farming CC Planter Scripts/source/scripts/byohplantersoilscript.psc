Scriptname BYOHPlanterSoilScript extends ObjectReference  

import debug
import utility

ObjectReference Property PlanterContainer auto hidden
ObjectReference property objSelf auto hidden

Bool Property AlreadyLoaded = FALSE Auto Hidden
int property clearPlanterChoice auto hidden
message property planterClearMessage auto

EVENT OnCellAttach()
	;debug.trace(self + " OnCellAttach")
	if AlreadyLoaded == FALSE
		;debug.trace(self + " OnCellAttach: DO ONCE")
		objSelf = self
		PlanterContainer = GetLinkedRef()
		(PlanterContainer as BYOHPlanterContainerScript).mySoilRef = objSelf
		AlreadyLoaded = TRUE
	endif
	(PlanterContainer as BYOHPlanterContainerScript).GrowPlantedItem()
	UpdateName()
	If GetState() == "planted"
		playAnimation("PlayAnim02")
	Else
		playAnimation("PlayAnim01")
	EndIf
endEVENT

Function UpdateName()
	Form plantedFloraBase = (PlanterContainer as BYOHPlanterContainerScript).plantedFloraBase
	String sState
	If plantedFloraBase
		sState = plantedFloraBase.GetName()
	Else
		sState = Game.GetGameSettingString("sEmpty")
	EndIf
	SetDisplayName(GetBaseObject().GetName() + " (" + sState + ")")
	PO3_SKSEFunctions.UpdateCrosshairs()
EndFunction

auto state empty
	EVENT OnActivate(ObjectReference TriggerRef)
		;debug.trace(self + " OnActivate")
		; temp
		actor containerActor = PlanterContainer as actor
		if containerActor
			;debug.trace(self + " ShowGiftMenu using filter = " + flPlanterPlantableItem)
			ForceSingleDeposit()
			containerActor.ShowGiftMenu(abGivingGift = true, apFilterList = flPlanterPlantableItem, abShowStolenItems = true, abUseFavorPoints = false)
		else
			PlanterContainer.Activate(Game.GetPlayer(), FALSE)
		endif
	endEVENT
endState

state planted
	EVENT OnActivate(ObjectReference TriggerRef)
		IF triggerRef == game.getPlayer()
			SoSeedingQuestScript SoSeedingQuest = Game.GetFormFromFile(0x800, "Simplicity of Seeding.esp") as SoSeedingQuestScript
			SoSeedingQuest.Stop()
			SoSeedingQuest.Start()
			if SoSeedingQuest.ShowPlanterClearMessage((PlanterContainer as BYOHPlanterContainerScript).plantedFloraRef)
				(PlanterContainer as BYOHPlanterContainerScript).plantedFloraRef.delete()
				(PlanterContainer as BYOHPlanterContainerScript).plantedFloraRef = none
				(PlanterContainer as BYOHPlanterContainerScript).plantedFloraBase = none
				; back to "unplanted" state
				playAnimation("PlayAnim01")
				self.goToState("empty")
				PlanterContainer.Activate(Game.GetPlayer(), FALSE)
				UpdateName()
			endif
		endIf
	endEVENT
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

FormList Property flPlanterPlantableItem auto
