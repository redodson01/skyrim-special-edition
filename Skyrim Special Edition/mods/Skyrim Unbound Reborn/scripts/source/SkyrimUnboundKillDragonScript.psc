Scriptname SkyrimUnboundKillDragonScript extends Quest 

GlobalVariable Property DragonsFought Auto
Actor Property PlayerRef Auto
Faction Property CurrentFollowerFaction Auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
	Actor dragonKiller = akKiller as Actor
	if (dragonKiller && (dragonKiller == PlayerRef || dragonKiller.IsInFaction(CurrentFollowerFaction) || dragonKiller.IsPlayerTeammate())) || PlayerRef.GetDistance(akVictim) < 3000
		DragonsFought.Mod(1)
	endif
	Stop()
endEvent
