Scriptname SkyrimUnboundModuleInventory extends SkyrimUnboundModule  

bool Property ChoiceRandomWeapons = true Auto Hidden
int Property ChoiceOneHanded Auto Hidden
int Property ChoiceOneHandedCombination Auto Hidden
int Property ChoiceTwoHanded Auto Hidden
int Property ChoiceRanged Auto Hidden
int Property ChoiceStaff Auto Hidden
int Property ChoiceArmorType Auto Hidden
int Property ChoiceArmorSet Auto Hidden
int Property ChoiceHeadgear Auto Hidden
int Property ChoiceSpellsMode Auto Hidden
int Property ChoiceSpellSchool1 Auto Hidden
int Property ChoiceSpellSchool2 Auto Hidden
bool Property ChoiceSameSchoolSpellsChance = true Auto Hidden
int Property ChoiceWealth Auto Hidden
int Property ChoiceGold = -1 Auto Hidden
int Property ChoiceFood = 2 Auto Hidden
int Property ChoiceDrinks = 2 Auto Hidden
int Property ChoicePotions = 2 Auto Hidden
int Property ChoiceLockpicks = 2 Auto Hidden
int Property ChoiceTorch = 2 Auto Hidden
int Property ChoiceLantern = 2 Auto Hidden
int Property ChoiceWoodcuttersAxe Auto Hidden
int Property ChoicePickaxe Auto Hidden
int Property ChoiceSkooma Auto Hidden
bool Property ChoiceOnlyEntryLevelArmors Auto Hidden
int Property ChoiceWeaponSet Auto Hidden

SkyrimUnboundQuestScript Property MainScript Auto
SkyrimUnboundModuleAbilities Property Abilities Auto
SkyrimUnboundModuleLocations Property Locations Auto

ObjectReference Property SkyrimUnboundStartupAddedItemsStorage Auto

FormList Property ArmorsClothes Auto
FormList Property ArmorsLight Auto
FormList Property ArmorsHeavy Auto
FormList Property ArmorsRandom Auto
FormList Property ArmorsEntryLevel Auto
FormList Property ArmorsWithReducedSteelWeaponsChance Auto
FormList Property ArmorsWithNoRandomHood Auto
FormList Property ArmorsWithNoRandomShield Auto
FormList Property ArmorsWithNoRandomDagger Auto
FormList Property ArmorsMage Auto
FormList Property ArmorsVampire Auto
FormList Property ArmorsRich Auto
FormList Property ArmorsWithScimitar Auto
LeveledItem Property ArmorPart_CollegeHood Auto
LeveledItem Property ArmorSets_FarmClothes Auto
LeveledItem Property ArmorSets_CollegeRobes Auto
LeveledItem Property ArmorSets_Rags Auto
LeveledItem Property ArmorSets_SteelPlateArmor Auto
LeveledItem Property ArmorSets_ScaledArmor Auto
LeveledItem Property ArmorSets_OrcishArmor Auto
LeveledItem Property ArmorSets_AncientNordArmor Auto
LeveledItem Property ArmorSets_ElvenArmor Auto
LeveledItem Property ArmorSets_ElvenLightArmor Auto
FormList Property ArmorsImperialFaction Auto
FormList Property ArmorsArgonianRacialAddToRandom Auto
FormList Property ArmorsBretonRacialAddToRandom Auto
FormList Property ArmorsDarkElfRacialOrSolstheimAddToRandom Auto
FormList Property ArmorsImperialRacialAddToRandom Auto
FormList Property ArmorsHighElfRacialAddToRandom Auto
FormList Property ArmorsKhajiitRacialAddToRandom Auto
FormList Property ArmorsNordRacialAddToRandom Auto
FormList Property ArmorsOrcRacialOrOrcStrongholdAddToRandom Auto
FormList Property ArmorsRedguardRacialAddToRandom Auto
FormList Property ArmorsWoodElfRacialAddToRandom Auto
FormList Property SuitableArmors Auto
FormList Property SuitableArmorsClothes Auto
FormList Property SuitableArmorsLight Auto
FormList Property SuitableArmorsHeavy Auto

FormList Property WeaponTypes1H Auto
FormList Property WeaponTypes2H Auto
FormList Property WeaponTypesRanged Auto
FormList Property WeaponTypes1HRandom Auto
FormList Property WeaponTypes2HRandom Auto
FormList Property Weapons_Daggers Auto
FormList Property Weapons_Swords Auto
FormList Property Weapons_WarAxes Auto
FormList Property Weapons_Maces Auto
FormList Property Weapons_Scimitars Auto
FormList Property Weapons_Greatswords Auto
FormList Property Weapons_Battleaxes Auto
FormList Property Weapons_Warhammers Auto
FormList Property Weapons_Bows Auto
FormList Property Weapons_Crossbows Auto
FormList Property Ammo_Arrows Auto
FormList Property Ammo_Bolts Auto
FormList Property WeaponSets Auto
FormList Property WeaponSet_Iron Auto
FormList Property WeaponSet_Steel Auto
FormList Property WeaponSet_Imperial Auto
FormList Property WeaponSet_Orcish Auto
FormList Property WeaponSet_Elven Auto
FormList Property WeaponSet_AncientNord Auto
FormList Property WeaponsNoRandomDual Auto
LeveledItem Property Shield_DefaultClothes Auto
LeveledItem Property Shield_DefaultLightArmor Auto
LeveledItem Property Shield_DefaultHeavyArmor Auto
FormList Property SuitableWeapons Auto

FormList[] Property SpellLists Auto
FormList[] Property VanillaSpellLists Auto
FormList[] Property StaffLists Auto
FormList[] Property VanillaStaffLists Auto
FormList Property SelectedSpells Auto

FormList Property AddonItems Auto
LeveledItem Property SkyrimUnboundFoodBeggar Auto
LeveledItem Property SkyrimUnboundDrinksCheap Auto
LeveledItem Property SkyrimUnboundFoodCheap Auto
LeveledItem Property SkyrimUnboundDrinksCommon Auto
LeveledItem Property SkyrimUnboundFoodCommon Auto
LeveledItem Property SkyrimUnboundPotionsCommon Auto
LeveledItem Property SkyrimUnboundPotionsCommonMagic Auto
LeveledItem Property SkyrimUnboundGems Auto
LeveledItem Property SkyrimUnboundDrinksNoble Auto
LeveledItem Property SkyrimUnboundFoodNoble Auto
LeveledItem Property SkyrimUnboundPotionsNoble Auto
LeveledItem Property SkyrimUnboundPotionsNobleMagic Auto
LeveledItem Property SkyrimUnboundLantern Auto
MiscObject Property Gold001 Auto
MiscObject Property Lockpick Auto
MiscObject Property Lantern01 Auto
Light Property Torch01 Auto
Weapon Property Axe01 Auto
Weapon Property weapPickaxe Auto
Potion Property Skooma Auto
Spell Property Candlelight Auto
Spell Property Magelight Auto

string[] ValidJsonProperties_Armors
string[] ValidJsonValues_ArmorFlags
string[] ValidJsonProperties_Weapons
string[] ValidJsonValues_WeaponFlags
string[] ValidJsonProperties_WeaponTypes
string[] ValidJsonValues_WeaponTypeFlags
string[] ValidJsonProperties_WeaponSets
string[] ValidJsonProperties_Items
string[] ValidJsonProperties_ItemsOptions

bool wasGivePlayerStuffCalledOnce = false


function BeforeLoadingAddons()

	ValidJsonProperties_Armors = new string[5]
	ValidJsonProperties_Armors[0] = "fArmorSet"
	ValidJsonProperties_Armors[1] = "sName"
	ValidJsonProperties_Armors[2] = "sType"
	ValidJsonProperties_Armors[3] = "fAutoWeaponSet"
	ValidJsonProperties_Armors[4] = "fAddToLists"

	ValidJsonValues_ArmorFlags = new string[8]
	ValidJsonValues_ArmorFlags[0] = "AddToRandom"
	ValidJsonValues_ArmorFlags[1] = "EntryLevelArmor"
	ValidJsonValues_ArmorFlags[2] = "NoRandomHood"
	ValidJsonValues_ArmorFlags[3] = "NoRandomShield"
	ValidJsonValues_ArmorFlags[4] = "NoRandomDagger"
	ValidJsonValues_ArmorFlags[5] = "Scimitar"
	ValidJsonValues_ArmorFlags[6] = "MageOutfit"
	ValidJsonValues_ArmorFlags[7] = "VampireOutfit"

	ValidJsonProperties_Weapons = new string[6]
	ValidJsonProperties_Weapons[0] = "fWeapon"
	ValidJsonProperties_Weapons[1] = "sType"
	ValidJsonProperties_Weapons[2] = "fWeaponTypeList"
	ValidJsonProperties_Weapons[3] = "sWeaponSet"
	ValidJsonProperties_Weapons[4] = "fWeaponSet"
	ValidJsonProperties_Weapons[5] = "sFlags"

	ValidJsonValues_WeaponFlags = new string[1]
	ValidJsonValues_WeaponFlags[0] = "NoRandomDual"

	ValidJsonProperties_WeaponTypes = new string[4]
	ValidJsonProperties_WeaponTypes[0] = "fWeaponTypeList"
	ValidJsonProperties_WeaponTypes[1] = "sName"
	ValidJsonProperties_WeaponTypes[2] = "sCategory"
	ValidJsonProperties_WeaponTypes[3] = "sFlags"

	ValidJsonValues_WeaponTypeFlags = new string[1]
	ValidJsonValues_WeaponTypeFlags[0] = "AddToRandom"

	ValidJsonProperties_WeaponSets = new string[3]
	ValidJsonProperties_WeaponSets[0] = "fWeaponSet"
	ValidJsonProperties_WeaponSets[1] = "sName"
	ValidJsonProperties_WeaponSets[2] = "fAutoWeaponSetOn"

	ValidJsonProperties_Items = new string[5]
	ValidJsonProperties_Items[0] = "fItem"
	ValidJsonProperties_Items[1] = "options"
	ValidJsonProperties_Items[2] = "sName"
	ValidJsonProperties_Items[3] = "iCount"
	ValidJsonProperties_Items[4] = "fItemByWealth"

	ValidJsonProperties_ItemsOptions = new string[4]
	ValidJsonProperties_ItemsOptions[0] = "fItem"
	ValidJsonProperties_ItemsOptions[1] = "sName"
	ValidJsonProperties_ItemsOptions[2] = "iCount"
	ValidJsonProperties_ItemsOptions[3] = "fItemByWealth"

	int iSchool = 5
	while iSchool
		iSchool -= 1
		SpellLists[iSchool].AddForms(VanillaSpellLists[iSchool].ToArray())
		StaffLists[iSchool].AddForms(VanillaStaffLists[iSchool].ToArray())
	endwhile

	if Game.GetModByName("Chesko_WearableLantern.esp") != 255
		SkyrimUnboundLantern.AddForm(Game.GetFormFromFile(0x111C2, "Chesko_WearableLantern.esp"), 1, 1)
	endif
	if Game.GetModByName("Usable lantern.esp") != 255
		SkyrimUnboundLantern.AddForm(Lantern01, 1, 1)
	endif
	if Game.GetModByName("QwibLantern.esp") != 255
		SkyrimUnboundLantern.AddForm(Game.GetFormFromFile(0xD63, "QwibLantern.esp"), 1, 1)
	endif
	if Game.GetModByName("Realistic Usable Lanterns.esp") != 255
		SkyrimUnboundLantern.AddForm(Game.GetFormFromFile(0x844, "Realistic Usable Lanterns.esp"), 1, 1)
	endif

	WeaponTypesRanged.AddForm(Weapons_Crossbows)

endFunction

function LoadAddon(string fileName)

	int i = 0
	int len = JsonUtil.PathCount(fileName, ".armors")
	while i < len
		ImportArmor(fileName, ".armors["+ i + "]")
		i += 1
	endwhile

	i = 0
	len = JsonUtil.PathCount(fileName, ".weapons")
	while i < len
		ImportWeapon(fileName, ".weapons[" + i + "]")
		i += 1
	endwhile

	i = 0
	len = JsonUtil.PathCount(fileName, ".weaponTypes")
	while i < len
		ImportWeaponType(fileName, ".weaponTypes[" + i + "]")
		i += 1
	endwhile

	i = 0
	len = JsonUtil.PathCount(fileName, ".weaponSets")
	while i < len
		ImportWeaponSet(fileName, ".weaponSets[" + i + "]")
		i += 1
	endwhile

	i = 0
	len = JsonUtil.PathCount(fileName, ".items")
	while i < len
		ImportItem(fileName, ".items[" + i + "]")
		i += 1
	endwhile

	ImportSpells(fileName)
	ImportStaffs(fileName)

endFunction

function AfterLoadingAddons()
	if Weapons_Crossbows.GetSize()
		StorageUtil.SetStringValue(Weapons_Crossbows, "SkyrimUnbound_Name", "$SU_Crossbow")
	else
		WeaponTypesRanged.RemoveAddedForm(Weapons_Crossbows)
	endif
endFunction

bool function IsItem(Form akForm)
	return akForm as LeveledItem || akForm as MiscObject || akForm as Armor || akForm as Weapon || akForm as Ammo || akForm as Potion || akForm as Scroll ||  akForm as Ingredient || akForm as Book
endFunction

function ImportArmor(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_Armors)

	Form fArmorSet = GetJsonForm(fileName, elPath, ".fArmorSet", true)
	if !fArmorSet
		return
	elseif !(fArmorSet as LeveledItem || fArmorSet as Outfit)
		ShowAddonLoadingError(fileName, elPath, "fArmorSet is of an unsupported type (allowed types: LeveledItem, Outfit)")
		return
	endif
		
	string sName = GetJsonString(fileName, elPath, ".sName", true)
	if !sName
		return
	endif
	StorageUtil.SetStringValue(fArmorSet, "SkyrimUnbound_Name", sName)

	string sType = GetJsonString(fileName, elPath, ".sType", true)
	if !sType
		return
	elseif sType == "Clothes"
		ArmorsClothes.AddForm(fArmorSet)
	elseif sType == "Light"
		ArmorsLight.AddForm(fArmorSet)
	elseif sType == "Heavy"
		ArmorsHeavy.AddForm(fArmorSet)
	elseif sType
		ShowAddonLoadingError(fileName, elPath, "Unknown sType value: \"" + sType + "\"")
		return
	endif
		
	Form fAutoWeaponSet = GetJsonForm(fileName, elPath, ".fAutoWeaponSet", false)
	if fAutoWeaponSet
		StorageUtil.SetFormValue(fArmorSet, "SkyrimUnbound_AutoWeaponSet", fAutoWeaponSet)
	endif

	string[] flags = GetJsonStringArray(fileName, elPath, ".sFlags", false, checkForInvalidValues = true, validValues = ValidJsonValues_ArmorFlags)
	if flags.Length
		if flags.Find("AddToRandom") > -1
			ArmorsRandom.AddForm(fArmorSet)
		endif
		if flags.Find("EntryLevelArmor") > -1
			ArmorsEntryLevel.AddForm(fArmorSet)
		endif
		if flags.Find("NoRandomHood") > -1
			ArmorsWithNoRandomHood.AddForm(fArmorSet)
		endif
		if flags.Find("NoRandomShield") > -1
			ArmorsWithNoRandomShield.AddForm(fArmorSet)
		endif
		if flags.Find("NoRandomDagger") > -1
			ArmorsWithNoRandomDagger.AddForm(fArmorSet)
		endif
		if flags.Find("Scimitar") > -1
			ArmorsWithScimitar.AddForm(fArmorSet)
		endif
		if flags.Find("MageOutfit") > -1
			ArmorsMage.AddForm(fArmorSet)
		endif
		if flags.Find("VampireOutfit") > -1
			ArmorsVampire.AddForm(fArmorSet)
		endif
	endif

	Form[] fAddToLists = GetJsonFormArray(fileName, elPath, ".fAddToLists", false)
	if fAddToLists.Length
		int i = fAddToLists.Length
		while i > 0
			i -= 1
			FormList nthList = fAddToLists[i] as FormList
			if nthList
				nthList.AddForm(fArmorSet)
			else
				ShowAddonLoadingError(fileName, elPath, "fAddToLists[" + i + "] is of an unsupported type (allowed types: FormList)")
			endif
		endwhile
	endif

endFunction

function ImportWeapon(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_Weapons)

	Form fWeapon = GetJsonForm(fileName, elPath, ".fWeapon", true)
	if !fWeapon
		return
	elseif !(fWeapon as Weapon || fWeapon as Ammo || fWeapon as LeveledItem)
		ShowAddonLoadingError(fileName, elPath, "fWeapon is of an unsupported type (allowed types: Weapon, Ammo, LeveledItem)")
		return
	endif

	string sType = GetJsonString(fileName, elPath, ".sType", false)
	FormList fWeaponTypeList
	if !sType
		Form fWeaponTypeList_Form = GetJsonForm(fileName, elPath, ".fWeaponTypeList", false)
		fWeaponTypeList = fWeaponTypeList_Form as FormList
		if fWeaponTypeList_Form && !fWeaponTypeList
			ShowAddonLoadingError(fileName, elPath, "fWeaponTypeList is of an unsupported type (allowed types: FormList)")
			return
		endif
	elseif sType == "Dagger"
		fWeaponTypeList = Weapons_Daggers
	elseif sType == "Sword"
		fWeaponTypeList = Weapons_Swords
	elseif sType == "Axe"
		fWeaponTypeList = Weapons_WarAxes
	elseif sType == "Mace"
		fWeaponTypeList = Weapons_Maces
	elseif sType == "Scimitar"
		fWeaponTypeList = Weapons_Scimitars
	elseif sType == "Greatsword"
		fWeaponTypeList = Weapons_Greatswords
	elseif sType == "Battleaxe"
		fWeaponTypeList = Weapons_Battleaxes
	elseif sType == "Warhammer"
		fWeaponTypeList = Weapons_Warhammers
	elseif sType == "Bow"
		fWeaponTypeList = Weapons_Bows
	elseif sType == "Crossbow"
		fWeaponTypeList = Weapons_Crossbows
	elseif sType == "Arrow"
		fWeaponTypeList = Ammo_Arrows
	elseif sType == "Bolt"
		fWeaponTypeList = Ammo_Bolts
	else
		ShowAddonLoadingError(fileName, elPath, "Unknown sType value: \"" + sType + "\"")
		return
	endif
	if fWeaponTypeList
		fWeaponTypeList.AddForm(fWeapon)
	endif

	FormList fWeaponSet
	string sWeaponSet = GetJsonString(fileName, elPath, ".sWeaponSet", false)
	if !sWeaponSet
		Form fWeaponSet_Form = GetJsonForm(fileName, elPath, ".fWeaponSet", false)
		fWeaponSet = fWeaponSet_Form as FormList
		if fWeaponSet_Form && !fWeaponSet
			ShowAddonLoadingError(fileName, elPath, "fWeaponSet is of an unsupported type (allowed types: FormList)")
			return
		endif
	elseif sWeaponSet == "Iron"
		fWeaponSet = WeaponSet_Iron
	elseif sWeaponSet == "Steel"
		fWeaponSet = WeaponSet_Steel
	elseif sWeaponSet == "Imperial"
		fWeaponSet = WeaponSet_Imperial
	elseif sWeaponSet == "Orcish"
		fWeaponSet = WeaponSet_Orcish
	elseif sWeaponSet == "Elven"
		fWeaponSet = WeaponSet_Elven
	elseif sWeaponSet == "Ancient Nord"
		fWeaponSet = WeaponSet_AncientNord
	else
		ShowAddonLoadingError(fileName, elPath, "Unknown sWeaponSet value: \"" + sWeaponSet + "\"")
		return
	endif
	if fWeaponSet
		fWeaponSet.AddForm(fWeapon)
	endif

	string[] flags = GetJsonStringArray(fileName, elPath, ".sFlags", false, checkForInvalidValues = true, validValues = ValidJsonValues_WeaponFlags)
	if flags.Length
		if flags.Find("NoRandomDual") > -1
			WeaponsNoRandomDual.AddForm(fWeapon)
		endif
	endif

endFunction

function ImportWeaponType(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_WeaponTypes)

	Form fWeaponTypeList = GetJsonForm(fileName, elPath, ".fWeaponTypeList", true)
	if !fWeaponTypeList
		return
	elseif !(fWeaponTypeList as FormList)
		ShowAddonLoadingError(fileName, elPath, "fWeaponTypeList is of an unsupported type (allowed types: FormList)")
		return
	endif

	string sName = GetJsonString(fileName, elPath, ".sName", true)
	if !sName
		return
	endif
	StorageUtil.SetStringValue(fWeaponTypeList, "SkyrimUnbound_Name", sName)

	string sCategory = GetJsonString(fileName, elPath, ".sCategory", true)
	if !sCategory
		return
	elseif sCategory == "1H"
		WeaponTypes1H.AddForm(fWeaponTypeList)
	elseif sCategory == "2H"
		WeaponTypes2H.AddForm(fWeaponTypeList)
	elseif sCategory == "Ranged"
		WeaponTypesRanged.AddForm(fWeaponTypeList)
	else
		ShowAddonLoadingError(fileName, elPath, "Unknown sCategory value: \"" + sCategory + "\"")
		return
	endif

	string[] flags = GetJsonStringArray(fileName, elPath, ".sFlags", false, checkForInvalidValues = true, validValues = ValidJsonValues_WeaponTypeFlags)
	if flags.Length
		if flags.Find("AddToRandom") > -1
			if sCategory == "1H"
				WeaponTypes1HRandom.AddForm(fWeaponTypeList)
			elseif sCategory == "2H"
				WeaponTypes2HRandom.AddForm(fWeaponTypeList)
			elseif sCategory == "Ranged"
				ShowAddonLoadingError(fileName, elPath, "Flag \"AddToRandom\" is not supported for Ranged weapons")
			endif
		endif
	endif

endFunction

function ImportWeaponSet(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_WeaponSets)

	Form fWeaponSet = GetJsonForm(fileName, elPath, ".fWeaponSet", true)
	if !fWeaponSet
		return
	elseif !(fWeaponSet as FormList)
		ShowAddonLoadingError(fileName, elPath, "fWeaponSet is of an unsupported type (allowed types: FormList)")
		return
	endif
	WeaponSets.AddForm(fWeaponSet)

	string sName = GetJsonString(fileName, elPath, ".sName", true)
	if !sName
		return
	endif
	StorageUtil.SetStringValue(fWeaponSet, "SkyrimUnbound_Name", sName)

	Form[] fAutoWeaponSetOn = GetJsonFormArray(fileName, elPath, ".fAutoWeaponSetOn", false)
	if fAutoWeaponSetOn.Length
		int i = fAutoWeaponSetOn.Length
		while i > 0
			i -= 1
			Form nthArmorSet = fAutoWeaponSetOn[i]
			if nthArmorSet as LeveledItem || nthArmorSet as Outfit
				StorageUtil.SetFormValue(nthArmorSet, "SkyrimUnbound_AutoWeaponSet", fWeaponSet)
			else
				ShowAddonLoadingError(fileName, elPath, "fAutoWeaponSetOn[" + i + "] is of an unsupported type (allowed types: LeveledItem, Outfit)")
			endif
		endwhile
	endif

endFunction

function ImportSpells(string fileName)
	if JsonUtil.CanResolvePath(fileName, ".spells")
		Form[] spellsToRemove = JsonUtil.PathFormElements(fileName, ".spells.remove")
		int i = spellsToRemove.Length
		while i > 0
			i -= 1
			Form nthSpell = spellsToRemove[i]
			SpellLists[0].RemoveAddedForm(nthSpell)
			SpellLists[1].RemoveAddedForm(nthSpell)
			SpellLists[2].RemoveAddedForm(nthSpell)
			SpellLists[3].RemoveAddedForm(nthSpell)
			SpellLists[4].RemoveAddedForm(nthSpell)
		endwhile
		SpellLists[0].AddForms(JsonUtil.PathFormElements(fileName, ".spells.alteration"))
		SpellLists[1].AddForms(JsonUtil.PathFormElements(fileName, ".spells.conjuration"))
		SpellLists[2].AddForms(JsonUtil.PathFormElements(fileName, ".spells.destruction"))
		SpellLists[3].AddForms(JsonUtil.PathFormElements(fileName, ".spells.illusion"))
		SpellLists[4].AddForms(JsonUtil.PathFormElements(fileName, ".spells.restoration"))
	endif
endFunction

function ImportStaffs(string fileName)
	if JsonUtil.CanResolvePath(fileName, ".staffs")
		Form[] staffsToRemove = JsonUtil.PathFormElements(fileName, ".staffs.remove")
		int i = staffsToRemove.Length
		while i > 0
			i -= 1
			Form nthStaff = staffsToRemove[i]
			StaffLists[0].RemoveAddedForm(nthStaff)
			StaffLists[1].RemoveAddedForm(nthStaff)
			StaffLists[2].RemoveAddedForm(nthStaff)
			StaffLists[3].RemoveAddedForm(nthStaff)
			StaffLists[4].RemoveAddedForm(nthStaff)
		endwhile
		StaffLists[0].AddForms(JsonUtil.PathFormElements(fileName, ".staffs.alteration"))
		StaffLists[1].AddForms(JsonUtil.PathFormElements(fileName, ".staffs.conjuration"))
		StaffLists[2].AddForms(JsonUtil.PathFormElements(fileName, ".staffs.destruction"))
		StaffLists[3].AddForms(JsonUtil.PathFormElements(fileName, ".staffs.illusion"))
		StaffLists[4].AddForms(JsonUtil.PathFormElements(fileName, ".staffs.restoration"))
	endif
endFunction

function ImportItem(string fileName, string elPath)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_Items)

	Form fItem = GetJsonForm(fileName, elPath, ".fItem", true)
	if !fItem
		return
	elseif !(fItem as FormList || IsItem(fItem))
		ShowAddonLoadingError(fileName, elPath, "fItem is of an unsupported type (allowed types: FormList, LeveledItem, MiscObject, Armor, Weapon, Ammo, Potion, Scroll, SoulGem, Ingredient, Book, Key)")
		return
	endif

	if !ImportCommonItemProperties(fileName, elPath, fItem)
		return
	endif
		
	if fItem as FormList
		FormList fItem_FormList = fItem as FormList
		int i = 0
		int numOptions = fItem_FormList.GetSize()
		while i < numOptions
			Form item = fItem_FormList.GetAt(i)
			string itemName = item.GetName()
			if itemName
				StorageUtil.SetStringValue(item, "SkyrimUnbound_Name", itemName)
			endif
			i += 1
		endwhile
		i = 0
		numOptions = JsonUtil.PathCount(fileName, elPath + ".options")
		while i < numOptions
			ImportItemOption(fileName, elPath + ".options[" + i + "]", fItem_FormList)
			i += 1
		endwhile
	endif

	AddonItems.AddForm(fItem)

endFunction

function ImportItemOption(string fileName, string elPath, FormList itemList)

	ReportUnknownJsonProperties(fileName, elPath, ValidJsonProperties_ItemsOptions)

	Form fItem = GetJsonForm(fileName, elPath, ".fItem", true)
	if !fItem
		return
	elseif !IsItem(fItem)
		ShowAddonLoadingError(fileName, elPath, "fItem is of an unsupported type (allowed types: LeveledItem, MiscObject, Armor, Weapon, Ammo, Potion, Scroll, SoulGem, Ingredient, Book, Key)")
		return
	endif

	if !ImportCommonItemProperties(fileName, elPath, fItem)
		return
	endif

	itemList.AddForm(fItem)

endFunction

bool function ImportCommonItemProperties(string fileName, string elPath, Form fItem)
{imports properties common to items and items[i].options}

	string sName = GetJsonString(fileName, elPath, ".sName", false)
	if !sName
		sName = fItem.GetName()
		if !sName
			ShowAddonLoadingError(fileName, elPath, "sName is not set and can't retrieve it automatically")
			return false
		endif
	endif
	StorageUtil.SetStringValue(fItem, "SkyrimUnbound_Name", sName)

	int iCount = GetJsonInt(fileName, elPath, ".iCount", false)
	if iCount > 1
		StorageUtil.SetIntValue(fItem, "SkyrimUnbound_ItemCount", iCount)
	endif

	if !(fItem as FormList)
		Form[] fItemByWealth = GetJsonFormArray(fileName, elPath, ".fItemByWealth", false, 4)
		if fItemByWealth.Length
			int i = fItemByWealth.Length
			while i > 0
				i -= 1
				if !(fItemByWealth[i] == fItem || IsItem(fItemByWealth[i]))
					ShowAddonLoadingError(fileName, elPath, "fItemByWealth[" + i + "] is of an unsupported type (allowed types: LeveledItem, MiscObject, Armor, Weapon, Ammo, Potion, Scroll, SoulGem, Ingredient, Book, Key)")
				endif
			endwhile
			StorageUtil.FormListCopy(fItem, "SkyrimUnbound_ItemByWealth", fItemByWealth)
		endif
	endif

	return true

endFunction

function SavePreset(string fileName)
	
	JsonUtil.SetIntValue(fileName, "ToggleRandomWeapon", ChoiceRandomWeapons as int)
	
	if ChoiceOneHanded > 2
		JsonUtil.UnsetIntValue(fileName, "OneHanded")
		JsonUtil.SetFormValue(fileName, "OneHandedTypeList", WeaponTypes1H.GetAt(ChoiceOneHanded - 3))
	else
		JsonUtil.SetIntValue(fileName, "OneHanded", ChoiceOneHanded)
		JsonUtil.UnsetFormValue(fileName, "OneHandedTypeList")
	endif
	JsonUtil.SetIntValue(fileName, "OneHandedCombo", ChoiceOneHandedCombination)

	if ChoiceTwoHanded > 1
		JsonUtil.UnsetIntValue(fileName, "TwoHanded")
		JsonUtil.SetFormValue(fileName, "TwoHandedTypeList", WeaponTypes2H.GetAt(ChoiceTwoHanded - 2))
	else
		JsonUtil.SetIntValue(fileName, "TwoHanded", ChoiceTwoHanded)
		JsonUtil.UnsetFormValue(fileName, "TwoHandedTypeList")
	endif
	
	if ChoiceRanged > 1
		JsonUtil.UnsetIntValue(fileName, "Ranged")
		JsonUtil.SetFormValue(fileName, "RangedTypeList", WeaponTypesRanged.GetAt(ChoiceRanged - 2))
	else
		JsonUtil.SetIntValue(fileName, "Ranged", ChoiceRanged)
		JsonUtil.UnsetFormValue(fileName, "RangedTypeList")
	endif

	int playerStaff = ChoiceStaff
	int playerStaff2 = 0
	Form staff
	if playerStaff > 1
		int lastIndexPrevious = 1
		int lastIndex = 1
		int iSchool = 0
		while iSchool < 5
			lastIndex += StaffLists[iSchool].GetSize() + 1
			iSchool += 1
			if playerStaff <= lastIndex
				playerStaff2 = playerStaff - (lastIndexPrevious + 1)
				playerStaff = iSchool + 1
				iSchool = 999
			else
				lastIndexPrevious = lastIndex
			endif
		endwhile
		if playerStaff2
			staff = StaffLists[playerStaff - 2].GetAt(playerStaff2 - 1)
		endif
	endif
	JsonUtil.SetIntValue(fileName, "StaffSchool", playerStaff)
	if staff
		JsonUtil.SetFormValue(fileName, "StaffForm", staff)
	else
		JsonUtil.UnsetFormValue(fileName, "StaffForm")
	endif

	if ChoiceWeaponSet
		JsonUtil.SetFormValue(fileName, "WeaponSetList", WeaponSets.GetAt(ChoiceWeaponSet - 1))
	else
		JsonUtil.UnsetFormValue(fileName, "WeaponSetList")
	endif

	JsonUtil.SetIntValue(fileName, "ArmorType", ChoiceArmorType)
	if ChoiceArmorSet
		Form armorSet
		if ChoiceArmorType == 1
			armorSet = ArmorsClothes.GetAt(ChoiceArmorSet - 1)
		elseif ChoiceArmorType == 2
			armorSet = ArmorsLight.GetAt(ChoiceArmorSet - 1)
		elseif ChoiceArmorType == 3
			armorSet = ArmorsHeavy.GetAt(ChoiceArmorSet - 1)
		endif
		JsonUtil.SetFormValue(fileName, "ArmorSet", armorSet)
	else
		JsonUtil.UnsetFormValue(fileName, "ArmorSet")
	endif
	JsonUtil.SetIntValue(fileName, "Headgear", ChoiceHeadgear)
	JsonUtil.SetIntValue(fileName, "OnlyEntryLevelArmors", ChoiceOnlyEntryLevelArmors as int)

	JsonUtil.SetIntValue(fileName, "Spells", ChoiceSpellsMode)
	JsonUtil.SetIntValue(fileName, "PrimarySchool", ChoiceSpellSchool1)
	JsonUtil.SetIntValue(fileName, "SecondarySchool", ChoiceSpellSchool2)
	JsonUtil.SetIntValue(fileName, "SameSchoolChance", ChoiceSameSchoolSpellsChance as int)

	JsonUtil.FormListClear(fileName, "Spells")
	int i = SelectedSpells.GetSize()
	while i > 0
		i -= 1
		Form nthSpell = SelectedSpells.GetAt(i)
		bool isSpellFoundInLists = false
		int iSchool = SpellLists.Length
		while iSchool > 0
			iSchool -= 1
			if SpellLists[iSchool].HasForm(nthSpell)
				isSpellFoundInLists = true
				iSchool = 0
			endif
		endwhile
		if isSpellFoundInLists
			JsonUtil.FormListAdd(fileName, "Spells", nthSpell)
		endif
	endwhile

	JsonUtil.SetIntValue(fileName, "Wealth", ChoiceWealth)
	JsonUtil.SetIntValue(fileName, "CustomGold", ChoiceGold)
	JsonUtil.SetIntValue(fileName, "Food", ChoiceFood)
	JsonUtil.SetIntValue(fileName, "Drinks", ChoiceDrinks)
	JsonUtil.SetIntValue(fileName, "Potions", ChoicePotions)
	JsonUtil.SetIntValue(fileName, "Lockpicks", ChoiceLockpicks)
	JsonUtil.SetIntValue(fileName, "Torch", ChoiceTorch)
	JsonUtil.SetIntValue(fileName, "WoodcuttersAxe", ChoiceWoodcuttersAxe)
	JsonUtil.SetIntValue(fileName, "Pickaxe", ChoicePickaxe)
	JsonUtil.SetIntValue(fileName, "Skooma", ChoiceSkooma)
	JsonUtil.SetIntValue(fileName, "Lantern", ChoiceLantern)

	JsonUtil.FormListClear(fileName, "AddonItemsEnabled")
	JsonUtil.FormListClear(fileName, "AddonItemsRandom")
	JsonUtil.FormListClear(fileName, "AddonItemsWithOptions")
	JsonUtil.FormListClear(fileName, "AddonItemsSelectedOptions")
	i = AddonItems.GetSize()
	while i > 0
		i -= 1
		Form item = AddonItems.GetAt(i)
		int playerChoice = StorageUtil.GetIntValue(item, "SkyrimUnbound_PlayerChoice")
		if item as FormList
			if playerChoice
				JsonUtil.FormListAdd(fileName, "AddonItemsWithOptions", item)
				if playerChoice == 1
					JsonUtil.FormListAdd(fileName, "AddonItemsSelectedOptions", item)
				else
					JsonUtil.FormListAdd(fileName, "AddonItemsSelectedOptions", (item as FormList).GetAt(playerChoice - 2))
				endif
			endif
		else
			if playerChoice == 1
				JsonUtil.FormListAdd(fileName, "AddonItemsEnabled", item)
			elseif playerChoice == 2
				JsonUtil.FormListAdd(fileName, "AddonItemsRandom", item)
			endif
		endif
	endwhile

endFunction

bool function LoadPreset(string fileName)
	
	bool missingContent = false

	ChoiceRandomWeapons = JsonUtil.GetIntValue(fileName, "ToggleRandomWeapon")
	
	if JsonUtil.HasFormValue(fileName, "OneHandedTypeList")
		Form oneHandedTypeList = JsonUtil.GetFormValue(fileName, "OneHandedTypeList")
		if oneHandedTypeList
			ChoiceOneHanded = WeaponTypes1H.Find(oneHandedTypeList) + 3
			if ChoiceOneHanded == 2
				missingContent = true
				ChoiceOneHanded = 1
			endif
		else
			missingContent = true
			ChoiceOneHanded = 1
		endif
	else
		ChoiceOneHanded = JsonUtil.GetIntValue(fileName, "OneHanded")
	endif
	ChoiceOneHandedCombination = JsonUtil.GetIntValue(fileName, "OneHandedCombo")

	if JsonUtil.HasFormValue(fileName, "TwoHandedTypeList")
		Form twoHandedTypeList = JsonUtil.GetFormValue(fileName, "TwoHandedTypeList")
		if twoHandedTypeList
			ChoiceTwoHanded = WeaponTypes2H.Find(twoHandedTypeList) + 2
			if ChoiceTwoHanded == 1
				missingContent = true
			endif
		else
			missingContent = true
			ChoiceTwoHanded = 1
		endif
	else
		ChoiceTwoHanded = JsonUtil.GetIntValue(fileName, "TwoHanded")
	endif

	if JsonUtil.HasFormValue(fileName, "RangedTypeList")
		Form rangedTypeList = JsonUtil.GetFormValue(fileName, "RangedTypeList")
		if rangedTypeList
			ChoiceRanged = WeaponTypesRanged.Find(rangedTypeList) + 2
			if ChoiceRanged == 1
				missingContent = true
			endif
		else
			missingContent = true
			ChoiceRanged = 1
		endif
	else
		ChoiceRanged = JsonUtil.GetIntValue(fileName, "Ranged")
	endif

	int staffSchool = JsonUtil.GetIntValue(fileName, "StaffSchool")
	if staffSchool <= 1
		ChoiceStaff = staffSchool
	else
		int staffSchoolIndex = staffSchool - 2
		Form staffForm
		int indexOfStaffInSchool = -1
		if JsonUtil.HasFormValue(fileName, "StaffForm")
			staffForm = JsonUtil.GetFormValue(fileName, "StaffForm")
			if staffForm
				indexOfStaffInSchool = StaffLists[staffSchoolIndex].Find(staffForm)
				if indexOfStaffInSchool < 0
					missingContent = true
					staffForm = None
				endif
			else
				missingContent = true
			endif
		endif

		ChoiceStaff = 2
		int iSchool = 0
		while iSchool < 5
			if iSchool == staffSchoolIndex
				if staffForm
					ChoiceStaff += 1 + indexOfStaffInSchool
				endif
				iSchool = 999
			else
				ChoiceStaff += StaffLists[iSchool].GetSize() + 1
				iSchool += 1
			endif	
		endwhile
	endif

	ChoiceWeaponSet = 0
	Form weaponSetList = JsonUtil.GetFormValue(fileName, "WeaponSetList")
	if weaponSetList
		ChoiceWeaponSet = WeaponSets.Find(weaponSetList) + 1
		if ChoiceWeaponSet == 0
			missingContent = true
		endif
	elseif JsonUtil.HasFormValue(fileName, "WeaponSetList")
		missingContent = true
	endif

	ChoiceArmorType = JsonUtil.GetIntValue(fileName, "ArmorType")
	ChoiceArmorSet = 0
	Form ArmorSet = JsonUtil.GetFormValue(fileName, "ArmorSet")
	if ArmorSet
		if ChoiceArmorType == 1
			ChoiceArmorSet = ArmorsClothes.Find(ArmorSet) + 1
		elseif ChoiceArmorType == 2
			ChoiceArmorSet = ArmorsLight.Find(ArmorSet) + 1
		elseif ChoiceArmorType == 3
			ChoiceArmorSet = ArmorsHeavy.Find(ArmorSet) + 1
		endif
		if ChoiceArmorSet == 0
			missingContent = true
		endif
	elseif JsonUtil.HasFormValue(fileName, "ArmorSet")
		missingContent = true
	endif
	ChoiceHeadgear = JsonUtil.GetIntValue(fileName, "Headgear")
	ChoiceOnlyEntryLevelArmors = JsonUtil.GetIntValue(fileName, "OnlyEntryLevelArmors")
	
	ChoiceSpellsMode = JsonUtil.GetIntValue(fileName, "Spells")
	ChoiceSpellSchool1 = JsonUtil.GetIntValue(fileName, "PrimarySchool")
	ChoiceSpellSchool2 = JsonUtil.GetIntValue(fileName, "SecondarySchool")
	ChoiceSameSchoolSpellsChance = JsonUtil.GetIntValue(fileName, "SameSchoolChance")

	SelectedSpells.Revert()
	int i = JsonUtil.FormListCount(fileName, "Spells")
	while i > 0
		i -= 1
		Form TheSpell = JsonUtil.FormListGet(fileName, "Spells", i)
		if TheSpell
			bool isSpellFoundInLists = false
			int iSchool = SpellLists.Length
			while iSchool > 0
				iSchool -= 1
				if SpellLists[iSchool].HasForm(TheSpell)
					isSpellFoundInLists = true
					iSchool = 0
				endif
			endwhile
			if isSpellFoundInLists
				SelectedSpells.AddForm(TheSpell)
			else
				missingContent = true
			endif
		else
			missingContent = true
		endif
	endwhile

	ChoiceWealth = JsonUtil.GetIntValue(fileName, "Wealth")
	ChoiceGold = JsonUtil.GetIntValue(fileName, "CustomGold")
	ChoiceFood = JsonUtil.GetIntValue(fileName, "Food")
	ChoiceDrinks = JsonUtil.GetIntValue(fileName, "Drinks")
	ChoicePotions = JsonUtil.GetIntValue(fileName, "Potions")
	ChoiceLockpicks = JsonUtil.GetIntValue(fileName, "Lockpicks")
	ChoiceTorch = JsonUtil.GetIntValue(fileName, "Torch")
	ChoiceWoodcuttersAxe = JsonUtil.GetIntValue(fileName, "WoodcuttersAxe")
	ChoicePickaxe = JsonUtil.GetIntValue(fileName, "Pickaxe")
	ChoiceSkooma = JsonUtil.GetIntValue(fileName, "Skooma")
	ChoiceLantern = JsonUtil.GetIntValue(fileName, "Lantern")

	i = AddonItems.GetSize()
	while i
		i -= 1
		StorageUtil.UnsetIntValue(AddonItems.GetAt(i), "SkyrimUnbound_PlayerChoice")
	endwhile
	i = JsonUtil.FormListCount(fileName, "AddonItemsEnabled")
	while i > 0
		i -= 1
		Form AddonItem = JsonUtil.FormListGet(fileName, "AddonItemsEnabled", i)
		if AddonItem && AddonItems.HasForm(AddonItem)
			StorageUtil.SetIntValue(AddonItem, "SkyrimUnbound_PlayerChoice", 1)
		else
			missingContent = true
		endif
	endwhile
	i = JsonUtil.FormListCount(fileName, "AddonItemsRandom")
	while i > 0
		i -= 1
		Form AddonItem = JsonUtil.FormListGet(fileName, "AddonItemsRandom", i)
		if AddonItem && AddonItems.HasForm(AddonItem)
			StorageUtil.SetIntValue(AddonItem, "SkyrimUnbound_PlayerChoice", 2)
		else
			missingContent = true
		endif
	endwhile
	i = JsonUtil.FormListCount(fileName, "AddonItemsWithOptions")
	while i > 0
		i -= 1
		Form AddonItem = JsonUtil.FormListGet(fileName, "AddonItemsWithOptions", i)
		Form SelectedOptionItem = JsonUtil.FormListGet(fileName, "AddonItemsSelectedOptions", i)
		if AddonItem && AddonItems.HasForm(AddonItem) && AddonItem as FormList && SelectedOptionItem
			if AddonItem == SelectedOptionItem
				StorageUtil.SetIntValue(AddonItem, "SkyrimUnbound_PlayerChoice", 1)
			else
				int index = (AddonItem as FormList).Find(SelectedOptionItem)
				if index > -1
					StorageUtil.SetIntValue(AddonItem, "SkyrimUnbound_PlayerChoice", index + 2)
				else
					missingContent = true
				endif
			endif
		else
			missingContent = true
		endif
	endwhile

	return !missingContent

endFunction

function GivePlayerStuff()

	if !wasGivePlayerStuffCalledOnce
		wasGivePlayerStuffCalledOnce = true
		PlayerRef.RemoveAllItems(SkyrimUnboundStartupAddedItemsStorage, true, true)
	endif

	PlayerRef.RemoveAllItems()

	bool noBeggarChance = ShouldExcludeBeggarItems()

	Form armorSet = RandomizeArmorSet(noBeggarChance)
	FormList armorTypeList
	if armorSet
		armorTypeList = GetArmorTypeListByArmorSet(armorSet)
		GiveArmorSet(armorSet)
		GiveHeadgear(RandomizeHeadgear(armorTypeList, armorSet))
	endif
	
	int wealth = RandomizeWealthSet(armorSet, noBeggarChance)

	GiveAddonItems(wealth)
	GiveTools(wealth)
	bool hasAnyWeapons = GiveWeapons(armorTypeList, armorSet, wealth)

	int startingSpellsCount = GiveSpells(armorSet, hasAnyWeapons)

	GiveItems(wealth, startingSpellsCount)


	int iItem = SkyrimUnboundStartupAddedItemsStorage.GetNumItems()
	while iItem > 0
		iItem -= 1
		Form item = SkyrimUnboundStartupAddedItemsStorage.GetNthForm(iItem)
		if PlayerRef.GetItemCount(item) == 0
			AddItem(item, SkyrimUnboundStartupAddedItemsStorage.GetItemCount(item))
		endif
	endwhile

	EquipGearInInventory()

endFunction

Form function RandomizeArmorSet(bool noBeggarChance)
	int armorType = ChoiceArmorType
	if armorType == 4
		return None
	endif
	if ChoiceArmorSet > 0
		return GetArmorTypeList(armorType).GetAt(ChoiceArmorSet - 1)
	endif
	if Locations.GetLocationConditionInt("SkyrimUnbound_Condition_IsInRags") - 1 == 1 && (armorType == 1 || armorType == 0 || armorType == 5 || armorType == 6)
		return ArmorSets_Rags
	endif

	bool areClothesAllowed
	bool areLightArmorsAllowed
	bool areHeavyArmorsAllowed
	if armorType == 0 || armorType >= 5
		areClothesAllowed = true
		areLightArmorsAllowed = true
		areHeavyArmorsAllowed = true
		if armorType == 5
			areHeavyArmorsAllowed = false
		elseif armorType == 6
			areLightArmorsAllowed = false
		elseif armorType == 7
			areClothesAllowed = false
		endif
		int[] locationAllowedArmorTypes = Locations.GetLocationConditionIntArray("SkyrimUnbound_Condition_ArmorTypeIs")
		if locationAllowedArmorTypes.Length
			bool areClothesAllowedWithLocation = areClothesAllowed
			bool areLightArmorsAllowedWithLocation = areLightArmorsAllowed
			bool areHeavyArmorsAllowedWithLocation = areHeavyArmorsAllowed
			if locationAllowedArmorTypes[0] == 0
				areClothesAllowedWithLocation = false
			endif
			if locationAllowedArmorTypes[1] == 0
				areLightArmorsAllowedWithLocation = false
			endif
			if locationAllowedArmorTypes[2] == 0
				areHeavyArmorsAllowedWithLocation = false
			endif
			if areClothesAllowedWithLocation || areLightArmorsAllowedWithLocation || areHeavyArmorsAllowedWithLocation
				areClothesAllowed = areClothesAllowedWithLocation
				areLightArmorsAllowed = areLightArmorsAllowedWithLocation
				areHeavyArmorsAllowed = areHeavyArmorsAllowedWithLocation
			endif
		endif
	else
		areClothesAllowed = false
		areLightArmorsAllowed = false
		areHeavyArmorsAllowed = false
		if armorType == 1
			areClothesAllowed = true
		elseif armorType == 2
			areLightArmorsAllowed = true
		elseif armorType == 3
			areHeavyArmorsAllowed = true
		endif
	endif

	SuitableArmors.Revert()
	bool locationHasArmorWhiteOrBlacklists = false

	Form[] locationWhitelist = Locations.GetLocationConditionFormArray(Locations.FinalLocation, "SkyrimUnbound_Condition_ArmorIs")
	Form[] locationBlacklist = Locations.GetLocationConditionFormArray(Locations.FinalLocation, "SkyrimUnbound_Condition_ArmorIsNot")
	Form[] locationAddToRandomList = Locations.GetLocationConditionFormArray(Locations.FinalLocation, "SkyrimUnbound_Condition_ArmorAddToRandom")
	Form[] locTypeWhitelist = Locations.GetLocationConditionFormArray(Locations.FinalLocationTypeList, "SkyrimUnbound_Condition_ArmorIs")
	bool resetWhitelist = StorageUtil.HasIntValue(Locations.FinalLocation, "SkyrimUnbound_Condition_ArmorIs_Reset")
	bool resetBlacklist = StorageUtil.HasIntValue(Locations.FinalLocation, "SkyrimUnbound_Condition_ArmorIsNot_Reset")
	bool resetAddToRandomList = StorageUtil.HasIntValue(Locations.FinalLocation, "SkyrimUnbound_Condition_ArmorAddToRandom_Reset")

	if locationWhitelist.Length
		locationHasArmorWhiteOrBlacklists = true
		SuitableArmors.AddForms(locationWhitelist)
	elseif locTypeWhitelist.Length && !locationBlacklist.Length && !locationAddToRandomList.Length && !resetWhitelist && !resetBlacklist && !resetAddToRandomList
		locationHasArmorWhiteOrBlacklists = true
		SuitableArmors.AddForms(locTypeWhitelist)
	else
		Form[] holdAddToRandomList = Locations.GetLocationConditionFormArray(Locations.FinalHoldList, "SkyrimUnbound_Condition_ArmorAddToRandom")
		Form[] locTypeAddToRandomList = Locations.GetLocationConditionFormArray(Locations.FinalLocationTypeList, "SkyrimUnbound_Condition_ArmorAddToRandom")
		Form[] locTypeBlacklist = Locations.GetLocationConditionFormArray(Locations.FinalLocationTypeList, "SkyrimUnbound_Condition_ArmorIsNot")

		SuitableArmors.AddForms(ArmorsRandom.ToArray())
		FormList addToRandomListForPlayerRace = GetDefaultAddToRandomListForPlayerRace()
		if addToRandomListForPlayerRace && addToRandomListForPlayerRace.GetSize()
			SuitableArmors.AddForms(addToRandomListForPlayerRace.ToArray())
		endif
		if holdAddToRandomList.Length
			SuitableArmors.AddForms(holdAddToRandomList)
		endif
		if locTypeAddToRandomList.Length && !locationAddToRandomList.Length && !resetAddToRandomList && !resetWhitelist
			SuitableArmors.AddForms(locTypeAddToRandomList)
		endif
		if locTypeBlacklist.Length && !locationBlacklist.Length && !resetBlacklist && !resetWhitelist
			locationHasArmorWhiteOrBlacklists = true
			int i = locTypeBlacklist.Length
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(locTypeBlacklist[i])
			endwhile
		endif
		if locationAddToRandomList.Length
			SuitableArmors.AddForms(locationAddToRandomList)
		endif
		if locationBlacklist.Length
			locationHasArmorWhiteOrBlacklists = true
			int i = locationBlacklist.Length
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(locationBlacklist[i])
			endwhile
		endif
	endif

	if locationHasArmorWhiteOrBlacklists && !SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
		SuitableArmors.Revert()
		SuitableArmors.AddForms(ArmorsRandom.ToArray())
	endif

	Form[] SuitableArmorsBackup = SuitableArmors.ToArray()

	if ChoiceOnlyEntryLevelArmors
		int i = SuitableArmors.GetSize()
		Form nthArmor
		while i > 0
			i -= 1
			nthArmor = SuitableArmors.GetAt(i)
			if !ArmorsClothes.HasForm(nthArmor) && !ArmorsEntryLevel.HasForm(nthArmor)
				SuitableArmors.RemoveAddedForm(nthArmor)
			endif
		endwhile

		if locationHasArmorWhiteOrBlacklists
			if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
				SuitableArmorsBackup = SuitableArmors.ToArray()
			else
				SuitableArmors.Revert()
				SuitableArmors.AddForms(SuitableArmorsBackup)
			endif
		endif
	endif

	if noBeggarChance || Locations.GetLocationConditionInt("SkyrimUnbound_Condition_IsInRags") - 1 == 0
		SuitableArmors.RemoveAddedForm(ArmorSets_Rags)

		if locationHasArmorWhiteOrBlacklists
			if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
				SuitableArmorsBackup = SuitableArmors.ToArray()
			else
				SuitableArmors.Revert()
				SuitableArmors.AddForms(SuitableArmorsBackup)
			endif
		endif
	endif

	if HasPlayerDisabledSpells()
		int i = ArmorsMage.GetSize()
		while i > 0
			i -= 1
			SuitableArmors.RemoveAddedForm(ArmorsMage.GetAt(i))
		endwhile

		if locationHasArmorWhiteOrBlacklists
			if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
				SuitableArmorsBackup = SuitableArmors.ToArray()
			else
				SuitableArmors.Revert()
				SuitableArmors.AddForms(SuitableArmorsBackup)
			endif
		endif
	endif

	if Abilities.ChoiceDisease != 1
		int i = ArmorsVampire.GetSize()
		while i > 0
			i -= 1
			SuitableArmors.RemoveAddedForm(ArmorsVampire.GetAt(i))
		endwhile

		if locationHasArmorWhiteOrBlacklists
			if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
				SuitableArmorsBackup = SuitableArmors.ToArray()
			else
				SuitableArmors.Revert()
				SuitableArmors.AddForms(SuitableArmorsBackup)
			endif
		endif
	endif

	if !ChoiceRandomWeapons 
		if (!ChoiceOneHanded || ChoiceOneHanded == 3) && !ChoiceTwoHanded && (ChoiceOneHanded == 3 || ChoiceRanged || ChoiceStaff) && (areClothesAllowed || areLightArmorsAllowed) && ChoiceArmorType != 6 && ChoiceArmorType != 7
			int i = ArmorsHeavy.GetSize()
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(ArmorsHeavy.GetAt(i))
			endwhile

			if locationHasArmorWhiteOrBlacklists
				if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
					SuitableArmorsBackup = SuitableArmors.ToArray()
				else
					SuitableArmors.Revert()
					SuitableArmors.AddForms(SuitableArmorsBackup)
				endif
			endif
		endif

		if ChoiceOneHanded && ChoiceOneHandedCombination == 2
			int i = ArmorsWithNoRandomShield.GetSize()
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(ArmorsWithNoRandomShield.GetAt(i))
			endwhile

			if locationHasArmorWhiteOrBlacklists
				if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
					SuitableArmorsBackup = SuitableArmors.ToArray()
				else
					SuitableArmors.Revert()
					SuitableArmors.AddForms(SuitableArmorsBackup)
				endif
			endif
		endif
		
		if ((ChoiceOneHanded && ChoiceOneHandedCombination == 2 && ChoiceOneHanded != 3) || ChoiceTwoHanded) && (areLightArmorsAllowed || areHeavyArmorsAllowed) && ChoiceArmorType != 5 && ChoiceArmorType != 6
			int i = ArmorsClothes.GetSize()
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(ArmorsClothes.GetAt(i))
			endwhile

			if locationHasArmorWhiteOrBlacklists
				if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
					SuitableArmorsBackup = SuitableArmors.ToArray()
				else
					SuitableArmors.Revert()
					SuitableArmors.AddForms(SuitableArmorsBackup)
				endif
			endif
		endif

		if (ChoiceOneHanded > 3 && ChoiceOneHanded != 7) || ChoiceTwoHanded
			int i = ArmorsWithScimitar.GetSize()
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(ArmorsWithScimitar.GetAt(i))
			endwhile

			if locationHasArmorWhiteOrBlacklists
				if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
					SuitableArmorsBackup = SuitableArmors.ToArray()
				else
					SuitableArmors.Revert()
					SuitableArmors.AddForms(SuitableArmorsBackup)
				endif
			endif
		endif

		if ChoiceOneHanded == 3 && !(ChoiceTwoHanded || ChoiceRanged || ChoiceStaff)
			int i = ArmorsWithNoRandomDagger.GetSize()
			while i > 0
				i -= 1
				SuitableArmors.RemoveAddedForm(ArmorsWithNoRandomDagger.GetAt(i))
			endwhile

			if locationHasArmorWhiteOrBlacklists
				if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
					SuitableArmorsBackup = SuitableArmors.ToArray()
				else
					SuitableArmors.Revert()
					SuitableArmors.AddForms(SuitableArmorsBackup)
				endif
			endif
		endif
	endif

	if ChoiceHeadgear == 3
		int i = ArmorsWithNoRandomHood.GetSize()
		while i > 0
			i -= 1
			SuitableArmors.RemoveAddedForm(ArmorsWithNoRandomHood.GetAt(i))
		endwhile

		if locationHasArmorWhiteOrBlacklists
			if SuitableArmorsContainsAnyArmorOfTypes(areClothesAllowed, areLightArmorsAllowed, areHeavyArmorsAllowed)
				SuitableArmorsBackup = SuitableArmors.ToArray()
			else
				SuitableArmors.Revert()
				SuitableArmors.AddForms(SuitableArmorsBackup)
			endif
		endif
	endif

	SuitableArmorsClothes.Revert()
	SuitableArmorsLight.Revert()
	SuitableArmorsHeavy.Revert()
	int i = SuitableArmors.GetSize()
	Form nthArmor
	while i > 0
		i -= 1
		nthArmor = SuitableArmors.GetAt(i)
		if ArmorsClothes.HasForm(nthArmor)
			SuitableArmorsClothes.AddForm(nthArmor)
		elseif ArmorsLight.HasForm(nthArmor)
			SuitableArmorsLight.AddForm(nthArmor)
		elseif ArmorsHeavy.HasForm(nthArmor)
			SuitableArmorsHeavy.AddForm(nthArmor)
		endif
	endwhile

	SuitableArmors.Revert()
	if areClothesAllowed && SuitableArmorsClothes.GetSize()
		SuitableArmors.AddForm(SuitableArmorsClothes)
	endif
	if areLightArmorsAllowed && SuitableArmorsLight.GetSize()
		SuitableArmors.AddForm(SuitableArmorsLight)
	endif
	if areHeavyArmorsAllowed && SuitableArmorsHeavy.GetSize()
		SuitableArmors.AddForm(SuitableArmorsHeavy)
	endif
	FormList armorTypeList = SuitableArmors.GetAt(Utility.RandomInt(0, SuitableArmors.GetSize() - 1)) as FormList

	Form armorSet
	if armorTypeList == SuitableArmorsClothes && armorTypeList.HasForm(ArmorSets_FarmClothes)
		; double the chance of farm clothes
		int armorSetIndex = Utility.RandomInt(0, armorTypeList.GetSize()) 
		if armorSetIndex == armorTypeList.GetSize()
			armorSet = ArmorSets_FarmClothes
		else
			armorSet = armorTypeList.GetAt(armorSetIndex)
		endif
	else
		armorSet = armorTypeList.GetAt(Utility.RandomInt(0, armorTypeList.GetSize() - 1))
	endif

	return armorSet

endFunction

FormList function GetDefaultAddToRandomListForPlayerRace()
	string playerRaceString = MainScript.GetPlayerRaceString()
	if playerRaceString == "Argonian"
		return ArmorsArgonianRacialAddToRandom
	elseif playerRaceString == "Breton"
		return ArmorsBretonRacialAddToRandom
	elseif playerRaceString == "Dark Elf"
		return ArmorsDarkElfRacialOrSolstheimAddToRandom
	elseif playerRaceString == "High Elf"
		return ArmorsHighElfRacialAddToRandom
	elseif playerRaceString == "Imperial"
		return ArmorsImperialRacialAddToRandom
	elseif playerRaceString == "Khajiit"
		return ArmorsKhajiitRacialAddToRandom
	elseif playerRaceString == "Nord"
		return ArmorsNordRacialAddToRandom
	elseif playerRaceString == "Orc"
		return ArmorsOrcRacialOrOrcStrongholdAddToRandom
	elseif playerRaceString == "Redguard"
		return ArmorsRedguardRacialAddToRandom
	elseif playerRaceString == "Wood Elf"
		return ArmorsWoodElfRacialAddToRandom
	else
		return None
	endif
endFunction

bool function SuitableArmorsContainsAnyArmorOfTypes(bool areClothesAllowed, bool areLightArmorsAllowed, bool areHeavyArmorsAllowed)
	int countOfSuitableClothes = 0
	int countOfSuitableLightArmors = 0
	int countOfSuitableHeavyArmors = 0

	int i = SuitableArmors.GetSize()
	Form nthArmor
	while i > 0
		i -= 1
		nthArmor = SuitableArmors.GetAt(i)
		if ArmorsClothes.HasForm(nthArmor)
			countOfSuitableClothes += 1
		elseif ArmorsLight.HasForm(nthArmor)
			countOfSuitableLightArmors += 1
		elseif ArmorsHeavy.HasForm(nthArmor)
			countOfSuitableHeavyArmors += 1
		endif
	endwhile

	if (areClothesAllowed && countOfSuitableClothes) || (areLightArmorsAllowed && countOfSuitableLightArmors) || (areHeavyArmorsAllowed && countOfSuitableHeavyArmors)
		return true
	else
		return false
	endif
endFunction

FormList function GetArmorTypeList(int armorType)
	if armorType == 1
		return ArmorsClothes
	elseif armorType == 2
		return ArmorsLight
	elseif armorType == 3
		return ArmorsHeavy
	else
		return None
	endif
endFunction

FormList function GetArmorTypeListByArmorSet(Form armorSet)
	if ArmorsClothes.HasForm(armorSet)
		return ArmorsClothes
	elseif ArmorsLight.HasForm(armorSet)
		return ArmorsLight
	elseif ArmorsHeavy.HasForm(armorSet)
		return ArmorsHeavy
	else
		return None
	endif
endFunction

function GiveArmorSet(Form armorSet)
	if armorSet as Outfit
		Outfit armorSetOutfit = armorSet as Outfit
		int i = armorSetOutfit.GetNumParts()
		while i > 0
			i -= 1
			AddItem(armorSetOutfit.GetNthPart(i))
		endwhile
	else
		AddItem(armorSet)
	endif
endFunction

int function RandomizeHeadgear(FormList armorTypeList, Form armorSet)
	int headgear = ChoiceHeadgear

	if !armorTypeList ; Nothing 
		headgear = 2 ; Default
	elseif headgear == 0 || headgear >= 4
		bool isNothingAllowed = true
		bool isDefaultAllowed = true
		bool isHoodAllowed = true
		if headgear == 4
			isNothingAllowed = false
		elseif headgear == 5
			isDefaultAllowed = false
		elseif headgear == 6
			isHoodAllowed = false
		endif
		int[] locationAllowedHeadgear = Locations.GetLocationConditionIntArray("SkyrimUnbound_Condition_HeadgearIs")
		if locationAllowedHeadgear.Length
			bool isNothingAllowedWithLocation = isNothingAllowed
			bool isDefaultAllowedWithLocation = isDefaultAllowed
			bool isHoodAllowedWithLocation = isHoodAllowed
			if locationAllowedHeadgear.Find(1) == -1
				isNothingAllowedWithLocation = false
			endif
			if locationAllowedHeadgear.Find(2) == -1
				isDefaultAllowedWithLocation = false
			endif
			if locationAllowedHeadgear.Find(3) == -1
				isHoodAllowedWithLocation = false
			endif
			if isNothingAllowedWithLocation || isDefaultAllowedWithLocation || isHoodAllowedWithLocation
				isNothingAllowed = isNothingAllowedWithLocation
				isDefaultAllowed = isDefaultAllowedWithLocation
				isHoodAllowed = isHoodAllowedWithLocation
			endif
		endif
		if ArmorsWithNoRandomHood.HasForm(armorSet) && (isNothingAllowed || isDefaultAllowed)
			isHoodAllowed = false
		endif
		
		if isNothingAllowed && isDefaultAllowed && isHoodAllowed
			headgear = Utility.RandomInt(1, 3)
		elseif isDefaultAllowed && isHoodAllowed
			headgear = Utility.RandomInt(2, 3)
		elseif isNothingAllowed && isHoodAllowed
			if Utility.RandomInt(0, 1)
				headgear = 1
			else
				headgear = 3
			endif
		elseif isNothingAllowed && isDefaultAllowed
			headgear = Utility.RandomInt(1, 2)
		elseif isNothingAllowed
			headgear = 1
		elseif isDefaultAllowed
			headgear = 2
		elseif isHoodAllowed
			headgear = 3
		endif
	endif

	if headgear == 3 && armorSet == ArmorSets_CollegeRobes
		headgear = 2
	endif

	return headgear
endFunction

Armor function FindHeadgearInInventory()
	int i = PlayerRef.GetNumItems()
	Form item
	while i > 0
		i -= 1
		item = PlayerRef.GetNthForm(i)
		if item as Armor && (item.HasKeywordString("ClothingHead") || item.HasKeywordString("ArmorHelmet") || item.HasKeywordString("ClothingCirclet"))
			return item as Armor
		endif
	endwhile
	return None
endFunction

function GiveHeadgear(int headgear)
	if headgear != 2
		Form helmet = FindHeadgearInInventory()
		if helmet
			playerRef.RemoveItem(helmet, 1, true)
		endif
		if headgear == 3
			AddItem(ArmorPart_CollegeHood)
		endif
	endif
endFunction

int function RandomizeWealthSet(Form armorSet, bool noBeggarChance)
	if ChoiceWealth > 0
		return ChoiceWealth
	endif

	int locationRequiredMinWealth = Locations.GetLocationConditionInt("SkyrimUnbound_Condition_WealthMin") + 1
	int locationRequiredMaxWealth = Locations.GetLocationConditionInt("SkyrimUnbound_Condition_WealthMax") + 1
	if locationRequiredMaxWealth != 0 && locationRequiredMinWealth > locationRequiredMaxWealth
		locationRequiredMinWealth = 0
		locationRequiredMaxWealth = 0
	endif

	if armorSet == ArmorSets_Rags 
		if locationRequiredMinWealth > 2
			return locationRequiredMinWealth
		elseif locationRequiredMaxWealth == 2
			return 2
		else
			if Utility.RandomInt(1, 3) == 3
				return 3
			else
				return 2
			endif
		endif
	endif

	int[] possibleValues = new int[4]
	possibleValues[0] = 2
	possibleValues[1] = 3
	possibleValues[2] = 4
	possibleValues[3] = 5
	int[] chancesRatio = new int[4]
	; Warning: if you set any of the chances to zero here, the code below can set all chances to zero
	if ArmorsRich.HasForm(armorSet)
		chancesRatio[0] = 1
		chancesRatio[1] = 1
		chancesRatio[2] = 3
		chancesRatio[3] = 5
	else
		chancesRatio[0] = 1
		chancesRatio[1] = 2
		chancesRatio[2] = 2
		chancesRatio[3] = 2
	endif

	if locationRequiredMinWealth != 0 || locationRequiredMaxWealth != 0
		if locationRequiredMaxWealth == 0
			locationRequiredMaxWealth = 999
		endif
		int i = possibleValues.Length
		while i > 0
			i -= 1
			if possibleValues[i] < locationRequiredMinWealth || possibleValues[i] > locationRequiredMaxWealth
				chancesRatio[i] = 0
			endif
		endwhile
	endif

	if noBeggarChance && locationRequiredMaxWealth != 2
		chancesRatio[0] = 0
	endif

	return RandomIntWithRatio(possibleValues, chancesRatio)
endFunction

function GiveAddonItems(int wealth)
	if wealth == 1
		return
	endif

	int iAddonItem = 0
	int numberOfAddonItems = AddonItems.GetSize()
	while iAddonItem < numberOfAddonItems
		Form addonItem = AddonItems.GetAt(iAddonItem)
		int playerChoice = StorageUtil.GetIntValue(addonItem, "SkyrimUnbound_PlayerChoice")
		int itemCount = StorageUtil.GetIntValue(addonItem, "SkyrimUnbound_ItemCount", 1)
		if addonItem as FormList
			if playerChoice
				FormList addonItemList = addonItem as FormList
				if playerChoice == 1
					playerChoice = Utility.RandomInt(2, addonItemList.GetSize() + 1)
				endif
				Form item = addonItemList.GetAt(playerChoice - 2)
				itemCount = itemCount*StorageUtil.GetIntValue(item, "SkyrimUnbound_ItemCount", 1)
				if StorageUtil.FormListCount(item, "SkyrimUnbound_ItemByWealth") == 4
					item = StorageUtil.FormListGet(item, "SkyrimUnbound_ItemByWealth", wealth - 2)
				endif
				AddItem(item, itemCount)
			endif
		else
			if playerChoice == 2
				playerChoice = Utility.RandomInt(0, 1)
			endif
			if playerChoice
				if StorageUtil.FormListCount(addonItem, "SkyrimUnbound_ItemByWealth") == 4
					addonItem = StorageUtil.FormListGet(addonItem, "SkyrimUnbound_ItemByWealth", wealth - 2)
				endif
				AddItem(addonItem, itemCount)
			endif
		endif
		iAddonItem += 1
	endwhile
endFunction

function GiveTools(int wealth)
	if wealth == 1
		return
	endif

	if ChoiceWoodcuttersAxe == 1 || (ChoiceWoodcuttersAxe == 2 && Utility.RandomInt(0, 1))
		AddItem(Axe01)
	endif
	if ChoicePickaxe == 1 || (ChoicePickaxe == 2 && Utility.RandomInt(0, 1))
		AddItem(weapPickaxe)
	endif
endFunction

Armor function FindShieldInInventory()
	int i = PlayerRef.GetNumItems()
	Form item
	while i > 0
		i -= 1
		item = PlayerRef.GetNthForm(i)
		if item as Armor && item.HasKeywordString("ArmorShield")
			return item as Armor
		endif
	endwhile
	return None
endFunction

Form function FindMostSuitableWeapon(FormList weaponTypeList, Form armorSet)
	int playerWeaponSet = ChoiceWeaponSet
	FormList weaponSetList
	if !playerWeaponSet && StorageUtil.HasFormValue(armorSet, "SkyrimUnbound_AutoWeaponSet")
		weaponSetList = StorageUtil.GetFormValue(armorSet, "SkyrimUnbound_AutoWeaponSet") as FormList
	else
		if !playerWeaponSet
			if armorSet == ArmorSets_Rags
				playerWeaponSet = 1
			elseif armorSet == ArmorSets_SteelPlateArmor || armorSet == ArmorSets_ScaledArmor
				playerWeaponSet = 2
			elseif ArmorsImperialFaction.HasForm(armorSet)
				playerWeaponSet = 3
			elseif armorSet == ArmorSets_OrcishArmor
				playerWeaponSet = 4
			elseif armorSet == ArmorSets_ElvenLightArmor || armorSet == ArmorSets_ElvenArmor
				playerWeaponSet = 5
			elseif armorSet == ArmorSets_AncientNordArmor
				playerWeaponSet = 6
			elseif ArmorsWithReducedSteelWeaponsChance.HasForm(armorSet)
				if Utility.RandomInt(1, 3) < 3
					playerWeaponSet = 1
				else
					playerWeaponSet = 2
				endif
			else
				playerWeaponSet = Utility.RandomInt(1, 2)
			endif
		endif
		weaponSetList = WeaponSets.GetAt(playerWeaponSet - 1) as FormList
	endif

	Form suitableWeapon = FindSuitableWeapon(weaponTypeList, weaponSetList)
	if !suitableWeapon
		if weaponSetList != WeaponSet_Iron
			suitableWeapon = FindSuitableWeapon(weaponTypeList, WeaponSet_Iron)
		endif
		if !suitableWeapon
			if weaponSetList != WeaponSet_Steel
				suitableWeapon = FindSuitableWeapon(weaponTypeList, WeaponSet_Steel)
			endif
			if !suitableWeapon
				suitableWeapon = FindSuitableWeapon(weaponTypeList, None)
			endif
		endif
	endif
	return SuitableWeapon
endFunction

Form function FindSuitableWeapon(FormList weaponTypeList, FormList weaponSetList)
	SuitableWeapons.Revert()
	if weaponSetList
		int i = weaponTypeList.GetSize()
		while i > 0
			i -= 1
			Form nthWeapon = weaponTypeList.GetAt(i)
			if weaponSetList.HasForm(nthWeapon)
				SuitableWeapons.AddForm(nthWeapon)
			endif
		endwhile
		if SuitableWeapons.GetSize()
			return SuitableWeapons.GetAt(Utility.RandomInt(0, SuitableWeapons.GetSize() - 1))
		endif
	else
		if weaponTypeList.GetSize()
			return weaponTypeList.GetAt(Utility.RandomInt(0, WeaponTypeList.GetSize() - 1))
		endif
	endif
	return None
endFunction

bool function GiveWeapons(FormList armorTypeList, Form armorSet, int wealth) ; returns whether any weapons were given

	int playerOneHanded = ChoiceOneHanded
	int playerOneHandedCombination = ChoiceOneHandedCombination
	int playerTwoHanded = ChoiceTwoHanded
	int playerRanged = ChoiceRanged
	int playerStaff = ChoiceStaff

	if ChoiceRandomWeapons
		playerOneHanded = 0
		playerOneHandedCombination = 0
		playerTwoHanded = 0
		playerRanged = 0
		playerStaff = 0

		int locationRequiredHasWeapon = Locations.GetLocationConditionInt("SkyrimUnbound_Condition_HasWeapon") - 1
		int locationRequiredHasWeaponOrSpells = Locations.GetLocationConditionInt("SkyrimUnbound_Condition_HasWeaponOrSpells") - 1
		if locationRequiredHasWeapon == 0 || locationRequiredHasWeaponOrSpells == 0
			; keep all weapons disabled
		elseif ArmorsMage.HasForm(armorSet)
			playerOneHanded = 1
			if Utility.RandomInt(1, 3) == 1
				playerStaff = 1
			endif
		elseif armorTypeList == ArmorsClothes
			if armorSet == ArmorSets_Rags
				if locationRequiredHasWeapon == 1 || (locationRequiredHasWeaponOrSpells == 1 && HasPlayerDisabledSpells())
					playerOneHanded = 3
					playerOneHandedCombination = 1
					if Utility.RandomInt(1, 3) == 1
						playerStaff = 1
					endif
				else
					if Utility.RandomInt(0, 1)
						playerOneHanded = 3
						playerOneHandedCombination = 1
					endif
					if Utility.RandomInt(1, 5) == 1
						playerStaff = 1
					endif
				endif
			else
				playerOneHanded = 1
				int rand = Utility.RandomInt(1, 5)
				if rand <= 2
					playerRanged = 1
				elseif rand == 5
					playerStaff = 1
				endif
			endif
		else
			if Utility.RandomInt(1, 5) <= 2
				playerRanged = 1
			endif
			if ArmorsWithScimitar.HasForm(armorSet) || Utility.RandomInt(1, 5) <= 3
				playerOneHanded = 1
				if !playerRanged && Utility.RandomInt(1, 5) == 1
					playerStaff = 1
				endif
			else
				playerTwoHanded = 1
			endif
		endif

	endif

	if playerOneHanded
		FormList weaponTypeList
		if playerOneHanded == 1 && armorTypeList == ArmorsClothes && playerOneHandedCombination != 2 && (!ArmorsWithNoRandomDagger.HasForm(armorSet) || ChoiceTwoHanded || ChoiceRanged || ChoiceStaff)
			; clothes - increase chance of dagger
			if Utility.RandomInt(0, 1)
				playerOneHanded = 3
			endif
			WeaponTypes1HRandom.RemoveAddedForm(Weapons_Daggers)
		endif
		if playerOneHanded <= 2
			if playerOneHanded == 2 || armorTypeList == ArmorsHeavy || playerOneHandedCombination == 2 || (ArmorsWithNoRandomDagger.HasForm(armorSet) && !(ChoiceTwoHanded || ChoiceRanged || ChoiceStaff)) ; Random(NoDagger) or Random+HeavyArmor or Random+Shield
				WeaponTypes1HRandom.RemoveAddedForm(Weapons_Daggers)
			else
				WeaponTypes1HRandom.AddForm(Weapons_Daggers)
			endif
			if ArmorsWithScimitar.HasForm(armorSet)
				if !WeaponTypes1HRandom.HasForm(Weapons_Daggers) || Utility.RandomInt(0, 1)
					playerOneHanded = 7 ; Scimitar
				else
					playerOneHanded = 3
				endif
				weaponTypeList = WeaponTypes1H.GetAt(playerOneHanded - 3) as FormList
			else
				weaponTypeList = WeaponTypes1HRandom.GetAt(Utility.RandomInt(0, WeaponTypes1HRandom.GetSize() - 1)) as FormList
			endif
		else
			weaponTypeList = WeaponTypes1H.GetAt(playerOneHanded - 3) as FormList
		endif
		Form playerWeapon = FindMostSuitableWeapon(weaponTypeList, armorSet)

		if !playerOneHandedCombination
			if ArmorsMage.HasForm(armorSet)
				playerOneHandedCombination = 1
			elseif armorTypeList == ArmorsClothes ; exclude Shield and increase chance of Single
				if WeaponsNoRandomDual.HasForm(playerWeapon) || Utility.RandomInt(1, 3) != 1
					playerOneHandedCombination = 1
				else
					playerOneHandedCombination = 3
				endif
			elseif playerOneHanded == 3 || ArmorsWithNoRandomShield.HasForm(armorSet) ; dagger - exclude Shield
				if WeaponsNoRandomDual.HasForm(playerWeapon) || Utility.RandomInt(0, 1)
					playerOneHandedCombination = 1
				else
					playerOneHandedCombination = 3
				endif
			elseif WeaponsNoRandomDual.HasForm(playerWeapon)
				playerOneHandedCombination = Utility.RandomInt(1, 2)
			else ; armor - increase chance of Shield
				int rand = Utility.RandomInt(1, 4)
				if rand <= 2
					playerOneHandedCombination = 2
				elseif rand == 3
					playerOneHandedCombination = 1
				else
					playerOneHandedCombination = 3
				endif
			endif
		endif

		if playerWeapon
			AddItem(playerWeapon)
		endif

		if playerOneHandedCombination == 3 ;Dual
			int i = PlayerRef.GetNumItems()
			while i > 0
				i -= 1
				Weapon nthWeapon = PlayerRef.GetNthForm(i) as Weapon
				if nthWeapon && nthWeapon.GetWeaponType() > 0 && nthWeapon.GetWeaponType() < 5
					AddItem(nthWeapon)
					i = 0
				endif
			endwhile	
		endif
	endif
	
	Form shield = FindShieldInInventory()
	if playerOneHanded && playerOneHandedCombination == 2
		if !shield
			if armorTypeList == ArmorsLight
				AddItem(Shield_DefaultLightArmor)
			elseif armorTypeList == ArmorsHeavy
				AddItem(Shield_DefaultHeavyArmor)
			else
				AddItem(Shield_DefaultClothes)
			endif
		endif
	elseif shield
		PlayerRef.RemoveItem(shield, 1, true)
		shield = none
	endif

	if playerStaff
		int playerStaff2 = 0
		if playerStaff == 1
			playerStaff = Utility.RandomInt(1, 5)
			;reduce the chance of Alteration cause it has fewer staffs
			if playerStaff == 1 && Utility.RandomInt(1, 3) == 2
				playerStaff = Utility.RandomInt(2, 5)
			endif
		else
			int lastIndexPrevious = 1
			int lastIndex = 1
			int iSchool = 0
			while iSchool < 5
				lastIndex += StaffLists[iSchool].GetSize() + 1
				iSchool += 1
				if playerStaff <= lastIndex
					playerStaff2 = playerStaff - (lastIndexPrevious + 1)
					playerStaff = iSchool
					iSchool = 999
				else
					lastIndexPrevious = lastIndex
				endif
			endwhile
		endif
		FormList staffList = StaffLists[playerStaff - 1]
		if !playerStaff2
			playerStaff2 = Utility.RandomInt(1, staffList.GetSize())
		endif
		AddItem(staffList.GetAt(playerStaff2 - 1))
	endif

	if playerRanged
		if playerRanged == 1
			if Weapons_Crossbows.GetSize() && Utility.RandomInt(1, 5) <= 2
				playerRanged = 3
			else
				playerRanged = 2
			endif
		endif
		FormList weaponTypeList = WeaponTypesRanged.GetAt(playerRanged - 2) as FormList
		Form playerWeapon = FindMostSuitableWeapon(weaponTypeList, armorSet)
		if playerWeapon
			AddItem(playerWeapon)
			if weaponTypeList == Weapons_Bows
				Form arrow = FindMostSuitableWeapon(Ammo_Arrows, armorSet)
				if arrow
					if wealth < 4
						AddItem(arrow, Utility.RandomInt(15, 30))
					else
						AddItem(arrow, Utility.RandomInt(20, 40))
					endif
					EquipItem(arrow)
				endif
			elseif weaponTypeList == Weapons_Crossbows
				Form bolt = FindMostSuitableWeapon(Ammo_Bolts, armorSet)
				if bolt
					if wealth < 4
						AddItem(bolt, Utility.RandomInt(15, 30))
					else
						AddItem(bolt, Utility.RandomInt(20, 40))
					endif
					EquipItem(bolt)
				endif
			endif
		endif
	endif

	if playerTwoHanded
		Form playerWeapon
		if playerTwoHanded == 1
			playerWeapon = FindMostSuitableWeapon(WeaponTypes2HRandom.GetAt(Utility.RandomInt(0, WeaponTypes2HRandom.GetSize() - 1)) as FormList, armorSet)
		else
			playerWeapon = FindMostSuitableWeapon(WeaponTypes2H.GetAt(playerTwoHanded - 2) as FormList, armorSet)
		endif
		if playerWeapon
			AddItem(playerWeapon)
		endif
	endif

	return playerOneHanded || playerTwoHanded || playerRanged || playerStaff
endFunction

Weapon function FindLastGivenWeaponInInventory()
	int i = PlayerRef.GetNumItems()
	Form item
	while i > 0
		i -= 1
		item = PlayerRef.GetNthForm(i)
		if item as Weapon
			return item as Weapon
		endif
	endwhile
	return None
endFunction

function EquipGearInInventory()
	int iItem = PlayerRef.GetNumItems()
	Form shield
	while iItem > 0
		iItem -= 1
		Form item = PlayerRef.GetNthForm(iItem)
		if item as Armor && item.IsPlayable() && (item as Armor).GetSlotMask() && item.GetGoldValue() > 0
			if item.HasKeywordString("ArmorShield")
				shield = item
			else
				EquipItem(item)
			endif
		endif
	endwhile
	if Game.GetModByName("All Geared Up Derivative.esp") == 255 ; this condition prevents a bug with AllGUD when unsheating weapons doesn't hide sheated versions
		Weapon weaponToEquip = FindLastGivenWeaponInInventory()
		if weaponToEquip
			EquipItem(weaponToEquip)
			if weaponToEquip.GetWeaponType() > 0 && weaponToEquip.GetWeaponType() < 5 ; 1H
				if PlayerRef.GetItemCount(weaponToEquip) > 1
					PlayerRef.EquipItemEx(weaponToEquip, 2) ; equip the second 1H
				elseif shield
					EquipItem(shield)
				endif
			endif
		endif
	endif
endFunction

int function GiveSpells(Form armorSet, bool hasAnyWeapons) ;returns the number of spells given

	int playerSpellsMode = ChoiceSpellsMode
	int playerSchool1 = ChoiceSpellSchool1
	int playerSchool2 = ChoiceSpellSchool2

	int iSchool = 5
	while iSchool > 0
		iSchool -= 1
		int iSpell = SpellLists[iSchool].GetSize()
		while iSpell > 0
			iSpell -= 1
			PlayerRef.RemoveSpell(SpellLists[iSchool].GetAt(iSpell) as Spell)
		endwhile
	endwhile

	if !playerSpellsMode
		int locationRequiredHasSpells = Locations.GetLocationConditionInt("SkyrimUnbound_Condition_HasSpells") - 1
		int locationRequiredHasWeaponOrSpells = Locations.GetLocationConditionInt("SkyrimUnbound_Condition_HasWeaponOrSpells") - 1
		if locationRequiredHasSpells == 1 || (locationRequiredHasWeaponOrSpells == 1 && !hasAnyWeapons) \
		|| (locationRequiredHasSpells != 0 && locationRequiredHasWeaponOrSpells != 0 && (ArmorsMage.HasForm(armorSet) || Utility.RandomInt(0, 1)))
			playerSpellsMode = 2
			playerSchool1 = 0
			playerSchool2 = Utility.RandomInt(0, 1)
		else
			return 0
		endif
	else
		if playerSpellsMode == 2 ;Simplify if possible and make "Nothing" last and "Select a spell" first
			if playerSchool2 == 7
				if playerSchool1 == 7 || playerSchool1 == 1
					playerSpellsMode = 3 ;replace with Spell Selection
				elseif !SelectedSpells.GetSize()
					playerSchool2 = 1 ;replace with Nothing
				else ;swap
					playerSchool2 = playerSchool1
					playerSchool1 = 7 
				endif
			elseif playerSchool1 == 7 && playerSchool2 == 1
				playerSpellsMode = 3 ;replace with Spell Selection
			elseif playerSchool1 == 1 || (playerSchool1 == 7 && !SelectedSpells.GetSize()) ;swap
				playerSchool1 = playerSchool2
				playerSchool2 = 1
			endif
		endif
		
		if playerSpellsMode == 3 ;Spell selection
			int iSpell = SelectedSpells.GetSize()
			while iSpell
				iSpell -= 1
				PlayerRef.AddSpell(SelectedSpells.GetAt(iSpell) as Spell, false)
			endwhile
			return SelectedSpells.GetSize()
		elseif playerSpellsMode == 1 || (playerSpellsMode == 2 && playerSchool2 == 1 && playerSchool1 == 1) ;No Spells
			return 0
		endif
	endif

	if playerSpellsMode == 2
		Spell spell1
		Spell spell2

		;Spell selection ("Select a spell")
		if SelectedSpells.GetSize()
			spell1 = SelectedSpells.GetAt(0) as Spell
			iSchool = 5
			while iSchool > 0
				iSchool -= 1
				if SpellLists[iSchool].HasForm(spell1)
					playerSchool1 = iSchool + 2
					iSchool = 0
				endif
			endwhile
		endif

		;Randomize schools
		if !playerSchool1
			if playerSchool2 > 1 ;swap
				playerSchool1 = playerSchool2
				playerSchool2 = 0
			else
				playerSchool1 = Utility.RandomInt(2, 6)
			endif
		endif
		if !playerSchool2
			if ChoiceSameSchoolSpellsChance
				playerSchool2 = Utility.RandomInt(2, 6)
			else
				playerSchool2 = Utility.RandomInt(2, 5) 
				if playerSchool2 == playerSchool1
					playerSchool2 = 6
				endif
			endif
		endif
		
		;Randomize school spells
		if !spell1
			FormList schoolList1 = SpellLists[playerSchool1 - 2]
			spell1 = schoolList1.GetAt(Utility.RandomInt(0, schoolList1.GetSize() - 1)) as Spell
		endif
		if playerSchool2 != 1 && playerSchool2 != 7
			FormList schoolList2 = SpellLists[playerSchool2 - 2]
			if playerSchool2 != playerSchool1
				spell2 = schoolList2.GetAt(Utility.RandomInt(0, schoolList2.GetSize() - 1)) as Spell
			else
				spell2 = schoolList2.GetAt(Utility.RandomInt(0, schoolList2.GetSize() - 2)) as Spell
				if spell2 == spell1
					spell2 = schoolList2.GetAt(schoolList2.GetSize() - 1) as Spell
				endif
			endif
		endif

		int numberOfSpells = 0
		if spell1
			PlayerRef.AddSpell(spell1, false)
			numberOfSpells += 1
		endif
		if spell2
			PlayerRef.AddSpell(spell2, false)
			numberOfSpells += 1
		endif
		return numberOfSpells
	endif

	return 0
	
endFunction

int function RandomCountFromConfig(string settingName, int defaultMinCount, int defaultMaxCount, int defaultMinEnabledCount = -1, bool isOptionEnabled = false)
	int minCount = defaultMinCount
	int maxCount = defaultMaxCount
	int minEnabledCount = defaultMinEnabledCount
	if PapyrusUtil.GetVersion()
		minCount = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", settingName, 0)
		maxCount = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", settingName, 1)
		minEnabledCount = JsonUtil.IntListGet("../SkyrimUnbound/SkyrimUnboundBalance.json", settingName, 2)
	endif
	if isOptionEnabled && minEnabledCount > 0
		minCount = minEnabledCount
	endif
	return Utility.RandomInt(minCount, maxCount)
endFunction

function GiveItems(int wealth, int startingSpellsCount)
	if wealth == 1
		return
	endif

	if ChoiceGold >= 0
		AddItem(Gold001, ChoiceGold)
	elseif wealth == 2
		AddItem(Gold001, RandomCountFromConfig("gold1", 0, 15))
	elseif wealth == 3
		AddItem(Gold001, RandomCountFromConfig("gold2", 50, 150))
	elseif wealth == 4
		AddItem(Gold001, RandomCountFromConfig("gold3", 150, 400))
	elseif wealth == 5
		AddItem(Gold001, RandomCountFromConfig("gold4", 400, 750))
		AddItem(SkyrimUnboundGems, 2)
	endif

	if ChoiceFood == 1 || (ChoiceFood == 2 && Utility.RandomInt(0, 1))
		if wealth == 2
			AddItem(SkyrimUnboundFoodBeggar, RandomCountFromConfig("food1", 1, 1, 1, ChoiceFood == 1))
		elseif wealth == 3
			AddItem(SkyrimUnboundFoodCheap, RandomCountFromConfig("food2", 1, 2, 2, ChoiceFood == 1))
		elseif wealth == 4
			AddItem(SkyrimUnboundFoodCommon, RandomCountFromConfig("food3", 1, 3, 2, ChoiceFood == 1))
		elseif wealth == 5
			AddItem(SkyrimUnboundFoodNoble, RandomCountFromConfig("food4", 1, 3, 2, ChoiceFood == 1))
		endif
	endif

	if ChoiceDrinks == 1 || (ChoiceDrinks == 2 && Utility.RandomInt(0, 1))
		if wealth == 2
			AddItem(SkyrimUnboundDrinksCheap, RandomCountFromConfig("drinks1", 1, 1, 1, ChoiceDrinks == 1))
		elseif wealth == 3
			AddItem(SkyrimUnboundDrinksCheap, RandomCountFromConfig("drinks2", 1, 2, 2, ChoiceDrinks == 1))
		elseif wealth == 4
			AddItem(SkyrimUnboundDrinksCommon, RandomCountFromConfig("drinks3", 1, 3, 2, ChoiceDrinks == 1))
		elseif wealth == 5
			AddItem(SkyrimUnboundDrinksNoble, RandomCountFromConfig("drinks4", 1, 3, 2, ChoiceDrinks == 1))
		endif
	endif

	if ChoiceSkooma == 1 || (ChoiceSkooma == 2 && Utility.RandomInt(0, 1))
		if wealth == 2
			AddItem(Skooma, RandomCountFromConfig("skooma1", 1, 1, 1, ChoiceSkooma == 1))
		elseif wealth == 3
			AddItem(Skooma, RandomCountFromConfig("skooma2", 1, 2, 1, ChoiceSkooma == 1))
		elseif wealth == 4
			AddItem(Skooma, RandomCountFromConfig("skooma3", 1, 3, 1, ChoiceSkooma == 1))
		elseif wealth == 5
			AddItem(Skooma, RandomCountFromConfig("skooma4", 1, 3, 1, ChoiceSkooma == 1))
		endif
	endif

	if ChoicePotions == 1 || (ChoicePotions == 2 && Utility.RandomInt(0, 1))
		SkyrimUnboundPotionsCommon.Revert()
		SkyrimUnboundPotionsNoble.Revert()
		if startingSpellsCount
			int i = SkyrimUnboundPotionsCommonMagic.GetNumForms()
			while i > 0
				i -= 1
				SkyrimUnboundPotionsCommon.AddForm(SkyrimUnboundPotionsCommonMagic.GetNthForm(i), SkyrimUnboundPotionsCommonMagic.GetNthLevel(i), SkyrimUnboundPotionsCommonMagic.GetNthCount(i))
			endwhile
			i = SkyrimUnboundPotionsNobleMagic.GetNumForms()
			while i > 0
				i -= 1
				SkyrimUnboundPotionsNoble.AddForm(SkyrimUnboundPotionsNobleMagic.GetNthForm(i), SkyrimUnboundPotionsNobleMagic.GetNthLevel(i), SkyrimUnboundPotionsNobleMagic.GetNthCount(i))
			endwhile
		endif

		if wealth == 3
			AddItem(SkyrimUnboundPotionsCommon, RandomCountFromConfig("potions2", 1, 2, 2, ChoicePotions == 1))
		elseif wealth == 4
			AddItem(SkyrimUnboundPotionsCommon, RandomCountFromConfig("potions3", 1, 3, 2, ChoicePotions == 1))
		elseif wealth == 5
			AddItem(SkyrimUnboundPotionsNoble, RandomCountFromConfig("potions4", 1, 4, 2, ChoicePotions == 1))
		endif
	endif

	if ChoiceLockpicks == 1 || (ChoiceLockpicks == 2 && Utility.RandomInt(0, 1))
		if wealth == 2
			AddItem(Lockpick, RandomCountFromConfig("lockpicks1", 1, 10, 5, ChoiceLockpicks == 1))
		elseif wealth == 3
			AddItem(Lockpick, RandomCountFromConfig("lockpicks2", 1, 10, 5, ChoiceLockpicks == 1))
		elseif wealth == 4
			AddItem(Lockpick, RandomCountFromConfig("lockpicks3", 1, 10, 5, ChoiceLockpicks == 1))
		elseif wealth == 5
			AddItem(Lockpick, RandomCountFromConfig("lockpicks4", 1, 10, 5, ChoiceLockpicks == 1))
		endif
	endif

	bool alwaysGiveLightIfRandom = Locations.ShouldGiveLightForFinalLocation() && Abilities.ChoiceDisease != 1 && (Abilities.ChoiceDisease != 2 || Game.GetModByName("Manbeast.esp") == 255) && !PlayerRef.HasSpell(Candlelight) && !PlayerRef.HasSpell(Magelight)
	int choiceLanternIfExists = ChoiceLantern
	if !SkyrimUnboundLantern.GetNumForms()
		choiceLanternIfExists = 0
	endif
	if ChoiceTorch == 2 && choiceLanternIfExists == 2
		int rand
		if alwaysGiveLightIfRandom
			rand = Utility.RandomInt(1, 2)
		else
			rand = Utility.RandomInt(1, 4)
		endif
		if rand == 1
			AddItem(Torch01)
		elseif rand == 2
			AddItem(SkyrimUnboundLantern)
		endif
	else
		if ChoiceTorch == 1 || (ChoiceTorch == 2 && ((alwaysGiveLightIfRandom && choiceLanternIfExists != 1) || Utility.RandomInt(0, 1)))
			AddItem(Torch01)
		endif
		if choiceLanternIfExists == 1 || (choiceLanternIfExists == 2 && ((alwaysGiveLightIfRandom && ChoiceTorch != 1) || Utility.RandomInt(0, 1)))
			AddItem(SkyrimUnboundLantern)
		endif
	endif

endFunction

bool function ShouldExcludeBeggarItems()
	return (ChoiceWealth >= 3 && ChoiceWealth <= 5) || ChoiceGold > 25 || ChoicePotions == 1 || ChoiceFood == 1 || ChoiceDrinks == 1
endFunction

bool function HasPlayerDisabledSpells()
	if ChoiceSpellsMode == 2
		return (ChoiceSpellSchool1 == 1 || (ChoiceSpellSchool1 == 7 && !SelectedSpells.GetSize())) && (ChoiceSpellSchool2 == 1 || (ChoiceSpellSchool2 == 7 && !SelectedSpells.GetSize()))
	else
		return ChoiceSpellsMode == 1 || (ChoiceSpellsMode == 3 && !SelectedSpells.GetSize())
	endif
endFunction

Form function GetArmorSetSelectedByPlayer()
	if ChoiceArmorType < 1 || ChoiceArmorType > 3 || ChoiceArmorSet < 1
		return None
	endif
	FormList armorTypeList = GetArmorTypeList(ChoiceArmorType)
	if armorTypeList
		return armorTypeList.GetAt(ChoiceArmorSet - 1)
	else
		return None
	endif
endFunction

function AddItem(Form item, int count = 1)
	PlayerRef.AddItem(item, count, true)
endFunction

function EquipItem(Form item)
	PlayerRef.EquipItem(item, false, true)
endFunction

int function RandomIntWithRatio(int[] values, int[] chancesRatio)
	int randMax = 0
	int i = chancesRatio.Length
	while i > 0
		i -= 1
		randMax += chancesRatio[i]
	endwhile

	int randNumber = Utility.RandomInt(1, randMax)

	i = 0
	int l = values.Length
	int lastNumberForThisValue = 0
	while i < l
		lastNumberForThisValue += chancesRatio[i]
		if randNumber <= lastNumberForThisValue
			return values[i]
		endif
		i += 1
	endwhile

	return -1
endFunction
