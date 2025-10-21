ScriptName RockTrapVictimTrigger extends ObjectReference
{Script for the victim triggerbox (the one that sets the area that triggers the trap when the victim enters it).
Use L_TRAP_TRIGGER collision layer for the triggerbox}

ObjectReference Property ActivatorTrigger Auto 
{The activator actor triggerbox}
Actor Property ActivatorActor Auto
{The actor who and whose allies will prevent the trap from triggering if they're in the victim trigger}


Event OnTriggerEnter(ObjectReference akActionRef)
	Actor akActor = akActionRef as Actor
	if akActor
		if IsActivatorActorOrAlly(akActor)
			StorageUtil.FormListAdd(self, "ActivatorsAlliesInTrigger", akActionRef, false)
		else
			StorageUtil.FormListAdd(self, "VictimsInTrigger", akActionRef, false)
		endif

		UpdateHighTrigger()
	endif
EndEvent

bool Function IsActivatorActorOrAlly(Actor akActor)
	if ActivatorActor.GetFactionReaction(akActor) >= 2 || akActor == ActivatorActor
		return true
	else
		Actor[] ActivatorsCombatAllies = PO3_SKSEFunctions.GetCombatAllies(ActivatorActor)
		return ActivatorsCombatAllies.Length && ActivatorsCombatAllies.Find(akActor) > -1
	endif
EndFunction

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef as Actor
		StorageUtil.FormListRemove(self, "ActivatorsAlliesInTrigger", akActionRef, false)
		StorageUtil.FormListRemove(self, "VictimsInTrigger", akActionRef, false)

		UpdateHighTrigger()
	endif
EndEvent

Function ClearTrigger()
	StorageUtil.FormListClear(self, "VictimsInTrigger")
	StorageUtil.FormListClear(self, "ActivatorsAlliesInTrigger")
EndFunction

Function UpdateHighTrigger()
	if GetTriggerObjectCount() < 1
		ClearTrigger()
	endif
	if StorageUtil.FormListCount(self, "VictimsInTrigger") > 0 && StorageUtil.FormListCount(self, "ActivatorsAlliesInTrigger") < 1
		ActivatorTrigger.EnableNoWait()
	else
		ActivatorTrigger.DisableNoWait()
	endif
EndFunction


State Triggered ; set from RockTrapActivatorScript. not really required, just an optimization

	Event OnBeginState()
		ClearTrigger()
		RegisterForSingleUpdate(10.0)
	EndEvent

	Event OnUpdate()
		ClearTrigger()
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	EndEvent

EndState
