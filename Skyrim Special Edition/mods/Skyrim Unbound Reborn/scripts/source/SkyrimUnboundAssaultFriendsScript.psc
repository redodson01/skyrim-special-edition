Scriptname SkyrimUnboundAssaultFriendsScript extends Quest  

SkyrimUnboundLocalFactionManager Property LocalFactionManager Auto

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
	LocalFactionManager.PlayerAssaultedFriend(akVictim as Actor)
	Stop()
endEvent

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
	LocalFactionManager.PlayerAssaultedFriend(akVictim as Actor)
	Stop()
endEvent
