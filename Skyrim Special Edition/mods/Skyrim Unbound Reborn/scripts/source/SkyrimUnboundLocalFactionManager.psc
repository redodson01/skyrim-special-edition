Scriptname SkyrimUnboundLocalFactionManager extends ReferenceAlias  

Actor Property PlayerRef Auto
LocationAlias Property ReservedLocation Auto
GlobalVariable Property TrackAssaults Auto

Faction Property SkyrimUnboundBanditTempFaction Auto
Faction Property SkyrimUnboundBanditLocalFaction Auto
Faction Property SkyrimUnboundWarlockTempFaction Auto
Faction Property SkyrimUnboundWarlockLocalFaction Auto
Faction Property SkyrimUnboundVampireTempFaction Auto
Faction Property SkyrimUnboundVampireLocalFaction Auto

FormList Property BanditCampFactions Auto
FormList Property BanditCampFactionsInteriorOnly Auto
FormList Property WarlockLairFactions Auto
FormList Property WarlockLairFactionsInteriorOnly Auto
FormList Property VampireLairFactions Auto
FormList Property VampireLairFactionsInteriorOnly Auto

Message Property SkyrimUnboundVampireThrallStartMessage Auto

bool PlayerWasInInterior
Location PotentialLocation


function PrepareStartBeforeTeleportation(int iFaction, Form[] additionalFriendFactions, Form[] additionalFriendFactionsInteriorOnly) ;called from SkyrimUnboundQuestScript
	if iFaction == 1
		BanditCampFactions.AddForms(additionalFriendFactions)
		BanditCampFactionsInteriorOnly.AddForms(additionalFriendFactionsInteriorOnly)
		SetTempFactionFriendRelations(SkyrimUnboundBanditTempFaction, BanditCampFactions)
		SetTempFactionFriendRelations(SkyrimUnboundBanditTempFaction, BanditCampFactionsInteriorOnly)
		PlayerRef.AddToFaction(SkyrimUnboundBanditTempFaction)
		PlayerRef.AddToFaction(SkyrimUnboundBanditLocalFaction)
	elseif iFaction == 2
		WarlockLairFactions.AddForms(additionalFriendFactions)
		WarlockLairFactionsInteriorOnly.AddForms(additionalFriendFactionsInteriorOnly)
		SetTempFactionFriendRelations(SkyrimUnboundWarlockTempFaction, WarlockLairFactions)
		SetTempFactionFriendRelations(SkyrimUnboundWarlockTempFaction, WarlockLairFactionsInteriorOnly)
		PlayerRef.AddToFaction(SkyrimUnboundWarlockTempFaction)
		PlayerRef.AddToFaction(SkyrimUnboundWarlockLocalFaction)
	elseif iFaction == 3
		VampireLairFactions.AddForms(additionalFriendFactions)
		VampireLairFactionsInteriorOnly.AddForms(additionalFriendFactionsInteriorOnly)
		SetTempFactionFriendRelations(SkyrimUnboundVampireTempFaction, VampireLairFactions)
		SetTempFactionFriendRelations(SkyrimUnboundVampireTempFaction, VampireLairFactionsInteriorOnly)
		PlayerRef.AddToFaction(SkyrimUnboundVampireTempFaction)
		PlayerRef.AddToFaction(SkyrimUnboundVampireLocalFaction)
	endif
	TrackAssaults.SetValue(1)
endFunction

function SetTempFactionFriendRelations(Faction tempFaction, FormList factionsList)
	int i = factionsList.GetSize()
	while i > 0
		i -= 1
		tempFaction.SetAlly(factionsList.GetAt(i) as Faction, true, true)
	endwhile
endFunction

function PrepareStartAfterTeleportation() ;called from SkyrimUnboundQuestScript
	if PlayerRef.IsInFaction(SkyrimUnboundVampireLocalFaction) && !PlayerRef.HasKeywordString("Vampire")
		Utility.Wait(2.0)
		while Utility.IsInMenuMode()
		endwhile
		SkyrimUnboundVampireThrallStartMessage.Show()
	endif
	GoToState("Preparing")
endFunction

function PlayerAssaultedFriend(Actor akVictim) ;called from SkyrimUnboundAssaultFriendsQuest
	RemovePlayerFromLocalFaction()
endFunction

State Preparing

	Event OnBeginState()
		RegisterForSingleUpdate(0.001)
	endEvent

	Event OnUpdate() 
		ReservedLocation.Clear()
		PotentialLocation = None
		ReserveLocation(PlayerRef)
		GoToState("Detecting")
	endEvent

EndState

State Detecting

	Event OnBeginState()
		ProcessCurrentCell()
	endEvent

	Event OnCellDetach()
		if PlayerWasInInterior
			ProcessCurrentCell()
		endif
	endEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		Actor akActor = akActionRef as Actor
		if akActor
			if akActor == PlayerRef
				RegisterForSingleUpdate(15.0)
			else
				CheckActor(akActor)
			endif
		endif
	endEvent

	Event OnUpdate()
		GoToState("")
		RemovePlayerFromTempFaction()
		if !ReservedLocation.GetLocation() && PotentialLocation
			ReservedLocation.ForceLocationTo(PotentialLocation)
		endif
		if PlayerRef.IsInFaction(SkyrimUnboundVampireLocalFaction)
			if PlayerRef.HasKeywordString("Vampire")
				GoToState("TrackingVampirePlayer")
			else
				GoToState("TrackingThrallPlayer")
			endif
		endif
	endEvent
	
	Event OnEndState()
		UnregisterForUpdate()
		GetReference().Disable()
	endEvent

endState

State TrackingThrallPlayer

	Event OnCellDetach()
		if !IsPlayerInTheVampireLair() ;the lair exterior got detached not because the player entered the lair
			GoToState("")
			RemovePlayerFromLocalFaction()
		endif
	endEvent
	
endState

State TrackingVampirePlayer

	Event OnCellDetach()
		if IsPlayerInTheVampireLair() ;the lair exterior got detached because the player entered the lair
			if !PlayerRef.HasKeywordString("Vampire") ;this mf has cured
				GoToState("")
				RemovePlayerFromLocalFaction()
			endif
		endif
	endEvent
	
endState

bool function IsPlayerInTheVampireLair()
	return PlayerRef.IsInInterior() && PlayerRef.GetCurrentLocation() == ReservedLocation.GetLocation() && ReservedLocation.GetLocation()
endFunction

function RemovePlayerFromLocalFaction()
	TrackAssaults.SetValue(0)
	GoToState("")
	ReservedLocation.Clear()
	RemovePlayerFromTempFaction()
	if PlayerRef.IsInFaction(SkyrimUnboundBanditLocalFaction)
		PlayerRef.RemoveFromFaction(SkyrimUnboundBanditLocalFaction)
	endif
	if PlayerRef.IsInFaction(SkyrimUnboundWarlockLocalFaction)
		PlayerRef.RemoveFromFaction(SkyrimUnboundWarlockLocalFaction)
	endif
	if PlayerRef.IsInFaction(SkyrimUnboundVampireLocalFaction)
		PlayerRef.RemoveFromFaction(SkyrimUnboundVampireLocalFaction)
	endif
endFunction

function RemovePlayerFromTempFaction()
	if PlayerRef.IsInFaction(SkyrimUnboundBanditTempFaction)
		PlayerRef.RemoveFromFaction(SkyrimUnboundBanditTempFaction)
	endif
	if PlayerRef.IsInFaction(SkyrimUnboundWarlockTempFaction)
		PlayerRef.RemoveFromFaction(SkyrimUnboundWarlockTempFaction)
	endif
	if PlayerRef.IsInFaction(SkyrimUnboundVampireTempFaction)
		PlayerRef.RemoveFromFaction(SkyrimUnboundVampireTempFaction)
	endif
endFunction

function ProcessCurrentCell()
	PlayerWasInInterior = PlayerRef.IsInInterior()
	GetReference().MoveTo(PlayerRef)
	if PlayerWasInInterior
		Cell ThisCell = PlayerRef.GetParentCell()
		int iActor = ThisCell.GetNumRefs(43)
		while iActor > 0
			iActor -= 1
			CheckActor(ThisCell.GetNthRef(iActor, 43) as Actor)
		endwhile
	else
		GetReference().Enable()
	endif
endFunction

function CheckActor(Actor akActor)
	if PlayerRef.IsInFaction(SkyrimUnboundBanditLocalFaction)
		if IsActorInAnyFaction(akActor, BanditCampFactions) || (akActor.IsInInterior() && IsActorInAnyFaction(akActor, BanditCampFactionsInteriorOnly))
			akActor.AddToFaction(SkyrimUnboundBanditLocalFaction)
			ReserveLocation(akActor)
		endif
	elseif PlayerRef.IsInFaction(SkyrimUnboundWarlockLocalFaction)
		if IsActorInAnyFaction(akActor, WarlockLairFactions) || (akActor.IsInInterior() && IsActorInAnyFaction(akActor, WarlockLairFactionsInteriorOnly))
			akActor.AddToFaction(SkyrimUnboundWarlockLocalFaction)
			ReserveLocation(akActor)
		endif
	elseif PlayerRef.IsInFaction(SkyrimUnboundVampireLocalFaction)
		if IsActorInAnyFaction(akActor, VampireLairFactions) || (akActor.IsInInterior() && IsActorInAnyFaction(akActor, VampireLairFactionsInteriorOnly))
			akActor.AddToFaction(SkyrimUnboundVampireLocalFaction)
			ReserveLocation(akActor)
		endif
	endif
endFunction

bool function IsActorInAnyFaction(Actor akActor, FormList factionsList)
	int i = factionsList.GetSize()
	while i > 0
		i -= 1
		if akActor.IsInFaction(factionsList.GetAt(i) as Faction)
			return true
		endif
	endwhile
	return false
endFunction

function ReserveLocation(ObjectReference Ref)
	if !ReservedLocation.GetLocation() 
		Location RefLocation = Ref.GetCurrentLocation()
		bool MatchingType = false
		if PlayerRef.IsInFaction(SkyrimUnboundBanditLocalFaction)
			MatchingType = RefLocation.HasKeywordString("LocTypeBanditCamp")
		elseif PlayerRef.IsInFaction(SkyrimUnboundWarlockLocalFaction)
			MatchingType = RefLocation.HasKeywordString("LocTypeWarlockLair")
		elseif PlayerRef.IsInFaction(SkyrimUnboundVampireLocalFaction)
			MatchingType = RefLocation.HasKeywordString("LocTypeVampireLair")
		else
			return
		endif
		if MatchingType
			ReservedLocation.ForceLocationTo(RefLocation)
		elseif !PotentialLocation && RefLocation.HasKeywordString("LocTypeClearable")
			PotentialLocation = RefLocation
		endif
	endif
endFunction
