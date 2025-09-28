ScriptName PoisonWeaponNative

Potion Function WornObjectGetPoison(Actor akActor, int aiHandSlot, int aiSlotMask)										global
	return WornObject.GetPoison(akActor, aiHandSlot, aiSlotMask)
endFunction

int Function GetPoisonWeaponCharges(Actor akActor, bool isLeftHand) 	global native

int Function PoisonActorWeapon(Actor akActor, bool isLeftHand, Potion akPoison, int aiCharges = 1) 	global native