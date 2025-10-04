Scriptname SkyrimUnboundLocationsThread extends Quest 

FormList Property SuitableLocationTypes Auto
FormList Property SuitableLocations Auto
FormList Property SuitableLocationsConditionless Auto
FormList Property LocationsConditional Auto
FormList Property LocationsConditionalDefault Auto
FormList Property AllLocationsInSuitableHolds Auto
FormList Property SuitableHolds Auto
FormList Property HoldsWithJail Auto
FormList Property Markers_FactionHeadquarters Auto
FormList Property Markers_PlayerHomes Auto
FormList Property Markers_BanditCamps Auto
FormList Property Markers_WarlockLairs Auto
FormList Property Markers_Inns Auto
FormList Property Markers_Docks Auto
FormList Property ArmorsRandom Auto
FormList Property ArmorsClothes Auto
FormList Property ArmorsLight Auto
FormList Property ArmorsHeavy Auto
FormList Property ArmorsEntryLevel Auto
FormList Property ArmorsMage Auto
FormList Property ArmorsVampire Auto
FormList Property ArmorsWithNoRandomShield Auto
FormList Property ArmorsWithScimitar Auto
FormList Property ArmorsWithNoRandomDagger Auto
FormList Property ArmorsWithNoRandomHood Auto
LeveledItem Property ArmorSets_Rags Auto
FormList Property Hold_Solstheim Auto
FormList Property ArmorsDarkElfRacialOrSolstheimAddToRandom Auto
FormList Property ThisThreadSuitableArmors Auto

int Property FirstIndex = -1 Auto Hidden
int Property LastIndex = -1 Auto Hidden

string Property PlayerRaceString Auto Hidden
bool Property IsPlayerVampire Auto Hidden
bool Property IsPlayerWerewolf Auto Hidden
int Property PlayerHasAtLeastOneSpell Auto Hidden
int Property PlayerHasAtLeastOneWeapon Auto Hidden
int Property PlayerHasAtLeastOneWeaponOrSpell Auto Hidden
bool Property PlayerSelectedNothingAsArmor Auto Hidden
bool Property PlayerAllowedClothes Auto Hidden
bool Property PlayerAllowedLightArmors Auto Hidden
bool Property PlayerAllowedHeavyArmors Auto Hidden
Form Property PlayerArmorSet Auto Hidden
int Property PlayerArmorSetArmorTypeIndex Auto Hidden
int Property PlayerIsInRags Auto Hidden
int[] Property PlayerAllowedHeadgear Auto Hidden
int Property PlayerWealth Auto Hidden
int Property PlayerHasBounty Auto Hidden
FormList Property DefaultAddToRandomListForPlayerRace Auto Hidden
bool Property AreOnlyEntryLevelArmorsAllowed Auto Hidden
bool Property ShouldExcludeBeggarItems Auto Hidden
bool Property ShouldExcludeArmorsWithNoRandomShield Auto Hidden
bool Property ShouldExcludeArmorsWithScimitar Auto Hidden
bool Property ShouldExcludeClothes Auto Hidden
bool Property ShouldExcludeHeavyArmors Auto Hidden
bool Property ShouldExcludeArmorsWithNoRandomDagger Auto Hidden

int locTypeConditionResult_Never
int locTypeConditionResult_Race
int locTypeConditionResult_IsVampire
int locTypeConditionResult_IsWerewolf
int locTypeConditionResult_HasSpells
int locTypeConditionResult_HasWeapon
int locTypeConditionResult_HasWeaponOrSpells
int locTypeConditionResult_ArmorTypeIs
int locTypeConditionResult_IsInRags
int locTypeConditionResult_HeadgearIs
int locTypeConditionResult_WealthMin
int locTypeConditionResult_WealthMax
int locTypeConditionResult_HasBounty


Event OnThreadRun()

	if FirstIndex < 0 || LastIndex < 0
		Debug.Messagebox("Skyrim Unbound error: a location thread was run with no input")
		return
	endif

	Form[] allLocationsInSuitableHoldsArray = AllLocationsInSuitableHolds.ToArray()
	Form[] locTypesArray = SuitableLocationTypes.ToArray()
	int iLocType = FirstIndex
	FormList nthLocTypeList
	Form[] nthLocTypeArray
	int iLocation
	Form nthLocation
	int defaultLocTypeConditionResult
	while iLocType <= LastIndex
		nthLocTypeList = locTypesArray[iLocType] as FormList
		nthLocTypeArray = nthLocTypeList.ToArray()

		if LocationsConditional.HasForm(nthLocTypeList)
			defaultLocTypeConditionResult = -1
		else
			defaultLocTypeConditionResult = 1
		endif
		locTypeConditionResult_Never = defaultLocTypeConditionResult
		locTypeConditionResult_Race = defaultLocTypeConditionResult
		locTypeConditionResult_IsVampire = defaultLocTypeConditionResult
		locTypeConditionResult_IsWerewolf = defaultLocTypeConditionResult
		locTypeConditionResult_HasSpells = defaultLocTypeConditionResult
		locTypeConditionResult_HasWeapon = defaultLocTypeConditionResult
		locTypeConditionResult_HasWeaponOrSpells = defaultLocTypeConditionResult
		locTypeConditionResult_ArmorTypeIs = defaultLocTypeConditionResult
		locTypeConditionResult_IsInRags = defaultLocTypeConditionResult
		locTypeConditionResult_HeadgearIs = defaultLocTypeConditionResult
		locTypeConditionResult_WealthMin = defaultLocTypeConditionResult
		locTypeConditionResult_WealthMax = defaultLocTypeConditionResult
		locTypeConditionResult_HasBounty = defaultLocTypeConditionResult
		if LocationsConditionalDefault.HasForm(nthLocTypeList)
			if nthLocTypeList == Markers_Inns || nthLocTypeList == Markers_PlayerHomes || nthLocTypeList == Markers_Docks
				if PlayerIsInRags == 1
					locTypeConditionResult_IsInRags = 0
				endif
			elseif nthLocTypeList == Markers_BanditCamps
				if PlayerHasAtLeastOneWeaponOrSpell == 0
					locTypeConditionResult_HasWeaponOrSpells = 0
				endif
			elseif nthLocTypeList == Markers_WarlockLairs
				if PlayerHasAtLeastOneSpell == 0
					locTypeConditionResult_HasSpells = 0
				endif
			endif
		endif

		iLocation = nthLocTypeArray.Length
		while iLocation > 0
			iLocation -= 1
			nthLocation = nthLocTypeArray[iLocation]
			if allLocationsInSuitableHoldsArray.Find(nthLocation) > -1
				if EvaluateLocationConditions(nthLocTypeList, nthLocation)
					SuitableLocations.AddForm(nthLocation)
				endif
				SuitableLocationsConditionless.AddForm(nthLocation)
			endif
		endwhile

		iLocType += 1
	endwhile

	FirstIndex = -1
	LastIndex = -1
EndEvent

bool function EvaluateLocationConditions(FormList locTypeList, Form locationForm)

	bool isLocationFormConditional = LocationsConditional.HasForm(locationForm)
	if !LocationsConditional.HasForm(locTypeList) && !isLocationFormConditional
		return true
	endif
	if LocationsConditionalDefault.HasForm(locationForm)
		; processing for individual locations in LocationsConditionalDefault is in ModuleLocations after the threads finish
		; so far there are no such locations where location type also has conditions
		return true
	endif

	if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_Never")
		if StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_Never") == 1
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - Never")
			return false
		endif
	else
		if locTypeConditionResult_Never == -1
			locTypeConditionResult_Never = 1
			if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_Never")
				if StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_Never") == 1
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - Never")
					locTypeConditionResult_Never = 0
					return false
				endif
			endif
		elseif locTypeConditionResult_Never == 0
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - Never")
			return false
		endif
	endif

	if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_Race")
		if StorageUtil.StringListCount(locationForm, "SkyrimUnbound_Condition_RaceIs") > 0
			if StorageUtil.StringListToArray(locationForm, "SkyrimUnbound_Condition_RaceIs").Find(PlayerRaceString) < 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - RaceIs")
				return false
			endif
		elseif StorageUtil.StringListCount(locationForm, "SkyrimUnbound_Condition_RaceIsNot") > 0
			if StorageUtil.StringListToArray(locationForm, "SkyrimUnbound_Condition_RaceIsNot").Find(PlayerRaceString) > -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - RaceIsNot")
				return false
			endif
		endif
	else
		if locTypeConditionResult_Race == -1
			locTypeConditionResult_Race = 1
			if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_Race")
				if StorageUtil.StringListCount(locTypeList, "SkyrimUnbound_Condition_RaceIs") > 0
					if StorageUtil.StringListToArray(locTypeList, "SkyrimUnbound_Condition_RaceIs").Find(PlayerRaceString) < 0
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - RaceIsNot")
						locTypeConditionResult_Race = 0
						return false
					endif
				elseif StorageUtil.StringListCount(locTypeList, "SkyrimUnbound_Condition_RaceIsNot") > 0
					if StorageUtil.StringListToArray(locTypeList, "SkyrimUnbound_Condition_RaceIsNot").Find(PlayerRaceString) > -1
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - RaceIsNot")
						locTypeConditionResult_Race = 0
						return false
					endif
				endif
			endif
		elseif locTypeConditionResult_Race == 0
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - RaceIs/RaceIsNot")
			return false
		endif
	endif

	if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_IsVampire")
		int condition_IsVampire = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_IsVampire")
		if IsPlayerVampire != condition_IsVampire - 1 && condition_IsVampire != -1
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsVampire")
			return false
		endif
	else
		if locTypeConditionResult_IsVampire == -1
			locTypeConditionResult_IsVampire = 1
			if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_IsVampire")
				if IsPlayerVampire != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_IsVampire") - 1
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsVampire")
					locTypeConditionResult_IsVampire = 0
					return false
				endif
			endif
		elseif locTypeConditionResult_IsVampire == 0
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsVampire")
			return false
		endif
	endif

	if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_IsWerewolf")
		int condition_IsWerewolf = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_IsWerewolf")
		if IsPlayerWerewolf != condition_IsWerewolf - 1 && condition_IsWerewolf != -1
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsWerewolf")
			return false
		endif
	else
		if locTypeConditionResult_IsWerewolf == -1
			locTypeConditionResult_IsWerewolf = 1
			if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_IsWerewolf")
				if IsPlayerWerewolf != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_IsWerewolf") - 1
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsWerewolf")
					locTypeConditionResult_IsWerewolf = 0
					return false
				endif
			endif
		elseif locTypeConditionResult_IsWerewolf == 0
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsWerewolf")
			return false
		endif
	endif

	if PlayerHasAtLeastOneSpell != -1
		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_HasSpells")
			int condition_HasSpells = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_HasSpells") 
			if PlayerHasAtLeastOneSpell != condition_HasSpells - 1 && condition_HasSpells != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasSpells")
				return false
			endif
		else
			if locTypeConditionResult_HasSpells == -1
				locTypeConditionResult_HasSpells = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_HasSpells")
					if PlayerHasAtLeastOneSpell != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_HasSpells") - 1 
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasSpells")
						locTypeConditionResult_HasSpells = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_HasSpells == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasSpells")
				return false
			endif
		endif
	endif

	if PlayerHasAtLeastOneWeapon != -1
		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_HasWeapon")
			int condition_HasWeapon = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_HasWeapon")
			if PlayerHasAtLeastOneWeapon != condition_HasWeapon - 1 && condition_HasWeapon != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasWeapon")
				return false
			endif
		else
			if locTypeConditionResult_HasWeapon == -1
				locTypeConditionResult_HasWeapon = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_HasWeapon")
					if PlayerHasAtLeastOneWeapon != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_HasWeapon") - 1
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasWeapon")
						locTypeConditionResult_HasWeapon = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_HasWeapon == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasWeapon")
				return false
			endif
		endif
	endif

	if PlayerHasAtLeastOneWeaponOrSpell != -1
		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_HasWeaponOrSpells")
			int condition_HasWeaponOrSpells = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_HasWeaponOrSpells")
			if PlayerHasAtLeastOneWeaponOrSpell != condition_HasWeaponOrSpells - 1 && condition_HasWeaponOrSpells != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasWeaponOrSpells")
				return false
			endif
		else
			if locTypeConditionResult_HasWeaponOrSpells == -1
				locTypeConditionResult_HasWeaponOrSpells = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_HasWeaponOrSpells")
					if PlayerHasAtLeastOneWeaponOrSpell != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_HasWeaponOrSpells") - 1
						locTypeConditionResult_HasWeaponOrSpells = 0
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasWeaponOrSpells")
						return false
					endif
				endif
			elseif locTypeConditionResult_HasWeaponOrSpells == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasWeaponOrSpells")
				return false
			endif
		endif
	endif

	if PlayerIsInRags != -1
		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_IsInRags")
			int condition_IsInRags = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_IsInRags")
			if PlayerIsInRags != condition_IsInRags - 1 && condition_IsInRags != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsInRags")
				return false
			endif
		else
			if locTypeConditionResult_IsInRags == -1
				locTypeConditionResult_IsInRags = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_IsInRags")
					if PlayerIsInRags != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_IsInRags") - 1
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsInRags")
						locTypeConditionResult_IsInRags = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_IsInRags == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - IsInRags")
				return false
			endif
		endif
	endif

	if PlayerAllowedHeadgear.Length
		if isLocationFormConditional && StorageUtil.IntListCount(locationForm, "SkyrimUnbound_Condition_HeadgearIs") > 0
			int[] allowedHeadgear = StorageUtil.IntListToArray(locationForm, "SkyrimUnbound_Condition_HeadgearIs")
			if allowedHeadgear[0] != -1 && allowedHeadgear.Find(PlayerAllowedHeadgear[0]) < 0 && (PlayerAllowedHeadgear.Length < 2 || allowedHeadgear.Find(PlayerAllowedHeadgear[1]) < 0)
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HeadgearIs")
				return false
			endif
		else
			if locTypeConditionResult_HeadgearIs == -1
				locTypeConditionResult_HeadgearIs = 1
				if StorageUtil.IntListCount(locTypeList, "SkyrimUnbound_Condition_HeadgearIs") > 0
					int[] allowedHeadgear = StorageUtil.IntListToArray(locTypeList, "SkyrimUnbound_Condition_HeadgearIs")
					if allowedHeadgear[0] != -1 && allowedHeadgear.Find(PlayerAllowedHeadgear[0]) < 0 && (PlayerAllowedHeadgear.Length < 2 || allowedHeadgear.Find(PlayerAllowedHeadgear[1]) < 0)
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - HeadgearIs")
						locTypeConditionResult_HeadgearIs = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_HeadgearIs == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HeadgearIs")
				return false
			endif
		endif
	endif

	if PlayerWealth != -1
		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_WealthMin")
			int condition_WealthMin = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_WealthMin")
			if PlayerWealth < condition_WealthMin && condition_WealthMin != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - WealthMin")
				return false
			endif
		else
			if locTypeConditionResult_WealthMin == -1
				locTypeConditionResult_WealthMin = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_WealthMin")
					if PlayerWealth < StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_WealthMin")
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - WealthMin")
						locTypeConditionResult_WealthMin = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_WealthMin == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - WealthMin")
				return false
			endif
		endif

		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_WealthMax")
			int condition_WealthMax = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_WealthMax")
			if PlayerWealth > condition_WealthMax && condition_WealthMax != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - WealthMax")
				return false
			endif
		else
			if locTypeConditionResult_WealthMax == -1
				locTypeConditionResult_WealthMax = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_WealthMax")
					if PlayerWealth > StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_WealthMax")
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - WealthMax")
						locTypeConditionResult_WealthMax = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_WealthMax == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - WealthMax")
				return false
			endif
		endif
	endif

	if PlayerHasBounty != -1
		if isLocationFormConditional && StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_HasBounty")
			int condition_HasBounty = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_HasBounty")
			if PlayerHasBounty != condition_HasBounty - 1 && condition_HasBounty != -1
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasBounty")
				return false
			endif
		else
			if locTypeConditionResult_HasBounty == -1
				locTypeConditionResult_HasBounty = 1
				if StorageUtil.HasIntValue(locTypeList, "SkyrimUnbound_Condition_HasBounty")
					if PlayerHasBounty != StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_HasBounty") - 1
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasBounty")
						locTypeConditionResult_HasBounty = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_HasBounty == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - HasBounty")
				return false
			endif
		endif
	endif

	if PlayerArmorSet
		if isLocationFormConditional && StorageUtil.IntListCount(locationForm, "SkyrimUnbound_Condition_ArmorTypeIs") > 0
			int[] condition_allowedArmorTypes = StorageUtil.IntListToArray(locationForm, "SkyrimUnbound_Condition_ArmorTypeIs")
			if condition_allowedArmorTypes[0] != -1 && condition_allowedArmorTypes[PlayerArmorSetArmorTypeIndex] == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorTypeIs")
				return false
			endif
		else
			if locTypeConditionResult_ArmorTypeIs == -1
				locTypeConditionResult_ArmorTypeIs = 1
				if StorageUtil.IntListCount(locTypeList, "SkyrimUnbound_Condition_ArmorTypeIs") > 0
					int[] condition_allowedArmorTypes = StorageUtil.IntListToArray(locTypeList, "SkyrimUnbound_Condition_ArmorTypeIs")
					if condition_allowedArmorTypes[0] != -1 && condition_allowedArmorTypes[PlayerArmorSetArmorTypeIndex] == 0
						;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorTypeIs")
						locTypeConditionResult_ArmorTypeIs = 0
						return false
					endif
				endif
			elseif locTypeConditionResult_ArmorTypeIs == 0
				;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorTypeIs")
				return false
			endif
		endif

		int locationHasWhiteOrBlacklist = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_HasBlackOrWhitelist")
		int locTypeHasWhiteOrBlacklist = 0
		if locationHasWhiteOrBlacklist == 0
			locTypeHasWhiteOrBlacklist = StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_HasBlackOrWhitelist")
		endif
		if locationHasWhiteOrBlacklist == 1
			Form[] locationWhitelist = StorageUtil.FormListToArray(locationForm, "SkyrimUnbound_Condition_ArmorIs")
			if locationWhitelist.Length 
				if !ArmorListContainsArmorSet(locationWhitelist, PlayerArmorSet)
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorIs")
					return false
				endif
			else
				Form[] locationBlacklist = StorageUtil.FormListToArray(locationForm, "SkyrimUnbound_Condition_ArmorIsNot")
				if ArmorListContainsArmorSet(locationBlacklist, PlayerArmorSet)
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorIsNot")
					return false
				endif
			endif
		elseif locTypeHasWhiteOrBlacklist == 1
			Form[] locTypeWhitelist = StorageUtil.FormListToArray(locTypeList, "SkyrimUnbound_Condition_ArmorIs")
			Form[] locationAddToRandomList = StorageUtil.FormListToArray(locationForm, "SkyrimUnbound_Condition_ArmorAddToRandom")
			if locTypeWhitelist.Length
				if !locationAddToRandomList.Length && !StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_ArmorAddToRandom_Reset") && !ArmorListContainsArmorSet(locTypeWhitelist, PlayerArmorSet)
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorIs")
					return false
				endif
			else
				Form[] locTypeBlacklist = StorageUtil.FormListToArray(locTypeList, "SkyrimUnbound_Condition_ArmorIsNot")
				if ArmorListContainsArmorSet(locTypeBlacklist, PlayerArmorSet) && (!locationAddToRandomList.Length || !ArmorListContainsArmorSet(locationAddToRandomList, PlayerArmorSet))
					;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorIsNot")
					return false
				endif
			endif
		endif

	elseif !PlayerSelectedNothingAsArmor
		if !ArmorConditionsMatchPlayerChoicesIfArmorIsRandom(locTypeList, locationForm)
			return false
		endif
	endif

	return true

endFunction

bool function ArmorListContainsArmorSet(Form[] armorList, Form armorSet)
	if armorList.Find(armorSet) > -1
		return true
	endif
	int i = armorList.Length
	while i > 0
		i -= 1
		if armorList[i] as FormList && (armorList[i] as FormList).HasForm(armorSet)
			return true
		endif
	endwhile
	return false
endFunction

bool function ArmorConditionsMatchPlayerChoicesIfArmorIsRandom(FormList locTypeList, Form locationForm)
	bool areClothesAllowed = PlayerAllowedClothes
	bool areLightArmorsAllowed = PlayerAllowedLightArmors
	bool areHeavyArmorsAllowed = PlayerAllowedHeavyArmors

	int[] locationAllowedArmorTypes = GetLocationConditionIntArray(locTypeList, locationForm, "SkyrimUnbound_Condition_ArmorTypeIs")
	if locationAllowedArmorTypes.Length
		if locationAllowedArmorTypes[0] == 0
			areClothesAllowed = false
		endif
		if locationAllowedArmorTypes[1] == 0
			areLightArmorsAllowed = false
		endif
		if locationAllowedArmorTypes[2] == 0
			areHeavyArmorsAllowed = false
		endif
		if !(areClothesAllowed || areLightArmorsAllowed || areHeavyArmorsAllowed)
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorTypeIs 1")
			return false
		endif
		if ShouldExcludeHeavyArmors && !areClothesAllowed && !areLightArmorsAllowed
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorTypeIs 2 ")
			return false
		endif
		if ShouldExcludeClothes && !areLightArmorsAllowed && !areHeavyArmorsAllowed
			;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorTypeIs 3")
			return false
		endif
	endif

	int locationHasWhiteOrBlacklist = StorageUtil.GetIntValue(locationForm, "SkyrimUnbound_Condition_HasBlackOrWhitelist")
	int locTypeHasWhiteOrBlacklist = 0
	if locationHasWhiteOrBlacklist == 0
		locTypeHasWhiteOrBlacklist = StorageUtil.GetIntValue(locTypeList, "SkyrimUnbound_Condition_HasBlackOrWhitelist")
	endif
	if locationHasWhiteOrBlacklist != 1 && locTypeHasWhiteOrBlacklist != 1
		return true
	endif

	Form[] locTypeWhitelist = GetLocationConditionFormArray(locTypeList, "SkyrimUnbound_Condition_ArmorIs")
	Form[] locationWhitelist = GetLocationConditionFormArray(locationForm, "SkyrimUnbound_Condition_ArmorIs")
	Form[] locationAddToRandomList = GetLocationConditionFormArray(locationForm, "SkyrimUnbound_Condition_ArmorAddToRandom")
	bool resetAddToRandomList = StorageUtil.HasIntValue(locationForm, "SkyrimUnbound_Condition_ArmorAddToRandom_Reset")
	
	ThisThreadSuitableArmors.Revert()
	if locationWhitelist.Length
		ThisThreadSuitableArmors.AddForms(locationWhitelist)
	elseif locTypeWhitelist.Length && locationHasWhiteOrBlacklist == 0
		if locationAddToRandomList.Length || resetAddToRandomList
			return true
		else
			ThisThreadSuitableArmors.AddForms(locTypeWhitelist)
		endif
	else
		Form[] holdAddToRandomList = GetLocationConditionFormArray(GetHoldListForLocation(locationForm), "SkyrimUnbound_Condition_ArmorAddToRandom")
		Form[] locTypeBlacklist = GetLocationConditionFormArray(locTypeList, "SkyrimUnbound_Condition_ArmorIsNot")
		Form[] locTypeAddToRandomList = GetLocationConditionFormArray(locTypeList, "SkyrimUnbound_Condition_ArmorAddToRandom")

		ThisThreadSuitableArmors.AddForms(ArmorsRandom.ToArray())
		if DefaultAddToRandomListForPlayerRace && DefaultAddToRandomListForPlayerRace.GetSize()
			ThisThreadSuitableArmors.AddForms(DefaultAddToRandomListForPlayerRace.ToArray())
		endif
		if holdAddToRandomList.Length
			ThisThreadSuitableArmors.AddForms(holdAddToRandomList)
		endif
		if locTypeAddToRandomList.Length && !locationAddToRandomList.Length && !resetAddToRandomList
			ThisThreadSuitableArmors.AddForms(locTypeAddToRandomList)
		endif
		if locTypeBlacklist.Length
			int i = locTypeBlacklist.Length
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(locTypeBlacklist[i])
			endwhile
		endif
		if locationAddToRandomList.Length
			ThisThreadSuitableArmors.AddForms(locationAddToRandomList)
		endif
		if locationHasWhiteOrBlacklist == 1
			Form[] locationBlacklist = GetLocationConditionFormArray(locationForm, "SkyrimUnbound_Condition_ArmorIsNot")
			int i = locationBlacklist.Length
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(locationBlacklist[i])
			endwhile
		endif
	endif

	if AreOnlyEntryLevelArmorsAllowed
		int i = ThisThreadSuitableArmors.GetSize()
		Form nthArmor
		while i > 0
			i -= 1
			nthArmor = ThisThreadSuitableArmors.GetAt(i)
			if !ArmorsClothes.HasForm(nthArmor) && !ArmorsEntryLevel.HasForm(nthArmor)
				ThisThreadSuitableArmors.RemoveAddedForm(nthArmor)
			endif
		endwhile
	endif

	if ShouldExcludeBeggarItems || GetLocationConditionInt(locTypeList, locationForm, "SkyrimUnbound_Condition_IsInRags") - 1 == 0
		ThisThreadSuitableArmors.RemoveAddedForm(ArmorSets_Rags)
	endif

	if PlayerHasAtLeastOneSpell == 0
		int i = ArmorsMage.GetSize()
		while i > 0
			i -= 1
			ThisThreadSuitableArmors.RemoveAddedForm(ArmorsMage.GetAt(i))
		endwhile
	endif

	if IsPlayerVampire == 0
		int i = ArmorsVampire.GetSize()
		while i > 0
			i -= 1
			ThisThreadSuitableArmors.RemoveAddedForm(ArmorsVampire.GetAt(i))
		endwhile
	endif

	if PlayerHasAtLeastOneWeapon == 1
		if ShouldExcludeHeavyArmors
			int i = ArmorsHeavy.GetSize()
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(ArmorsHeavy.GetAt(i))
			endwhile
		endif

		if ShouldExcludeArmorsWithNoRandomShield
			int i = ArmorsWithNoRandomShield.GetSize()
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(ArmorsWithNoRandomShield.GetAt(i))
			endwhile
		endif

		if ShouldExcludeClothes
			int i = ArmorsClothes.GetSize()
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(ArmorsClothes.GetAt(i))
			endwhile
		endif

		if ShouldExcludeArmorsWithScimitar
			int i = ArmorsWithScimitar.GetSize()
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(ArmorsWithScimitar.GetAt(i))
			endwhile
		endif

		if ShouldExcludeArmorsWithNoRandomDagger
			int i = ArmorsWithNoRandomDagger.GetSize()
			while i > 0
				i -= 1
				ThisThreadSuitableArmors.RemoveAddedForm(ArmorsWithNoRandomDagger.GetAt(i))
			endwhile
		endif
	endif

	if PlayerAllowedHeadgear.Length == 1 && PlayerAllowedHeadgear[0] == 3
		int i = ArmorsWithNoRandomHood.GetSize()
		while i > 0
			i -= 1
			ThisThreadSuitableArmors.RemoveAddedForm(ArmorsWithNoRandomHood.GetAt(i))
		endwhile
	endif

	if !ThisThreadSuitableArmors.GetSize()
		;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorIs/ArmorIsNot")
		return false
	endif
	if areClothesAllowed && areLightArmorsAllowed && areHeavyArmorsAllowed
		return true
	endif

	Form[] suitableArmors = ThisThreadSuitableArmors.ToArray()
	ThisThreadSuitableArmors.Revert()
	if areClothesAllowed
		ThisThreadSuitableArmors.AddForms(ArmorsClothes.ToArray())
	endif
	if areLightArmorsAllowed
		ThisThreadSuitableArmors.AddForms(ArmorsLight.ToArray())
	endif
	if areHeavyArmorsAllowed
		ThisThreadSuitableArmors.AddForms(ArmorsHeavy.ToArray())
	endif
	int i = suitableArmors.Length
	int countOfSuitableArmorsOfAllowedTypes = 0
	while i > 0
		i -= 1
		if ThisThreadSuitableArmors.HasForm(suitableArmors[i])
			countOfSuitableArmorsOfAllowedTypes += 1
		endif
	endwhile
	if countOfSuitableArmorsOfAllowedTypes
		return true
	else
		;MiscUtil.PrintConsole("Excluded " + locationForm + " - ArmorIs/ArmorIsNot")
		return false
	endif
endFunction

FormList function GetHoldListForLocation(Form locationForm)
	FormList holdList
	if HoldsWithJail.HasForm(locationForm) ; Jail
		holdList = locationForm as FormList
	else
		Form[] holdLists = SuitableHolds.ToArray()
		int iHold = holdLists.Length
		FormList nthHoldList
		while iHold > 0
			iHold -= 1
			nthHoldList = holdLists[iHold] as FormList
			if nthHoldList.HasForm(locationForm)
				holdList = nthHoldList
				iHold = 0
			endif
		endwhile
	endif
	return holdList
endFunction

int function GetLocationConditionInt(FormList locTypeList, Form locationForm, string conditionName)
	int conditionValue = -1
	if StorageUtil.HasIntValue(locationForm, conditionName)
		conditionValue = StorageUtil.GetIntValue(locationForm, conditionName)
	elseif StorageUtil.HasIntValue(locTypeList, conditionName)
		conditionValue = StorageUtil.GetIntValue(locTypeList, conditionName)
	elseif LocationsConditionalDefault.HasForm(locTypeList)
		if conditionName == "SkyrimUnbound_Condition_IsInRags"
			if locTypeList == Markers_Inns || locTypeList == Markers_PlayerHomes || locTypeList == Markers_Docks
				conditionValue = 1 ;0
			endif
		elseif conditionName == "SkyrimUnbound_Condition_HasSpells"
			if locTypeList == Markers_WarlockLairs
				conditionValue = 2 ;1
			endif
		elseif conditionName == "SkyrimUnbound_Condition_HasWeaponOrSpells"
			if locTypeList == Markers_BanditCamps
				conditionValue = 2 ;1
			endif
		endif
	endif
	return conditionValue
endFunction

int[] function GetLocationConditionIntArray(FormList locTypeList, Form locationForm, string conditionName)
	int[] returnedArray
	if StorageUtil.IntListCount(locationForm, conditionName) > 0
		if StorageUtil.IntListFind(locationForm, conditionName, -1) == -1
			returnedArray = StorageUtil.IntListToArray(locationForm, conditionName)
		endif
	elseif StorageUtil.IntListCount(locTypeList, conditionName) > 0
		if StorageUtil.IntListFind(locTypeList, conditionName, -1) == -1
			returnedArray = StorageUtil.IntListToArray(locTypeList, conditionName)
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
		if formToTakeFrom == Hold_Solstheim && conditionName == "SkyrimUnbound_Condition_ArmorAddToRandom"
			return ArmorsDarkElfRacialOrSolstheimAddToRandom.ToArray()
		endif
	endif
	return formsFromList
endFunction
