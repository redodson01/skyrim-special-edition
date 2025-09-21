Scriptname randomQuestMasterScript extends Quest Conditional

Function GiveReward(Actor giver, Quest q)
	Actor player = Game.GetPlayer()
	int questMultiplier = 1
	If q == randomQuestDungeon || q == randomQuestRescue
		questMultiplier *= 2
	EndIf
	If !giver.WornHasKeyword(ClothingPoor)
		questMultiplier *= 2
	EndIf
	If giver.IsChild()
		player.AddItem(LitemJunk, questMultiplier)
	ElseIf giver.IsInFaction(FavorJobsBeggarsFaction)
		FavorJobsBeggarsAbility.cast(player, player)
		player.AddItem(LitemJunk, questMultiplier)
	Else
		questMultiplier *= randomQuestGoldRewardMultiplier.GetValueInt()
		player.AddItem(randomQuestLvlReward, questMultiplier)
	EndIf
EndFunction

Function ImproveRelationship(Actor npc)
	If !randomQuestDispositionEnabled.GetValueInt()
		Return
	EndIf
	Actor player = Game.GetPlayer()
	int newRank = npc.GetRelationshipRank(player) + 1
	If newRank > 4
		newRank = 4
	EndIf
	bool allowMarriage = newRank >= 4
	bool allowFollower = npc.GetAV("Assistance") + newRank >= 4

	If allowFollower && randomQuestFollowerEnabled.GetValueInt()
		If randomQuestFollowerMinConfidence.GetValueInt() <= npc.GetAV("Confidence")
			npc.AddToFaction(PotentialFollowerFaction)
		EndIf
	EndIf
	If allowMarriage && randomQuestMarriageEnabled.GetValueInt()
		If randomQuestMarriageIgnore.GetValueInt() || !HasLover(npc)
			npc.AddToFaction(PotentialMarriageFaction)
		EndIf
	EndIf

	npc.SetRelationshipRank(player, newRank)
	npc.SetFactionRank(randomQuestDispositionFaction, newRank)
EndFunction

bool Function HasLover(Actor npc)
	lover1Alias.ForceRefTo(npc)
	randomQuestFindLover.Start()
	bool result = lover2Alias.GetRef() != none
	randomQuestFindLover.Stop()
	Return result
EndFunction

Function SetUp(Actor akActor)
	questsReady = false
	randomQuestHasQuestSpell.Cast(akActor, akActor)
	npcAlias.ForceRefTo(akActor)
	randomQuestDungeon.Reset()
	randomQuestDelivery.Reset()
	randomQuestGather.Reset()
	randomQuestTemper.Reset()
	randomQuestShopping.Reset()
	randomQuestShipment.Reset()
	randomQuestRescue.Reset()
	randomQuestDungeonStarted = randomQuestEnabledDungeon.GetValueInt() && randomQuestDungeon.Start()
	randomQuestGatherStarted = randomQuestEnabledGather.GetValueInt() && randomQuestGather.Start()
	randomQuestDeliveryStarted = randomQuestEnabledDelivery.GetValueInt() && randomQuestDelivery.Start()
	randomQuestTemperStarted = randomQuestEnabledTemper.GetValueInt() && randomQuestTemper.Start()
	randomQuestShoppingStarted = randomQuestEnabledShopping.GetValueInt() && randomQuestShopping.Start()
	randomQuestShipmentStarted = randomQuestEnabledShipment.GetValueInt() && randomQuestShipment.Start()
	randomQuestRescueStarted = randomQuestEnabledRescue.GetValueInt() && randomQuestRescue.Start()
	questsReady = true
	While UI.IsMenuOpen("Dialogue Menu")
		Utility.WaitMenuMode(1)
	EndWhile
	CleanUp()
EndFunction

Function SetDelay(Actor akActor)
	randomQuestDelaySpell.Cast(akActor, akActor)
EndFunction

Function CleanUp()
	If randomQuestDungeon.GetStage() != 10
		randomQuestDungeon.Stop()
		randomQuestDungeon.Reset()
	EndIf
	If randomQuestDelivery.GetStage() != 10
		randomQuestDelivery.Stop()
		randomQuestDelivery.Reset()
	EndIf
	If randomQuestGather.GetStage() != 10
		randomQuestGather.Stop()
		randomQuestGather.Reset()
	EndIf
	If randomQuestTemper.GetStage() != 10
		randomQuestTemper.Stop()
		randomQuestTemper.Reset()
	EndIf
	If randomQuestShopping.GetStage() != 10
		randomQuestShopping.Stop()
		randomQuestShopping.Reset()
	EndIf
	If randomQuestShipment.GetStage() != 10
		randomQuestShipment.Stop()
		randomQuestShipment.Reset()
	EndIf
	If randomQuestRescue.GetStage() != 10
		randomQuestRescue.Stop()
		randomQuestRescue.Reset()
	EndIf
EndFunction

Function FixDisposition(actor npc)
	Actor player = Game.GetPlayer()
	int currentDisposition = npc.GetRelationshipRank(player)
	int probableDisposition = npc.GetFactionRank(randomQuestDispositionFaction)
	If currentDisposition > 0 && probableDisposition > 0 && probableDisposition > currentDisposition
		npc.SetRelationshipRank(player, probableDisposition)
	EndIf
EndFunction

Faction Property PotentialMarriageFaction Auto
Faction Property PotentialFollowerFaction Auto

GlobalVariable Property randomQuestDispositionEnabled Auto
GlobalVariable Property randomQuestMarriageEnabled Auto
GlobalVariable Property randomQuestFollowerEnabled Auto
GlobalVariable Property randomQuestMarriageIgnore Auto
GlobalVariable Property randomQuestFollowerMinConfidence Auto

Quest Property randomQuestFindLover Auto
ReferenceAlias Property lover1Alias Auto
ReferenceAlias Property lover2Alias Auto

Quest Property randomQuestDungeon Auto
Quest Property randomQuestGather Auto
Quest Property randomQuestDelivery Auto
Quest Property randomQuestTemper Auto
Quest Property randomQuestShopping Auto
Quest Property randomQuestShipment Auto
Quest Property randomQuestRescue Auto

GlobalVariable Property randomQuestEnabledDungeon Auto
GlobalVariable Property randomQuestEnabledGather Auto
GlobalVariable Property randomQuestEnabledDelivery Auto
GlobalVariable Property randomQuestEnabledTemper Auto
GlobalVariable Property randomQuestEnabledShopping Auto
GlobalVariable Property randomQuestEnabledShipment Auto
GlobalVariable Property randomQuestEnabledRescue Auto

bool randomQuestDungeonStarted Conditional
bool randomQuestGatherStarted Conditional
bool randomQuestDeliveryStarted Conditional
bool randomQuestTemperStarted Conditional
bool randomQuestShoppingStarted Conditional
bool randomQuestShipmentStarted Conditional
bool randomQuestRescueStarted Conditional
bool questsReady Conditional

LeveledItem Property randomQuestLvlReward Auto

LeveledItem Property LitemJunk Auto
Keyword Property ClothingPoor Auto
Spell Property FavorJobsBeggarsAbility Auto
Faction Property FavorJobsBeggarsFaction Auto

Spell Property randomQuestDelaySpell Auto
Spell Property randomQuestHasQuestSpell Auto
MagicEffect Property randomQuestDelayMGEF Auto
MagicEffect Property randomQuestHasQuestMGEF Auto

ReferenceAlias Property npcAlias Auto

GlobalVariable Property randomQuestGoldRewardMultiplier Auto

Keyword Property ArmorCuirass Auto

Faction Property randomQuestDispositionFaction Auto