Scriptname HangingDeadAnimalsManagerScript extends ReferenceAlias  

Event OnPlayerLoadGame()
	ModEvent.Send(ModEvent.Create("FHHC_OnPlayerLoadGame"))
endEvent
