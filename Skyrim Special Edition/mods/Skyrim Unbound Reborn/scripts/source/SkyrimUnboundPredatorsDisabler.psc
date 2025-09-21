Scriptname SkyrimUnboundPredatorsDisabler extends ReferenceAlias  

Actor Property PlayerRef Auto
Keyword Property ActorTypeAnimal Auto
Faction Property PredatorFaction Auto
Faction Property TrollFaction Auto
Faction Property SkeeverFaction Auto


function DisableNearbyPredators(ObjectReference TeleportMarker)
	UnregisterForUpdate()
	GetReference().MoveTo(TeleportMarker)
	GetReference().Enable()
endFunction

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor akActor = akActionRef as Actor
	if akActor
		if akActor == PlayerRef
			RegisterForSingleUpdate(5.0)
		elseif akActor.HasKeyword(ActorTypeAnimal) && (akActor.IsInFaction(PredatorFaction) || akActor.IsInFaction(SkeeverFaction) || akActor.IsInFaction(TrollFaction))
			akActionRef.DisableNoWait()
		endif
	endif
endEvent

Event OnUpdate()
	GetReference().Disable()
endEvent
