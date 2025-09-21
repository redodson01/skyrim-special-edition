Scriptname SkyrimUnboundModuleLocations extends SkyrimUnboundModule  

int Property ChoiceLocationType Auto Hidden
int Property ChoiceLocation Auto Hidden
int Property ChoiceLocalInhabitant Auto Hidden
bool Property ChoiceAlreadyAdventurer Auto Hidden
int Property ChoiceBounty = -1 Auto Hidden
int Property ChoiceSeason Auto Hidden
int Property ChoiceMonth Auto Hidden
int Property ChoiceTimeOfDay Auto Hidden

SkyrimUnboundQuestScript Property MainScript Auto
SkyrimUnboundModuleInventory Property Inventory Auto
SkyrimUnboundModuleAbilities Property Abilities Auto
SkyrimUnboundLocationsThread[] Property Threads Auto
SkyrimUnboundAddonQuestManager Property AddonQuestManager Auto
SkyrimUnboundLocalFactionManager Property LocalFactionManager Auto
SkyrimUnboundPredatorsDisabler Property PredatorsDisabler Auto

FormList Property LocationTypeLists Auto
FormList Property Markers_Cities Auto
FormList Property Markers_Towns Auto
FormList Property Markers_Inns Auto
FormList Property Markers_Wilderness Auto
FormList Property Markers_Borders Auto
FormList Property Markers_Docks Auto
FormList Property Markers_Temples Auto
FormList Property Markers_PlayerHomes Auto
FormList Property Markers_HomelessShelters Auto
FormList Property Markers_FactionHeadquarters Auto
FormList Property Markers_BanditCamps Auto
FormList Property Markers_WarlockLairs Auto
FormList Property Markers_VampireLairs Auto
FormList Property Markers_Other Auto
FormList Property HoldLists Auto
FormList Property HoldsWithJail Auto
FormList Property Hold_Eastmarch Auto
FormList Property Hold_Falkreath Auto
FormList Property Hold_Haafingar Auto
FormList Property Hold_Hjaalmarch Auto
FormList Property Hold_Pale Auto
FormList Property Hold_Reach Auto
FormList Property Hold_Rift Auto
FormList Property Hold_Whiterun Auto
FormList Property Hold_Winterhold Auto
FormList Property Hold_Solstheim Auto
FormList Property Hold_Other Auto
Faction[] Property CrimeFactions Auto
FormList Property SelectedLocationTypes Auto
FormList Property SelectedHolds Auto
FormList Property SuitableLocationTypes Auto
FormList Property SuitableLocations Auto
FormList Property SuitableLocationsConditionless Auto
FormList Property SuitableHolds Auto
FormList Property AllLocationsInSuitableHolds Auto
FormList Property LocationsConditional Auto
FormList Property LocationsConditionalDefault Auto
FormList Property ArmorsImperialFaction Auto
FormList Property ArmorsStormcloak Auto
FormList Property ArmorsDarkElfRacialOrSolstheimAddToRandom Auto
FormList Property LocationsDisableNearbyPredators Auto
FormList Property LocationsAlwaysGiveLightIfRandom Auto
ObjectReference Property MarkerTempleRavenRock Auto
Message Property SkyrimUnboundBountyMessage Auto
Message Property SkyrimUnboundNoBountyMessage Auto
GlobalVariable Property WEEnabled Auto
GlobalVariable Property GameMonth Auto
GlobalVariable Property GameDay Auto
GlobalVariable Property GameHour Auto
ObjectReference Property StartingLocationMarker Auto
GlobalVariable Property PlayerIsInhabitantOfRegion Auto
GlobalVariable Property PlayerIsInhabitantOfSettlement Auto
GlobalVariable Property AdventurerCommentsLocsDiscoveredReq Auto
FormList Property AutoLocalInhabitantSettlementLocations Auto
FormList Property AutoLocalInhabitantRegionLocations Auto
FormList Property AutoLocalInhabitantExcludedLocations Auto
FormList Property CitizenLocations Auto
FormList Property CitizenCities Auto
FormList Property CitizenGlobals Auto
GlobalVariable Property SkyrimInhabitant Auto
GlobalVariable Property SolstheimInhabitant Auto
GlobalVariable Property RiftenCitizen Auto
GlobalVariable Property MarkarthCitizen Auto
GlobalVariable Property WhiterunCitizen Auto
GlobalVariable Property MorthalCitizen Auto
Location Property DLC2SolstheimLocation Auto
Location Property TamrielLocation Auto
Location Property RiftenLocation Auto
Worldspace Property Tamriel Auto
Quest Property DialogueCrimeGuards  Auto
Quest Property RelationshipMarriage Auto
Quest Property DialogueRiftenMaul Auto
Quest Property DialogueRiftenGateGuards Auto
Quest Property DialogueMarkarth Auto
Quest Property DialogueWhiterun Auto
Quest Property DialogueSolitudeGuardIntro Auto
ObjectReference Property MS14HouseTriggerRef Auto

ObjectReference Property DLC2InitTrigger Auto
GlobalVariable Property DLC2RRGjalundInit Auto
GlobalVariable Property DLC2RRASForce Auto
Quest Property DLC2RRArrivalScene Auto

ObjectReference Property MarkerWhiterunValtheimTowers Auto
ObjectReference Property MarkerBorderMorrowindRift Auto
ObjectReference Property MarkerBanditBannermistTower Auto
ObjectReference Property MarkerBanditTraitorsPost Auto
ObjectReference Property MarkerBanditKnifepointRidge Auto
ObjectReference Property MarkerWarlockCragwallowSlope Auto
ObjectReference Property MarkerWarlockIlinaltasDeep Auto
ObjectReference Property MarkerWarlockMorvunskar Auto
ObjectReference Property MarkerWarlockHobsFallCave Auto
ObjectReference Property MarkerVampireMarasEyeDen Auto
ObjectReference Property MarkerVampireBloodletThrone Auto
ObjectReference Property MarkerVampirePinemoonCave Auto
ObjectReference Property MarkerVampireBrokenFangCave Auto

Quest Property CW01A Auto
Quest Property CW01B Auto
Quest Property CW01AOutfitImperial Auto
ObjectReference Property MarkerFactionStartImperials Auto
ObjectReference Property MarkerFactionStartStormcloaks Auto

ObjectReference Property SkyrimUnboundMarkerBeggarsRow Auto
ObjectReference Property SkyrimUnboundMarkerWarrens Auto
ObjectReference Property SkyrimUnboundMarkerAbandonedBuilding Auto
ObjectReference Property BeggarsRowPlayerBedroll Auto
ObjectReference Property AbandonedBuildingPlayerBedroll Auto
Key Property MarkarthWarrensCosnachRoomKey Auto
Faction Property MarkarthCosnachFaction Auto
Faction Property MarkarthWarrensTenantsFaction Auto
Faction Property DLC2RRBeggarFaction Auto

Quest Property HousePurchase Auto
ObjectReference Property SkyrimUnboundMarkerBreezehome Auto
ObjectReference Property SkyrimUnboundMarkerHoneyside Auto
ObjectReference Property SkyrimUnboundMarkerProudspireManor Auto
ObjectReference Property SkyrimUnboundMarkerVlindrelHall Auto
ObjectReference Property SolitudePlayerHouseDecorateAlchemy Auto
ObjectReference Property SolitudePlayerHouseDecorateBedroom Auto
ObjectReference Property SolitudePlayerHouseDecorateEnchanting Auto
ObjectReference Property SolitudePlayerHouseDecorateKitchen Auto
ObjectReference Property SolitudePlayerHouseDecorateLivingRoom Auto
ObjectReference Property SolitudePlayerHouseDecoratePorch Auto
ObjectReference Property MarkarthPlayerHouseDecorateAlchemyDisable Auto
ObjectReference Property MarkarthPlayerHouseDecorateAlchemy Auto
ObjectReference Property MarkarthPlayerHouseDecorateBedroom Auto
ObjectReference Property MarkarthPlayerHouseDecorateEnchanting Auto
ObjectReference Property MarkarthPlayerHouseDecorateHallway Auto
ObjectReference Property MarkarthPlayerHouseDecorateLivingRoom Auto
ObjectReference Property WhiterunPlayerHouseAlchemyLaboratoryStart Auto
ObjectReference Property WhiterunPlayerHouseBedroomStart Auto
ObjectReference Property WhiterunPlayerHouseDiningRoomStart Auto
ObjectReference Property WhiterunPlayerHouseKitchenStart Auto
ObjectReference Property WhiterunPlayerHouseLoftStart Auto
ObjectReference Property WhiterunPlayerHouseAlchemyLaboratory Auto
ObjectReference Property WhiterunPlayerHouseDecorateBedroom Auto
ObjectReference Property WhiterunPlayerHouseDecorateDiningRoom Auto
ObjectReference Property WhiterunPlayerHouseDecorateKitchen Auto
ObjectReference Property WhiterunPlayerHouseDecorateLivingRoom Auto
ObjectReference Property WhiterunPlayerHouseDecorateLoft Auto
ObjectReference Property RiftenPlayerHouseDecorateEnchantingDisable Auto
ObjectReference Property RiftenPlayerHouseDecorateAlchemy Auto
ObjectReference Property RiftenPlayerHouseDecorateBedroom Auto
ObjectReference Property RiftenPlayerHouseDecorateEnchanting Auto
ObjectReference Property RiftenPlayerHouseDecorateGarden Auto
ObjectReference Property RiftenPlayerHouseDecorateKitchen Auto
ObjectReference Property RiftenPlayerHouseDecoratePorch Auto


Form Property FinalLocation Auto Hidden
FormList Property FinalHoldList Auto Hidden
FormList Property FinalLocationTypeList Auto Hidden
ObjectReference Property FinalTeleportMarker Auto Hidden

string[] ValidJsonProperties_Locations
string[] ValidJsonProperties_LocationTypes
string[] ValidJsonProperties_LocationConditions
string[] ValidJsonValues_LocationFlags
string[] ValidJsonProperties_Holds
string[] ValidJsonProperties_HoldConditions
string[] ValidJsonValues_Races
string[] ValidJsonValues_ArmorTypes
string[] ValidJsonValues_Headgear

int BountyToShow = -1


function BeforeLoadingAddons()

	ValidJsonProperties_Locations = new string[15]
	ValidJsonProperties_Locations[0] = "fLocation"
	ValidJsonProperties_Locations[1] = "sName"
	ValidJsonProperties_Locations[2] = "sType"
	ValidJsonProperties_Locations[3] = "fLocationTypeList"
	ValidJsonProperties_Locations[4] = "sHold"
	ValidJsonProperties_Locations[5] = "fHoldList"
	ValidJsonProperties_Locations[6] = "sForceLocation"
	ValidJsonProperties_Locations[7] = "fQuest"
	ValidJsonProperties_Locations[8] = "sParam"
	ValidJsonProperties_Locations[9] = "sAutoLocalInhabitant"
	ValidJsonProperties_Locations[10] = "iAutoBounty"
	ValidJsonProperties_Locations[11] = "conditions"
	ValidJsonProperties_Locations[12] = "sFlags"
	ValidJsonProperties_Locations[13] = "fAdditionalFriendFactions"
	ValidJsonProperties_Locations[14] = "fAdditionalFriendFactionsInteriorOnly"

	ValidJsonProperties_LocationTypes = new string[9]
	ValidJsonProperties_LocationTypes[0] = "fLocationTypeList"
	ValidJsonProperties_LocationTypes[1] = "sName"
	ValidJsonProperties_LocationTypes[2] = "sDescription"
	ValidJsonProperties_LocationTypes[3] = "fQuest"
	ValidJsonProperties_LocationTypes[4] = "sParam"
	ValidJsonProperties_LocationTypes[5] = "sAutoLocalInhabitant"
	ValidJsonProperties_LocationTypes[6] = "iAutoBounty"
	ValidJsonProperties_LocationTypes[7] = "conditions"
	ValidJsonProperties_LocationTypes[8] = "sFlags"

	ValidJsonProperties_LocationConditions = new string[17]
	ValidJsonProperties_LocationConditions[0] = "never"
	ValidJsonProperties_LocationConditions[1] = "raceIs"
	ValidJsonProperties_LocationConditions[2] = "raceIsNot"
	ValidJsonProperties_LocationConditions[3] = "isVampire"
	ValidJsonProperties_LocationConditions[4] = "isWerewolf"
	ValidJsonProperties_LocationConditions[5] = "hasSpells"
	ValidJsonProperties_LocationConditions[6] = "hasWeapon"
	ValidJsonProperties_LocationConditions[7] = "hasWeaponOrSpells"
	ValidJsonProperties_LocationConditions[8] = "wealthMin"
	ValidJsonProperties_LocationConditions[9] = "wealthMax"
	ValidJsonProperties_LocationConditions[10] = "armorTypeIs"
	ValidJsonProperties_LocationConditions[11] = "armorIs"
	ValidJsonProperties_LocationConditions[12] = "armorIsNot"
	ValidJsonProperties_LocationConditions[13] = "armorAddToRandom"
	ValidJsonProperties_LocationConditions[14] = "isInRags"
	ValidJsonProperties_LocationConditions[15] = "headgearIs"
	ValidJsonProperties_LocationConditions[16] = "hasBounty"

	ValidJsonValues_LocationFlags = new string[2]
	ValidJsonValues_LocationFlags[0] = "DisableNearbyPredators"
	ValidJsonValues_LocationFlags[1] = "AlwaysGiveLightIfRandom"

	ValidJsonProperties_Holds = new string[4]
	ValidJsonProperties_Holds[0] = "fHoldList"
	ValidJsonProperties_Holds[1] = "sName"
	ValidJsonProperties_Holds[2] = "fCrimeFaction"
	ValidJsonProperties_Holds[3] = "conditions"

	ValidJsonProperties_HoldConditions = new string[1]
	ValidJsonProperties_HoldConditions[0] = "armorAddToRandomList"

	ValidJsonValues_Races = new string[10]
	ValidJsonValues_Races[0] = "Argonian"
	ValidJsonValues_Races[1] = "Breton"
	ValidJsonValues_Races[2] = "Dark Elf"
	ValidJsonValues_Races[3] = "Imperial"
	ValidJsonValues_Races[4] = "High Elf"
	ValidJsonValues_Races[5] = "Khajiit"
	ValidJsonValues_Races[6] = "Nord"
	ValidJsonValues_Races[7] = "Orc"
	ValidJsonValues_Races[8] = "Redguard"
	ValidJsonValues_Races[9] = "Wood Elf"

	ValidJsonValues_ArmorTypes = new string[3]
	ValidJsonValues_ArmorTypes[0] = "Clothes"
	ValidJsonValues_ArmorTypes[1] = "Light"
	ValidJsonValues_ArmorTypes[2] = "Heavy"

	ValidJsonValues_Headgear = new string[3]
	ValidJsonValues_Headgear[0] = "Nothing"
	ValidJsonValues_Headgear[1] = "Default"
	ValidJsonValues_Headgear[2] = "Hood"

	LocationsConditional.AddForms(LocationsConditionalDefault.ToArray())

endFunction

function LoadAddon(string fileName)

	int i = 0
	int len = JsonUtil.PathCount(fileName, ".locations")
	while i < len
		ImportLocation(fileName, ".locations[" + i + "]")
		i += 1
	endwhile

	i = 0
	len = JsonUtil.PathCount(fileName, ".holds")
	while i < len
		ImportHold(fileName, ".holds[" + i + "]")
		i += 1
	endwhile

	i = 0
	len = JsonUtil.PathCount(fileName, ".locationTypes")
	while i < len
		ImportLocationType(fileName, ".locationTypes[" + i + "]")
		i += 1
	endwhile

endFunction

function AfterLoadingAddons()
	LocationTypeLists.AddForm(Markers_Other)
	HoldLists.AddForm(Hold_Other)
endFunction

function ImportHold(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_Holds)

	Form fHoldList = GetJsonForm(fileName, elPath, ".fHoldList", true)
	if !fHoldList
		return
	elseif !(fHoldList as FormList)
		ShowAddonLoadingError(fileName, elPath, "fHoldList is of an unsupported Form type (allowed types: FormList)")
		return
	endif

	string sName = GetJsonString(fileName, elPath, ".sName", true)
	if !sName
		return
	endif
	StorageUtil.SetStringValue(fHoldList, "SkyrimUnbound_Name", sName)
	
	Form fCrimeFaction = GetJsonForm(fileName, elPath, ".fCrimeFaction", false)
	if fCrimeFaction
		if fCrimeFaction as Faction
			StorageUtil.SetFormValue(fHoldList, "SkyrimUnbound_CrimeFaction", fCrimeFaction)
		else
			ShowAddonLoadingError(fileName, elPath, "fCrimeFaction is of an unsupported Form type (allowed types: Faction)")
			return
		endif
	endif

	HoldLists.AddForm(fHoldList)
	if fCrimeFaction
		HoldsWithJail.AddForm(fHoldList)
	endif

	if JsonUtil.CanResolvePath(fileName, elPath + ".conditions")
		ReportUnknownJsonProperties(fileName, elPath + ".conditions", ValidJsonProperties_HoldConditions)

		LocationsConditional.AddForm(fHoldList)

		ImportArmorListCondition(fHoldList, fileName, elPath, ".conditions.armorAddToRandom", "SkyrimUnbound_Condition_ArmorAddToRandom", false, false)
	endif

endFunction

function ImportLocationType(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_LocationTypes)

	Form fLocationTypeList = GetJsonForm(fileName, elPath, ".fLocationTypeList", true)
	if !fLocationTypeList
		return
	elseif !(fLocationTypeList as FormList)
		ShowAddonLoadingError(fileName, elPath, "fLocationTypeList is of an unsupported type (allowed types: FormList)")
		return
	endif

	string sName = GetJsonString(fileName, elPath, ".sName", true)
	if !sName
		return
	endif
	StorageUtil.SetStringValue(fLocationTypeList, "SkyrimUnbound_Name", sName)

	string sDescription = GetJsonString(fileName, elPath, ".sDescription", false)
	if sDescription
		StorageUtil.SetStringValue(fLocationTypeList, "SkyrimUnbound_Description", sDescription)
	endif

	if !ImportCommonLocationProperties(fileName, elPath, fLocationTypeList, true)
		return
	endif

	LocationTypeLists.AddForm(fLocationTypeList)

endFunction

function ImportLocation(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_Locations)

	Form fLocation = GetJsonForm(fileName, elPath, ".fLocation", true)
	if !fLocation
		return
	elseif !(fLocation as ObjectReference || fLocation as FormList)
		ShowAddonLoadingError(fileName, elPath, "fLocation is of an unsupported type (allowed types: ObjectReference, FormList)")
		return
	endif

	string sName = GetJsonString(fileName, elPath, ".sName", false)
	if !sName
		ObjectReference locationRef = fLocation as ObjectReference
		if !locationRef
			FormList locationList = fLocation as FormList
			if locationList && locationList.GetSize()
				locationRef = LocationList.GetAt(0) as ObjectReference
			endif
		endif
		Form parentCell = locationRef.GetParentCell()
		if parentCell
			sName = parentCell.GetName()
		endif
		if !sName
			Form parentLocation = locationRef.GetCurrentLocation()
			if parentLocation
				sName = parentLocation.GetName()
			endif
			if !sName
				Form parentWorldspace = locationRef.GetWorldspace()
				if parentWorldspace
					sName = parentWorldspace.GetName()
				endif
				if !sName
					ShowAddonLoadingError(fileName, elPath, "sName is not set and can't retrieve it automatically\n\nfLocation: " \
						+ fLocation + " (GetType()=" + fLocation.GetType() + ")\nParent cell: " + parentCell + " (name=" + parentCell.GetName() + ")\nParent location: " \
						+ parentLocation + " (name=" + parentLocation.GetName() + ")")
					return
				endif
			endif
		endif
	endif
	if sName
		StorageUtil.SetStringValue(fLocation, "SkyrimUnbound_Name", sName)
	endif

	string sType = GetJsonString(fileName, elPath, ".sType", false)
	FormList fLocationTypeList
	if !sType
		Form fLocationTypeList_Form = GetJsonForm(fileName, elPath, ".fLocationTypeList", false)
		fLocationTypeList = fLocationTypeList_Form as FormList
		if fLocationTypeList_Form && !fLocationTypeList
			ShowAddonLoadingError(fileName, elPath, "fLocationTypeList is of an unsupported type (allowed types: FormList)")
			return
		endif
	elseif sType == "Other"
		fLocationTypeList = Markers_Other
	elseif sType == "Player Home"
		fLocationTypeList = Markers_PlayerHomes
	elseif sType == "Town"
		fLocationTypeList = Markers_Towns
	elseif sType == "City"
		fLocationTypeList = Markers_Cities
	elseif sType == "Inn"
		fLocationTypeList = Markers_Inns
	elseif sType == "Wilderness"
		fLocationTypeList = Markers_Wilderness
	elseif sType == "Bandit Camp"
		fLocationTypeList = Markers_BanditCamps
	elseif sType == "Warlock Lair"
		fLocationTypeList = Markers_WarlockLairs
	elseif sType == "Vampire Lair"
		fLocationTypeList = Markers_VampireLairs
	elseif sType == "Temple"
		fLocationTypeList = Markers_Temples
	elseif sType == "Docks"
		fLocationTypeList = Markers_Docks
	elseif sType == "Border"
		fLocationTypeList = Markers_Borders
	elseif sType == "Faction Headquarters"
		fLocationTypeList = Markers_FactionHeadquarters
	elseif sType == "Homeless Shelter"
		fLocationTypeList = Markers_HomelessShelters
	else
		ShowAddonLoadingError(fileName, elPath, "Unknown sType value: \"" + sType + "\"")
		return
	endif

	FormList fHoldList
	string sHold = GetJsonString(fileName, elPath, ".sHold", false)
	if !sHold
		Form fHoldList_Form = GetJsonForm(fileName, elPath, ".fHoldList", false)
		fHoldList = fHoldList_Form as FormList
		if fHoldList_Form && !fHoldList
			ShowAddonLoadingError(fileName, elPath, "fHoldList is of an unsupported type (allowed types: FormList)")
			return
		endif
	elseif sHold == "Eastmarch"
		fHoldList = Hold_Eastmarch
	elseif sHold == "Falkreath"
		fHoldList = Hold_Falkreath
	elseif sHold == "Haafingar"
		fHoldList = Hold_Haafingar
	elseif sHold == "Hjaalmarch"
		fHoldList = Hold_Hjaalmarch
	elseif sHold == "The Pale"
		fHoldList = Hold_Pale
	elseif sHold == "The Reach"
		fHoldList = Hold_Reach
	elseif sHold == "The Rift"
		fHoldList = Hold_Rift
	elseif sHold == "Whiterun"
		fHoldList = Hold_Whiterun
	elseif sHold == "Winterhold"
		fHoldList = Hold_Winterhold
	elseif sHold == "Solstheim"
		fHoldList = Hold_Solstheim
	elseif sHold == "Other"
		fHoldList = Hold_Other
	else
		ShowAddonLoadingError(fileName, elPath, "Unknown sHold value: \"" + sHold + "\"")
		return
	endif

	string sForceLocation = GetJsonString(fileName, elPath, ".sForceLocation", false)
	if sForceLocation
		string[] LocationNames = new string[16]
		LocationNames[0] = "Dawnstar"
		LocationNames[1] = "Falkreath"
		LocationNames[2] = "Markarth"
		LocationNames[3] = "Morthal"
		LocationNames[4] = "Riften"
		LocationNames[5] = "Solitude"
		LocationNames[6] = "Whiterun"
		LocationNames[7] = "Windhelm"
		LocationNames[8] = "Winterhold"
		LocationNames[9] = "Raven Rock"
		LocationNames[10] = "Dragon Bridge"
		LocationNames[11] = "Ivarstead"
		LocationNames[12] = "Karthwasten"
		LocationNames[13] = "Riverwood"
		LocationNames[14] = "Rorikstead"
		LocationNames[15] = "Shor's Stone"
		int LocationNameIndex = LocationNames.Find(sForceLocation)
		if LocationNameIndex > -1
			StorageUtil.SetIntValue(fLocation, "SkyrimUnbound_ForceLocation", LocationNameIndex + 1)
		else
			ShowAddonLoadingError(fileName, elPath, "Unknown sForceLocation value: \"" + sForceLocation + "\"")
		endif
	endif

	if !ImportCommonLocationProperties(fileName, elPath, fLocation, false)
		return
	endif

	Form[] fAdditionalFriendFactions = GetJsonFormArray(fileName, elPath, ".fAdditionalFriendFactions", false)
	if fAdditionalFriendFactions.Length
		if fLocationTypeList == Markers_BanditCamps || fLocationTypeList == Markers_WarlockLairs || fLocationTypeList == Markers_VampireLairs
			int i = fAdditionalFriendFactions.Length
			while i > 0
				i -= 1
				Form nthFaction = fAdditionalFriendFactions[i]
				if nthFaction as Faction
					StorageUtil.FormListAdd(fLocation, "SkyrimUnbound_AdditionalFriendFactions", nthFaction, false)
				else
					ShowAddonLoadingError(fileName, elPath, "fAdditionalFriendFactions[" + i + "] is of an unsupported type (allowed types: Faction)")
				endif
			endwhile
		else
			ShowAddonLoadingError(fileName, elPath, "fAdditionalFriendFactions is only supported for the following location types: Bandit Camp, Warlock Lair, Vampire Lair")
		endif
	endif
	Form[] fAdditionalFriendFactionsInteriorOnly = GetJsonFormArray(fileName, elPath, ".fAdditionalFriendFactionsInteriorOnly", false)
	if fAdditionalFriendFactionsInteriorOnly.Length
		if fLocationTypeList == Markers_BanditCamps || fLocationTypeList == Markers_WarlockLairs || fLocationTypeList == Markers_VampireLairs
			int i = fAdditionalFriendFactionsInteriorOnly.Length
			while i > 0
				i -= 1
				Form nthFaction = fAdditionalFriendFactionsInteriorOnly[i]
				if nthFaction as Faction
					StorageUtil.FormListAdd(fLocation, "SkyrimUnbound_AdditionalFriendFactionsInteriorOnly", nthFaction, false)
				else
					ShowAddonLoadingError(fileName, elPath, "fAdditionalFriendFactionsInteriorOnly[" + i + "] is of an unsupported type (allowed types: Faction)")
				endif
			endwhile
		else
			ShowAddonLoadingError(fileName, elPath, "fAdditionalFriendFactionsInteriorOnly is only supported for the following location types: Bandit Camp, Warlock Lair, Vampire Lair")
		endif
	endif

	if fLocationTypeList
		fLocationTypeList.AddForm(fLocation)
	endif
	if fHoldList
		fHoldList.AddForm(fLocation)
	endif

endFunction

bool function ImportCommonLocationProperties(string fileName, string elPath, Form locationForm, bool isLocType)
{imports properties common to locations and location types}

	Form fQuest = GetJsonForm(fileName, elPath, ".fQuest", false)
	if fQuest
		if fQuest as Quest
			StorageUtil.SetFormValue(locationForm, "SkyrimUnbound_Quest", fQuest) 
		else
			ShowAddonLoadingError(fileName, elPath, "fQuest is of an unsupported type (allowed types: Quest)")
			return false
		endif
	endif
	string sParam = GetJsonString(fileName, elPath, ".sParam", false)
	if sParam
		StorageUtil.SetStringValue(locationForm, "SkyrimUnbound_LocationParam", sParam)
	endif

	string sAutoLocalInhabitant = GetJsonString(fileName, elPath, ".sAutoLocalInhabitant", false)
	if sAutoLocalInhabitant
		if sAutoLocalInhabitant == "Settlement"
			AutoLocalInhabitantSettlementLocations.AddForm(locationForm)
		elseif sAutoLocalInhabitant == "Region"
			AutoLocalInhabitantRegionLocations.AddForm(locationForm)
		elseif sAutoLocalInhabitant == "Disabled"
			AutoLocalInhabitantExcludedLocations.AddForm(locationForm)
		else
			ShowAddonLoadingError(fileName, elPath, "Unknown sAutoLocalInhabitant value \"" + sAutoLocalInhabitant + "\"")
		endif
	endif

	int[] iAutoBounty = GetJsonIntArray(fileName, elPath, ".iAutoBounty", false, 3)
	if iAutoBounty.Length
		if iAutoBounty[2] < -1 || iAutoBounty[2] > 100
			ShowAddonLoadingError(fileName, elPath, "iAutoBounty chance must be between -1 and 100")
		else
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_AutoBountyMin", iAutoBounty[0])
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_AutoBountyMax", iAutoBounty[1])
			if iAutoBounty[2] == 0
				StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_AutoBountyChance", -2)
			else
				StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_AutoBountyChance", iAutoBounty[2])
			endif
		endif	
	endif

	string[] flags = GetJsonStringArray(fileName, elPath, ".sFlags", false, checkForInvalidValues = true, validValues = ValidJsonValues_LocationFlags)
	if flags.Length
		if flags.Find("DisableNearbyPredators") > -1
			LocationsDisableNearbyPredators.AddForm(locationForm)
		endif
		if flags.Find("AlwaysGiveLightIfRandom") > -1
			LocationsAlwaysGiveLightIfRandom.AddForm(locationForm)
		endif
	endif

	ImportLocationConditions(fileName, elPath, locationForm, isLocType)

	return true

endFunction

function ImportLocationConditions(string fileName, string elPath, Form locationForm, bool isLocType)

	if !JsonUtil.CanResolvePath(fileName,  elPath + ".conditions")
		return
	endif
	ReportUnknownJsonProperties(fileName, elPath + ".conditions", ValidJsonProperties_LocationConditions)

	LocationsConditional.AddForm(locationForm)

	int never = GetJsonInt(fileName, elPath, ".conditions.never", false)
	if never != MISSING_INT
		if never == 1 || (never == -1 && !isLocType)
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_Never", never)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid never value: " + never + " (allowed values: 1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid never value: " + never + " (allowed values: 1/-1)")
			endif
		endif
	endif

	string[] raceIs = GetJsonStringArray(fileName, elPath, ".conditions.raceIs", false, checkForInvalidValues = true, validValues = ValidJsonValues_Races, allowEmpty = !isLocType, elementIfEmpty = "RESET")
	string[] raceIsNot = GetJsonStringArray(fileName, elPath, ".conditions.raceIsNot", false, checkForInvalidValues = true, validValues = ValidJsonValues_Races, allowEmpty = !isLocType, elementIfEmpty = "RESET")
	if raceIs.Length && raceIsNot.Length
		ShowAddonLoadingError(fileName, elPath, "Can't have both raceIs and raceIsNot on the same form")
	elseif raceIs.Length
		StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_Race", 1)
		if raceIs[0] != "RESET"
			StorageUtil.StringListCopy(locationForm, "SkyrimUnbound_Condition_RaceIs", raceIs)
		endif
	elseif raceIsNot.Length
		StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_Race", 1)
		if raceIsNot[0] != "RESET"
			StorageUtil.StringListCopy(locationForm, "SkyrimUnbound_Condition_RaceIsNot", raceIsNot)
		endif
	endif

	int hasSpells = GetJsonInt(fileName, elPath, ".conditions.hasSpells", false)
	if hasSpells != MISSING_INT
		if hasSpells == 0 || hasSpells == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasSpells", hasSpells + 1)
		elseif hasSpells == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasSpells", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid hasSpells value: " + hasSpells + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid hasSpells value: " + hasSpells + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	int hasWeapon = GetJsonInt(fileName, elPath, ".conditions.hasWeapon", false)
	if hasWeapon != MISSING_INT
		if hasWeapon == 0 || hasWeapon == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasWeapon", hasWeapon + 1)
		elseif hasWeapon == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasWeapon", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid hasWeapon value: " + hasWeapon + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid hasWeapon value: " + hasWeapon + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	int hasWeaponOrSpells = GetJsonInt(fileName, elPath, ".conditions.hasWeaponOrSpells", false)
	if hasWeaponOrSpells != MISSING_INT
		if hasWeaponOrSpells == 0 || hasWeaponOrSpells == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasWeaponOrSpells", hasWeaponOrSpells + 1)
		elseif hasWeaponOrSpells == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasWeaponOrSpells", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid hasWeaponOrSpells value: " + hasWeaponOrSpells + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid hasWeaponOrSpells value: " + hasWeaponOrSpells + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	int isInRags = GetJsonInt(fileName, elPath, ".conditions.isInRags", false)
	if isInRags != MISSING_INT
		if isInRags == 0 || isInRags == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_IsInRags", isInRags + 1)
		elseif isInRags == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_IsInRags", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid isInRags value: " + isInRags + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid isInRags value: " + isInRags + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	int isVampire = GetJsonInt(fileName, elPath, ".conditions.isVampire", false)
	if isVampire != MISSING_INT
		if isVampire == 0 || isVampire == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_IsVampire", isVampire + 1)
		elseif isVampire == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_IsVampire", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid isVampire value: " + isVampire + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid isVampire value: " + isVampire + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	int isWerewolf = GetJsonInt(fileName, elPath, ".conditions.isWerewolf", false)
	if isWerewolf != MISSING_INT
		if isWerewolf == 0 || isWerewolf == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_IsWerewolf", isWerewolf + 1)
		elseif isWerewolf == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_IsWerewolf", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid isWerewolf value: " + isWerewolf + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid isWerewolf value: " + isWerewolf + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	int wealthMin = GetJsonInt(fileName, elPath, ".conditions.wealthMin", false)
	if wealthMin != MISSING_INT
		if (wealthMin >= 1 && wealthMin <= 4) || (wealthMin == -1 && !isLocType)
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_wealthMin", wealthMin)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid wealthMin value: " + wealthMin + " (allowed values: 1-4)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid wealthMin value: " + wealthMin + " (allowed values: 1-4/-1)")
			endif
		endif
	endif

	int wealthMax = GetJsonInt(fileName, elPath, ".conditions.wealthMax", false)
	if wealthMax != MISSING_INT
		if (wealthMax >= 1 && wealthMax <= 4) || (wealthMax == -1 && !isLocType)
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_WealthMax", wealthMax)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid wealthMax value: " + wealthMax + " (allowed values: 1-4)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid wealthMax value: " + wealthMax + " (allowed values: 1-4/-1)")
			endif
		endif
	endif

	int hasBounty = GetJsonInt(fileName, elPath, ".conditions.hasBounty", false)
	if hasBounty != MISSING_INT
		if hasBounty == 0 || hasBounty == 1
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasBounty", hasBounty + 1)
		elseif hasBounty == -1 && !isLocType
			StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasBounty", -1)
		else
			if isLocType
				ShowAddonLoadingError(fileName, elPath, "Invalid hasBounty value: " + hasBounty + " (allowed values: 0/1)")
			else
				ShowAddonLoadingError(fileName, elPath, "Invalid hasBounty value: " + hasBounty + " (allowed values: 0/1/-1)")
			endif
		endif
	endif

	string[] armorTypeIs = GetJsonStringArray(fileName, elPath, ".conditions.armorTypeIs", false, checkForInvalidValues = true, validValues = ValidJsonValues_ArmorTypes, allowEmpty = !isLocType, elementIfEmpty = "RESET")
	if armorTypeIs.Length
		if armorTypeIs[0] == "RESET"
			StorageUtil.IntListAdd(locationForm, "SkyrimUnbound_Condition_ArmorTypeIs", -1)
		else
			int[] armorTypeIsArray = new int[3]
			if armorTypeIs.Find("Clothes") > -1
				armorTypeIsArray[0] = 1
			else
				armorTypeIsArray[0] = 0
			endif
			if armorTypeIs.Find("Light") > -1
				armorTypeIsArray[1] = 1
			else
				armorTypeIsArray[1] = 0
			endif
			if armorTypeIs.Find("Heavy") > -1
				armorTypeIsArray[2] = 1
			else
				armorTypeIsArray[2] = 0
			endif
			StorageUtil.IntListCopy(locationForm, "SkyrimUnbound_Condition_ArmorTypeIs", armorTypeIsArray)
		endif
	endif

	string[] headgearIs = GetJsonStringArray(fileName, elPath, ".conditions.headgearIs", false, checkForInvalidValues = true, validValues = ValidJsonValues_Headgear, allowEmpty = !isLocType, elementIfEmpty = "RESET")
	if headgearIs.Length
		if headgearIs[0] == "RESET"
			StorageUtil.IntListAdd(locationForm, "SkyrimUnbound_Condition_HeadgearIs", -1)
		else
			if headgearIs.Find("Nothing") > -1
				StorageUtil.IntListAdd(locationForm, "SkyrimUnbound_Condition_HeadgearIs", 1)
			endif
			if headgearIs.Find("Default") > -1
				StorageUtil.IntListAdd(locationForm, "SkyrimUnbound_Condition_HeadgearIs", 2)
			endif
			if headgearIs.Find("Hood") > -1
				StorageUtil.IntListAdd(locationForm, "SkyrimUnbound_Condition_HeadgearIs", 3)
			endif
		endif
	endif

	bool hasArmorIs = ImportArmorListCondition(locationForm, fileName, elPath, ".conditions.armorIs", "SkyrimUnbound_Condition_ArmorIs", !isLocType, true)
	bool hasArmorIsNot = ImportArmorListCondition(locationForm, fileName, elPath, ".conditions.armorIsNot", "SkyrimUnbound_Condition_ArmorIsNot", !isLocType, true)
	bool hasArmorAddToRandom = ImportArmorListCondition(locationForm, fileName, elPath, ".conditions.armorAddToRandom", "SkyrimUnbound_Condition_ArmorAddToRandom", !isLocType, false)

	if hasArmorIs && (hasArmorIsNot || hasArmorAddToRandom)
		ShowAddonLoadingError(fileName, elPath, "Can't have both armorIs and armorIsNot/armorAddToRandom on the same form")
	endif

endFunction

bool function ImportArmorListCondition(Form locationForm, string fileName, string elPath, string propertyName, string storageUtilName, bool isSpecificLocation, bool isWhiteOrBlacklist)
	Form[] armorList = GetJsonFormArray(fileName, elPath, propertyName, false, allowEmpty = isSpecificLocation, elementIfEmpty = self)
	if armorList.Length
		if armorList[0] == self
			StorageUtil.SetIntValue(locationForm, storageUtilName + "_Reset", 1)
			if isWhiteOrBlacklist
				StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasBlackOrWhitelist", -1)
			endif
		else
			int i = armorList.Length
			while i > 0
				i -= 1
				if armorList[i] as FormList
					Form[] sublist = (armorList[i] as FormList).ToArray()
					int iSubItem = sublist.Length
					while iSubItem > 0
						iSubItem -= 1
						if !(sublist[iSubItem] as LeveledItem || sublist[iSubItem] as Outfit)
							ShowAddonLoadingError(fileName, elPath, propertyName + "[" + i + "][" + iSubItem + "] is of an unsupported type (allowed types: LeveledItem, Outfit)")
						endif
					endwhile
				elseif !(armorList[i] as LeveledItem || armorList[i] as Outfit)
					ShowAddonLoadingError(fileName, elPath, propertyName + "[" + i + "] is of an unsupported type (allowed types: FormList, LeveledItem, Outfit)")
				endif
			endwhile
			StorageUtil.FormListCopy(locationForm, storageUtilName, armorList)
			if isWhiteOrBlacklist
				StorageUtil.SetIntValue(locationForm, "SkyrimUnbound_Condition_HasBlackOrWhitelist", 1)
			endif
		endif
	endif
	return (armorList.Length > 0)
endFunction

function SavePreset(string fileName)

	int location1 = ChoiceLocationType
	if location1
		FormList locTypeList = LocationTypeLists.GetAt(location1 - 1) as FormList
		JsonUtil.SetFormValue(fileName, "LocTypeList", locTypeList)
		if ChoiceLocation
			JsonUtil.SetFormValue(fileName, "LocationForm", locTypeList.GetAt(ChoiceLocation - 1))
		else
			JsonUtil.UnsetFormValue(fileName, "LocationForm")
		endif
	else
		JsonUtil.UnsetFormValue(fileName, "LocTypeList")
		JsonUtil.UnsetFormValue(fileName, "LocationForm")
	endif
	JsonUtil.FormListClear(fileName, "LocTypeLists")
	int i = SelectedLocationTypes.GetSize()
	while i > 0
		i -= 1
		Form locTypeList = SelectedLocationTypes.GetAt(i)
		if LocationTypeLists.HasForm(locTypeList)
			JsonUtil.FormListAdd(fileName, "LocTypeLists", locTypeList)
		endif
	endwhile

	JsonUtil.FormListClear(fileName, "Holds")
	i = SelectedHolds.GetSize()
	while i > 0
		i -= 1
		Form holdList = SelectedHolds.GetAt(i)
		if HoldLists.HasForm(holdList)
			JsonUtil.FormListAdd(fileName, "Holds", holdList)
		endif
	endwhile

	JsonUtil.SetIntValue(fileName, "LocalInhabitant", ChoiceLocalInhabitant)
	JsonUtil.SetIntValue(fileName, "AlreadyAdventurer", ChoiceAlreadyAdventurer as int)
	JsonUtil.SetIntValue(fileName, "Bounty", ChoiceBounty)

	JsonUtil.SetIntValue(fileName, "TimeOfDay", ChoiceTimeOfDay)
	JsonUtil.SetIntValue(fileName, "Season", ChoiceSeason)
	JsonUtil.SetIntValue(fileName, "Month", ChoiceMonth)

endFunction

bool function LoadPreset(string fileName)

	bool missingContent = false

	int location1 = 0
	FormList locTypeList
	SelectedLocationTypes.Revert()
	if JsonUtil.HasFormValue(fileName, "LocTypeList")
		locTypeList = JsonUtil.GetFormValue(fileName, "LocTypeList") as FormList
		if !locTypeList || locTypeList.GetSize() == 0
			missingContent = true
		else
			location1 = LocationTypeLists.Find(locTypeList) + 1
			if location1 == 0
				missingContent = true
			endif
		endif
	endif
	int i = JsonUtil.FormListCount(fileName, "LocTypeLists")
	while i > 0
		i -= 1
		Form nthList = JsonUtil.FormListGet(fileName, "LocTypeLists", i)
		if nthList && LocationTypeLists.HasForm(nthList) && (nthList as FormList).GetSize()
			SelectedLocationTypes.AddForm(nthList)
		else
			missingContent = true
		endif
	endwhile
	int location2 = 0
	if locTypeList && JsonUtil.HasFormValue(fileName, "LocationForm")
		Form locationForm = JsonUtil.GetFormValue(fileName, "LocationForm")
		if locationForm as ObjectReference || locationForm as FormList
			location2 = locTypeList.Find(locationForm) + 1
			if location2 == 0
				missingContent = true
			endif
		else
			missingContent = true
		endif
	endif
	ChoiceLocationType = location1
	ChoiceLocation = location2

	SelectedHolds.Revert()
	i = JsonUtil.FormListCount(fileName, "Holds")
	while i > 0
		i -= 1
		Form holdList = JsonUtil.FormListGet(fileName, "Holds", i)
		if holdList && HoldLists.HasForm(holdList) && (holdList as FormList).GetSize()
			SelectedHolds.AddForm(holdList)
		else
			missingContent = true
		endif
	endwhile

	if location1 == 0
		if !HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), SelectedLocationTypes.ToArray())
			SelectedHolds.Revert()
			missingContent = true
		endif
	elseif location2 == 0
		Form[] locTypeFormLists = new Form[1]
		locTypeFormLists[0] = locTypeList
		if !HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), locTypeFormLists)
			SelectedHolds.Revert()
			missingContent = true
		endif
	endif

	ChoiceLocalInhabitant = JsonUtil.GetIntValue(fileName, "LocalInhabitant")
	ChoiceAlreadyAdventurer = JsonUtil.GetIntValue(fileName, "AlreadyAdventurer")
	ChoiceBounty = JsonUtil.GetIntValue(fileName, "Bounty")

	ChoiceTimeOfDay = JsonUtil.GetIntValue(fileName, "TimeOfDay")
	ChoiceSeason = JsonUtil.GetIntValue(fileName, "Season")
	ChoiceMonth = JsonUtil.GetIntValue(fileName, "Month")

	return !missingContent

endFunction

function SelectLocation()

	FinalLocation = None
	FinalLocationTypeList = None
	FinalHoldList = None

	SuitableLocationTypes.Revert()
	SuitableHolds.Revert()
	AllLocationsInSuitableHolds.Revert()
	SuitableLocations.Revert()
	SuitableLocationsConditionless.Revert()

	int location1 = ChoiceLocationType
	int location2 = ChoiceLocation

	FormList locTypeList
	Form locationForm

	if location2 && location1
		locTypeList = LocationTypeLists.GetAt(location1 - 1) as FormList
		locationForm = locTypeList.GetAt(location2 - 1)
	else
		location2 = 0

		if location1
			locTypeList = LocationTypeLists.GetAt(location1 - 1) as FormList
			SuitableLocationTypes.AddForm(locTypeList)
		else
			if SelectedLocationTypes.GetSize()
				SuitableLocationTypes.AddForms(SelectedLocationTypes.ToArray())
			else
				SuitableLocationTypes.AddForms(LocationTypeLists.ToArray())
			endif
		endif

		Form[] suitableHoldsArray
		if SelectedHolds.GetSize()
			suitableHoldsArray = SelectedHolds.ToArray()
		else
			suitableHoldsArray = HoldLists.ToArray()
		endif
		SuitableHolds.AddForms(suitableHoldsArray)

		if SuitableLocationTypes.HasForm(HoldsWithJail)
			SuitableLocationTypes.RemoveAddedForm(HoldsWithJail)
			SuitableLocations.AddForms(suitableHoldsArray)
			SuitableLocationsConditionless.AddForms(suitableHoldsArray)
		endif
		
		if SuitableLocationTypes.GetSize()
			int iHold = suitableHoldsArray.Length
			while iHold > 0
				iHold -= 1
				AllLocationsInSuitableHolds.AddForms((suitableHoldsArray[iHold] as FormList).ToArray())
			endwhile

			string playerRaceString = MainScript.GetPlayerRaceString()
			bool isPlayerVampire = Abilities.ChoiceDisease == 1
			bool isPlayerWerewolf = Abilities.ChoiceDisease == 2
			int playerHasAtLeastOneSpell = -1
			if Inventory.ChoiceSpellsMode > 0
				playerHasAtLeastOneSpell = (!Inventory.HasPlayerDisabledSpells()) as int
			endif
			int playerHasAtLeastOneWeapon = -1
			if !Inventory.ChoiceRandomWeapons
				playerHasAtLeastOneWeapon = (Inventory.ChoiceOneHanded > 0 || Inventory.ChoiceTwoHanded > 0 || Inventory.ChoiceRanged > 0 || Inventory.ChoiceStaff > 0) as int
			endif
			int playerHasAtLeastOneWeaponOrSpell = -1
			if playerHasAtLeastOneWeapon == 0 && playerHasAtLeastOneSpell == 0
				playerHasAtLeastOneWeaponOrSpell = 0
			elseif playerHasAtLeastOneWeapon == 1 || playerHasAtLeastOneSpell == 1
				playerHasAtLeastOneWeaponOrSpell = 1
			endif
			bool playerSelectedNothingAsArmor = Inventory.ChoiceArmorType == 4
			bool playerAllowedClothes = true
			bool playerAllowedLightArmors = true
			bool playerAllowedHeavyArmors = true
			if Inventory.ChoiceArmorType
				playerAllowedClothes = false
				playerAllowedLightArmors = false
				playerAllowedHeavyArmors = false
				if Inventory.ChoiceArmorType == 1 || Inventory.ChoiceArmorType == 5 || Inventory.ChoiceArmorType == 6
					playerAllowedClothes = true
				endif
				if Inventory.ChoiceArmorType == 2 || Inventory.ChoiceArmorType == 5 || Inventory.ChoiceArmorType == 7
					playerAllowedLightArmors = true
				endif
				if Inventory.ChoiceArmorType == 3 || Inventory.ChoiceArmorType == 6 || Inventory.ChoiceArmorType == 7
					playerAllowedHeavyArmors = true
				endif
			endif
			Form playerArmorSet = Inventory.GetArmorSetSelectedByPlayer()
			int playerArmorSetArmorTypeIndex = -1
			if playerArmorSet
				playerArmorSetArmorTypeIndex = Inventory.ChoiceArmorType - 1
			endif
			int playerIsInRags = -1
			if playerArmorSet
				playerIsInRags = (playerArmorSet == Inventory.ArmorSets_Rags) as int
			elseif Inventory.ChoiceArmorType && Inventory.ChoiceArmorType != 4 && !playerAllowedClothes
				playerIsInRags = 0
			endif
			int[] playerAllowedHeadgear
			if Inventory.ChoiceHeadgear
				if Inventory.ChoiceHeadgear <= 3
					playerAllowedHeadgear = new int[1]
					playerAllowedHeadgear[0] = Inventory.ChoiceHeadgear
				else
					playerAllowedHeadgear = new int[2]
					if Inventory.ChoiceHeadgear == 4
						playerAllowedHeadgear[0] = 2
						playerAllowedHeadgear[1] = 3
					elseif Inventory.ChoiceHeadgear == 5
						playerAllowedHeadgear[0] = 1
						playerAllowedHeadgear[1] = 3
					elseif Inventory.ChoiceHeadgear == 6
						playerAllowedHeadgear[0] = 1
						playerAllowedHeadgear[1] = 2
					endif
				endif
			endif
			int playerWealth = -1
			if Inventory.ChoiceWealth > 0
				playerWealth = Inventory.ChoiceWealth - 1
			endif
			int playerHasBounty = -1
			if ChoiceBounty == 0
				playerHasBounty = 0
			elseif ChoiceBounty > 0
				playerHasBounty = 1
			endif
			FormList defaultAddToRandomListForPlayerRace = Inventory.GetDefaultAddToRandomListForPlayerRace()
			bool areOnlyEntryLevelArmorsAllowed = Inventory.ChoiceOnlyEntryLevelArmors
			bool shouldExcludeBeggarItems = Inventory.ShouldExcludeBeggarItems()
			bool shouldExcludeArmorsWithNoRandomShield = Inventory.ChoiceOneHanded && Inventory.ChoiceOneHandedCombination == 2
			bool shouldExcludeArmorsWithScimitar = (Inventory.ChoiceOneHanded > 3 && Inventory.ChoiceOneHanded != 7) || Inventory.ChoiceTwoHanded
			bool shouldExcludeHeavyArmors = (!Inventory.ChoiceOneHanded || Inventory.ChoiceOneHanded == 3) && !Inventory.ChoiceTwoHanded \
				&& (Inventory.ChoiceOneHanded == 3 || Inventory.ChoiceRanged || Inventory.ChoiceStaff) \
				&& Inventory.ChoiceArmorType != 3 && Inventory.ChoiceArmorType != 6 && Inventory.ChoiceArmorType != 7
			bool shouldExcludeClothes = ((Inventory.ChoiceOneHanded && Inventory.ChoiceOneHandedCombination == 2 && Inventory.ChoiceOneHanded != 3) || Inventory.ChoiceTwoHanded) \
				&& Inventory.ChoiceArmorType != 1 && Inventory.ChoiceArmorType != 5 && Inventory.ChoiceArmorType != 6
			bool shouldExcludeArmorsWithNoRandomDagger = Inventory.ChoiceOneHanded == 3 && !(Inventory.ChoiceTwoHanded || Inventory.ChoiceRanged || Inventory.ChoiceStaff)

			int numberOfLocTypes = SuitableLocationTypes.GetSize()
			int numberOfThreadsToUse
			if numberOfLocTypes < Threads.Length
				numberOfThreadsToUse = numberOfLocTypes
			else
				numberOfThreadsToUse = Threads.Length
			endif
			int numberOfLocTypesPerThread = numberOfLocTypes / numberOfThreadsToUse
			int numberOfLocTypesRemainder = numberOfLocTypes % numberOfThreadsToUse

			;MiscUtil.PrintConsole("-------------------------------------------------------------")

			int iThread = 0
			int lastAssignedIndex = -1
			while iThread < numberOfThreadsToUse
				Threads[iThread].FirstIndex = lastAssignedIndex + 1
				if iThread < numberOfLocTypesRemainder
					Threads[iThread].LastIndex = lastAssignedIndex + numberOfLocTypesPerThread + 1
				else
					Threads[iThread].LastIndex = lastAssignedIndex + numberOfLocTypesPerThread
				endif
				lastAssignedIndex = Threads[iThread].LastIndex

				Threads[iThread].PlayerRaceString = playerRaceString
				Threads[iThread].IsPlayerVampire = isPlayerVampire
				Threads[iThread].IsPlayerWerewolf = isPlayerWerewolf
				Threads[iThread].PlayerHasAtLeastOneSpell = playerHasAtLeastOneSpell
				Threads[iThread].PlayerHasAtLeastOneWeapon = playerHasAtLeastOneWeapon
				Threads[iThread].PlayerHasAtLeastOneWeaponOrSpell = playerHasAtLeastOneWeaponOrSpell
				Threads[iThread].PlayerSelectedNothingAsArmor = playerSelectedNothingAsArmor
				Threads[iThread].PlayerAllowedClothes = playerAllowedClothes
				Threads[iThread].PlayerAllowedLightArmors = playerAllowedLightArmors
				Threads[iThread].PlayerAllowedHeavyArmors = playerAllowedHeavyArmors
				Threads[iThread].PlayerArmorSet = playerArmorSet
				Threads[iThread].PlayerArmorSetArmorTypeIndex = playerArmorSetArmorTypeIndex
				Threads[iThread].PlayerIsInRags = playerIsInRags
				Threads[iThread].PlayerAllowedHeadgear = playerAllowedHeadgear
				Threads[iThread].PlayerWealth = playerWealth
				Threads[iThread].PlayerHasBounty = playerHasBounty
				Threads[iThread].DefaultAddToRandomListForPlayerRace = defaultAddToRandomListForPlayerRace
				Threads[iThread].AreOnlyEntryLevelArmorsAllowed = areOnlyEntryLevelArmorsAllowed
				Threads[iThread].ShouldExcludeBeggarItems = shouldExcludeBeggarItems
				Threads[iThread].ShouldExcludeArmorsWithNoRandomShield = shouldExcludeArmorsWithNoRandomShield
				Threads[iThread].ShouldExcludeArmorsWithScimitar = shouldExcludeArmorsWithScimitar
				Threads[iThread].ShouldExcludeClothes = shouldExcludeClothes
				Threads[iThread].ShouldExcludeHeavyArmors = shouldExcludeHeavyArmors
				Threads[iThread].ShouldExcludeArmorsWithNoRandomDagger = shouldExcludeArmorsWithNoRandomDagger

				Threads[iThread].RegisterForModEvent("SkyrimUnbound_RunLocationThreads", "OnThreadRun")

				iThread += 1
			endwhile
			ModEvent.Send(ModEvent.Create("SkyrimUnbound_RunLocationThreads"))

			iThread = 0
			while iThread < numberOfThreadsToUse
				while Threads[iThread].LastIndex != -1
				endwhile
				Threads[iThread].UnregisterForModEvent("SkyrimUnbound_RunLocationThreads")
				
				iThread += 1
			endwhile

			if playerRaceString != "Dark Elf"
				;MiscUtil.PrintConsole("Excluded " + MarkerTempleRavenRock)
				SuitableLocations.RemoveAddedForm(MarkerTempleRavenRock)
			endif

			if playerHasAtLeastOneWeapon == 0 || ShouldExcludeArmorsWithNoRandomDagger || (playerArmorSet && !ArmorsImperialFaction.HasForm(playerArmorSet)) 
				;MiscUtil.PrintConsole("Excluded " + MarkerFactionStartImperials)
				SuitableLocations.RemoveAddedForm(MarkerFactionStartImperials)
			endif

			if playerHasAtLeastOneWeapon == 0 || ShouldExcludeArmorsWithNoRandomDagger || (playerArmorSet && !ArmorsStormcloak.HasForm(playerArmorSet))
				;MiscUtil.PrintConsole("Excluded " + MarkerFactionStartStormcloaks)
				SuitableLocations.RemoveAddedForm(MarkerFactionStartStormcloaks)
			endif
		endif
		
		if SuitableLocations.GetSize()
			locationForm = SuitableLocations.GetAt(Utility.RandomInt(0, SuitableLocations.GetSize() - 1))
		else
			locationForm = SuitableLocationsConditionless.GetAt(Utility.RandomInt(0, SuitableLocationsConditionless.GetSize() - 1))
		endif
	endif

	FormList holdList
	if HoldsWithJail.HasForm(locationForm) ; Jail
		holdList = locationForm as FormList
		locTypeList = HoldsWithJail
	else
		Form[] holdListsArray = HoldLists.ToArray()
		int iHold = holdListsArray.Length
		while iHold > 0
			iHold -= 1
			FormList nthHoldList = holdListsArray[iHold] as FormList
			if nthHoldList.HasForm(locationForm)
				holdList = nthHoldList
				iHold = 0
			endif
		endwhile
		if !location2
			if !location1
				Form[] suitableLocationTypesArray = SuitableLocationTypes.ToArray()
				int iLocType = suitableLocationTypesArray.Length
				while iLocType > 0
					iLocType -= 1
					FormList nthLocType = suitableLocationTypesArray[iLocType] as FormList
					if nthLocType.HasForm(locationForm)
						locTypeList = nthLocType
						location1 = LocationTypeLists.Find(locTypeList) + 1
						iLocType = 0
					endif
				endwhile
			endif
			location2 = locTypeList.Find(locationForm) + 1
		endif
	endif

	if !locationForm
		Debug.Messagebox("Skyrim Unbound Reborn failed to find an object to teleport you to. If you're not the cause, please take a screenshot and report this." +\
"\n\nlocation1 : initial=" + ChoiceLocationType + ", resulting=" + location1 + "/" + LocationTypeLists.GetSize() + " (" + locTypeList +\
")\nlocation2 : initial=" + ChoiceLocation + ", resulting=" + location2 + "/" + locTypeList.GetSize() + " \n(" + locationForm +\
")\nHold : " + (HoldLists.Find(holdList) + 1) + "/" + HoldLists.GetSize() + " (" + holdList + ") (" + SelectedHolds.GetSize() + " holds selected)")
		return
	endif

	FinalLocation = locationForm
	FinalLocationTypeList = locTypeList
	FinalHoldList = holdList

	if HoldsWithJail.HasForm(FinalLocation) ; Jail
		FinalTeleportMarker = None
	else
		if FinalLocation as FormList
			FormList teleportMarkers = FinalLocation as FormList
			FinalTeleportMarker = teleportMarkers.GetAt(Utility.RandomInt(0, teleportMarkers.GetSize() - 1)) as ObjectReference
		else
			FinalTeleportMarker = FinalLocation as ObjectReference
		endif
	endif
	
endFunction

Faction function GetCrimeFactionForHold(FormList holdList)
	int holdIndex = HoldLists.Find(holdList)
	if holdIndex < 0 
		return None
	elseif holdIndex < 10
		return CrimeFactions[holdIndex]
	else
		return StorageUtil.GetFormValue(holdList, "SkyrimUnbound_CrimeFaction") as Faction
	endif
endFunction

int function GetLocationConditionInt(string conditionName)
	int conditionValue = -1
	if FinalLocation
		if StorageUtil.HasIntValue(FinalLocation, conditionName)
			conditionValue = StorageUtil.GetIntValue(FinalLocation, conditionName)
		elseif StorageUtil.HasIntValue(FinalLocationTypeList, conditionName)
			conditionValue = StorageUtil.GetIntValue(FinalLocationTypeList, conditionName)
		else
			if LocationsConditionalDefault.HasForm(FinalLocation)
				if conditionName == "SkyrimUnbound_Condition_HasWeapon"
					if FinalLocation == MarkerFactionStartImperials || FinalLocation == MarkerFactionStartStormcloaks
						conditionValue = 2 ;1
					endif
				endif
			endif
			if LocationsConditionalDefault.HasForm(FinalLocationTypeList) && conditionValue == -1
				if conditionName == "SkyrimUnbound_Condition_IsInRags"
					if FinalLocationTypeList == Markers_Inns || FinalLocationTypeList == Markers_PlayerHomes || FinalLocationTypeList == Markers_Docks
						conditionValue = 1 ;0
					endif
				elseif conditionName == "SkyrimUnbound_Condition_HasSpells"
					if FinalLocationTypeList == Markers_WarlockLairs
						conditionValue = 2 ;1
					endif
				elseif conditionName == "SkyrimUnbound_Condition_HasWeaponOrSpells"
					if FinalLocationTypeList == Markers_BanditCamps
						conditionValue = 2 ;1
					endif
				endif
			endif
		endif
	endif
	return conditionValue
endFunction

int[] function GetLocationConditionIntArray(string conditionName)
	int[] returnedArray
	if FinalLocation
		if StorageUtil.IntListCount(FinalLocation, conditionName) > 0
			if StorageUtil.IntListFind(FinalLocation, conditionName, -1) == -1
				returnedArray = StorageUtil.IntListToArray(FinalLocation, conditionName)
			endif
		elseif StorageUtil.IntListCount(FinalLocationTypeList, conditionName) > 0
			if StorageUtil.IntListFind(FinalLocationTypeList, conditionName, -1) == -1
				returnedArray = StorageUtil.IntListToArray(FinalLocationTypeList, conditionName)
			endif
		endif
	endif
	return returnedArray
endFunction

Form[] function GetLocationConditionFormArray(Form formToTakeFrom, string conditionName)
	Form[] formsFromList = StorageUtil.FormListToArray(formToTakeFrom, conditionName)
	if formsFromList.Length
		Form[] formsFromSublists
		int i = formsFromList.Length
		while i > 0
			i -= 1
			if formsFromList[i] as FormList
				formsFromSublists = PapyrusUtil.MergeFormArray(formsFromSublists, (formsFromList[i] as FormList).ToArray(), true)
				formsFromList[i] = None
			endif
		endwhile
		if formsFromSublists.Length
			return PapyrusUtil.MergeFormArray(PapyrusUtil.RemoveForm(formsFromList, None), formsFromSublists, true)
		else
			return formsFromList
		endif
	elseif LocationsConditionalDefault.HasForm(formToTakeFrom)
		if conditionName == "SkyrimUnbound_Condition_ArmorIs"
			if formToTakeFrom == MarkerFactionStartImperials
				return ArmorsImperialFaction.ToArray()
			elseif formToTakeFrom == MarkerFactionStartStormcloaks
				return ArmorsStormcloak.ToArray()
			endif
		elseif conditionName == "SkyrimUnbound_Condition_ArmorAddToRandom"
			if formToTakeFrom == Hold_Solstheim
				return ArmorsDarkElfRacialOrSolstheimAddToRandom.ToArray()
			endif
		endif
	endif
	return formsFromList
endFunction

function TeleportPlayer(bool debugSpell)

	if !debugSpell
		SetStartingDateTime()
	endif

	if HoldsWithJail.HasForm(FinalLocation) ; Jail
		if FinalHoldList == Hold_Solstheim
			PrepareSolstheimStart()
		endif

		Faction crimeFaction = GetCrimeFactionForHold(FinalHoldList)
		if ChoiceBounty == -1
			crimeFaction.SetCrimeGold(GetDefaultRandomBounty())
		elseif ChoiceBounty > 0
			crimeFaction.SetCrimeGold(ChoiceBounty)
		endif

		crimeFaction.SendPlayerToJail()
		if FinalHoldList == Hold_Reach
			(DialogueCrimeGuards as CrimeGuardsScript).SetupCidhnaMine()
		endif

		Utility.Wait(0.2)
		ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnPlayerTeleported"))
	else
		WEEnabled.SetValue(0)

		if FinalHoldList == Hold_Solstheim
			PrepareSolstheimStart()
		endif

		PrepareStartBeforeTeleportation(FinalLocationTypeList, FinalLocation, FinalTeleportMarker)

		Form formWithQuest
		if StorageUtil.HasFormValue(FinalLocation, "SkyrimUnbound_Quest")
			formWithQuest = FinalLocation
		elseif StorageUtil.HasFormValue(FinalLocationTypeList, "SkyrimUnbound_Quest")
			formWithQuest = FinalLocationTypeList
		endif
		if formWithQuest
			AddonQuestManager.QuestToRun = StorageUtil.GetFormValue(formWithQuest, "SkyrimUnbound_Quest") as Quest
			AddonQuestManager.TeleportMarker = FinalTeleportMarker
			AddonQuestManager.LocationParam = StorageUtil.GetStringValue(FinalLocation, "SkyrimUnbound_LocationParam")
			AddonQuestManager.LocationTypeParam = StorageUtil.GetStringValue(FinalLocationTypeList, "SkyrimUnbound_LocationTypeParam")

			AddonQuestManager.TeleportationAllowed = false
			AddonQuestManager.StartCompletionAllowed = false
			AddonQuestManager.RegisterForSingleUpdate(0.001)
			while !AddonQuestManager.TeleportationAllowed
			endwhile
		endif

		StartingLocationMarker.MoveTo(FinalTeleportMarker)

		if !debugSpell
			SetLocalInhabitant(FinalLocationTypeList, FinalLocation, FinalTeleportMarker)
		endif

		Cell oldCell = PlayerRef.GetParentCell()
		PlayerRef.MoveTo(FinalTeleportMarker)
		if FinalTeleportMarker.GetParentCell() != oldCell
			while PlayerRef.GetParentCell() == oldCell
			endwhile
			Utility.Wait(0.2)
		endif
		
		ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnPlayerTeleported"))

		PrepareStartAfterTeleportation(FinalLocationTypeList, FinalLocation, FinalTeleportMarker)
		if formWithQuest
			while !AddonQuestManager.StartCompletionAllowed
			endwhile
		endif
		
		BountyToShow = -1
		if !debugSpell
			int bounty = 0
			bool bountyNotification = false
			if ChoiceBounty == -1
				int condition_HasBounty = GetLocationConditionInt("SkyrimUnbound_Condition_HasBounty")

				if StorageUtil.HasIntValue(FinalLocation, "SkyrimUnbound_AutoBountyChance") || StorageUtil.HasIntValue(FinalLocationTypeList, "SkyrimUnbound_AutoBountyChance")
					bountyNotification = true
					Form formWithBountySettings = FinalLocationTypeList
					if StorageUtil.HasIntValue(FinalLocation, "SkyrimUnbound_AutoBountyChance")
						formWithBountySettings = FinalLocation
					endif
					int bountyChance
					if condition_HasBounty == 1
						bountyChance = 100
					else 
						bountyChance = StorageUtil.GetIntValue(formWithBountySettings, "SkyrimUnbound_AutoBountyChance")
						if bountyChance == -1
							bountyChance = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", "bounty", 2)
						endif
					endif
					if Utility.RandomInt(1, 100) <= bountyChance
						int minBounty = StorageUtil.GetIntValue(formWithBountySettings, "SkyrimUnbound_AutoBountyMin")
						int maxBounty = StorageUtil.GetIntValue(formWithBountySettings, "SkyrimUnbound_AutoBountyMax")
						if minBounty < 0 || (condition_HasBounty == 1 && minBounty == 0)
							minBounty = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", "bounty", 0)
						endif
						if maxBounty < 0 || (condition_HasBounty == 1 && maxBounty == 0)
							maxBounty = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", "bounty", 1)
						endif
						if minBounty > maxBounty
							int prevMinBounty = minBounty
							minBounty = maxBounty
							maxBounty = prevMinBounty
						endif
						bounty = Utility.RandomInt(minBounty, maxBounty)
					endif

				elseif condition_HasBounty == 1 || FinalLocationTypeList == Markers_BanditCamps
					bountyNotification = true
					int bountyChance = 60
					if condition_HasBounty == 1
						bountyChance = 100
					elseif PapyrusUtil.GetVersion()
						bountyChance = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", "bounty", 2)
					endif
					if Utility.RandomInt(1, 100) <= bountyChance
						bounty = GetDefaultRandomBounty()
					endif
				endif

			elseif ChoiceBounty > 0
				bounty = ChoiceBounty
			endif

			if bounty > 0
				Faction crimeFaction = GetCrimeFactionForHold(FinalHoldList)
				if crimeFaction
					if bounty > 10
						bounty -= bounty % 10
					endif
					crimeFaction.SetCrimeGold(bounty)
				else
					bountyNotification = false
				endif
			endif
			if bountyNotification
				BountyToShow = bounty
			endif
		endif
		
		WEEnabled.SetValue(1)

		RegisterForModEvent("SkyrimUnbound_OnAdventureBegun", "OnAdventureBegun")
	endif

endFunction

Event OnAdventureBegun()
	if BountyToShow > -1
		Utility.Wait(4.0)
		if BountyToShow == 0
			SkyrimUnboundNoBountyMessage.Show()
		else
			SkyrimUnboundBountyMessage.Show(BountyToShow)
		endif
	endif
endEvent

int function GetDefaultRandomBounty()
	int minBounty = 250
	int maxBounty = 2500
	if PapyrusUtil.GetVersion()
		minBounty = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", "bounty", 0)
		maxBounty = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", "bounty", 1)
	endif
	return Utility.RandomInt(minBounty, maxBounty)
endFunction

function SetLocalInhabitant(FormList locTypeList, Form locationForm, ObjectReference teleportMarker)

	int localInhabitant = ChoiceLocalInhabitant
	if localInhabitant == 0
		if AutoLocalInhabitantRegionLocations.HasForm(locTypeList)
			localInhabitant = 2
		elseif AutoLocalInhabitantSettlementLocations.HasForm(locTypeList)
			localInhabitant = 3
		else
			localInhabitant = 1
		endif
		if AutoLocalInhabitantRegionLocations.HasForm(locationForm)
			localInhabitant = 2
		elseif AutoLocalInhabitantSettlementLocations.HasForm(locationForm)
			localInhabitant = 3
		elseif AutoLocalInhabitantExcludedLocations.HasForm(locationForm)
			localInhabitant = 1
		endif
	endif
	if localInhabitant == 1
		PlayerIsInhabitantOfRegion.SetValue(0)
		PlayerIsInhabitantOfSettlement.SetValue(0)
	elseif localInhabitant == 2
		PlayerIsInhabitantOfRegion.SetValue(1)
		PlayerIsInhabitantOfSettlement.SetValue(0)
	elseif localInhabitant == 3
		PlayerIsInhabitantOfRegion.SetValue(1)
		PlayerIsInhabitantOfSettlement.SetValue(1)
	endif
	if ChoiceAlreadyAdventurer
		AdventurerCommentsLocsDiscoveredReq.SetValue(0)
	endif

	if PlayerIsInhabitantOfRegion.GetValue()
		if teleportMarker.IsInLocation(TamrielLocation) || teleportMarker.GetWorldspace() == Tamriel
			SkyrimInhabitant.SetValue(1)
		elseif teleportMarker.IsInLocation(DLC2SolstheimLocation)
			SolstheimInhabitant.SetValue(1)
		endif

		if SkyrimInhabitant.GetValue() || SolstheimInhabitant.GetValue()
			RelationshipMarriage.SetStage(10)
		endif
	endif

	if PlayerIsInhabitantOfSettlement.GetValue()
		int locationIndex
		if StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_ForceLocation")
			locationIndex = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_ForceLocation") - 1
		else
			locationIndex = CitizenCities.Find(locationForm)
			if locationIndex == -1
				int i = CitizenGlobals.GetSize()
				while i > 0
					i -= 1
					if teleportMarker.IsInLocation(CitizenLocations.GetAt(i) as Location)
						locationIndex = i
						i = 0
					endif
				endwhile
			endif
		endif
		if locationIndex > -1
			(CitizenGlobals.GetAt(locationIndex) as GlobalVariable).SetValue(1)
		endif

		if WhiterunCitizen.GetValue()
			DialogueWhiterun.SetStage(60) ;Jon Battle-Born
		elseif RiftenCitizen.GetValue()
			DialogueRiftenMaul.SetStage(30)
			DialogueRiftenMaul.SetStage(40)
			DialogueRiftenMaul.SetStage(200)
			DialogueRiftenGateGuards.SetStage(200)
		elseif MarkarthCitizen.GetValue()
			DialogueMarkarth.SetStage(45) ;Yngvar
			DialogueMarkarth.SetStage(50) ;Reburrus
			DialogueMarkarth.SetStage(100) ;Faleen
			DialogueMarkarth.SetStage(110) ;the gate guards
		elseif MorthalCitizen.GetValue()
			MS14HouseTriggerRef.Disable()
		endif
	endif

endFunction

function PrepareSolstheimStart()
	if !DLC2InitTrigger.IsDeleted()
		(DLC2InitTrigger as DLC2InitTriggerScript).OnTriggerEnter(PlayerRef) ;register arriving at Solstheim and set up all Solstheim stuff
		DLC2RRArrivalScene.SetStage(200) ;skip the arrival scene
		DLC2RRASForce.SetValue(1) ;skip Adril Arano arrival dialogues
		DLC2RRGjalundInit.SetValue(1) ;skip the first Gjalund dialogues
	endif
endFunction

function PrepareStartBeforeTeleportation(FormList locTypeList, Form locationForm, ObjectReference teleportMarker)

	if LocationsDisableNearbyPredators.HasForm(locTypeList) || LocationsDisableNearbyPredators.HasForm(locationForm)
		PredatorsDisabler.DisableNearbyPredators(teleportMarker)
	endif

	if locTypeList == Markers_PlayerHomes
		HousePurchaseScript HP = HousePurchase as HousePurchaseScript
		QF_HousePurchase_000A7B33 HPQF = HousePurchase as QF_HousePurchase_000A7B33
		if teleportMarker == SkyrimUnboundMarkerBreezehome
			HP.PurchaseHouse(HPQF.WhiterunHouse, HPQF.WhiterunHouseKey, HPQF.WhiterunGuide, None)
			HP.WhiterunHouseVar = 2
			WhiterunPlayerHouseAlchemyLaboratoryStart.Disable()
			WhiterunPlayerHouseBedroomStart.Disable()
			WhiterunPlayerHouseDiningRoomStart.Disable()
			WhiterunPlayerHouseKitchenStart.Disable()
			WhiterunPlayerHouseLoftStart.Disable()
			WhiterunPlayerHouseAlchemyLaboratory.Enable()
			WhiterunPlayerHouseDecorateBedroom.Enable()
			WhiterunPlayerHouseDecorateDiningRoom.Enable()
			WhiterunPlayerHouseDecorateKitchen.Enable()
			WhiterunPlayerHouseDecorateLivingRoom.Enable()
			WhiterunPlayerHouseDecorateLoft.Enable()
			(HPQF.RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
		elseif teleportMarker == SkyrimUnboundMarkerHoneyside
			HP.PurchaseHouse(HPQF.RiftenHouse, HPQF.RiftenHouseKey, HPQF.RiftenGuide, None)
			HP.RiftenHouseVar = 2
			RiftenPlayerHouseDecorateEnchantingDisable.Disable()
			RiftenPlayerHouseDecorateAlchemy.Enable()
			RiftenPlayerHouseDecorateBedroom.Enable()
			RiftenPlayerHouseDecorateEnchanting.Enable()
			RiftenPlayerHouseDecorateGarden.Enable()
			RiftenPlayerHouseDecorateKitchen.Enable()
			RiftenPlayerHouseDecoratePorch.Enable()
			(HPQF.RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
		elseif teleportMarker == SkyrimUnboundMarkerProudspireManor
			HP.PurchaseHouse(HPQF.SolitudeHouse, HPQF.SolitudeHouseKey, HPQF.SolitudeGuide, None)
			HP.SolitudeHouseVar = 2
			SolitudePlayerHouseDecoratePorch.Enable()
			SolitudePlayerHouseDecorateBedroom.Enable()
			SolitudePlayerHouseDecorateAlchemy.Enable()
			SolitudePlayerHouseDecorateEnchanting.Enable()
			SolitudePlayerHouseDecorateKitchen.Enable()
			SolitudePlayerHouseDecorateLivingRoom.Enable()
			(HPQF.RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
		elseif teleportMarker == SkyrimUnboundMarkerVlindrelHall
			HP.PurchaseHouse(HPQF.MarkarthHouse, HPQF.MarkarthHouseKey, HPQF.MarkarthGuide, None)
			HP.MarkarthHouseVar = 2
			MarkarthPlayerHouseDecorateAlchemyDisable.Disable()
			MarkarthPlayerHouseDecorateAlchemy.Enable()
			MarkarthPlayerHouseDecorateBedroom.Enable()
			MarkarthPlayerHouseDecorateEnchanting.Enable()
			MarkarthPlayerHouseDecorateHallway.Enable()
			MarkarthPlayerHouseDecorateLivingRoom.Enable()
			(HPQF.RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
		endif
	elseif locTypeList == Markers_FactionHeadquarters
		if teleportMarker == MarkerFactionStartImperials
			CW01A.SetStage(1)
			(CW01A as CW01Script).CW01AOutfitImperial = None
			CW01A.SetStage(100)
			CW01A.SetStage(150)
			CW01A.SetStage(160)
			CW01A.SetStage(200)
			CW01AOutfitImperial.SetStage(255)
		elseif teleportMarker == MarkerFactionStartStormcloaks
			CW01B.SetStage(1)
			(CW01B as CW01BScript).CWPlayerUniformSons = None
			CW01B.SetStage(100)
			CW01B.SetStage(150)
			CW01B.SetStage(160)
			CW01B.SetStage(200)
		endif
	elseif locTypeList == Markers_HomelessShelters
		if teleportMarker == SkyrimUnboundMarkerBeggarsRow
			BeggarsRowPlayerBedroll.Enable()
		elseif teleportMarker == SkyrimUnboundMarkerWarrens
			PlayerRef.AddToFaction(MarkarthCosnachFaction)
			PlayerRef.AddToFaction(MarkarthWarrensTenantsFaction)
			AddItem(MarkarthWarrensCosnachRoomKey)
		elseif teleportMarker == SkyrimUnboundMarkerAbandonedBuilding
			AbandonedBuildingPlayerBedroll.Enable()
			PlayerRef.AddToFaction(DLC2RRBeggarFaction)
		endif
	elseif locTypeList == Markers_BanditCamps || locTypeList == Markers_WarlockLairs || locTypeList == Markers_VampireLairs
		Form[] additionalFriendFactions = StorageUtil.FormListToArray(locationForm, "SkyrimUnbound_AdditionalFriendFactions")
		Form[] additionalFriendFactionsInteriorOnly = StorageUtil.FormListToArray(locationForm, "SkyrimUnbound_AdditionalFriendFactionsInteriorOnly")
		if locTypeList == Markers_BanditCamps
			LocalFactionManager.PrepareStartBeforeTeleportation(1, additionalFriendFactions, additionalFriendFactionsInteriorOnly)
		elseif locTypeList == Markers_WarlockLairs
			LocalFactionManager.PrepareStartBeforeTeleportation(2, additionalFriendFactions, additionalFriendFactionsInteriorOnly)
		elseif locTypeList == Markers_VampireLairs
			LocalFactionManager.PrepareStartBeforeTeleportation(3, additionalFriendFactions, additionalFriendFactionsInteriorOnly)
		endif
	endif

	if PlayerRef.IsInLocation(RiftenLocation)
		DialogueRiftenGateGuards.SetStage(200)
	endif

endFunction

function PrepareStartAfterTeleportation(FormList locTypeList, Form locationForm, ObjectReference teleportMarker)

	if locTypeList == Markers_Wilderness
		if teleportMarker == MarkerWhiterunValtheimTowers
			(Game.GetFormFromFile(0xDC8E4, "Skyrim.esm") as ObjectReference).DisableNoWait() ;a deer
		endif
	elseif locTypeList == Markers_Borders
		if teleportMarker == MarkerBorderMorrowindRift
			(Game.GetFormFromFile(0x10F137, "Skyrim.esm") as ObjectReference).DisableNoWait()
			(Game.GetFormFromFile(0x10F138, "Skyrim.esm") as ObjectReference).DisableNoWait()
		endif
	elseif locTypeList == Markers_BanditCamps
		if teleportMarker == MarkerBanditBannermistTower
			(Game.GetFormFromFile(0xBFA02, "Skyrim.esm") as ObjectReference).Lock(false, false)
		elseif teleportMarker == MarkerBanditTraitorsPost
			(Game.GetFormFromFile(0x73D13, "Skyrim.esm") as ObjectReference).DisableNoWait()
		elseif teleportMarker == MarkerBanditKnifepointRidge
			(Game.GetFormFromFile(0xA6456, "Skyrim.esm") as ObjectReference).Lock(false, false)
		endif
	elseif locTypeList == Markers_WarlockLairs
		if teleportMarker == MarkerWarlockCragwallowSlope
			(Game.GetFormFromFile(0xEBC3B, "Skyrim.esm") as ObjectReference).Lock(false, false)
		elseif teleportMarker == MarkerWarlockIlinaltasDeep
			(Game.GetFormFromFile(0x89BE9, "Skyrim.esm") as ObjectReference).Lock(false, false)
			(Game.GetFormFromFile(0x89C14, "Skyrim.esm") as ObjectReference).Activate(PlayerRef)
		elseif teleportMarker == MarkerWarlockMorvunskar
			(Game.GetFormFromFile(0x42771, "Skyrim.esm") as ObjectReference).Lock(false, false)
			(Game.GetFormFromFile(0xB8ABE, "Skyrim.esm") as ObjectReference).Activate(PlayerRef)
		elseif teleportMarker == MarkerWarlockHobsFallCave
			(Game.GetFormFromFile(0x101D79, "Skyrim.esm") as ObjectReference).OnTriggerEnter(PlayerRef)
			(Game.GetFormFromFile(0x82FBE, "Skyrim.esm") as ObjectReference).OnTriggerEnter(PlayerRef)
			(Game.GetFormFromFile(0x82FC1, "Skyrim.esm") as ObjectReference).OnTriggerEnter(PlayerRef)
			(Game.GetFormFromFile(0x82FC3, "Skyrim.esm") as ObjectReference).OnTriggerEnter(PlayerRef)
			defaultStartSceneTrigScript trigger2 = Game.GetFormFromFile(0x82FBC, "Skyrim.esm") as defaultStartSceneTrigScript
			trigger2.SceneToStart = None
			trigger2.OnTriggerEnter(PlayerRef)
			(Game.GetFormFromFile(0x80BE7, "Skyrim.esm") as ObjectReference).Lock(false, false)
		endif
	elseif locTypeList == Markers_VampireLairs
		if teleportMarker == MarkerVampireMarasEyeDen
			(Game.GetFormFromFile(0xDC068, "Skyrim.esm") as ObjectReference).Lock(false, false)
			(Game.GetFormFromFile(0xDC01E, "Skyrim.esm") as ObjectReference).Lock(false, false)
		elseif teleportMarker == MarkerVampireBloodletThrone
			(Game.GetFormFromFile(0x4D14, "Dawnguard.esm") as ObjectReference).DisableNoWait()
			(Game.GetFormFromFile(0x4D10, "Dawnguard.esm") as ObjectReference).DisableNoWait()
			(Game.GetFormFromFile(0x4D18, "Dawnguard.esm") as ObjectReference).DisableNoWait()
			(Game.GetFormFromFile(0xCBFA1, "Skyrim.esm") as ObjectReference).OnTriggerEnter(PlayerRef)
			defaultStartSceneTrigScript trigger2 = Game.GetFormFromFile(0xCBF9F, "Skyrim.esm") as defaultStartSceneTrigScript
			trigger2.SceneToStart = None
			trigger2.OnTriggerEnter(PlayerRef)
			(Game.GetFormFromFile(0xCBFB2, "Skyrim.esm") as ObjectReference).OnTriggerEnter(PlayerRef)
			(Game.GetFormFromFile(0x5E48F, "Skyrim.esm") as ObjectReference).Lock(false, false)
			(Game.GetFormFromFile(0x7A79B, "Skyrim.esm") as ObjectReference).Lock(false, false)
			(Game.GetFormFromFile(0x7A79C, "Skyrim.esm") as ObjectReference).Lock(false, false)
			(Game.GetFormFromFile(0x17083, "Skyrim.esm") as ObjectReference).Activate(PlayerRef)
		elseif teleportMarker == MarkerVampirePinemoonCave
			(Game.GetFormFromFile(0xC89C5, "Skyrim.esm") as ObjectReference).Lock(false, false)
		elseif teleportMarker == MarkerVampireBrokenFangCave
			(Game.GetFormFromFile(0x26810, "Skyrim.esm") as ObjectReference).Lock(false, false)
		endif
	endif

	if locTypeList == Markers_BanditCamps || locTypeList == Markers_WarlockLairs || locTypeList == Markers_VampireLairs
		LocalFactionManager.PrepareStartAfterTeleportation()
	endif

endFunction

bool function ShouldGiveLightForFinalLocation()
	if FinalTeleportMarker
		return (FinalTeleportMarker.IsInInterior() && FinalTeleportMarker.GetCurrentLocation().HasKeywordString("LocTypeDungeon")) || LocationsAlwaysGiveLightIfRandom.HasForm(FinalLocationTypeList) || LocationsAlwaysGiveLightIfRandom.HasForm(FinalLocation)
	else
		return false
	endif
endFunction

int function GetNumberOfDaysInMonth(int month)
{month = 1-12}
	int daysInMonth = 31
	if month == 2
		daysInMonth = 28
	elseif month == 4 || month == 6 || month == 9 || month == 11
		daysInMonth = 30
	endif
	return daysInMonth
endFunction

int[] function GetSundasesInMonth(int month)
{month = 1-12}
	int[] sundases = new int[5]
	int numberOfDaysFrom29thOfEveningStarOf4E200To1thOfThisMonth = 3
	int nthMonthBefore = 1
	while nthMonthBefore < month
		numberOfDaysFrom29thOfEveningStarOf4E200To1thOfThisMonth += GetNumberOfDaysInMonth(nthMonthBefore)
		nthMonthBefore += 1
	endwhile
	int dayOfWeekFor1thOfThisMonthStartingFrom0 = numberOfDaysFrom29thOfEveningStarOf4E200To1thOfThisMonth % 7
	if dayOfWeekFor1thOfThisMonthStartingFrom0 == 0
		sundases[0] = 1
	else
		sundases[0] = 8 - dayOfWeekFor1thOfThisMonthStartingFrom0
	endif
	int i = 1
	int daysInMonth = GetNumberOfDaysInMonth(month)
	int numberOfSundases = 1
	while i < 5
		int nextSundas = sundases[i - 1] + 7
		if nextSundas <= daysInMonth
			sundases[i] = nextSundas
			numberOfSundases += 1
			i += 1
		else
			i = 5
		endif
	endwhile
	if numberOfSundases < 5
		sundases = Utility.ResizeIntArray(sundases, numberOfSundases)
	endif
	return sundases
endFunction

function SetStartingDateTime()
	int season = ChoiceSeason
	if !season
		season = Utility.RandomInt(1, 4)
	endif
	int monthInSeason = ChoiceMonth
	if !monthInSeason
		monthInSeason = Utility.RandomInt(1, 3)
	endif

	int month = (season - 1)*3 + monthInSeason - 1
	if month == 0
		month = 12
	endif
	GameMonth.SetValue(month - 1)

	int[] sundasesInMonth = GetSundasesInMonth(month)
	GameDay.SetValue(sundasesInMonth[Utility.RandomInt(0, sundasesInMonth.Length - 1)])

	if ChoiceTimeOfDay == 0
		GameHour.SetValue(Utility.RandomFloat(0.0, 23.99))
	elseif ChoiceTimeOfDay == 1
		GameHour.SetValue(6.0)
	elseif ChoiceTimeOfDay == 2
		GameHour.SetValue(9.0)
	elseif ChoiceTimeOfDay == 3
		GameHour.SetValue(12.0)
	elseif ChoiceTimeOfDay == 4
		GameHour.SetValue(15.0)
	elseif ChoiceTimeOfDay == 5
		GameHour.SetValue(18.0)
	elseif ChoiceTimeOfDay == 6
		GameHour.SetValue(21.0)
	elseif ChoiceTimeOfDay == 7
		GameHour.SetValue(0.0)
	endif
endFunction

function AddItem(Form item, int count = 1)
	PlayerRef.AddItem(item, count, true)
endFunction

bool function HoldsHaveLocationsOfTypes(Form[] holdFormLists, Form[] locTypeFormLists)
	if holdFormLists.Length < 1 || locTypeFormLists.Length < 1 || locTypeFormLists.Find(HoldsWithJail) > -1
		return true
	endif

	int numberOfLocTypes = locTypeFormLists.Length
	int numberOfHolds = holdFormLists.Length
	int iLocType = 0
	int iHold = 0
	Form[] nthLocTypeListArray
	Form[] nthHoldListArray
	Form[] smallerLocationsArray
	Form[] biggerLocationsArray

	while iLocType < numberOfLocTypes
		nthLocTypeListArray = (locTypeFormLists[iLocType] as FormList).ToArray()
		while iHold < numberOfHolds
			nthHoldListArray = (holdFormLists[iHold] as FormList).ToArray()

			if nthHoldListArray.Length >= nthLocTypeListArray.Length
				smallerLocationsArray = nthLocTypeListArray
				biggerLocationsArray = nthHoldListArray
			else
				smallerLocationsArray = nthHoldListArray
				biggerLocationsArray = nthLocTypeListArray
			endif

			int iLocation = smallerLocationsArray.Length
			while iLocation > 0
				iLocation -= 1
				if biggerLocationsArray.Find(smallerLocationsArray[iLocation]) > -1
					return true
				endif
			endwhile

			iHold += 1
		endwhile
		iLocType += 1
	endwhile

	return false
endFunction
