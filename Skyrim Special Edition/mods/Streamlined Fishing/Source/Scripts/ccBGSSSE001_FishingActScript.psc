Scriptname ccBGSSSE001_FishingActScript extends ObjectReference
{The main script attached to fishing supply items, which drives the majority of the fishing mechanic.}

ccBGSSSE001_FishingSystemScript Property FishingSystem Auto
{The system that handles all fishing gameplay mechanics.}

int Property BiomeType = 0 Auto
{What type of biome this set of fishing supplies is in. 0 = Temperate Stream, 1 = Temperate Lake, 2 = Arctic, 3 = Cave. Default: 0}

FormList Property myOverrideJunkCatchDataList Auto
{The junk override list to draw from for this set of fishing supplies, used for catching specific flavors of junk.}

Quest Property myQuest Auto
{(Optional) The quest, if any, this set of fishing supplies is associated with. Default: None}
FormList Property myQuestCatchDataList Auto
{(Optional) The quest item list to draw from for this set of fishing supplies. Default: None}
GlobalVariable Property myQuestAllowCatchGlobal Auto
{(Optional) The global variable that must be 1 to catch items from the Quest Catch Data List, if any. Intended use is to track when catching the quest item is allowed when a required Quest Stage will not work. Must be set externally (this script does not change the value). Default: None}
GlobalVariable Property myQuestItemCaughtGlobal Auto
{(Optional) The global variable that must be 0 to catch items from the Quest Catch Data List, if any. Intended use is to track when enough of the quest item has been caught. Must be set externally (this script does not change the value). Default: None}
float Property myQuestCatchChance = 1.00000 Auto
{(Optional) What chance do I have of catching the quest item? Default: 1.0}
int Property myQuestRequiredStage = -1 Auto
{(Optional) The minimum (or specific, if no RequiredStageMax set) quest stage required in order to catch items from the Quest Catch Data List, if any. Default: -1}
int Property myQuestRequiredStageMax = -1 Auto
{(Optional) The maximum quest stage required in order to catch items from the Quest Catch Data List, if any. Default: -1}
int Property myQuestStageToSet = -1 Auto
{(Optional) The quest stage to set once a quest item is caught. Default: -1}
int Property myQuestSetStageRequiredRodType = -1 Auto
{(Optional) If this rod type is used, set myQuestStageToSet when the first item is caught. RODTYPE_IMPERIAL = 0, RODTYPE_ALIKRI = 1, RODTYPE_ARGONIAN = 2, RODTYPE_DWARVEN = 3 Default: -1}

int currentFishPopulation = 0
bool wasMorningEvening = false
bool calculatedPopulationRecently = false

int Function GetCurrentFishPopulation()
	return currentFishPopulation
EndFunction

Function SetFishPopulation(int aiValue)
	currentFishPopulation = aiValue
EndFunction

bool Function GetWasMorningEvening()
	return wasMorningEvening
EndFunction

Function SetWasMorningEvening(bool abWasMorningEvening)
	wasMorningEvening = abWasMorningEvening
EndFunction

bool Function GetCalculatedPopulationRecently()
	return calculatedPopulationRecently
EndFunction

Function SetCalculatedPopulationRecently(bool akCalculatedRecently)
	calculatedPopulationRecently = akCalculatedRecently
EndFunction

ObjectReference Function GetFishingMarker()
	return self.GetLinkedRef(none)
EndFunction

bool Function CanCatchQuestItem()
	if !myQuestCatchDataList
		return false
	endif

	if myQuestRequiredStage > -1
		Int currentStage = myQuest.GetStage()
		if myQuestRequiredStageMax > -1
			if currentStage < myQuestRequiredStage || currentStage > myQuestRequiredStageMax
				return false
			endif
		elseIf currentStage != myQuestRequiredStage
			return false
		endif
	endif

	if myQuestItemCaughtGlobal && myQuestItemCaughtGlobal.GetValueInt() != 0
		return false
	endif

	if myQuestAllowCatchGlobal && myQuestAllowCatchGlobal.GetValueInt() != 1
		return false
	endif

	if myQuestSetStageRequiredRodType > -1 && FishingSystem.GetCurrentFishingRodType() != myQuestSetStageRequiredRodType
		return false
	endif

	if Utility.RandomFloat(0.0, 1.0) > myQuestCatchChance
		return false
	endif

	return true
EndFunction

Function UpdateFishCatchSuccess()
EndFunction

Function UpdateFish()
EndFunction

Function UpdateNibble()
EndFunction

Function ReduceFishPopulation(int aiAmount)
	currentFishPopulation -= aiAmount
	if currentFishPopulation < 0
		currentFishPopulation = 0
	endif
EndFunction

Function RegisterForPopulationUpdate(float afHours)
	self.RegisterForSingleUpdateGameTime(afHours)
EndFunction

Event OnUpdateGameTime()
	Debug.Trace("Fishing Supplies " + self + " OnUpdateGameTime()", 0)
	self.SetCalculatedPopulationRecently(false)
	self.SetWasMorningEvening(false)
	self.SetFishPopulation(0)
EndEvent

Auto State Waiting

	Event OnActivate(ObjectReference akActivatorRef)
		self.GotoState("busy")

		if akActivatorRef == Game.GetPlayer()
			SLF_UtilityScript SLF = Quest.GetQuest("SLF_MainQuest") as SLF_UtilityScript
			SLF.ChooseRod()

			FishingSystem.StartPlayerInteraction(self, false)
		endif

		self.GotoState("Waiting")
	EndEvent

EndState

State busy
EndState
