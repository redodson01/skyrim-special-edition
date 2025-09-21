Scriptname SkyrimUnboundMCMScript extends SKI_ConfigBase

Actor Property PlayerRef Auto
SkyrimUnboundQuestScript Property SU Auto
SkyrimUnboundModuleDragons Property Dragons Auto
SkyrimUnboundModuleAbilities Property Abilities Auto
SkyrimUnboundModuleInventory Property Inventory Auto
SkyrimUnboundModuleLocations Property Locations Auto

GlobalVariable Property DelayDragonMin Auto
GlobalVariable Property DelayDragonMax Auto
GlobalVariable Property DelayDragonLevel1 Auto
GlobalVariable Property DelayDragonLevel2 Auto
FormList Property SelectedSpells Auto
FormList Property SelectedLocationTypes Auto
FormList Property SelectedHolds Auto
GlobalVariable Property UnlockShouts Auto
GlobalVariable Property WhiterunThanePrerequisite Auto

Message[] Property StandingStoneMessages Auto
FormList Property ArmorsClothes Auto
FormList Property ArmorsLight Auto
FormList Property ArmorsHeavy Auto
FormList Property VanillaArmors Auto
FormList Property WeaponTypes1H Auto
FormList Property WeaponTypes2H Auto
FormList Property WeaponTypesRanged Auto
FormList Property WeaponSets Auto
FormList Property Spells_Alteration Auto
FormList Property Spells_Conjuration Auto
FormList Property Spells_Destruction Auto
FormList Property Spells_Illusion Auto
FormList Property Spells_Restoration Auto
FormList[] Property StaffLists Auto
FormList Property AddonItems Auto
LeveledItem Property SkyrimUnboundLantern Auto
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
FormList Property LocationTypeLists Auto
FormList Property HoldLists Auto
FormList Property HoldsWithJail Auto
Spell Property SkyrimUnboundTeleportPower Auto

int OID_BeginAdventure
int OID_PreviewMode
int OID_LocationPreview
int OID_ReRandomizeLocation
int OID_LoadPreset
int OID_SavePreset

int OID_StandingStone
string[] OptionsStandingStone
int OID_Disease
string[] OptionsDisease

int OID_Dragonborn
string[] OptionsDragonborn

int OID_Dragons
string[] OptionsDragons
int OID_DelayMinDays
int OID_DelayMaxDays
int OID_DelayLevel1
int OID_DelayLevel2

int OID_ArmorType
string[] OptionsArmorType
int OID_ArmorSet 
string[] OptionsArmorLight
string[] OptionsArmorHeavy
string[] OptionsArmorClothes
int OID_Headgear
string[] OptionsHeadgear
int OID_OnlyEntryLevelArmors

int OID_RandomWeapons
int OID_OneHanded
string[] OptionsOneHanded
int OID_OneHandedCombination
string[] OptionsOneHandedCombination
int OID_TwoHanded
string[] OptionsTwoHanded
int OID_Ranged
string[] OptionsRanged
int OID_Staff
string[] OptionsStaff
int OID_WeaponSet
string[] OptionsWeaponSet

int OID_SpellsMode
string[] OptionsSpellsMode
int OID_SpellSchool1
int OID_SpellSchool2
string[] OptionsSpellSchool
int OID_SameSchoolSpellsChance
int[] OIDs_SpellsAlteration
int[] OIDs_SpellsConjuration
int[] OIDs_SpellsDestruction
int[] OIDs_SpellsIllusion
int[] OIDs_SpellsRestoration

int OID_Wealth
string[] OptionsWealth
string[] OptionsDisabledEnabledRandom
int OID_CustomGoldToggle
int OID_CustomGoldSlider
int OID_Food
int OID_Drinks
int OID_Potions
int OID_Lockpicks
int OID_Torch
int OID_Lantern
int OID_WoodcuttersAxe
int OID_Pickaxe
int OID_Skooma
int[] OIDs_AddonItems

int OID_LocationPreview2
int OID_ReRandomizeLocation2
int OID_RandomLocation
int OID_CustomizeLocationRandomization
int OID_SelectAllLocTypes
int OID_DeselectAllLocTypes
int[] OIDs_LocationTypes
string[] LocationTypeNames
string[] OptionsCity
string[] OptionsTown
string[] OptionsInn
string[] OptionsJail
string[] OptionsWilderness
string[] OptionsBorder
string[] OptionsDocks
string[] OptionsTemple
string[] OptionsPlayerHome
string[] OptionsHomelessShelter
string[] OptionsFactionHeadquarters
string[] OptionsBanditCamp
string[] OptionsWarlockLair
string[] OptionsVampireLair
string[] OptionsOtherLocation
int OID_SelectAllHolds
int OID_DeselectAllHolds
int[] OIDs_Holds
string[] HoldNames
int OID_LocalInhabitant
string[] OptionsLocalInhabitant
int OID_AlreadyAdventurer
int OID_AutoBounty
int OID_Bounty
int OID_TimeOfDay
string[] OptionsTimeOfDay
int OID_Season
string[] OptionsSeason
int OID_Month
string[] OptionsMonthWinter
string[] OptionsMonthSpring
string[] OptionsMonthSummer
string[] OptionsMonthFall

int OID_DebugMode
int OID_ShowDebugInfo

int OID_PerkPoints
int OID_UnlockShouts
string[] OptionsUnlockShouts
int OID_WhiterunThanePrerequisite
string[] OptionsWhiterunThanePrerequisite

int OID_Hotkey
int OID_BlackScreen
int OID_IntroTitles
string[] OptionsIntroTitles
int OID_ClothesInStartingRoom
int OID_Autosave
int OID_MCMOnTop 
int OID_AutoOpenMCM
int OID_AutoOpenMCMDelay
int OID_AutoOpenPresets

bool isDebugModeToggled = false
bool isInCustomizeRandomLocationMode = false
bool Property HasPlayerOpenenedMCM = false Auto Hidden


Event OnConfigInit()

	if !PapyrusUtil.GetVersion() || SU.GetGlobalSettingInt("mcm_on_top")
		ModName = " Skyrim Unbound"
	endif

	Pages = new string[6]
	Pages[0] = "$SU_PageMain"
	Pages[1] = "$SU_PageStartingLocation"
	Pages[2] = "$SU_PageEquipment"
	Pages[3] = "$SU_PageSpells"
	Pages[4] = "$SU_PageInventory"
	Pages[5] = "$SU_PageOtherSettings"
	
	OptionsDisabledEnabledRandom = new string[3]
	OptionsDisabledEnabledRandom[0] = "$SU_Disabled"
	OptionsDisabledEnabledRandom[1] = "$SU_Enabled"
	OptionsDisabledEnabledRandom[2] = "$SU_Random"

	OptionsDragonborn = new string[4]
	OptionsDragonborn[0] = "$SU_Random"
	OptionsDragonborn[1] = "$SU_DragonbornYes"
	OptionsDragonborn[2] = "$SU_DragonbornNo"
	OptionsDragonborn[3] = "$SU_DragonbornNoWithShouts"

	OptionsDragons = new string[7]
	OptionsDragons[0] = "$SU_TimedDelay"
	OptionsDragons[1] = "$SU_LeveledDelay"
	OptionsDragons[2] = "$SU_Disabled"
	OptionsDragons[3] = "$SU_Enabled"
	OptionsDragons[4] = "$SU_WallsOnly"
	OptionsDragons[5] = "$SU_WallsOnlyTimed"
	OptionsDragons[6] = "$SU_WallsOnlyLeveled"
	
	OptionsStandingStone = new string[15]
	OptionsStandingStone[0] = "$SU_Random"
	OptionsStandingStone[1] = "$SU_Nothing"
	OptionsStandingStone[2] = "$SU_StoneApprentice"
	OptionsStandingStone[3] = "$SU_StoneAtronach"
	OptionsStandingStone[4] = "$SU_StoneLady"
	OptionsStandingStone[5] = "$SU_StoneLord"
	OptionsStandingStone[6] = "$SU_StoneLover"
	OptionsStandingStone[7] = "$SU_StoneMage"
	OptionsStandingStone[8] = "$SU_StoneRitual"
	OptionsStandingStone[9] = "$SU_StoneSerpent"
	OptionsStandingStone[10] = "$SU_StoneShadow"
	OptionsStandingStone[11] = "$SU_StoneSteed"
	OptionsStandingStone[12] = "$SU_StoneThief"
	OptionsStandingStone[13] = "$SU_StoneTower"
	OptionsStandingStone[14] = "$SU_StoneWarrior"
	
	OptionsDisease = new string[3]
	OptionsDisease[0] = "$SU_Nothing"
	OptionsDisease[1] = "$SU_DiseaseVampire"
	OptionsDisease[2] = "$SU_DiseaseWerewolf"
	
	OptionsArmorType = new string[8]
	OptionsArmorType[0] = "$SU_Random"
	OptionsArmorType[1] = "$SU_ArmorTypeClothes"
	OptionsArmorType[2] = "$SU_ArmorTypeLight"
	OptionsArmorType[3] = "$SU_ArmorTypeHeavy"
	OptionsArmorType[4] = "$SU_Nothing"
	OptionsArmorType[5] = "{$SU_ArmorTypeClothes} / {$SU_ArmorTypeLight}"
	OptionsArmorType[6] = "{$SU_ArmorTypeClothes} / {$SU_ArmorTypeHeavy}"
	OptionsArmorType[7] = "{$SU_ArmorTypeLight} / {$SU_ArmorTypeHeavy}"

	OptionsHeadgear = new string[7]
	OptionsHeadgear[0] = "$SU_Random"
	OptionsHeadgear[1] = "$SU_Nothing"
	OptionsHeadgear[2] = "$SU_Default"
	OptionsHeadgear[3] = "$SU_Hood"
	OptionsHeadgear[4] = "{$SU_Default} / {$SU_Hood}"
	OptionsHeadgear[5] = "{$SU_Nothing} / {$SU_Hood}"
	OptionsHeadgear[6] = "{$SU_Nothing} / {$SU_Default}"

	OptionsOneHandedCombination = new string[4]
	OptionsOneHandedCombination[0] = "$SU_Random"
	OptionsOneHandedCombination[1] = "$SU_1HSingle"
	OptionsOneHandedCombination[2] = "$SU_1HShield"	
	OptionsOneHandedCombination[3] = "$SU_1HDual"

	OptionsSpellsMode = new string[4]
	OptionsSpellsMode[0] = "$SU_Random"
	OptionsSpellsMode[1] = "$SU_Nothing"
	OptionsSpellsMode[2] = "$SU_SelectSchools"
	OptionsSpellsMode[3] = "$SU_SelectSpells"

	OptionsSpellSchool = new string[8]
	OptionsSpellSchool[0] = "$SU_Random"
	OptionsSpellSchool[1] = "$SU_Nothing"
	OptionsSpellSchool[2] = "$SU_Alteration"
	OptionsSpellSchool[3] = "$SU_Conjuration"
	OptionsSpellSchool[4] = "$SU_Destruction"
	OptionsSpellSchool[5] = "$SU_Illusion"
	OptionsSpellSchool[6] = "$SU_Restoration"
	OptionsSpellSchool[7] = "$SU_SelectSpecificSpell"
	
	OptionsWealth = new string[6]
	OptionsWealth[0] = "$SU_Random"
	OptionsWealth[1] = "$SU_Nothing"
	OptionsWealth[2] = "$SU_WealthBeggar"
	OptionsWealth[3] = "$SU_WealthPoor"
	OptionsWealth[4] = "$SU_WealthMedium"
	OptionsWealth[5] = "$SU_WealthWealthy"

	OptionsLocalInhabitant = new string[4]
	OptionsLocalInhabitant[0] = "$SU_Auto"
	OptionsLocalInhabitant[1] = "$SU_Disabled"
	OptionsLocalInhabitant[2] = "$SU_LocalInhabitantRegion"
	OptionsLocalInhabitant[3] = "$SU_LocalInhabitantSettlement"

	OptionsTimeOfDay = new string[8]
	OptionsTimeOfDay[0] = "$SU_Random"
	OptionsTimeOfDay[1] = "$SU_Dawn"
	OptionsTimeOfDay[2] = "$SU_Morning"
	OptionsTimeOfDay[3] = "$SU_Midday"
	OptionsTimeOfDay[4] = "$SU_Afternoon"
	OptionsTimeOfDay[5] = "$SU_Dusk"
	OptionsTimeOfDay[6] = "$SU_Night"
	OptionsTimeOfDay[7] = "$SU_Midnight"

	OptionsSeason = new string[5]
	OptionsSeason[0] = "$SU_Random"
	OptionsSeason[1] = Game.GetGameSettingString("sSeasonWinter")
	OptionsSeason[2] = Game.GetGameSettingString("sSeasonSpring")
	OptionsSeason[3] = Game.GetGameSettingString("sSeasonSummer")
	OptionsSeason[4] = Game.GetGameSettingString("sSeasonFall")

	OptionsMonthWinter = new string[4]
	OptionsMonthWinter[0] = "$SU_Random"
	OptionsMonthWinter[1] = Game.GetGameSettingString("sMonthDecember")
	OptionsMonthWinter[2] = Game.GetGameSettingString("sMonthJanuary")
	OptionsMonthWinter[3] = Game.GetGameSettingString("sMonthFebruary")

	OptionsMonthSpring = new string[4]
	OptionsMonthSpring[0] = "$SU_Random"
	OptionsMonthSpring[1] = Game.GetGameSettingString("sMonthMarch")
	OptionsMonthSpring[2] = Game.GetGameSettingString("sMonthApril")
	OptionsMonthSpring[3] = Game.GetGameSettingString("sMonthMay")

	OptionsMonthSummer = new string[4]
	OptionsMonthSummer[0] = "$SU_Random"
	OptionsMonthSummer[1] = Game.GetGameSettingString("sMonthJune")
	OptionsMonthSummer[2] = Game.GetGameSettingString("sMonthJuly")
	OptionsMonthSummer[3] = Game.GetGameSettingString("sMonthAugust")

	OptionsMonthFall = new string[4]
	OptionsMonthFall[0] = "$SU_Random"
	OptionsMonthFall[1] = Game.GetGameSettingString("sMonthSeptember")
	OptionsMonthFall[2] = Game.GetGameSettingString("sMonthOctober")
	OptionsMonthFall[3] = Game.GetGameSettingString("sMonthNovember")

	OptionsIntroTitles = new string[3]
	OptionsIntroTitles[0] = "$SU_Disabled"
	OptionsIntroTitles[1] = "$SU_IntroTitlesShort"
	OptionsIntroTitles[2] = "$SU_IntroTitlesFull"

	OptionsUnlockShouts = new string[4]
	OptionsUnlockShouts[0] = "$SU_Disabled"
	OptionsUnlockShouts[1] = "$SU_UnlockShoutsForFree"
	OptionsUnlockShouts[2] = "$SU_UnlockShoutsForOneSoul"
	OptionsUnlockShouts[3] = "$SU_UnlockFirstWordForFree"

	OptionsWhiterunThanePrerequisite = new string[4]
	OptionsWhiterunThanePrerequisite[0] = "$SU_BleakFallsBarrow"
	OptionsWhiterunThanePrerequisite[1] = "$SU_TheBlessingsOfNature"
	OptionsWhiterunThanePrerequisite[2] = "$SU_BleakFallsBarrowOrTheBlessingsOfNature"
	OptionsWhiterunThanePrerequisite[3] = "$SU_BleakFallsBarrowAndTheBlessingsOfNature"

	while !SU.AreAddonsLoaded
		Utility.WaitMenuMode(0.5)
	endwhile

	string[] VanillaArmorNames = new string[33]
	VanillaArmorNames[0] = "$SU_CommonClothes"
	VanillaArmorNames[1] = "$SU_FineClothes"
	VanillaArmorNames[2] = "$SU_MerchantClothes"
	VanillaArmorNames[3] = "$SU_CollegeRobes"
	VanillaArmorNames[4] = "$SU_MonkRobes"
	VanillaArmorNames[5] = "$SU_DarkRobes"
	VanillaArmorNames[6] = "$SU_MinerClothes"
	VanillaArmorNames[7] = "$SU_Rags"
	VanillaArmorNames[8] = "$SU_RedguardClothes"
	VanillaArmorNames[9] = "$SU_VampireClothes"
	VanillaArmorNames[10] = "$SU_DunmerClothes"
	VanillaArmorNames[11] = "$SU_ArmorHunter"
	VanillaArmorNames[12] = "$SU_ArmorHide"
	VanillaArmorNames[13] = "$SU_ArmorFur"
	VanillaArmorNames[14] = "$SU_ArmorStudded"
	VanillaArmorNames[15] = "$SU_ArmorLeather"
	VanillaArmorNames[16] = "$SU_ArmorScaled"
	VanillaArmorNames[17] = "$SU_ArmorImperialLight"
	VanillaArmorNames[18] = "$SU_ArmorImperialStudded"
	VanillaArmorNames[19] = "$SU_ArmorStormcloak"
	VanillaArmorNames[20] = "$SU_ArmorVampire"
	VanillaArmorNames[21] = "$SU_ArmorChitin"
	VanillaArmorNames[22] = "$SU_ArmorElven"
	VanillaArmorNames[23] = "$SU_ArmorElvenLight"
	VanillaArmorNames[24] = "$SU_ArmorIron"
	VanillaArmorNames[25] = "$SU_ArmorIronBanded"
	VanillaArmorNames[26] = "$SU_ArmorSteel"
	VanillaArmorNames[27] = "$SU_ArmorSteelPlate"
	VanillaArmorNames[28] = "$SU_ArmorImperialHeavy"
	VanillaArmorNames[29] = "$SU_ArmorChitinHeavy"
	VanillaArmorNames[30] = "$SU_ArmorBonemold"
	VanillaArmorNames[31] = "$SU_ArmorOrcish"
	VanillaArmorNames[32] = "$SU_ArmorAncientNord"

	int i = ArmorsClothes.GetSize()
	OptionsArmorClothes = Utility.CreateStringArray(i + 1)
	OptionsArmorClothes[0] = "$SU_Random"
	while i > 0
		Form nthArmor = ArmorsClothes.GetAt(i - 1)
		int indexInVanillaArmorsArray = VanillaArmors.Find(nthArmor)
		if indexInVanillaArmorsArray > -1
			OptionsArmorClothes[i] = VanillaArmorNames[indexInVanillaArmorsArray]
		else
			OptionsArmorClothes[i] = StorageUtil.GetStringValue(nthArmor, "SkyrimUnbound_Name", "Error")
		endif
		i -= 1
	endwhile

	i = ArmorsLight.GetSize()
	OptionsArmorLight = Utility.CreateStringArray(i + 1)
	OptionsArmorLight[0] = "$SU_Random"
	while i > 0
		Form nthArmor = ArmorsLight.GetAt(i - 1)
		int indexInVanillaArmorsArray = VanillaArmors.Find(nthArmor)
		if indexInVanillaArmorsArray > -1
			OptionsArmorLight[i] = VanillaArmorNames[indexInVanillaArmorsArray]
		else
			OptionsArmorLight[i] = StorageUtil.GetStringValue(nthArmor, "SkyrimUnbound_Name", "Error")
		endif
		i -= 1
	endwhile

	i = ArmorsHeavy.GetSize()
	OptionsArmorHeavy = Utility.CreateStringArray(i + 1)
	OptionsArmorHeavy[0] = "$SU_Random"
	while i > 0
		Form nthArmor = ArmorsHeavy.GetAt(i - 1)
		int indexInVanillaArmorsArray = VanillaArmors.Find(nthArmor)
		if indexInVanillaArmorsArray > -1
			OptionsArmorHeavy[i] = VanillaArmorNames[indexInVanillaArmorsArray]
		else
			OptionsArmorHeavy[i] = StorageUtil.GetStringValue(nthArmor, "SkyrimUnbound_Name", "Error")
		endif
		i -= 1
	endwhile

	int len = WeaponSets.GetSize() + 1
	OptionsWeaponSet = Utility.CreateStringArray(len)
	OptionsWeaponSet[0] = "$SU_Random"
	OptionsWeaponSet[1] = "$SU_WeaponSetIron"
	OptionsWeaponSet[2] = "$SU_WeaponSetSteel"
	OptionsWeaponSet[3] = "$SU_WeaponSetImperial"
	OptionsWeaponSet[4] = "$SU_WeaponSetOrcish"
	OptionsWeaponSet[5] = "$SU_WeaponSetElven"
	OptionsWeaponSet[6] = "$SU_WeaponSetAncientNord"
	i = 7
	while i < len
		OptionsWeaponSet[i] = StorageUtil.GetStringValue(WeaponSets.GetAt(i - 1), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile

	len = WeaponTypes1H.GetSize() + 3
	OptionsOneHanded = Utility.CreateStringArray(len)
	OptionsOneHanded[0] = "$SU_Nothing"
	OptionsOneHanded[1] = "$SU_Random"
	OptionsOneHanded[2] = "$SU_Random1HNoDagger"
	OptionsOneHanded[3] = "$SU_Dagger"
	OptionsOneHanded[4] = "$SU_Sword"
	OptionsOneHanded[5] = "$SU_Axe"
	OptionsOneHanded[6] = "$SU_Mace"
	OptionsOneHanded[7] = "$SU_Scimitar"
	i = 8
	while i < len
		OptionsOneHanded[i] = StorageUtil.GetStringValue(WeaponTypes1H.GetAt(i - 3), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile

	len = WeaponTypes2H.GetSize() + 2
	OptionsTwoHanded = Utility.CreateStringArray(len)
	OptionsTwoHanded[0] = "$SU_Nothing"
	OptionsTwoHanded[1] = "$SU_Random"
	OptionsTwoHanded[2] = "$SU_Greatsword"
	OptionsTwoHanded[3] = "$SU_Battleaxe"
	OptionsTwoHanded[4] = "$SU_Warhammer"
	i = 5
	while i < len
		OptionsTwoHanded[i] = StorageUtil.GetStringValue(WeaponTypes2H.GetAt(i - 2), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile

	len = WeaponTypesRanged.GetSize() + 2
	OptionsRanged = Utility.CreateStringArray(len)
	OptionsRanged[0] = "$SU_Nothing"
	OptionsRanged[1] = "$SU_Random"
	OptionsRanged[2] = "$SU_Bow"
	i = 3
	while i < len
		OptionsRanged[i] = StorageUtil.GetStringValue(WeaponTypesRanged.GetAt(i - 2), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile

	OptionsStaff = Utility.CreateStringArray(StaffLists[0].GetSize() + StaffLists[1].GetSize() + StaffLists[2].GetSize() + StaffLists[3].GetSize() + StaffLists[4].GetSize() + 7)
	OptionsStaff[0] = "$SU_Nothing"
	OptionsStaff[1] = "$SU_Random"
	i = 2 ; menu option index
	int iSchool = 0
	while iSchool < 5
		string schoolName = OptionsSpellSchool[iSchool + 2]
		OptionsStaff[i] = "{" + schoolName + "} - {$SU_Random}"
		i += 1
		int iStaffInSchool = 0
		int numberOfStaffsInSchool = StaffLists[iSchool].GetSize()
		while iStaffInSchool < numberOfStaffsInSchool
			OptionsStaff[i] = "{" + schoolName + "} - {" + StaffLists[iSchool].GetAt(iStaffInSchool).GetName() + "}" 
			iStaffInSchool += 1
			i += 1
		endwhile
		iSchool += 1
	endwhile

	OIDs_SpellsAlteration = Utility.CreateIntArray(Spells_Alteration.GetSize(), -1)
	OIDs_SpellsConjuration = Utility.CreateIntArray(Spells_Conjuration.GetSize(), -1)
	OIDs_SpellsDestruction = Utility.CreateIntArray(Spells_Destruction.GetSize(), -1)
	OIDs_SpellsIllusion = Utility.CreateIntArray(Spells_Illusion.GetSize(), -1)
	OIDs_SpellsRestoration = Utility.CreateIntArray(Spells_Restoration.GetSize(), -1)

	OIDs_AddonItems = Utility.CreateIntArray(AddonItems.GetSize(), -1)

	len = HoldLists.GetSize()
	OIDs_Holds = Utility.CreateIntArray(len, -1)
	HoldNames = Utility.CreateStringArray(len)
	HoldNames[0] = "$SU_Eastmarch"
	HoldNames[1] = "$SU_Falkreath"
	HoldNames[2] = "$SU_Haafingar"
	HoldNames[3] = "$SU_Hjaalmarch"
	HoldNames[4] = "$SU_Pale"
	HoldNames[5] = "$SU_Reach"
	HoldNames[6] = "$SU_Rift"
	HoldNames[7] = "$SU_Whiterun"
	HoldNames[8] = "$SU_Winterhold"
	HoldNames[9] = "$SU_Solstheim"
	i = 10
	len -= 1
	while i < len
		HoldNames[i] = StorageUtil.GetStringValue(HoldLists.GetAt(i), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile
	HoldNames[len] = "$SU_OtherHolds"

	len = HoldsWithJail.GetSize()
	OptionsJail = Utility.CreateStringArray(len + 1)
	OptionsJail[0] = "$SU_Random"
	OptionsJail[1] = "$SU_Eastmarch"
	OptionsJail[2] = "$SU_Falkreath"
	OptionsJail[3] = "$SU_Haafingar"
	OptionsJail[4] = "$SU_Hjaalmarch"
	OptionsJail[5] = "$SU_Pale"
	OptionsJail[6] = "$SU_Reach"
	OptionsJail[7] = "$SU_Rift"
	OptionsJail[8] = "$SU_Whiterun"
	OptionsJail[9] = "$SU_Winterhold"
	OptionsJail[10] = "$SU_Solstheim"
	i = 10
	while i < len
		OptionsJail[i + 1] = StorageUtil.GetStringValue(HoldsWithJail.GetAt(i), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile

	OptionsInn = GenerateLocationNamesArray(Markers_Inns, autoName = true)
	OptionsCity = GenerateLocationNamesArray(Markers_Cities, "$SU_City")
	OptionsTown = GenerateLocationNamesArray(Markers_Towns, "$SU_Town")
	OptionsWilderness = GenerateLocationNamesArray(Markers_Wilderness, "$SU_Wilderness")
	OptionsBorder = GenerateLocationNamesArray(Markers_Borders, "$SU_Border")
	OptionsDocks = GenerateLocationNamesArray(Markers_Docks, "$SU_Docks")
	OptionsTemple = GenerateLocationNamesArray(Markers_Temples, "$SU_Temple")
	OptionsPlayerHome = GenerateLocationNamesArray(Markers_PlayerHomes, autoName = true)
	OptionsHomelessShelter = GenerateLocationNamesArray(Markers_HomelessShelters, autoName = true)
	OptionsFactionHeadquarters = GenerateLocationNamesArray(Markers_FactionHeadquarters, "$SU_FactionHeadquarters")
	OptionsBanditCamp = GenerateLocationNamesArray(Markers_BanditCamps, "$SU_BanditCamp")
	OptionsWarlockLair = GenerateLocationNamesArray(Markers_WarlockLairs, "$SU_WarlockLair")
	OptionsVampireLair = GenerateLocationNamesArray(Markers_VampireLairs, "$SU_VampireLair")
	OptionsOtherLocation = GenerateLocationNamesArray(Markers_Other)

	len = LocationTypeLists.GetSize()
	OIDs_LocationTypes = Utility.CreateIntArray(len, -1)
	LocationTypeNames = Utility.CreateStringArray(len)
	LocationTypeNames[0] = "$SU_City"
	LocationTypeNames[1] = "$SU_Town"
	LocationTypeNames[2] = "$SU_Inn"
	LocationTypeNames[3] = "$SU_Jail"
	LocationTypeNames[4] = "$SU_Wilderness"
	LocationTypeNames[5] = "$SU_Border"
	LocationTypeNames[6] = "$SU_Docks"
	LocationTypeNames[7] = "$SU_Temple"
	LocationTypeNames[8] = "$SU_PlayerHome"
	LocationTypeNames[9] = "$SU_HomelessShelter"
	LocationTypeNames[10] = "$SU_FactionHeadquarters"
	LocationTypeNames[11] = "$SU_BanditCamp"
	LocationTypeNames[12] = "$SU_WarlockLair"
	LocationTypeNames[13] = "$SU_VampireLair"
	i = 14
	len -= 1
	while i < len
		LocationTypeNames[i] = StorageUtil.GetStringValue(LocationTypeLists.GetAt(i), "SkyrimUnbound_Name", "Error")
		i += 1
	endwhile
	LocationTypeNames[len] = "$SU_OtherLocation"

endEvent

string[] function GenerateLocationNamesArray(FormList locTypeList, string translationFileString = "", bool autoName = false)

	int len = locTypeList.GetSize()
	string[] locationNames = Utility.CreateStringArray(len + 1)
	locationNames[0] = "$SU_Random"

	if autoName
		int i = len
		while i > 0
			Form nthLocTypeList = locTypeList.GetAt(i - 1)
			locationNames[i] = StorageUtil.GetStringValue(nthLocTypeList, "SkyrimUnbound_Name")
			if !locationNames[i]
				locationNames[i] = (nthLocTypeList as ObjectReference).GetParentCell().GetName()
				if !locationNames[i]
					locationNames[i] = "Error"
				endif
			endif
			i -= 1
		endwhile
	elseif !translationFileString
		int i = len
		while i > 0
			locationNames[i] = StorageUtil.GetStringValue(locTypeList.GetAt(i - 1), "SkyrimUnbound_Name", "Error")
			i -= 1
		endwhile
	else
		int i = 0
		int numberOfDefaultLocation = 0
		while i < len
			i += 1
			locationNames[i] = StorageUtil.GetStringValue(locTypeList.GetAt(i - 1), "SkyrimUnbound_Name")
			if !locationNames[i]
				numberOfDefaultLocation += 1
				locationNames[i] = translationFileString + numberOfDefaultLocation
			endif
		endwhile
	endif

	return locationNames

endFunction

string function GetLocationName(int location1, int location2)
	if location2 == 0
		return "$SU_Random"
	else
		FormList locTypeList = LocationTypeLists.GetAt(location1 - 1) as FormList
		string[] locationNamesForDefaultLocationType = GetLocationNamesForDefaultLocationType(locTypeList)
		if locationNamesForDefaultLocationType
			return locationNamesForDefaultLocationType[location2]
		else
			return StorageUtil.GetStringValue(locTypeList.GetAt(location2 - 1), "SkyrimUnbound_Name", "Error")
		endif
	endif
endFunction

string function GetLocationForm(int location1, int location2)
	if location2 == 0 || location1 == 0
		return None
	else
		return (LocationTypeLists.GetAt(location1 - 1) as FormList).GetAt(location2 - 1)
	endif
endFunction

string[] function GetLocationNames(int location1)
	if location1 == 0
		string[] result
		return result
	else
		FormList locTypeList = LocationTypeLists.GetAt(location1 - 1) as FormList
		string[] locationNamesForDefaultLocationType = GetLocationNamesForDefaultLocationType(locTypeList)
		if locationNamesForDefaultLocationType
			return locationNamesForDefaultLocationType
		else
			return GenerateLocationNamesArray(locTypeList)
		endif
	endif
endFunction

string[] function GetLocationNamesForDefaultLocationType(FormList locTypeList)
	if locTypeList == Markers_Cities
		return OptionsCity
	elseif locTypeList == Markers_Towns
		return OptionsTown
	elseif locTypeList == Markers_Inns
		return OptionsInn
	elseif locTypeList == HoldsWithJail
		return OptionsJail
	elseif locTypeList == Markers_Wilderness
		return OptionsWilderness
	elseif locTypeList == Markers_Borders
		return OptionsBorder
	elseif locTypeList == Markers_Docks
		return OptionsDocks
	elseif locTypeList == Markers_Temples
		return OptionsTemple
	elseif locTypeList == Markers_PlayerHomes
		return OptionsPlayerHome
	elseif locTypeList == Markers_HomelessShelters
		return OptionsHomelessShelter
	elseif locTypeList == Markers_FactionHeadquarters
		return OptionsFactionHeadquarters
	elseif locTypeList == Markers_BanditCamps
		return OptionsBanditCamp
	elseif locTypeList == Markers_WarlockLairs
		return OptionsWarlockLair
	elseif locTypeList == Markers_VampireLairs
		return OptionsVampireLair
	elseif locTypeList == Markers_Other
		return OptionsOtherLocation
	else
		string[] result
		return result
	endif
endFunction

Event OnPageReset(string page)

	SetCursorFillMode(TOP_TO_BOTTOM)

	if !SU.IsFullyInitialized
		AddTextOption("$SU_NotFullyInitializedYetLine1", "")
		AddTextOption("$SU_NotFullyInitializedYetLine2", "")
		return
	endif

	bool isBeforeStartAndReady = SU.GetStage() == 10 || SU.GetStage() == 30
	int flagGameStartOrDebug = FlagNoneIf(isBeforeStartAndReady || isDebugModeToggled)
	int flagGameStart = FlagNoneIf(isBeforeStartAndReady)

	if (page == Pages[0])
	
		if SU.GetStage() == 10 || SU.GetStage() == 30
			OID_BeginAdventure = AddTextOption("$SU_BeginYourAdventure", "$SU_BeginYourAdventureLetsGo")
			if SU.GetStage() == 10
				OID_PreviewMode = AddTextOption("", "$SU_PreviewMode")
				OID_LocationPreview = -1
				OID_ReRandomizeLocation = -1
			else
				OID_PreviewMode = -1
				OID_LocationPreview = AddTextOption("$SU_SelectedLocationMainPage", GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList))
				OID_ReRandomizeLocation = AddTextOption("", "$SU_ReRandomizeLocation", \
					FlagDisabledIf(Locations.ChoiceLocation > 0 && Locations.FinalLocation == GetLocationForm(Locations.ChoiceLocationType, Locations.ChoiceLocation)))
			endif
			AddEmptyOption()
		else
			OID_BeginAdventure = -1
			OID_PreviewMode = -1
			OID_LocationPreview = -1
			OID_ReRandomizeLocation = -1
		endif

		if PapyrusUtil.GetVersion()
			OID_LoadPreset = AddMenuOption("$SU_LoadPreset", "", flagGameStartOrDebug)
			OID_SavePreset = AddMenuOption("$SU_SavePreset", "", flagGameStartOrDebug)
			AddEmptyOption()
		else
			OID_LoadPreset = -1
			OID_SavePreset = -1
		endif
		
		AddHeaderOption("$SU_HeaderAbilities")
		if Abilities.AreStandingStonesAllowed()
			OID_StandingStone = AddMenuOption("$SU_StandingStone", OptionsStandingStone[Abilities.ChoiceStandingStone], flagGameStartOrDebug)
		else
			OID_StandingStone = -1
		endif
		OID_Disease = AddMenuOption("$SU_Disease", OptionsDisease[Abilities.ChoiceDisease], flagGameStart)

		SetCursorPosition(1)
		AddHeaderOption("$SU_HeaderDragonborn")
		OID_Dragonborn = AddMenuOption("$SU_Dragonborn", OptionsDragonborn[Abilities.ChoiceDragonborn])

		AddEmptyOption()
		AddHeaderOption("$SU_HeaderDragons")
		OID_Dragons = AddMenuOption("$SU_DragonsMode", OptionsDragons[Dragons.ChoiceDragons])
		int flagTimedDelay = FlagNoneIf(Dragons.ChoiceDragons == 0 || Dragons.ChoiceDragons == 5)
		OID_DelayMinDays = AddSliderOption("$SU_DelayMin", DelayDragonMin.GetValue(), "{0}", flagTimedDelay)
		OID_DelayMaxDays = AddSliderOption("$SU_DelayMax", DelayDragonMax.GetValue(), "{0}", flagTimedDelay)
		int flagLeveledDelay = FlagNoneIf(Dragons.ChoiceDragons == 1 || Dragons.ChoiceDragons == 6)
		OID_DelayLevel1 = AddSliderOption("$SU_WordWallLevel", DelayDragonLevel1.GetValue(), "{0}", flagLeveledDelay)
		OID_DelayLevel2 = AddSliderOption("$SU_RandomSpawnLevel", DelayDragonLevel2.GetValue(), "{0}", flagLeveledDelay)
		
	elseif (page == Pages[1])
	
		int location1 = Locations.ChoiceLocationType
		int location2 = Locations.ChoiceLocation
		
		if location1 > 0
			isInCustomizeRandomLocationMode = false
		endif

		if SU.GetStage() == 30
			OID_LocationPreview2 = AddTextOption("$SU_SelectedLocationLocationPage", GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList))
			OID_ReRandomizeLocation2 = AddTextOption("", "$SU_ReRandomizeLocation", \
				FlagDisabledIf(Locations.ChoiceLocation > 0 && Locations.FinalLocation == GetLocationForm(Locations.ChoiceLocationType, Locations.ChoiceLocation)))
			AddEmptyOption()
		else
			OID_LocationPreview2 = -1
			OID_ReRandomizeLocation2 = -1
		endif

		AddHeaderOption("$SU_HeaderLocation", flagGameStartOrDebug)

		if isInCustomizeRandomLocationMode
			OID_RandomLocation = -1
			OID_CustomizeLocationRandomization = AddTextOption("", "$SU_CustomizeLocationRandomizationGoBack")
			OID_SelectAllLocTypes = AddTextOption("", "$SU_SelectAll", flagGameStartOrDebug)
			OID_DeselectAllLocTypes = AddTextOption("", "$SU_DeselectAll", flagGameStartOrDebug)
		else
			OID_RandomLocation = AddToggleOption("$SU_Random", location1 == 0, flagGameStartOrDebug)
			OID_CustomizeLocationRandomization = AddTextOption("", "$SU_CustomizeLocationRandomization", FlagNoneIf(location1 == 0))
			OID_SelectAllLocTypes = -1
			OID_DeselectAllLocTypes = -1
		endif

		int i = 0
		int l = OIDs_LocationTypes.Length
		int selectedLocationTypeIndex = location1 - 1
		while i < l
			Form nthLocTypeList = LocationTypeLists.GetAt(i)
			if (nthLocTypeList as FormList).GetSize()
				string selectedOptionText = ""
				if i == selectedLocationTypeIndex
					selectedOptionText = GetLocationName(location1, location2)
				endif
				if isInCustomizeRandomLocationMode
					OIDs_LocationTypes[i] = AddToggleOption(LocationTypeNames[i], SelectedLocationTypes.HasForm(nthLocTypeList), flagGameStartOrDebug)
				else
					OIDs_LocationTypes[i] = AddMenuOption(LocationTypeNames[i], selectedOptionText, flagGameStartOrDebug)
				endif
			endif
			i += 1
		endwhile
		
		SetCursorPosition(1)
		AddHeaderOption("$SU_Holds", flagGameStartOrDebug)
		OID_SelectAllHolds = AddTextOption("", "$SU_SelectAll", flagGameStartOrDebug)
		OID_DeselectAllHolds = AddTextOption("", "$SU_DeselectAll", flagGameStartOrDebug)
		i = 0
		l = OIDs_Holds.Length
		while i < l
			Form nthHoldList = HoldLists.GetAt(i)
			if (nthHoldList as FormList).GetSize()
				OIDs_Holds[i] = AddToggleOption(HoldNames[i], SelectedHolds.HasForm(nthHoldList), flagGameStartOrDebug)
			endif
			i += 1
		endwhile

		AddEmptyOption()
		AddHeaderOption("$SU_HeaderStatus", flagGameStart)
		OID_LocalInhabitant = AddMenuOption("$SU_LocalInhabitant", OptionsLocalInhabitant[Locations.ChoiceLocalInhabitant], flagGameStart)
		OID_AlreadyAdventurer = AddToggleOption("$SU_AlreadyAdventurer", Locations.ChoiceAlreadyAdventurer, \
			FlagIf(flagGameStart, Locations.ChoiceLocalInhabitant != 1 && Locations.ChoiceLocalInhabitant != 2))

		AddEmptyOption()
		AddHeaderOption("$SU_Bounty", flagGameStart)
		OID_AutoBounty = AddToggleOption("$SU_AutoBounty", (Locations.ChoiceBounty < 0), flagGameStart)
		if Locations.ChoiceBounty >= 0
			OID_Bounty = AddSliderOption("$SU_Bounty", Locations.ChoiceBounty, "{0}", flagGameStart)
		else
			OID_Bounty = AddSliderOption("$SU_Bounty", 0, "$SU_Auto", OPTION_FLAG_DISABLED)
		endif

		AddEmptyOption()
		AddHeaderOption("$SU_HeaderTime", flagGameStart)
		OID_TimeOfDay = AddMenuOption("$SU_TimeOfDay", OptionsTimeOfDay[Locations.ChoiceTimeOfDay], flagGameStart)
		OID_Season = AddMenuOption("$SU_Season", OptionsSeason[Locations.ChoiceSeason], flagGameStart)
		OID_Month = AddMenuOption("$SU_Month", GetMonthArray()[Locations.ChoiceMonth], FlagIf(flagGameStart, Locations.ChoiceSeason))
		
	elseif (page == Pages[2])
		
		OID_WeaponSet = AddMenuOption("$SU_WeaponSet", OptionsWeaponSet[Inventory.ChoiceWeaponSet], flagGameStartOrDebug)
		
		AddHeaderOption("$SU_HeaderWeapons", flagGameStartOrDebug)

		OID_RandomWeapons = AddToggleOption("$SU_Random", Inventory.ChoiceRandomWeapons, flagGameStartOrDebug)
		int flagWeaponOptions = FlagIf(flagGameStartOrDebug, !Inventory.ChoiceRandomWeapons)
		if Inventory.ChoiceOneHanded == 0
			OID_OneHanded = AddMenuOption("$SU_OneHanded", "", flagWeaponOptions)
			OID_OneHandedCombination = AddMenuOption("$SU_OneHandedCombination", "", OPTION_FLAG_DISABLED)
		else
			OID_OneHanded = AddMenuOption("$SU_OneHanded", OptionsOneHanded[Inventory.ChoiceOneHanded], flagWeaponOptions)
			OID_OneHandedCombination = AddMenuOption("$SU_OneHandedCombination", OptionsOneHandedCombination[Inventory.ChoiceOneHandedCombination], flagWeaponOptions)
		endif
		if Inventory.ChoiceTwoHanded == 0
			OID_TwoHanded = AddMenuOption("$SU_TwoHanded", "", flagWeaponOptions)
		else
			OID_TwoHanded = AddMenuOption("$SU_TwoHanded", OptionsTwoHanded[Inventory.ChoiceTwoHanded], flagWeaponOptions)
		endif
		if Inventory.ChoiceRanged == 0
			OID_Ranged = AddMenuOption("$SU_RangedWeapon", "", flagWeaponOptions)
		else
			OID_Ranged = AddMenuOption("$SU_RangedWeapon", OptionsRanged[Inventory.ChoiceRanged], flagWeaponOptions)
		endif
		if Inventory.ChoiceStaff == 0
			OID_Staff = AddMenuOption("$SU_Staff", "", flagWeaponOptions)
		else
			OID_Staff = AddMenuOption("$SU_Staff", OptionsStaff[Inventory.ChoiceStaff], flagWeaponOptions)
		endif
		
		SetCursorPosition(1)
		AddHeaderOption("$SU_HeaderArmor", flagGameStartOrDebug)
		OID_ArmorType = AddMenuOption("$SU_ArmorType", OptionsArmorType[Inventory.ChoiceArmorType], flagGameStartOrDebug)
		string armorSetOptionText
		if Inventory.ChoiceArmorType == 1
			armorSetOptionText = OptionsArmorClothes[Inventory.ChoiceArmorSet]
		elseif Inventory.ChoiceArmorType == 2
			armorSetOptionText = OptionsArmorLight[Inventory.ChoiceArmorSet]
		elseif Inventory.ChoiceArmorType == 3
			armorSetOptionText = OptionsArmorHeavy[Inventory.ChoiceArmorSet]
		else
			armorSetOptionText = "$SU_Random"
		endif
		OID_ArmorSet = AddMenuOption("$SU_ArmorSet", armorSetOptionText, FlagIf(flagGameStartOrDebug, Inventory.ChoiceArmorType > 0 && Inventory.ChoiceArmorType < 4))
		OID_Headgear = AddMenuOption("$SU_Headgear", OptionsHeadgear[Inventory.ChoiceHeadgear], FlagIf(flagGameStartOrDebug, Inventory.ChoiceArmorType != 4))
		OID_OnlyEntryLevelArmors = AddToggleOption("$SU_OnlyEntryLevelArmors", Inventory.ChoiceOnlyEntryLevelArmors, \
			FlagIf(flagGameStartOrDebug, Inventory.ChoiceArmorSet == 0 && Inventory.ChoiceArmorType != 1 && Inventory.ChoiceArmorType != 4))
		
	elseif (page == Pages[3])

		OID_SpellsMode = AddMenuOption("$SU_Spells", OptionsSpellsMode[Inventory.ChoiceSpellsMode], flagGameStartOrDebug)
		if Inventory.ChoiceSpellsMode != 2
			OID_SpellSchool1 = AddMenuOption("$SU_FirstSpell", "", OPTION_FLAG_DISABLED)
			OID_SpellSchool2 = AddMenuOption("$SU_SecondSpell", "", OPTION_FLAG_DISABLED)
		else
			OID_SpellSchool1 = AddMenuOption("$SU_FirstSpell", OptionsSpellSchool[Inventory.ChoiceSpellSchool1], flagGameStartOrDebug)
			OID_SpellSchool2 = AddMenuOption("$SU_SecondSpell", OptionsSpellSchool[Inventory.ChoiceSpellSchool2], flagGameStartOrDebug)
		endif
		AddEmptyOption()

		if Inventory.ChoiceSpellsMode == 3 || Inventory.ChoiceSpellSchool1 == 7 || Inventory.ChoiceSpellSchool2 == 7
			Form[] selectedSpellsArray = SelectedSpells.ToArray()

			AddHeaderOption("$SU_Destruction", flagGameStartOrDebug)
			int l = OIDs_SpellsDestruction.Length
			int i = 0
			Form thisSpell
			while i < l
				thisSpell = Spells_Destruction.GetAt(i)
				OIDs_SpellsDestruction[i] = AddToggleOption(thisSpell.GetName(), selectedSpellsArray.Find(thisSpell) > -1, flagGameStartOrDebug)
				i += 1
			endwhile

			AddEmptyOption()
			AddHeaderOption("$SU_Conjuration", flagGameStartOrDebug)
			l = OIDs_SpellsConjuration.Length
			i = 0
			while i < l
				thisSpell = Spells_Conjuration.GetAt(i)
				OIDs_SpellsConjuration[i] = AddToggleOption(thisSpell.GetName(), selectedSpellsArray.Find(thisSpell) > -1, flagGameStartOrDebug)
				i += 1
			endwhile

			SetCursorPosition(9)

			AddHeaderOption("$SU_Restoration", flagGameStartOrDebug)
			l = OIDs_SpellsRestoration.Length
			i = 0
			while i < l
				thisSpell = Spells_Restoration.GetAt(i)
				OIDs_SpellsRestoration[i] = AddToggleOption(thisSpell.GetName(), selectedSpellsArray.Find(thisSpell) > -1, flagGameStartOrDebug)
				i += 1
			endwhile

			AddEmptyOption()
			AddHeaderOption("$SU_Illusion", flagGameStartOrDebug)
			l = OIDs_SpellsIllusion.Length
			i = 0
			while i < l
				thisSpell = Spells_Illusion.GetAt(i)
				OIDs_SpellsIllusion[i] = AddToggleOption(thisSpell.GetName(), selectedSpellsArray.Find(thisSpell) > -1, flagGameStartOrDebug)
				i += 1
			endwhile

			AddEmptyOption()
			AddHeaderOption("$SU_Alteration", flagGameStartOrDebug)
			l = OIDs_SpellsAlteration.Length
			i = 0
			while i < l
				thisSpell = Spells_Alteration.GetAt(i)
				OIDs_SpellsAlteration[i] = AddToggleOption(thisSpell.GetName(), selectedSpellsArray.Find(thisSpell) > -1, flagGameStartOrDebug)
				i += 1
			endwhile
		else
			AddHeaderOption("$SU_Destruction", OPTION_FLAG_DISABLED)
			int l = OIDs_SpellsDestruction.Length
			int i = 0
			while i < l
				OIDs_SpellsDestruction[i] = AddToggleOption(Spells_Destruction.GetAt(i).GetName(), false, OPTION_FLAG_DISABLED)
				i += 1
			endwhile

			AddEmptyOption()
			AddHeaderOption("$SU_Conjuration", OPTION_FLAG_DISABLED)
			l = OIDs_SpellsConjuration.Length
			i = 0
			while i < l
				OIDs_SpellsConjuration[i] = AddToggleOption(Spells_Conjuration.GetAt(i).GetName(), false, OPTION_FLAG_DISABLED)
				i += 1
			endwhile

			SetCursorPosition(9)

			AddHeaderOption("$SU_Restoration", OPTION_FLAG_DISABLED)
			l = OIDs_SpellsRestoration.Length
			i = 0
			while i < l
				OIDs_SpellsRestoration[i] = AddToggleOption(Spells_Restoration.GetAt(i).GetName(), false, OPTION_FLAG_DISABLED)
				i += 1
			endwhile

			AddEmptyOption()
			AddHeaderOption("$SU_Illusion", OPTION_FLAG_DISABLED)
			l = OIDs_SpellsIllusion.Length
			i = 0
			while i < l
				OIDs_SpellsIllusion[i] = AddToggleOption(Spells_Illusion.GetAt(i).GetName(), false, OPTION_FLAG_DISABLED)
				i += 1
			endwhile

			AddEmptyOption()
			AddHeaderOption("$SU_Alteration", OPTION_FLAG_DISABLED)
			l = OIDs_SpellsAlteration.Length
			i = 0
			while i < l
				OIDs_SpellsAlteration[i] = AddToggleOption(Spells_Alteration.GetAt(i).GetName(), false, OPTION_FLAG_DISABLED)
				i += 1
			endwhile
		endif

		SetCursorPosition(1)
		OID_SameSchoolSpellsChance = AddToggleOption("$SU_SameSchoolChance", Inventory.ChoiceSameSchoolSpellsChance, \
			FlagIf(flagGameStartOrDebug, !Inventory.ChoiceSpellsMode || (Inventory.ChoiceSpellsMode == 2 && (!Inventory.ChoiceSpellSchool1 || !Inventory.ChoiceSpellSchool2))))

	elseif (page == Pages[4])

		OID_Wealth = AddMenuOption("$SU_Wealth", OptionsWealth[Inventory.ChoiceWealth], flagGameStartOrDebug)
		int flagItemOptions = FlagIf(flagGameStartOrDebug, Inventory.ChoiceWealth != 1)

		AddHeaderOption("$SU_HeaderItems", flagGameStartOrDebug)
		OID_CustomGoldToggle = AddToggleOption("$SU_CustomGoldToggle", (Inventory.ChoiceGold >= 0), flagItemOptions)
		if Inventory.ChoiceGold >= 0
			OID_CustomGoldSlider = AddSliderOption("$SU_CustomGoldSilder", Inventory.ChoiceGold, "{0}", flagItemOptions)
		else
			OID_CustomGoldSlider = AddSliderOption("$SU_CustomGoldSilder", 0, "$SU_Random", OPTION_FLAG_DISABLED)
		endif
		OID_Food = AddTextOption("$SU_Food", OptionsDisabledEnabledRandom[Inventory.ChoiceFood], flagItemOptions)
		OID_Drinks = AddTextOption("$SU_Drinks", OptionsDisabledEnabledRandom[Inventory.ChoiceDrinks], flagItemOptions)
		OID_Potions = AddTextOption("$SU_Potions", OptionsDisabledEnabledRandom[Inventory.ChoicePotions], FlagIf(flagItemOptions, Inventory.ChoiceWealth != 2))
		OID_Lockpicks = AddTextOption("$SU_Lockpicks", OptionsDisabledEnabledRandom[Inventory.ChoiceLockpicks], flagItemOptions)
		OID_Torch = AddTextOption("$SU_Torch", OptionsDisabledEnabledRandom[Inventory.ChoiceTorch], flagItemOptions)
		if SkyrimUnboundLantern.GetNumForms()
			OID_Lantern = AddTextOption("$SU_Lantern", OptionsDisabledEnabledRandom[Inventory.ChoiceLantern], flagItemOptions)
		else
			OID_Lantern = -1
		endif
		OID_WoodcuttersAxe = AddTextOption("$SU_WoodcuttersAxe", OptionsDisabledEnabledRandom[Inventory.ChoiceWoodcuttersAxe], flagItemOptions)
		OID_Pickaxe = AddTextOption("$SU_Pickaxe", OptionsDisabledEnabledRandom[Inventory.ChoicePickaxe], flagItemOptions)
		OID_Skooma = AddTextOption("$SU_Skooma", OptionsDisabledEnabledRandom[Inventory.ChoiceSkooma], flagItemOptions)

		SetCursorPosition(1)
		
		int numberOfAddonItems = AddonItems.GetSize()
		if numberOfAddonItems
			AddHeaderOption("$SU_HeaderItems")
			int i = 0
			while i < numberOfAddonItems
				Form itemForm = AddonItems.GetAt(i)
				string optionName = StorageUtil.GetStringValue(itemForm, "SkyrimUnbound_Name")
				int playerChoice = StorageUtil.GetIntValue(itemForm, "SkyrimUnbound_PlayerChoice")
				if itemForm as FormList
					string selectedOptionText = "$SU_Disabled"
					if playerChoice == 1
						selectedOptionText = "$SU_Random"
					elseif playerChoice > 1
						selectedOptionText = StorageUtil.GetStringValue((itemForm as FormList).GetAt(playerChoice - 2), "SkyrimUnbound_Name")
					endif
					OIDs_AddonItems[i] = AddMenuOption(optionName, selectedOptionText, flagItemOptions)
				else
					OIDs_AddonItems[i] = AddTextOption(optionName, OptionsDisabledEnabledRandom[playerChoice], flagItemOptions)
				endif
				i += 1
			endwhile
		endif

	elseif (page == Pages[5])

		OID_DebugMode = AddToggleOption("$SU_DebugMode", isDebugModeToggled)

		if PapyrusUtil.GetVersion()
			AddEmptyOption()
			AddHeaderOption("$SU_HeaderGlobalSettings")
			OID_Hotkey = AddKeyMapOption("$SU_Hotkey", SU.GetGlobalSettingInt("hotkey"))
			OID_BlackScreen = AddSliderOption("$SU_BlackScreen", SU.GetGlobalSettingInt("black_screen"), "{0}")
			OID_IntroTitles = AddMenuOption("$SU_IntroTitles", OptionsIntroTitles[SU.GetGlobalSettingInt("intro_titles")])
			OID_ClothesInStartingRoom = AddToggleOption("$SU_ClothesInStartingRoom", SU.GetGlobalSettingInt("clothes_in_starting_room"))
			OID_Autosave = AddToggleOption("$SU_Autosave", SU.GetGlobalSettingInt("autosave"))
			OID_MCMOnTop = AddToggleOption("$SU_MCMOnTop", SU.GetGlobalSettingInt("mcm_on_top"))
			OID_AutoOpenMCM = AddToggleOption("$SU_AutoOpenMCM", SU.GetGlobalSettingInt("auto_open_mcm"))
			OID_AutoOpenMCMDelay = AddSliderOption("$SU_AutoOpenMCMDelay", SU.GetGlobalSettingInt("auto_open_mcm_delay"), "{0}", FlagNoneIf(SU.GetGlobalSettingInt("auto_open_mcm")))
			OID_AutoOpenPresets = AddToggleOption("$SU_AutoOpenPresets", SU.GetGlobalSettingInt("auto_open_presets"))
		else
			OID_Hotkey = -1
			OID_BlackScreen = -1
			OID_IntroTitles = -1
			OID_ClothesInStartingRoom = -1
			OID_Autosave = -1
			OID_MCMOnTop = -1
			OID_AutoOpenMCM = -1
			OID_AutoOpenMCMDelay = -1
			OID_AutoOpenPresets = -1
		endif
		
		SetCursorPosition(1)
		AddHeaderOption("$SU_HeaderQuests")
		OID_WhiterunThanePrerequisite = AddMenuOption("$SU_WhiterunThanePrerequisite", OptionsWhiterunThanePrerequisite[WhiterunThanePrerequisite.GetValueInt()])
		
		AddEmptyOption()
		AddHeaderOption("$SU_HeaderMisc")
		OID_UnlockShouts = AddMenuOption("$SU_AutoUnlockShouts", OptionsUnlockShouts[UnlockShouts.GetValueInt()], FlagDisabledIf(Abilities.ChoiceDragonborn == 3))
		OID_PerkPoints = AddSliderOption("$SU_AddPerkPoints", Abilities.ChoicePerkPoints, "{0}", flagGameStart)

		if isDebugModeToggled
			AddEmptyOption()
			AddHeaderOption("Debug")
			OID_ShowDebugInfo = AddTextOption("Show Debug Info", "Show")
		else
			OID_ShowDebugInfo = -1
		endif
		
	endif

endEvent

Event OnOptionMenuOpen(int option)

	if (CurrentPage == Pages[0])

		if (option == OID_LoadPreset || option == OID_SavePreset)
			string[] userPresets = JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")
			int i = userPresets.Length
			while i
				i -= 1
				userPresets[i] = StringUtil.Substring(userPresets[i], 0, StringUtil.GetLength(userPresets[i]) - 5)
			endwhile

			string[] firstElements
			if option == OID_LoadPreset
				if MiscUtil.FileExists("Data/SKSE/Plugins/SkyrimUnbound/Presets/Default/Custom.json")
					if userPresets.Length
						firstElements = new string[4]
						firstElements[3] = "$SU_RandomPreset"
					else
						firstElements = new string[3]
					endif
					firstElements[2] = "$SU_BlankPreset"
				else
					if userPresets.Length
						firstElements = new string[3]
						firstElements[2] = "$SU_RandomPreset"
					else
						firstElements = new string[2]
					endif
				endif
				firstElements[1] = "$SU_DefaultPreset"
			else
				firstElements = new string[3]
				firstElements[1] = "$SU_NewPreset"
				firstElements[2] = "$SU_DefaultPreset"
			endif
			firstElements[0] = "$SU_Cancel"

			SetMenuDialogOptions(PapyrusUtil.MergeStringArray(firstElements, userPresets))
			SetMenuDialogStartIndex(0)

		elseif (option == OID_StandingStone)
			SetMenuDialogOptions(OptionsStandingStone)
			SetMenuDialogStartIndex(Abilities.ChoiceStandingStone)

		elseif (option == OID_Disease)
			SetMenuDialogOptions(OptionsDisease)
			SetMenuDialogStartIndex(Abilities.ChoiceDisease)

		elseif (option == OID_Dragonborn)
			string[] OptionsDragonbornInMenu = new string[4]
			OptionsDragonbornInMenu[0] = "$SU_DragonbornRandom"
			OptionsDragonbornInMenu[1] = "$SU_DragonbornYes"
			OptionsDragonbornInMenu[2] = "$SU_DragonbornNo"
			OptionsDragonbornInMenu[3] = "$SU_DragonbornNoWithShouts"
			SetMenuDialogOptions(OptionsDragonbornInMenu)
			SetMenuDialogStartIndex(Abilities.ChoiceDragonborn)

		elseif (option == OID_Dragons)
			SetMenuDialogOptions(OptionsDragons)
			SetMenuDialogStartIndex(Dragons.ChoiceDragons)

		endif

	elseif (CurrentPage == Pages[1])
	
		if (option == OID_LocalInhabitant)
			SetMenuDialogOptions(OptionsLocalInhabitant)
			SetMenuDialogStartIndex(Locations.ChoiceLocalInhabitant)

		elseif (option == OID_Season)
			SetMenuDialogOptions(OptionsSeason)
			SetMenuDialogStartIndex(Locations.ChoiceSeason)

		elseif (option == OID_Month)
			SetMenuDialogOptions(GetMonthArray())
			SetMenuDialogStartIndex(Locations.ChoiceMonth)

		elseif (option == OID_TimeOfDay)
			SetMenuDialogOptions(OptionsTimeOfDay)
			SetMenuDialogStartIndex(Locations.ChoiceTimeOfDay)

		else
			int locationType = OIDs_LocationTypes.Find(option) + 1
			if locationType == Locations.ChoiceLocationType
				SetMenuDialogStartIndex(Locations.ChoiceLocation)
			else
				SetMenuDialogStartIndex(0)
			endif
			SetMenuDialogOptions(GetLocationNames(locationType))

		endif

	elseif (CurrentPage == Pages[2])

		if (option == OID_OneHanded)
			SetMenuDialogOptions(OptionsOneHanded)
			SetMenuDialogStartIndex(Inventory.ChoiceOneHanded)

		elseif (option == OID_OneHandedCombination)
			SetMenuDialogOptions(OptionsOneHandedCombination)
			SetMenuDialogStartIndex(Inventory.ChoiceOneHandedCombination)

		elseif (option == OID_TwoHanded)
			SetMenuDialogOptions(OptionsTwoHanded)
			SetMenuDialogStartIndex(Inventory.ChoiceTwoHanded)

		elseif (option == OID_Ranged)
			SetMenuDialogOptions(OptionsRanged)
			SetMenuDialogStartIndex(Inventory.ChoiceRanged)

		elseif (option == OID_Staff)
			SetMenuDialogOptions(OptionsStaff)
			SetMenuDialogStartIndex(Inventory.ChoiceStaff)

		elseif (option == OID_WeaponSet)
			SetMenuDialogOptions(OptionsWeaponSet)
			SetMenuDialogStartIndex(Inventory.ChoiceWeaponSet)

		elseif (option == OID_ArmorType)
			SetMenuDialogOptions(OptionsArmorType)
			SetMenuDialogStartIndex(Inventory.ChoiceArmorType)

		elseif (option == OID_ArmorSet)
			if Inventory.ChoiceArmorType == 1
				SetMenuDialogOptions(OptionsArmorClothes)
			elseif Inventory.ChoiceArmorType == 2
				SetMenuDialogOptions(OptionsArmorLight)
			elseif Inventory.ChoiceArmorType == 3
				SetMenuDialogOptions(OptionsArmorHeavy)
			endif
			SetMenuDialogStartIndex(Inventory.ChoiceArmorSet)

		elseif (option == OID_Headgear)
			SetMenuDialogOptions(OptionsHeadgear)
			SetMenuDialogStartIndex(Inventory.ChoiceHeadgear)
		endif
	
	elseif (CurrentPage == Pages[3])

		if (option == OID_SpellsMode)
			SetMenuDialogOptions(OptionsSpellsMode)
			SetMenuDialogStartIndex(Inventory.ChoiceSpellsMode)

		elseif (option == OID_SpellSchool1)
			SetMenuDialogOptions(OptionsSpellSchool)
			SetMenuDialogStartIndex(Inventory.ChoiceSpellSchool1)

		elseif (option == OID_SpellSchool2)
			SetMenuDialogOptions(OptionsSpellSchool)
			SetMenuDialogStartIndex(Inventory.ChoiceSpellSchool2)
		endif
	
	elseif (CurrentPage == Pages[4])

		if (option == OID_Wealth)
			SetMenuDialogOptions(OptionsWealth)
			SetMenuDialogStartIndex(Inventory.ChoiceWealth)

		else
			int addonItemOptionIndex = OIDs_AddonItems.Find(option)
			if addonItemOptionIndex > -1
				FormList addonItemList = AddonItems.GetAt(addonItemOptionIndex) as FormList
				string[] options = Utility.CreateStringArray(addonItemList.GetSize() + 2)
				options[0] = "$SU_Disabled"
				options[1] = "$SU_Random"
				int i = 2
				int numberOfOptions = options.Length
				while i < numberOfOptions
					options[i] = StorageUtil.GetStringValue(addonItemList.GetAt(i - 2), "SkyrimUnbound_Name")
					i += 1
				endwhile
				SetMenuDialogOptions(options)
				SetMenuDialogStartIndex(StorageUtil.GetIntValue(addonItemList, "SkyrimUnbound_PlayerChoice"))
			endif

		endif
		
	elseif (CurrentPage == Pages[5])

		if (option == OID_IntroTitles)
			SetMenuDialogOptions(OptionsIntroTitles)
			SetMenuDialogStartIndex(SU.GetGlobalSettingInt("intro_titles"))
	
		elseif (option == OID_WhiterunThanePrerequisite)
			SetMenuDialogOptions(OptionsWhiterunThanePrerequisite)
			SetMenuDialogStartIndex(WhiterunThanePrerequisite.GetValueInt())

		elseif (option == OID_UnlockShouts)
			SetMenuDialogOptions(OptionsUnlockShouts)
			SetMenuDialogStartIndex(UnlockShouts.GetValueInt())
		endif

	endif

	SetMenuDialogDefaultIndex(0)

endEvent

Event OnOptionMenuAccept(int option, int index)

	if (CurrentPage == Pages[0])

		if (option == OID_LoadPreset)
			if SU.IsRandomizingLocationOrGear
				ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
				return
			endif
			if index == 1 ; Default
				if MiscUtil.FileExists("Data/SKSE/Plugins/SkyrimUnbound/Presets/Default/Custom.json")
					LoadPreset("Default/Custom.json")
				else
					LoadPreset("Default/Blank.json")
				endif
			elseif index >= 2
				string[] presetNames = JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")
				bool blankPresetOptionExists = MiscUtil.FileExists("Data/SKSE/Plugins/SkyrimUnbound/Presets/Default/Custom.json")
				int firstUserPresetOptionIndex
				if blankPresetOptionExists && presetNames.Length
					firstUserPresetOptionIndex = 4
				else
					firstUserPresetOptionIndex = 3
				endif
				if index >= firstUserPresetOptionIndex
					LoadPreset(presetNames[index - firstUserPresetOptionIndex])
				elseif index == 2 && blankPresetOptionExists
					LoadPreset("Default/Blank.json")
				else
					string presetName = presetNames[Utility.RandomInt(0, presetNames.Length - 1)] 
					ShowMessage(StringUtil.Substring(presetName, 0, StringUtil.GetLength(presetName) - 5), false, "$SU_OK")
					LoadPreset(presetName)
				endif
			endif

		elseif (option == OID_SavePreset)
			if index == 1 ; New
				Utility.WaitMenuMode(0.1)
				string presetName = ((Self as Form) as UILIB_1).ShowTextInput("$SU_NewPresetHeader")
				Utility.WaitMenuMode(0.1)
				if presetName
					if !JsonUtil.JsonExists("../SkyrimUnbound/Presets/" + presetName) || ShowMessage("$SU_Preset{" + presetName + "}AlreadyExistsMessage", true, "$SU_OK")
						if StringUtil.Find(presetName, ".json") == -1
							presetName += ".json"
						endif
						SavePreset(presetName)
					endif
				endif
			elseif index == 2 ; Default
				if ShowMessage("$SU_ConfirmReplaceDefaultPresetMessage", true, "$SU_OK")
					SavePreset("Default/Custom.json")
				endif
			elseif index > 2
				string[] PresetNames = JsonUtil.JsonInFolder("../SkyrimUnbound/Presets")
				SavePreset(PresetNames[index - 3])
			endif

		elseif (option == OID_StandingStone)
			if index > 1
				string description = PO3_SKSEfunctions.GetDescription(StandingStoneMessages[index - 2])
				if !description && JsonUtil.JsonExists("../SkyrimUnbound/StandingStones.json")
					description = JsonUtil.StringListGet("../SkyrimUnbound/StandingStones.json", "descriptions", index - 2)
					JsonUtil.Unload("../SkyrimUnbound/StandingStones.json", false)
				endif
				if description && !ShowMessage(description, true, "$SU_OK")
					return
				endif
			endif
			Abilities.ChoiceStandingStone = index
			SetMenuOptionValue(option, OptionsStandingStone[index])
			if SU.GetStage() >= 100
				Abilities.SetStandingStone()
			endif

		elseif (option == OID_Disease)
			if SU.IsRandomizingLocationOrGear
				ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
				return
			endif
			Abilities.ChoiceDisease = index
			SetMenuOptionValue(option, OptionsDisease[index])

		elseif (option == OID_Dragonborn)
			if index == Abilities.ChoiceDragonborn
				return
			endif
			Abilities.ChoiceDragonborn = index 
			OptionsDragonborn[0] = "$SU_Random"
			SetMenuOptionValue(option, OptionsDragonborn[index])
			if SU.GetStage() >= 100
				Abilities.ApplyDragonbornOptions()
			endif

		elseif (option == OID_Dragons)
			if index == Dragons.ChoiceDragons
				return
			endif
			Dragons.ChoiceDragons = index
			SetMenuOptionValue(option, OptionsDragons[index])
			int flagTimedDelay = FlagNoneIf(index == 0 || index == 5)
			SetOptionFlags(OID_DelayMinDays, flagTimedDelay)
			SetOptionFlags(OID_DelayMaxDays, flagTimedDelay)
			int flagLeveledDelay = FlagNoneIf(index == 1 || index == 6)
			SetOptionFlags(OID_DelayLevel1, flagLeveledDelay)
			SetOptionFlags(OID_DelayLevel2, flagLeveledDelay)
			if SU.GetStage() >= 100
				Dragons.ApplyDragonsOption()
			endif

		endif
	
	elseif (CurrentPage == Pages[1])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_LocalInhabitant)
			Locations.ChoiceLocalInhabitant = index
			SetMenuOptionValue(option, OptionsLocalInhabitant[index])
			SetOptionFlags(OID_AlreadyAdventurer, FlagDisabledIf(index == 1 || index == 2))
		
		elseif (option == OID_Season)
			if index != Locations.ChoiceSeason
				Locations.ChoiceSeason = index
				SetMenuOptionValue(option, OptionsSeason[index])
				Locations.ChoiceMonth = 0
				SetMenuOptionValue(OID_Month, "$SU_Random")
				SetOptionFlags(OID_Month, FlagNoneIf(index))
			endif

		elseif (option == OID_Month)
			Locations.ChoiceMonth = index
			SetMenuOptionValue(option, GetMonthArray()[index])

		elseif (option == OID_TimeOfDay)
			Locations.ChoiceTimeOfDay = index
			SetMenuOptionValue(option, OptionsTimeOfDay[index])

		else
			if !index
				Form[] locTypeFormLists = new Form[1]
				locTypeFormLists[0] = LocationTypeLists.GetAt(OIDs_LocationTypes.Find(option))
				if !Locations.HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), locTypeFormLists)
					if ShowMessage("$SU_NoHoldLocationMatches", true, "$SU_ClearHolds")
						ClearHolds()
					else
						return
					endif
				endif
			endif

			if Locations.ChoiceLocationType
				int previousLocationTypeOID = OIDs_LocationTypes[Locations.ChoiceLocationType - 1]
				SetMenuOptionValue(previousLocationTypeOID, "")
			else
				SetToggleOptionValue(OID_RandomLocation, false)
				SetOptionFlags(OID_CustomizeLocationRandomization, OPTION_FLAG_DISABLED)
			endif
			Locations.ChoiceLocationType = OIDs_LocationTypes.Find(option) + 1
			Locations.ChoiceLocation = index
			string locationName = GetLocationName(Locations.ChoiceLocationType, index)
			SetMenuOptionValue(option, locationName)
			if OID_ReRandomizeLocation2 > -1
				if Locations.ChoiceLocation > 0
					SetOptionFlags(OID_ReRandomizeLocation2, OPTION_FLAG_DISABLED)
					SetMenuOptionValue(option, "$SU_Loading")
					SU.SelectLocation()
					SetMenuOptionValue(option, "$SU_Done")
					SetTextOptionValue(OID_LocationPreview2, locationName)
					if ShowMessage("$SU_PreviewModeMessage{" + locationName + "}{" + LocationTypeNames[LocationTypeLists.Find(Locations.FinalLocationTypeList)] \
					+ "}{" + HoldNames[HoldLists.Find(Locations.FinalHoldList)] + "}", true, "$SU_Yes", "$SU_No")
						CloseMCM()
					else
						SetMenuOptionValue(option, locationName)
					endif
				else
					SetOptionFlags(OID_ReRandomizeLocation2, OPTION_FLAG_NONE)
				endif
			endif

		endif

	elseif (CurrentPage == Pages[2])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_OneHanded)
			Inventory.ChoiceOneHanded = index
			if index == 0
				SetMenuOptionValue(option, "")
				SetOptionFlags(OID_OneHandedCombination, OPTION_FLAG_DISABLED)
				SetMenuOptionValue(OID_OneHandedCombination, "")
				Inventory.ChoiceOneHandedCombination = 0
			else
				SetMenuOptionValue(option, OptionsOneHanded[index])
				SetOptionFlags(OID_OneHandedCombination, OPTION_FLAG_NONE)
				if Inventory.ChoiceOneHandedCombination == 0
					SetMenuOptionValue(OID_OneHandedCombination, OptionsOneHandedCombination[0])
				endif
			endif

		elseif (option == OID_OneHandedCombination)
			Inventory.ChoiceOneHandedCombination = index
			SetMenuOptionValue(option, OptionsOneHandedCombination[index])

		elseif (option == OID_TwoHanded)
			Inventory.ChoiceTwoHanded = index
			if index == 0
				SetMenuOptionValue(option, "")
			else
				SetMenuOptionValue(option, OptionsTwoHanded[index])
			endif

		elseif (option == OID_Ranged)
			Inventory.ChoiceRanged = index
			if index == 0
				SetMenuOptionValue(option, "")
			else
				SetMenuOptionValue(option, OptionsRanged[index])
			endif

		elseif (option == OID_Staff)
			Inventory.ChoiceStaff = index
			if index == 0
				SetMenuOptionValue(option, "")
			else
				SetMenuOptionValue(option, OptionsStaff[index])
			endif

		elseif (option == OID_WeaponSet)
			Inventory.ChoiceWeaponSet = index
			SetMenuOptionValue(option, OptionsWeaponSet[index])

		elseif (option == OID_ArmorType)
			if index != Inventory.ChoiceArmorType
				Inventory.ChoiceArmorType = index
				Inventory.ChoiceArmorSet = 0
				SetMenuOptionValue(option, OptionsArmorType[index])
				SetMenuOptionValue(OID_ArmorSet, "$SU_Random")
				SetOptionFlags(OID_ArmorSet, FlagDisabledIf(index == 0 || index == 4))
				SetOptionFlags(OID_Headgear, FlagDisabledIf(index == 4))
				SetOptionFlags(OID_OnlyEntryLevelArmors, FlagDisabledIf(index == 1 || index == 4))
			endif

		elseif (option == OID_ArmorSet)
			Inventory.ChoiceArmorSet = index
			if Inventory.ChoiceArmorType == 1
				SetMenuOptionValue(option, OptionsArmorClothes[index])
			elseif Inventory.ChoiceArmorType == 2
				SetMenuOptionValue(option, OptionsArmorLight[index])
			elseif Inventory.ChoiceArmorType == 3
				SetMenuOptionValue(option, OptionsArmorHeavy[index])
			endif
			SetOptionFlags(OID_OnlyEntryLevelArmors, FlagDisabledIf(index > 0 || Inventory.ChoiceArmorType == 1))

		elseif (option == OID_Headgear)
			Inventory.ChoiceHeadgear = index
			SetMenuOptionValue(option, OptionsHeadgear[index])

		endif

	elseif (CurrentPage == Pages[3])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_SpellsMode)
			if index == Inventory.ChoiceSpellsMode
				return
			endif
			bool resetPage = index == 3 || Inventory.ChoiceSpellsMode == 3 || Inventory.ChoiceSpellSchool1 == 7 || Inventory.ChoiceSpellSchool2 == 7

			SetMenuOptionValue(option, OptionsSpellsMode[index])
			Inventory.ChoiceSpellsMode = index
			Inventory.ChoiceSpellSchool1 = 0
			Inventory.ChoiceSpellSchool2 = 0

			string schoolMenusOptionText = ""
			int schoolMenusFlag = OPTION_FLAG_DISABLED
			if index == 2
				schoolMenusOptionText = OptionsSpellSchool[0]
				schoolMenusFlag = OPTION_FLAG_NONE
			endif
			SetOptionFlags(OID_SpellSchool1, schoolMenusFlag)
			SetOptionFlags(OID_SpellSchool2, schoolMenusFlag)
			SetMenuOptionValue(OID_SpellSchool1, schoolMenusOptionText)
			SetMenuOptionValue(OID_SpellSchool2, schoolMenusOptionText)
			SetOptionFlags(OID_SameSchoolSpellsChance, FlagNoneIf(index == 2 || index == 0))

			if index != 3 && SelectedSpells.GetSize()
				ClearSpells()
			endif
			if resetPage
				ForcePageReset()
			endif

		elseif (option == OID_SpellSchool1 || option == OID_SpellSchool2)
			int oldValue
			int secondValue
			if option == OID_SpellSchool1
				oldValue = Inventory.ChoiceSpellSchool1
				if index == oldValue
					return
				endif
				secondValue = Inventory.ChoiceSpellSchool2
				Inventory.ChoiceSpellSchool1 = index
			else
				oldValue = Inventory.ChoiceSpellSchool2
				if index == oldValue
					return
				endif
				secondValue = Inventory.ChoiceSpellSchool1
				Inventory.ChoiceSpellSchool2 = index
			endif
			SetMenuOptionValue(option, OptionsSpellSchool[index])
			if index != 7 && (SelectedSpells.GetSize() > 1 || (secondValue != 7 && SelectedSpells.GetSize()))
				ClearSpells()
			endif
			if secondValue != 7 && (index == 7 || oldValue == 7)
				ForcePageReset()
			endif
		endif

	elseif (CurrentPage == Pages[4])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_Wealth)
			bool wasNothing = (Inventory.ChoiceWealth == 1)
			Inventory.ChoiceWealth = index
			SetMenuOptionValue(option, OptionsWealth[index])
			bool isNothing = (index == 1)
			int flagItemOptions = FlagDisabledIf(isNothing)
			if isNothing != wasNothing
				SetOptionFlags(OID_CustomGoldToggle, flagItemOptions)
				SetOptionFlags(OID_CustomGoldSlider, FlagIf(flagItemOptions, Inventory.ChoiceGold >= 0))
				SetOptionFlags(OID_Food, flagItemOptions)
				SetOptionFlags(OID_Drinks, flagItemOptions)
			endif
			SetOptionFlags(OID_Potions, FlagIf(flagItemOptions, index != 2))
			if isNothing != wasNothing
				SetOptionFlags(OID_Lockpicks, flagItemOptions)
				SetOptionFlags(OID_Torch, flagItemOptions)
				if SkyrimUnboundLantern.GetNumForms()
					SetOptionFlags(OID_Lantern, flagItemOptions)
				endif
				SetOptionFlags(OID_WoodcuttersAxe, flagItemOptions)
				SetOptionFlags(OID_Pickaxe, flagItemOptions)
				SetOptionFlags(OID_Skooma, flagItemOptions)
				int i = 0
				int numberOfAddonItems = AddonItems.GetSize()
				while i < numberOfAddonItems
					SetOptionFlags(OIDs_AddonItems[i], flagItemOptions)
					i += 1
				endwhile
			endif

		else
			int addonItemOptionIndex = OIDs_AddonItems.Find(option)
			if addonItemOptionIndex > -1
				FormList addonItemList = AddonItems.GetAt(addonItemOptionIndex) as FormList
				string selectedOptionText = "$SU_Disabled"
				if index == 1
					selectedOptionText = "$SU_Random"
				elseif index > 1
					selectedOptionText = StorageUtil.GetStringValue((addonItemList as FormList).GetAt(index - 2), "SkyrimUnbound_Name")
				endif
				SetMenuOptionValue(option, selectedOptionText)
				if index
					StorageUtil.SetIntValue(addonItemList, "SkyrimUnbound_PlayerChoice", index)
				else
					StorageUtil.UnsetIntValue(addonItemList, "SkyrimUnbound_PlayerChoice")
				endif
			endif

		endif
	
	elseif (CurrentPage == Pages[5])

		if (option == OID_IntroTitles)
			SU.SetGlobalSettingInt("intro_titles", index)
			SetMenuOptionValue(option, OptionsIntroTitles[index])
		
		elseif (option == OID_WhiterunThanePrerequisite)
			WhiterunThanePrerequisite.SetValue(index)
			SetMenuOptionValue(option, OptionsWhiterunThanePrerequisite[index])

		elseif (option == OID_UnlockShouts)
			UnlockShouts.SetValue(index)
			SetMenuOptionValue(option, OptionsUnlockShouts[index])

		endif

	endif	
	
endEvent

string function GetLocationNameByForm(Form locationForm, FormList locTypeList)
	if !locationForm || !locTypeList
		return "Error"
	endif
	string[] locationNamesForDefaultLocationType = GetLocationNamesForDefaultLocationType(locTypeList)
	if locationNamesForDefaultLocationType
		int locationIndex = locTypeList.Find(locationForm)
		if locationIndex < 0
			return "Error"
		endif
		return locationNamesForDefaultLocationType[locationIndex + 1]
	else
		return StorageUtil.GetStringValue(locationForm, "SkyrimUnbound_Name", "Error")
	endif
endFunction

Event OnOptionSelect(int option)

	if (CurrentPage == Pages[0])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_BeginAdventure)
			SetTextOptionValue(option, "$SU_Loading")
			SU.UnregisterForAllKeys()
			SU.UnregisterForMenu("Journal Menu")
			if SU.GetStage() == 10
				CloseMCM()
				Utility.Wait(0.1)
				SU.FadeOutBeforeGameStart(false)
				SU.PrepareForStart()
				SU.CompleteSkyrimUnbound()
			elseif SU.GetStage() == 30
				CloseMCM()
				Utility.Wait(0.1)
				SU.FadeOutBeforeGameStart(true)
				SU.CompleteSkyrimUnbound()
			endif

		elseif (option == OID_PreviewMode)
			SetTextOptionValue(option, "$SU_Loading")
			SU.PrepareForStart(true)
			SU.GearWasGivenWithMCMOpen = true
			SetTextOptionValue(option, "$SU_Done")
			if ShowMessage("$SU_PreviewModeMessage{" + GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList) \
			+ "}{" + LocationTypeNames[LocationTypeLists.Find(Locations.FinalLocationTypeList)] \
			+ "}{" + HoldNames[HoldLists.Find(Locations.FinalHoldList)] + "}", true, "$SU_Yes", "$SU_No")
				CloseMCM()
			else
				ForcePageReset()
			endif
			
		elseif (option == OID_ReRandomizeLocation)
			SetTextOptionValue(option, "$SU_Loading")
			SU.SelectLocation()
			string locationName = GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList)
			SetTextOptionValue(option, "$SU_Done")
			SetTextOptionValue(OID_LocationPreview, locationName)
			if ShowMessage("$SU_PreviewModeMessage{" + locationName + "}{" + LocationTypeNames[LocationTypeLists.Find(Locations.FinalLocationTypeList)] \
			+ "}{" + HoldNames[HoldLists.Find(Locations.FinalHoldList)] + "}", true, "$SU_Yes", "$SU_No")
				CloseMCM()
			else
				SetTextOptionValue(option, "$SU_ReRandomizeLocation")
			endif
	
		endif

	elseif (CurrentPage == Pages[1])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif
		
		int location1 = Locations.ChoiceLocationType
		int location2 = Locations.ChoiceLocation

		if (option == OID_LocationPreview2)
			; do nothing

		elseif (option == OID_ReRandomizeLocation2)
			SetTextOptionValue(option, "$SU_Loading")
			SU.SelectLocation()
			string locationName = GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList)
			SetTextOptionValue(option, "$SU_Done")
			SetTextOptionValue(OID_LocationPreview2, locationName)
			if ShowMessage("$SU_PreviewModeMessage{" + locationName + "}{" + LocationTypeNames[LocationTypeLists.Find(Locations.FinalLocationTypeList)] \
			+ "}{" + HoldNames[HoldLists.Find(Locations.FinalHoldList)] + "}", true, "$SU_Yes", "$SU_No")
				CloseMCM()
			else
				SetTextOptionValue(option, "$SU_ReRandomizeLocation")
			endif
	
		elseif (option == OID_RandomLocation)
			if location1
				if !Locations.HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), SelectedLocationTypes.ToArray())
					if ShowMessage("$SU_NoHoldLocationMatches", true, "$SU_ClearHolds")
						ClearHolds()
					else
						return
					endif
				endif

				int PrevMenu = OIDs_LocationTypes[location1 - 1]
				SetMenuOptionValue(PrevMenu, "")
				SetToggleOptionValue(option, true)
				SetOptionFlags(OID_CustomizeLocationRandomization, OPTION_FLAG_NONE)
				if OID_ReRandomizeLocation2 > -1
					SetOptionFlags(OID_ReRandomizeLocation2, OPTION_FLAG_NONE)
				endif
				Locations.ChoiceLocationType = 0
				Locations.ChoiceLocation = 0
			endif

		elseif (option == OID_CustomizeLocationRandomization)
			SetTextOptionValue(option, "$SU_Loading")
			isInCustomizeRandomLocationMode = !isInCustomizeRandomLocationMode
			ForcePageReset()

		elseif (option == OID_SelectAllLocTypes)
			SetTextOptionValue(option, "$SU_Loading")
			int len = OIDs_LocationTypes.Length
			int i = 0
			while i < len
				SetToggleOptionValue(OIDs_LocationTypes[i], true)
				i += 1
			endwhile
			Form[] locTypeListsArray = LocationTypeLists.ToArray()
			i = locTypeListsArray.Length
			FormList nthLocTypeList
			while i > 0
				i -= 1
				nthLocTypeList = locTypeListsArray[i] as FormList
				if nthLocTypeList.GetSize()
					SelectedLocationTypes.AddForm(nthLocTypeList)
				endif
			endwhile
			SetTextOptionValue(option, "$SU_SelectAll")

		elseif (option == OID_DeselectAllLocTypes)
			SetTextOptionValue(option, "$SU_Loading")
			SelectedLocationTypes.Revert()
			int len = OIDs_LocationTypes.Length
			int i = 0
			while i < len
				SetToggleOptionValue(OIDs_LocationTypes[i], false)
				i += 1
			endwhile
			SetTextOptionValue(option, "$SU_DeselectAll")

		elseif (option == OID_SelectAllHolds)
			SetTextOptionValue(option, "$SU_Loading")
			int len = OIDs_Holds.Length
			int i = 0
			while i < len
				SetToggleOptionValue(OIDs_Holds[i], true)
				i += 1
			endwhile
			Form[] holdListsArray = HoldLists.ToArray()
			i = holdListsArray.Length
			FormList nthHoldList
			while i > 0
				i -= 1
				nthHoldList = holdListsArray[i] as FormList
				if nthHoldList.GetSize()
					SelectedHolds.AddForm(nthHoldList)
				endif
			endwhile
			SetTextOptionValue(option, "$SU_SelectAll")

		elseif (option == OID_DeselectAllHolds)
			SetTextOptionValue(option, "$SU_Loading")
			ClearHolds()
			SetTextOptionValue(option, "$SU_DeselectAll")

		elseif (option == OID_AutoBounty)
			if (Locations.ChoiceBounty < 0)
				Locations.ChoiceBounty = 0
			else
				Locations.ChoiceBounty = -1
			endif
			SetToggleOptionValue(option, Locations.ChoiceBounty < 0)
			if Locations.ChoiceBounty >= 0
				SetSliderOptionValue(OID_Bounty, 0, "{0}")
				SetOptionFlags(OID_Bounty, OPTION_FLAG_NONE)
			else
				SetSliderOptionValue(OID_Bounty, 0, "$SU_Auto")
				SetOptionFlags(OID_Bounty, OPTION_FLAG_DISABLED)
			endif

		elseif (option == OID_AlreadyAdventurer)
			Locations.ChoiceAlreadyAdventurer = !Locations.ChoiceAlreadyAdventurer
			SetToggleOptionValue(option, Locations.ChoiceAlreadyAdventurer)

		else
			int holdOptionIndex = OIDs_Holds.Find(option)
			if holdOptionIndex > -1
				FormList holdList = HoldLists.GetAt(holdOptionIndex) as FormList
				if SelectedHolds.HasForm(holdList)
					SelectedHolds.RemoveAddedForm(holdList)
					if SelectedHolds.GetSize() ; if after unchecking this hold there will be no holds selected, don't check
						if !location1
							if !Locations.HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), SelectedLocationTypes.ToArray())
								ShowMessage("$SU_NoHoldLocationMatches", false, "$SU_OK")
								SelectedHolds.AddForm(holdList)
								return
							endif
						elseif !location2
							Form[] locTypeFormLists = new Form[1]
							locTypeFormLists[0] = LocationTypeLists.GetAt(location1 - 1) as FormList
							if !Locations.HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), locTypeFormLists)
								ShowMessage("$SU_NoHoldLocationMatches", false, "$SU_OK")
								SelectedHolds.AddForm(holdList)
								return
							endif
						endif
					endif
					SetToggleOptionValue(option, false)
				else
					if SelectedHolds.GetSize() < 1 ; if already successfully selected some hold, one matching hold is enough, don't check
						if !location1
							Form[] holdFormLists = new Form[1]
							holdFormLists[0] = holdList
							if !Locations.HoldsHaveLocationsOfTypes(holdFormLists, SelectedLocationTypes.ToArray())
								ShowMessage("$SU_NoHoldLocationMatches", false, "$SU_OK")
								return
							endif
						elseif !location2
							Form[] holdFormLists = new Form[1]
							holdFormLists[0] = holdList
							Form[] locTypeFormLists = new Form[1]
							locTypeFormLists[0] = LocationTypeLists.GetAt(location1 - 1) as FormList
							if !Locations.HoldsHaveLocationsOfTypes(holdFormLists, locTypeFormLists)
								ShowMessage("$SU_NoHoldLocationMatches", false, "$SU_OK")
								return
							endif
						endif
					endif
					SetToggleOptionValue(option, true)
					SelectedHolds.AddForm(holdList)
				endif

			elseif isInCustomizeRandomLocationMode
				FormList locTypeList = LocationTypeLists.GetAt(OIDs_LocationTypes.Find(option)) as FormList
				if SelectedLocationTypes.HasForm(locTypeList)
					SelectedLocationTypes.RemoveAddedForm(locTypeList)
					if SelectedLocationTypes.GetSize() ; if already successfully selected some location type, one matching location type is enough, don't check
						if !Locations.HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), SelectedLocationTypes.ToArray())
							if ShowMessage("$SU_NoHoldLocationMatches", true, "$SU_ClearHolds")
								ClearHolds()
							else
								SelectedLocationTypes.AddForm(locTypeList)
								return
							endif
						endif
					endif
					SetToggleOptionValue(option, false)
				else
					if SelectedLocationTypes.GetSize() < 1 ; if already successfully selected some location type, one matching location type is enough, don't check
						Form[] locTypeFormLists = new Form[1]
						locTypeFormLists[0] = locTypeList
						if !Locations.HoldsHaveLocationsOfTypes(SelectedHolds.ToArray(), locTypeFormLists)
							if ShowMessage("$SU_NoHoldLocationMatches", true, "$SU_ClearHolds")
								ClearHolds()
							else
								return
							endif
						endif
					endif
					SetToggleOptionValue(option, true)
					SelectedLocationTypes.AddForm(locTypeList)
				endif

			endif

		endif

	elseif (CurrentPage == Pages[2])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_RandomWeapons)
			Inventory.ChoiceRandomWeapons = !Inventory.ChoiceRandomWeapons
			SetToggleOptionValue(option, Inventory.ChoiceRandomWeapons)
			int flagWeaponOptions = FlagDisabledIf(Inventory.ChoiceRandomWeapons)
			SetOptionFlags(OID_OneHanded, flagWeaponOptions)
			SetOptionFlags(OID_OneHandedCombination, FlagIf(flagWeaponOptions, Inventory.ChoiceOneHanded))
			SetOptionFlags(OID_TwoHanded, flagWeaponOptions)
			SetOptionFlags(OID_Ranged, flagWeaponOptions)
			SetOptionFlags(OID_Staff, flagWeaponOptions)
			if Inventory.ChoiceRandomWeapons
				SetMenuOptionValue(OID_OneHanded, "")
				SetMenuOptionValue(OID_OneHandedCombination, "")
				SetMenuOptionValue(OID_TwoHanded, "")
				SetMenuOptionValue(OID_Ranged, "")
				SetMenuOptionValue(OID_Staff, "")
				Inventory.ChoiceOneHanded = 0
				Inventory.ChoiceOneHandedCombination = 0
				Inventory.ChoiceTwoHanded = 0
				Inventory.ChoiceRanged = 0
				Inventory.ChoiceStaff = 0
			endif

		elseif (option == OID_OnlyEntryLevelArmors)
			Inventory.ChoiceOnlyEntryLevelArmors = !Inventory.ChoiceOnlyEntryLevelArmors
			SetToggleOptionValue(option, Inventory.ChoiceOnlyEntryLevelArmors)

		endif

	elseif (CurrentPage == Pages[3])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_SameSchoolSpellsChance)
			Inventory.ChoiceSameSchoolSpellsChance = !Inventory.ChoiceSameSchoolSpellsChance
			SetToggleOptionValue(option, Inventory.ChoiceSameSchoolSpellsChance)

		else
			Form thisSpell
			int optionIndex = OIDs_SpellsAlteration.Find(option)
			if optionIndex > -1
				thisSpell = Spells_Alteration.GetAt(optionIndex)
			else
				optionIndex = OIDs_SpellsConjuration.Find(option)
				if optionIndex > -1
					thisSpell = Spells_Conjuration.GetAt(optionIndex)
				else
					optionIndex = OIDs_SpellsDestruction.Find(option)
					if optionIndex > -1
						thisSpell = Spells_Destruction.GetAt(optionIndex)
					else
						optionIndex = OIDs_SpellsIllusion.Find(option)
						if optionIndex > -1
							thisSpell = Spells_Illusion.GetAt(optionIndex)
						else
							optionIndex = OIDs_SpellsRestoration.Find(option)
							if optionIndex > -1
								thisSpell = Spells_Restoration.GetAt(optionIndex)
							endif
						endif
					endif
				endif
			endif
			bool newValue = !SelectedSpells.HasForm(thisSpell)
			if newValue
				if Inventory.ChoiceSpellsMode == 2
					int maxSpellsCount
					if Inventory.ChoiceSpellSchool1 == 7
						maxSpellsCount += 1
					endif
					if Inventory.ChoiceSpellSchool2 == 7
						maxSpellsCount += 1
					endif
					if SelectedSpells.GetSize() + 1 > maxSpellsCount
						return
					endif
				endif
				SelectedSpells.AddForm(thisSpell)
			else
				SelectedSpells.RemoveAddedForm(thisSpell)
			endif
			SetToggleOptionValue(option, newValue)

		endif

	elseif (CurrentPage == Pages[4])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_CustomGoldToggle)
			if (Inventory.ChoiceGold < 0)
				Inventory.ChoiceGold = 0
			else
				Inventory.ChoiceGold = -1
			endif
			SetToggleOptionValue(option, Inventory.ChoiceGold >= 0)
			if Inventory.ChoiceGold >= 0
				SetSliderOptionValue(OID_CustomGoldSlider, 0, "{0}")
				SetOptionFlags(OID_CustomGoldSlider, OPTION_FLAG_NONE)
			else
				SetSliderOptionValue(OID_CustomGoldSlider, 0, "$SU_Random")
				SetOptionFlags(OID_CustomGoldSlider, OPTION_FLAG_DISABLED)
			endif

		elseif (option == OID_Food)
			if Inventory.ChoiceFood
				Inventory.ChoiceFood -= 1
			else
				Inventory.ChoiceFood = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceFood])

		elseif (option == OID_Drinks)
			if Inventory.ChoiceDrinks
				Inventory.ChoiceDrinks -= 1
			else
				Inventory.ChoiceDrinks = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceDrinks])

		elseif (option == OID_Potions)
			if Inventory.ChoicePotions
				Inventory.ChoicePotions -= 1
			else
				Inventory.ChoicePotions = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoicePotions])

		elseif (option == OID_Lockpicks)
			if Inventory.ChoiceLockpicks
				Inventory.ChoiceLockpicks -= 1
			else
				Inventory.ChoiceLockpicks = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceLockpicks])

		elseif (option == OID_Torch)
			if Inventory.ChoiceTorch
				Inventory.ChoiceTorch -= 1
			else
				Inventory.ChoiceTorch = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceTorch])

		elseif (option == OID_WoodcuttersAxe)
			if Inventory.ChoiceWoodcuttersAxe
				Inventory.ChoiceWoodcuttersAxe -= 1
			else
				Inventory.ChoiceWoodcuttersAxe = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceWoodcuttersAxe])

		elseif (option == OID_Pickaxe)
			if Inventory.ChoicePickaxe
				Inventory.ChoicePickaxe -= 1
			else
				Inventory.ChoicePickaxe = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoicePickaxe])

		elseif (option == OID_Skooma)
			if Inventory.ChoiceSkooma
				Inventory.ChoiceSkooma -= 1
			else
				Inventory.ChoiceSkooma = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceSkooma])

		elseif (option == OID_Lantern)
			if Inventory.ChoiceLantern
				Inventory.ChoiceLantern -= 1
			else
				Inventory.ChoiceLantern = 2
			endif
			SetTextOptionValue(option, OptionsDisabledEnabledRandom[Inventory.ChoiceLantern])

		else
			int addonItemOptionIndex = OIDs_AddonItems.Find(option)
			if addonItemOptionIndex > -1
				Form item = AddonItems.GetAt(addonItemOptionIndex)
				int playerChoice = StorageUtil.GetIntValue(item, "SkyrimUnbound_PlayerChoice")
				if playerChoice
					playerChoice -= 1
				else
					playerChoice = 2
				endif
				SetTextOptionValue(option, OptionsDisabledEnabledRandom[playerChoice])
				if playerChoice
					StorageUtil.SetIntValue(item, "SkyrimUnbound_PlayerChoice", playerChoice)
				else
					StorageUtil.UnsetIntValue(item, "SkyrimUnbound_PlayerChoice")
				endif
			endif

		endif

	elseif (CurrentPage == Pages[5])

		if (option == OID_DebugMode)
			isDebugModeToggled = !isDebugModeToggled
			SetToggleOptionValue(option, isDebugModeToggled)
			if isDebugModeToggled
				PlayerRef.AddSpell(SkyrimUnboundTeleportPower, false)
			else
				PlayerRef.RemoveSpell(SkyrimUnboundTeleportPower)
			endif
			ForcePageReset()

		elseif (option == OID_ClothesInStartingRoom)
			bool newValue = !SU.GetGlobalSettingInt("clothes_in_starting_room")
			SU.SetGlobalSettingInt("clothes_in_starting_room", newValue as int)
			SetToggleOptionValue(option, newValue)

		elseif (option == OID_Autosave)
			bool newValue = !SU.GetGlobalSettingInt("autosave")
			SU.SetGlobalSettingInt("autosave", newValue as int)
			SetToggleOptionValue(option, newValue)

		elseif (option == OID_MCMOnTop)
			bool newValue = !SU.GetGlobalSettingInt("mcm_on_top")
			SU.SetGlobalSettingInt("mcm_on_top", newValue as int)
			SetToggleOptionValue(option, newValue)

		elseif (option == OID_AutoOpenMCM)
			bool newValue = !SU.GetGlobalSettingInt("auto_open_mcm")
			SU.SetGlobalSettingInt("auto_open_mcm", newValue as int)
			if newValue
				SU.SetGlobalSettingInt("auto_open_presets", 0)
				SetToggleOptionValue(OID_AutoOpenPresets, false)
			endif
			SetToggleOptionValue(option, newValue)
			SetOptionFlags(OID_AutoOpenMCMDelay, FlagNoneIf(newValue))

		elseif (option == OID_AutoOpenPresets)
			bool newValue = !SU.GetGlobalSettingInt("auto_open_presets")
			SU.SetGlobalSettingInt("auto_open_presets", newValue as int)
			if newValue
				SU.SetGlobalSettingInt("auto_open_mcm", 0)
				SetToggleOptionValue(OID_AutoOpenMCM, false)
			endif
			SetToggleOptionValue(option, newValue)
			
		elseif (option == OID_ShowDebugInfo)
			string messageText
			messageText += "Balgruuf relationship rank = " + SU.BalgruufTheGreaterREF.GetRelationshipRank(PlayerRef)
			messageText += "\nFavor253QuestGiverFaction = " + SU.BalgruufTheGreaterREF.IsInFaction(SU.Favor253QuestGiverFaction)
			Faction JobJarlFaction = Game.GetFormFromFile(0x50920, "Skyrim.esm") as Faction
			messageText += "\nJobJarlFaction = " + SU.BalgruufTheGreaterREF.IsInFaction(JobJarlFaction)
			Quest T03PostQuest = Game.GetFormFromFile(0xFE479, "Skyrim.esm") as Quest
			messageText += "\nT03PostQuest stage = " + T03PostQuest.GetStage()
			messageText += "\nT03PostQuest stage 0 done = " + T03PostQuest.GetStageDone(0)
			Quest Favor253 = Game.GetFormFromFile(0xA2C9E, "Skyrim.esm") as Quest
			messageText += "\nFavor253 stage = " + Favor253.GetStage()
			messageText += "\nFavor253 is running = " + Favor253.IsRunning()
			messageText += "\nCurrent cell = " + PlayerRef.GetParentCell()
			ShowMessage(messageText, true, "$SU_OK")

		endif

	endif
	
endEvent

Event OnOptionSliderOpen(int option)

	if (CurrentPage == Pages[0])

		if (option == OID_DelayMinDays)
			SetSliderDialogStartValue(DelayDragonMin.GetValue())
			SetSliderDialogDefaultValue(7.0)
			SetSliderDialogRange(1.0, 365.0)
			SetSliderDialogInterval(1.0)

		elseif (option == OID_DelayMaxDays)
			SetSliderDialogStartValue(DelayDragonMax.GetValue())
			SetSliderDialogDefaultValue(21.0)
			SetSliderDialogRange(1.0, 365.0)
			SetSliderDialogInterval(1.0)

		elseif (option == OID_DelayLevel1)
			SetSliderDialogStartValue(DelayDragonLevel1.GetValue())
			SetSliderDialogDefaultValue(25.0)
			SetSliderDialogRange(2.0, 100.0)
			SetSliderDialogInterval(1.0)

		elseif (option == OID_DelayLevel2)
			SetSliderDialogStartValue(DelayDragonLevel2.GetValue())
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(2.0, 100.0)
			SetSliderDialogInterval(1.0)

		endif

	elseif (CurrentPage == Pages[1])

		if (option == OID_Bounty)
			SetSliderDialogStartValue(Locations.ChoiceBounty)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 15000.0)
			SetSliderDialogInterval(250.0)
		endif

	elseif (CurrentPage == Pages[4])

		if (option == OID_CustomGoldSlider)
			SetSliderDialogStartValue(Inventory.ChoiceGold)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 5000.0)
			SetSliderDialogInterval(50.0)
		endif

	elseif (CurrentPage == Pages[5])

		if (option == OID_BlackScreen)
			SetSliderDialogStartValue(SU.GetGlobalSettingInt("black_screen"))
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 30.0)
			SetSliderDialogInterval(1.0)

		elseif (option == OID_PerkPoints)
			SetSliderDialogStartValue(Abilities.ChoicePerkPoints)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 6.0)
			SetSliderDialogInterval(1.0)

		elseif (option == OID_AutoOpenMCMDelay)
			SetSliderDialogStartValue(SU.GetGlobalSettingInt("auto_open_mcm_delay"))
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 60.0)
			SetSliderDialogInterval(1.0)

		endif

	endif

endEvent

Event OnOptionSliderAccept(int option, float value)

	if (CurrentPage == Pages[0])

		if (option == OID_DelayMinDays || option == OID_DelayMaxDays)
			float delayMin = DelayDragonMin.GetValue()
			float delayMax = DelayDragonMax.GetValue()
			if (option == OID_DelayMinDays)
				if value == delayMin
					return
				endif
				delayMin = value
				if delayMin > delayMax
					delayMax = delayMin
				endif
			elseif (option == OID_DelayMaxDays)
				if value == delayMax
					return
				endif
				delayMax = value
				if delayMax < delayMin
					delayMin = delayMax
				endif
			endif
			DelayDragonMin.SetValue(delayMin)
			DelayDragonMax.SetValue(delayMax)
			SetSliderOptionValue(OID_DelayMinDays, delayMin, "{0}")
			SetSliderOptionValue(OID_DelayMaxDays, delayMax, "{0}")
			if SU.GetStage() >= 100
				Dragons.SetDragons(timedDelayTimesMidgameChange = true)
			endif

		elseif (option == OID_DelayLevel1 || option == OID_DelayLevel2)
			float level1 = DelayDragonLevel1.GetValue()
			float level2 = DelayDragonLevel2.GetValue()
			if (option == OID_DelayLevel1)
				if value == level1
					return
				endif
				level1 = value
				if level1 > level2
					level2 = level1
				endif
			elseif (option == OID_DelayLevel2)
				if value == level2
					return
				endif
				level2 = value
				if level2 < level1
					level1 = level2
				endif
			endif
			DelayDragonLevel1.SetValue(level1)
			DelayDragonLevel2.SetValue(level2)
			SetSliderOptionValue(OID_DelayLevel1, level1, "{0}")
			SetSliderOptionValue(OID_DelayLevel2, level2, "{0}")
			if SU.GetStage() >= 100
				Dragons.SetDragons()
			endif

		endif

	elseif (CurrentPage == Pages[1])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_Bounty)
			Locations.ChoiceBounty = value as int
			SetSliderOptionValue(option, value, "{0}")
		endif

	elseif (CurrentPage == Pages[4])

		if SU.IsRandomizingLocationOrGear
			ShowMessage("$SU_IsRandomizingStuffWarning", false, "$SU_OK")
			return
		endif

		if (option == OID_CustomGoldSlider)
			Inventory.ChoiceGold = value as int
			SetSliderOptionValue(option, value, "{0}")
		endif

	elseif (CurrentPage == Pages[5])

		if (option == OID_BlackScreen)
			SU.SetGlobalSettingInt("black_screen", value as int)
			SetSliderOptionValue(option, value, "{0}")

		elseif (option == OID_PerkPoints)
			Abilities.ChoicePerkPoints = value as int
			SetSliderOptionValue(option, value, "{0}")

		elseif (option == OID_AutoOpenMCMDelay)
			SU.SetGlobalSettingInt("auto_open_mcm_delay", value as int)
			SetSliderOptionValue(option, value, "{0}")

		endif

	endif

endEvent

Event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)

	if conflictName
		conflictName = " (" + conflictName + ")"
	endif
	if conflictControl && !ShowMessage("$SU_HotkeyConflictWarning{" + conflictControl + "}{" + conflictName + "}", true, "$Yes")
        return
    endif	   
    SU.UnregisterForAllKeys()
    if SU.GetStage() == 10 || SU.GetStage() == 30
    	SU.RegisterForKey(keyCode)
    endif
    SU.SetGlobalSettingInt("hotkey", keyCode)
    SetKeyMapOptionValue(option, keyCode)
    
endEvent

Event OnOptionHighlight(int option)

	if (CurrentPage == Pages[0])

		if (option == OID_BeginAdventure)
			SetInfoText("$SU_HelpBeginAdventure")
		elseif (option == OID_PreviewMode)
			SetInfoText("$SU_HelpPreviewMode")
		elseif (option == OID_ReRandomizeLocation)
			SetInfoText("$SU_HelpReRandomizeLocation")
		elseif (option == OID_LocationPreview)
			SetInfoText("$SU_HelpLocationPreview{" + GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList) \
				+ "}{" + LocationTypeNames[LocationTypeLists.Find(Locations.FinalLocationTypeList)] \
				+ "}{" + HoldNames[HoldLists.Find(Locations.FinalHoldList)] + "}")
		elseif (option == OID_LoadPreset)
			SetInfoText("$SU_HelpLoadPreset{" + "Data\\SKSE\\Plugins\\SkyrimUnbound\\Presets" + "}")
		elseif (option == OID_SavePreset)
			SetInfoText("$SU_HelpSavePreset{" + "Data\\SKSE\\Plugins\\SkyrimUnbound\\Presets" + "}")
		elseif (option == OID_Dragonborn)
			SetInfoText("$SU_HelpDragonborn")
		elseif (option == OID_Dragons)
			SetInfoText("$SU_HelpDragons")
		elseif (option == OID_DelayMinDays || option == OID_DelayMaxDays)
			SetInfoText("$SU_HelpDelayMinMax")	
		elseif (option == OID_DelayLevel1)
			SetInfoText("$SU_HelpLevelWalls")
		elseif (option == OID_DelayLevel2)
			SetInfoText("$SU_HelpLevelRandom")
		elseif (option == OID_StandingStone)
			SetInfoText("$SU_HelpStandingStone")
		elseif (option == OID_Disease)
			SetInfoText("$SU_HelpDisease")
		endif

	elseif (CurrentPage == Pages[1])

		if (option == OID_LocationPreview2)
			SetInfoText("$SU_HelpLocationPreview{" + GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList) \
				+ "}{" + LocationTypeNames[LocationTypeLists.Find(Locations.FinalLocationTypeList)] \
				+ "}{" + HoldNames[HoldLists.Find(Locations.FinalHoldList)] + "}")
		elseif (option == OID_ReRandomizeLocation2)
			SetInfoText("$SU_HelpReRandomizeLocation")
		elseif option == OID_RandomLocation
			SetInfoText("$SU_HelpRandomLocation")
		elseif (option == OID_CustomizeLocationRandomization)
			if isInCustomizeRandomLocationMode
				SetInfoText("$SU_HelpCustomizeLocationRandomizationGoBack")
			else
				SetInfoText("$SU_HelpCustomizeLocationRandomization")
			endif
		elseif (option == OID_SelectAllLocTypes)
			SetInfoText("{$SU_HelpSelectAllLocationTypes}\n{$SU_HelpCustomizeLocationRandomizationToggles}")
		elseif (option == OID_DeselectAllLocTypes)
			SetInfoText("{$SU_HelpDeselectAllLocationTypes}\n{$SU_HelpCustomizeLocationRandomizationToggles}")
		elseif (option == OID_SelectAllHolds)
			SetInfoText("{$SU_HelpSelectAllHolds}\n{$SU_HelpHolds}")
		elseif (option == OID_DeselectAllHolds)
			SetInfoText("{$SU_HelpDeselectAllHolds}\n{$SU_HelpHolds}")
		elseif (option == OID_LocalInhabitant)
			SetInfoText("$SU_HelpLocalInhabitant")
		elseif (option == OID_AlreadyAdventurer)
			SetInfoText("$SU_HelpAlreadyAdventurer")
		elseif (option == OID_AutoBounty)
			SetInfoText("$SU_HelpAutoBounty")
		elseif (option == OID_Bounty)
			SetInfoText("$SU_HelpBounty")
		elseif (option == OID_TimeOfDay)
			SetInfoText("$SU_HelpTimeOfDay")
		elseif (option == OID_Season || option == OID_Month)
			SetInfoText("$SU_HelpDate")
		elseif OIDs_Holds.Find(option) != -1
			SetInfoText("$SU_HelpHolds")
		else
			int locationIndex = OIDs_LocationTypes.Find(option)
			if locationIndex > -1
				FormList locTypeList = LocationTypeLists.GetAt(locationIndex) as FormList
				string locTypeDescription = StorageUtil.GetStringValue(locTypeList, "SkyrimUnbound_Description")
				if !locTypeDescription
					if locTypeList == HoldsWithJail
						locTypeDescription = "$SU_HelpLocationJail"
					elseif locTypeList == Markers_FactionHeadquarters
						locTypeDescription = "$SU_HelpLocationFactionHeadquarters"
					elseif locTypeList == Markers_BanditCamps
						locTypeDescription = "$SU_HelpLocationBanditCamp"
					elseif locTypeList == Markers_WarlockLairs
						locTypeDescription = "$SU_HelpLocationWarlockLair"
					elseif locTypeList == Markers_VampireLairs
						locTypeDescription = "$SU_HelpLocationVampireLair"
					endif
				endif
				if locTypeDescription
					SetInfoText(locTypeDescription)
				elseif isInCustomizeRandomLocationMode
					SetInfoText("$SU_HelpCustomizeLocationRandomizationToggles")
				endif
			endif
		endif

	elseif (CurrentPage == Pages[2])

		if (option == OID_ArmorType || option == OID_ArmorSet)
			SetInfoText("$SU_HelpArmor")
		elseif (option == OID_Headgear)
			SetInfoText("$SU_HelpHeadgear")
		elseif (option == OID_RandomWeapons)
			SetInfoText("$SU_HelpRandomWeapons")
		elseif (option == OID_OneHandedCombination)
			SetInfoText("$SU_HelpOneHandedCombination")
		elseif (option == OID_OnlyEntryLevelArmors)
			SetInfoText("$SU_HelpOnlyEntryLevelArmors")
		elseif (option == OID_WeaponSet)
			SetInfoText("$SU_HelpWeaponSet")
		else
			SetInfoText("$SU_HelpWeapons")
		endif

	elseif (CurrentPage == Pages[3])

		if (option == OID_SpellsMode)
			SetInfoText("$SU_HelpSpells")
		elseif (option == OID_SpellSchool1 || option == OID_SpellSchool2)
			SetInfoText("$SU_HelpSelectSchools")
		elseif (option == OID_SameSchoolSpellsChance)
			SetInfoText("$SU_HelpSameSchoolChance")
		endif

	elseif (CurrentPage == Pages[4])

		if (option == OID_Wealth)
			SetInfoText("$SU_HelpWealth")
		elseif (option == OID_CustomGoldToggle)
			SetInfoText("$SU_HelpCustomGoldToggle")
		elseif (option == OID_CustomGoldSlider)
			SetInfoText("$SU_HelpCustomGoldSlider")
		elseif (option == OID_Lantern || (option == OID_Torch && SkyrimUnboundLantern.GetNumForms()))
			SetInfoText("{$SU_HelpToggleItem}\n\n{$SU_HelpLantern}")
		else
			int addonItemIndex = OIDs_AddonItems.Find(option) 
			if addonItemIndex > -1 && AddonItems.GetAt(addonItemIndex) as FormList
				SetInfoText("$SU_HelpSelectItem")
			else
				SetInfoText("$SU_HelpToggleItem")
			endif
		endif

	elseif (CurrentPage == Pages[5])

		if (option == OID_DebugMode)
			SetInfoText("$SU_HelpDebugMode")
		elseif (option == OID_WhiterunThanePrerequisite)
			SetInfoText("$SU_HelpWhiterunThanePrerequisite")
		elseif (option == OID_UnlockShouts)
			SetInfoText("$SU_HelpAutoUnlockShouts")
		elseif (option == OID_PerkPoints)
			SetInfoText("{$SU_HelpAddPerkPoints}")
		elseif (option == OID_Hotkey)
			SetInfoText("{$SU_HelpHotkey}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_BlackScreen)
			SetInfoText("{$SU_HelpBlackScreen}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_IntroTitles)
			SetInfoText("{$SU_HelpIntroTitles}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_ClothesInStartingRoom)
			SetInfoText("{$SU_HelpClothesInStartingRoom}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_Autosave)
			SetInfoText("{$SU_HelpAutosave}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_MCMOnTop)
			SetInfoText("{$SU_HelpMCMOnTop}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_AutoOpenMCM)
			SetInfoText("{$SU_HelpAutoOpenMCM}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_AutoOpenMCMDelay)
			SetInfoText("{$SU_HelpAutoOpenMCMDelay}\n{$SU_HelpGlobalSettings}")
		elseif (option == OID_AutoOpenPresets)
			SetInfoText("{$SU_HelpAutoOpenPresets}\n{$SU_HelpGlobalSettings}")
		endif

	endif
endEvent

function ClearSpells()
	SelectedSpells.Revert()
	int i = OIDs_SpellsAlteration.Length
	while i > 0
		i -= 1
		SetToggleOptionValue(OIDs_SpellsAlteration[i], false)
	endwhile
	i = OIDs_SpellsConjuration.Length
	while i > 0
		i -= 1
		SetToggleOptionValue(OIDs_SpellsConjuration[i], false)
	endwhile
	i = OIDs_SpellsDestruction.Length
	while i > 0
		i -= 1
		SetToggleOptionValue(OIDs_SpellsDestruction[i], false)
	endwhile
	i = OIDs_SpellsIllusion.Length
	while i > 0
		i -= 1
		SetToggleOptionValue(OIDs_SpellsIllusion[i], false)
	endwhile
	i = OIDs_SpellsRestoration.Length
	while i > 0
		i -= 1
		SetToggleOptionValue(OIDs_SpellsRestoration[i], false)
	endwhile
endFunction

function ClearHolds()
	SelectedHolds.Revert()
	int len = OIDs_Holds.Length
	int i = 0
	while i < len
		SetToggleOptionValue(OIDs_Holds[i], false)
		i += 1
	endwhile
endFunction

function DebugSelectLocation()
	if Locations.ChoiceLocationType > 0
		Locations.ChoiceLocation = ((Self as Form) as UILIB_1).ShowList(LocationTypeNames[Locations.ChoiceLocationType - 1], \
			GetLocationNames(Locations.ChoiceLocationType), Locations.ChoiceLocation, Locations.ChoiceLocation)
	endif
endFunction

string[] function GetMonthArray()
	if Locations.ChoiceSeason <= 1
		return OptionsMonthWinter
	elseif Locations.ChoiceSeason == 2
		return OptionsMonthSpring
	elseif Locations.ChoiceSeason == 3
		return OptionsMonthSummer
	elseif Locations.ChoiceSeason == 4
		return OptionsMonthFall
	endif
endFunction

function CloseMCM()
	UI.Invoke("Journal Menu", "_root.QuestJournalFader.Menu_mc.ConfigPanelClose")
	UI.Invoke("Journal Menu", "_root.QuestJournalFader.Menu_mc.CloseMenu")
endFunction

Event OnConfigOpen()
	if !HasPlayerOpenenedMCM
		HasPlayerOpenenedMCM = true
		SU.OnFirstMCMOpen()
		UnregisterForMenu("Journal Menu")
	endif
endEvent

function OpenMCMIfHaventOpenedYet()
	if !HasPlayerOpenenedMCM
		; all code for opening the MCM is taken from Open MCM Hotkey by Meridiano (MeridianoRus)
		RegisterForMenu("Journal Menu")
		UI.InvokeString("HUD Menu", "_global.skse.OpenMenu", "Journal Menu")
		; everything else happens in OnMenuOpen()
	endif
endFunction

Event OnMenuOpen(String menuName)
	if menuName == "Journal Menu"
		UnregisterForMenu(menuName)
		SU.EnableControlsAndStuff()
		if !HasPlayerOpenenedMCM
			string menuRoot = "_root.ConfigPanelFader.configPanel."
			string modList = "contentHolder.modListPanel.modListFader.list."
			; Open MCMs
			UI.Invoke(menuName, "_root.QuestJournalFader.Menu_mc.ConfigPanelOpen")
			; Open the mod
			Utility.WaitMenuMode(0.2)
			int modIndex = -1
			int listIndex = 0
			string listPath = menuRoot + modList + "_entryList."
			int listLength = UI.GetInt(menuName, ListPath + "length")
			while listIndex < listLength
				if UI.GetString(menuName, listPath + listIndex + ".modName") == ModName
					modIndex = listIndex
					listIndex = listLength
				else
					listIndex += 1
				endif
			endwhile
			if modIndex > -1
				int[] selection = new int[2]
				selection[0] = modIndex
				selection[1] = 1
				listPath = menuRoot + modList
				UI.InvokeIntA(menuName, listPath + "doSetSelectedIndex", selection)
				UI.InvokeIntA(menuName, listPath + "onItemPress", selection)
				; Open the page
				Utility.WaitMenuMode(1.0) ;0.3?
				selection[0] = 0 ; page index
				listPath = menuRoot + "contentHolder.modListPanel.subListFader.list."
				UI.InvokeIntA(menuName, listPath + "doSetSelectedIndex", selection)
				UI.InvokeIntA(menuName, listPath + "onItemPress", selection)
			endif
		endif
	endif
endEvent

function SavePreset(string fileName)
	SetMenuOptionValue(OID_SavePreset, "$SU_Saving")
	SU.SavePreset(fileName)
	SetMenuOptionValue(OID_SavePreset, "")
endFunction

function LoadPreset(string fileName)
	SetMenuOptionValue(OID_LoadPreset, "$SU_Loading")
	bool missingContent = !SU.LoadPreset(filename)
	if SU.GetStage() == 30
		if Locations.ChoiceLocation > 0
			SU.SelectLocation()
			SetOptionFlags(OID_ReRandomizeLocation, OPTION_FLAG_DISABLED)
			SetTextOptionValue(OID_LocationPreview, GetLocationNameByForm(Locations.FinalLocation, Locations.FinalLocationTypeList))
		else
			SetOptionFlags(OID_ReRandomizeLocation, OPTION_FLAG_NONE)
		endif
	endif
	if missingContent
		ShowMessage("$SU_PresetMissingContentMessage", false, "$SU_OK")
	endif
	ForcePageReset()
endFunction

int function FlagNoneIf(bool expressionResult)
	if expressionResult
		return OPTION_FLAG_NONE
	else
		return OPTION_FLAG_DISABLED
	endif
endFunction

int function FlagDisabledIf(bool expressionResult)
	if expressionResult
		return OPTION_FLAG_DISABLED
	else
		return OPTION_FLAG_NONE
	endif
endFunction

int function FlagIf(int flagIfTrue, bool expressionResult)
	if expressionResult
		return flagIfTrue
	else
		return OPTION_FLAG_DISABLED
	endif
endFunction
