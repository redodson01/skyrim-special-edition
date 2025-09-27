;/ Decompiled by Champollion V1.0.1
Source   : ccVSVSSE004_PlanterContainerScript.psc
Modified : 2021-08-19 08:15:45
Compiled : 2021-08-25 03:33:44
User     : builds
Computer : RKVBGSGPUVM04
/;
scriptName ccVSVSSE004_PlanterContainerScript extends Actor

;-- Properties --------------------------------------
objectreference property contPantry auto
message property msgItemPlanted auto
Float property chanceHarvestStart = 0.400000 auto
ccvsvsse004_restorefarmquestscript property qstRestoreFarm auto
globalvariable property GameDaysPassed auto
ccvsvsse004_plantersoilscript property mySoilRef auto hidden
form property myPlantedItem auto hidden
Float property chanceHarvestAdd = 0.200000 auto
formlist property listPlantableItems auto
Float property resetDays = 3.00000 auto
message property msgPrevItemRemoved auto
Float property growDays = 1.00000 auto
formlist property listPlantedFlora auto
ccvsvsse004_farmmodmanagerscript property modManager auto
form property myPlantedFloraBase auto hidden
objectreference property myPlantedFloraRef auto hidden
message property msgOnlyOne auto

;-- Variables ---------------------------------------
Float plantedTimestamp
Int plantedItemIndex
Float resetTimestamp
Bool containerProccessed

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function SetPlantedItem()

	containerProccessed = false
	if myPlantedFloraBase == none || myPlantedFloraBase != listPlantedFlora.getAt(plantedItemIndex)
		myPlantedFloraBase = listPlantedFlora.getAt(plantedItemIndex)
		plantedTimestamp = GameDaysPassed.GetValue()
		mySoilRef.playAnimation("PlayAnim02")
		if qstRestoreFarm.IsRunning() && qstRestoreFarm.GetStage() == 0
			qstRestoreFarm.CountCrops()
		endIf
	endIf
endFunction

function OnItemAdded(form akBaseItem, Int aiItemCount, objectreference akItemReference, objectreference akSourceContainer)

;	Int itemIndex = 0
;	Bool foundIt = false
;	while !foundIt && itemIndex < listPlantableItems.getSize()
;		if akBaseItem == listPlantableItems.getAt(itemIndex)
;			plantedItemIndex = itemIndex
;			foundIt = true
;		endIf
;		itemIndex += 1
;	endWhile

	int itemIndex = listPlantableItems.Find(akBaseItem)
	If itemIndex >= 0
		plantedItemIndex = itemIndex
	EndIf

	if myPlantedItem != none
		self.RemoveItem(myPlantedItem, 1, true, game.GetPlayer() as objectreference)
		myPlantedItem = akBaseItem
		msgPrevItemRemoved.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	else
		myPlantedItem = akBaseItem
	endIf
	if aiItemCount > 1
		self.RemoveItem(akBaseItem, aiItemCount - 1, true, game.GetPlayer() as objectreference)
		msgOnlyOne.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	else
		msgItemPlanted.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf

	UI.InvokeString("GiftMenu", "_global.skse.CloseMenu", "GiftMenu")

	if !containerProccessed
		containerProccessed = true
		utility.wait(0 as Float)
		self.SetPlantedItem()
	endIf
endFunction

function GrowPlantedItem()
	GoToState("busy")
	Float daysPassed = GameDaysPassed.GetValue()
	if myPlantedFloraRef == none && myPlantedItem != none && daysPassed - plantedTimestamp >= growDays
		resetTimestamp = daysPassed
		self.RemoveItem(myPlantedItem, 1, false, none)
		myPlantedItem = none
		myPlantedFloraRef = mySoilRef.placeAtMe(myPlantedFloraBase, 1, false, false)
		mySoilRef.SetPlanted()
		self.HarvestCrop()
	elseIf myPlantedFloraRef != none && daysPassed - resetTimestamp >= resetDays
		myPlantedFloraRef.Delete()
		myPlantedFloraRef = mySoilRef.placeAtMe(myPlantedFloraBase, 1, false, false)
		mySoilRef.SetPlanted()
		resetTimestamp = daysPassed
		self.HarvestCrop()
	endIf
	GoToState("")
endFunction

State busy
function GrowPlantedItem()
endFunction
EndState

; Skipped compiler generated GotoState

function OnInit()

	self.AddInventoryEventFilter(listPlantableItems as form)
endFunction

form function GetPlantedItem()

	if myPlantedItem != none
		return myPlantedItem
	elseIf myPlantedFloraBase != none
		return listPlantableItems.getAt(plantedItemIndex)
	else
		return none
	endIf
endFunction

function onCellAttach()

	self.GrowPlantedItem()
endFunction

function HarvestCrop()

	if modManager.GetHasHiredHelp() && myPlantedFloraRef != none
		form crop = self.GetPlantedItem()
		if contPantry.GetItemCount(crop) < modManager.maxCropPerTypeInPantry
			Float chance = chanceHarvestStart
			if modManager.HasFarmhand1
				chance += chanceHarvestAdd
			endIf
			if modManager.HasFarmhand2
				chance += chanceHarvestAdd
			endIf
			if modManager.HasBunkhouse
				chance += chanceHarvestAdd
			endIf
			if utility.RandomFloat(0.000000, 1.00000) < chance
				contPantry.AddItem(crop, 1, false)
			endIf
		endIf
	endIf
endFunction
