Scriptname RockTrapActivatorTrigger extends ObjectReference  
{Script for the high triggerbox (the one that sets the area that activates the lever/trap when the activator actor enters it).
Use L_TRAP_TRIGGER collision layer for the triggerbox and set the triggerbox initially disabled}

Actor Property PlayerRef Auto
Keyword Property ActorTypeNPC Auto

ObjectReference Property RefToActivate Auto
{The reference that need to be activated to trigger the trap (the lever or the trap itself)}
Actor Property ActivatorActor Auto
{The actor who and whose allies will activate the trap}
ObjectReference Property VictimTrigger Auto
{The victim triggerbox}


Function OnActorActivatedTrap(Actor akActor)
	;for extension
EndFunction


Event OnTrigger(ObjectReference akActionRef)
	Actor akActor = akActionRef as Actor
	if akActor
		if akActor.IsInCombat() && !akActor.IsDead() && akActor != PlayerRef && akActor.HasKeyword(ActorTypeNPC) && IsActivatorActorOrAlly(akActor)
			RefToActivate.Activate(Self)
			GoToState("Triggered")
			OnActorActivatedTrap(akActor)
		endif
	endif
EndEvent

bool Function IsActivatorActorOrAlly(Actor akActor)
	if akActor == ActivatorActor || ActivatorActor.GetFactionReaction(akActor) >= 2
		return true
	else
		Actor[] ActivatorsCombatAllies = PO3_SKSEFunctions.GetCombatAllies(ActivatorActor)
		return ActivatorsCombatAllies.Length && ActivatorsCombatAllies.Find(akActor) > -1
	endif
EndFunction


State Triggered

	Event OnTrigger(ObjectReference akActionRef)
	EndEvent

	Event OnBeginState()
		(VictimTrigger as RockTrapVictimTrigger).GoToState("Triggered")
		DisableNoWait()
		RegisterForSingleUpdate(10.0)
	EndEvent

	Event OnUpdate()
		DisableNoWait()
	EndEvent

	Event OnEndState()
		(VictimTrigger as RockTrapVictimTrigger).GoToState("")
	EndEvent

EndState

Event OnReset()
	DisableNoWait()
EndEvent
