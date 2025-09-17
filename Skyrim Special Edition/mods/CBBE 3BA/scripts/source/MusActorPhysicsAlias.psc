Scriptname MusActorPhysicsAlias extends ReferenceAlias  

Mus3BPhysicsManager property PM auto

Event OnPlayerLoadGame()
	PM.DataManager(1)
	if PM.Version < 4
		PM.Version = 4
	endif	
	PM.InitialArrays()
	PM.InitialPos()
	PM.ApplyActorList()
endEvent
