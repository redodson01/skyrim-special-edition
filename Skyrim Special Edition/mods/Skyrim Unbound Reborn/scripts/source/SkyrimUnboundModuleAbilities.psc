Scriptname SkyrimUnboundModuleAbilities extends SkyrimUnboundModule  

int Property ChoiceDragonborn Auto Hidden
int Property ChoiceStandingStone Auto Hidden
int Property ChoiceDisease Auto Hidden
int Property ChoicePerkPoints Auto Hidden

Quest Property SkyrimUnbound Auto

GlobalVariable Property DragonSoulsEnabled Auto
GlobalVariable Property WordWallsEnabled Auto
GlobalVariable Property UnlockShouts Auto
FormList Property RefsToEnableForNonDragonborn Auto

PlayerVampireQuestScript Property PlayerVampireQuest Auto
Spell Property WerewolfChange Auto
Spell Property WerewolfImmunity Auto
CompanionsHouseKeepingScript Property C00 Auto

Spell Property pDoomApprenticeAbility Auto
Spell Property pdoomApprenticeNegativeAbility Auto
Spell Property pDoomAtronachAbility Auto
Spell Property pDoomLadyAbility Auto
Spell Property pDoomLordAbility Auto
Spell Property pDoomLoverAbility Auto
Spell Property pDoomMageAbility Auto
Spell Property pDoomRitualAbility Auto
Perk Property pDoomRitualPerk Auto
Spell Property pDoomSerpentAbility Auto
Spell Property pDoomShadowAbility Auto
Spell Property pDoomSteedAbility Auto
Spell Property pDoomThiefAbility Auto
Spell Property pDoomTowerAbility Auto
Spell Property pDoomWarriorAbility Auto


function BeforeTeleportation()
	SetStandingStone()

	if ChoicePerkPoints
		Game.AddPerkPoints(ChoicePerkPoints)
	endif

	ApplyDragonbornOptions()
endFunction

function AfterTeleportation()
	if ChoiceDisease == 1
		PlayerVampireQuest.VampireChange(PlayerRef)
	elseif ChoiceDisease == 2
		C00.PlayerOriginalRace = PlayerRef.GetRace()
		PlayerRef.AddSpell(WerewolfChange, false)
		PlayerRef.AddSpell(WerewolfImmunity, false)
		C00.PlayerIsWerewolf.SetValue(1)
		C00.PlayerHasBeastBlood = true
		PlayerRef.SendLycanthropyStateChanged(true)
	endif
endFunction

function SavePreset(string fileName)
	JsonUtil.SetIntValue(fileName, "Dragonborn", ChoiceDragonborn)
	JsonUtil.SetIntValue(fileName, "AutoUnlockShouts", UnlockShouts.GetValueInt())
	JsonUtil.SetIntValue(fileName, "StandingStone", ChoiceStandingStone)
	JsonUtil.SetIntValue(fileName, "Disease", ChoiceDisease)
	JsonUtil.SetIntValue(fileName, "AddPerkPoints", ChoicePerkPoints)
endFunction

bool function LoadPreset(string fileName)
	ChoiceDragonborn = JsonUtil.GetIntValue(fileName, "Dragonborn")
	UnlockShouts.SetValue(JsonUtil.GetIntValue(fileName, "AutoUnlockShouts"))
	ChoiceStandingStone = JsonUtil.GetIntValue(fileName, "StandingStone")
	ChoiceDisease = JsonUtil.GetIntValue(fileName, "Disease")
	ChoicePerkPoints = JsonUtil.GetIntValue(fileName, "AddPerkPoints")
	if SkyrimUnbound.GetStage() >= 100
		SetStandingStone()
		ApplyDragonbornOptions()
	endif
	return true
endFunction

function ApplyDragonbornOptions()

	int dragonborn = ChoiceDragonborn
	if dragonborn == 0
		dragonborn = Utility.RandomInt(0, 1)
	endif
	if dragonborn == 1
		DragonSoulsEnabled.SetValue(1)
		WordWallsEnabled.SetValue(1)
	elseif dragonborn == 2
		DragonSoulsEnabled.SetValue(0)
		WordWallsEnabled.SetValue(0)
	elseif dragonborn == 3
		DragonSoulsEnabled.SetValue(0)
		WordWallsEnabled.SetValue(1)
	endif

	int i = RefsToEnableForNonDragonborn.GetSize()
	while i > 0
		i -= 1
		ObjectReference ref = RefsToEnableForNonDragonborn.GetAt(i) as ObjectReference
		if WordWallsEnabled.GetValue()
			ref.Disable()
		else
			ref.Enable()
		endif
	endwhile

endFunction

bool function AreStandingStonesAllowed()
	return Game.GetModByName("Character Creation Overhaul.esp") == 255 && Game.GetModByName("ClassicClasses.esp") == 255
endFunction

function ClearStandingStone()

	if PlayerRef.HasSpell(pDoomApprenticeAbility)
		PlayerRef.RemoveSpell(pDoomApprenticeAbility)
		PlayerRef.RemoveSpell(pdoomApprenticeNegativeAbility)
	elseif PlayerRef.HasSpell(pDoomAtronachAbility)
		PlayerRef.RemoveSpell(pDoomAtronachAbility)
	elseif PlayerRef.HasSpell(pDoomLadyAbility)
		PlayerRef.RemoveSpell(pDoomLadyAbility)
	elseif PlayerRef.HasSpell(pDoomLordAbility)
		PlayerRef.RemoveSpell(pDoomLordAbility)
	elseif PlayerRef.HasSpell(pDoomLoverAbility)
		PlayerRef.RemoveSpell(pDoomLoverAbility)
	elseif PlayerRef.HasSpell(pDoomMageAbility)
		PlayerRef.RemoveSpell(pDoomMageAbility)
	elseif PlayerRef.HasSpell(pDoomRitualAbility)
		PlayerRef.RemoveSpell(pDoomRitualAbility)
		PlayerRef.RemovePerk(pdoomRitualPerk)
	elseif PlayerRef.HasSpell(pDoomSerpentAbility)
		PlayerRef.RemoveSpell(pDoomSerpentAbility)
	elseif PlayerRef.HasSpell(pDoomShadowAbility)
		PlayerRef.RemoveSpell(pDoomShadowAbility)
	elseif PlayerRef.HasSpell(pDoomSteedAbility)
		PlayerRef.RemoveSpell(pDoomSteedAbility)
	elseif PlayerRef.HasSpell(pDoomThiefAbility)
		PlayerRef.RemoveSpell(pDoomThiefAbility)
	elseif PlayerRef.HasSpell(pDoomTowerAbility)
		PlayerRef.RemoveSpell(pDoomTowerAbility)
	elseif PlayerRef.HasSpell(pDoomWarriorAbility)
		PlayerRef.RemoveSpell(pDoomWarriorAbility)
	endif

endFunction

function SetStandingStone()

	if !AreStandingStonesAllowed()
		return
	endif
	if SkyrimUnbound.GetStage() >= 100
		ClearStandingStone()
	endif

	int standingStone = ChoiceStandingStone
	if !standingStone
		standingStone = Utility.RandomInt(2, 14)
	endif

	if standingStone == 1
		return
	elseif standingStone == 2
		PlayerRef.AddSpell(pDoomApprenticeAbility, false)
		PlayerRef.AddSpell(pdoomApprenticeNegativeAbility, false)
	elseif standingStone == 3
		PlayerRef.AddSpell(pDoomAtronachAbility, false)
	elseif standingStone == 4
		PlayerRef.AddSpell(pDoomLadyAbility, false)
	elseif standingStone == 5
		PlayerRef.AddSpell(pDoomLordAbility, false)
	elseif standingStone == 6
		PlayerRef.AddSpell(pDoomLoverAbility, false)
	elseif standingStone == 7
		PlayerRef.AddSpell(pDoomMageAbility, false)
	elseif standingStone == 8
		PlayerRef.AddSpell(pDoomRitualAbility, false)
		PlayerRef.AddPerk(pdoomRitualPerk)
	elseif standingStone == 9
		PlayerRef.AddSpell(pDoomSerpentAbility, false)
	elseif standingStone == 10
		PlayerRef.AddSpell(pDoomShadowAbility, false)
	elseif standingStone == 11
		PlayerRef.AddSpell(pDoomSteedAbility, false)
	elseif standingStone == 12
		PlayerRef.AddSpell(pDoomThiefAbility, false)
	elseif standingStone == 13
		PlayerRef.AddSpell(pDoomTowerAbility, false)
	elseif standingStone == 14
		PlayerRef.AddSpell(pDoomWarriorAbility, false)
	endif

endFunction


