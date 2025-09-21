Scriptname SkyrimUnboundTeleportEffect extends activemagiceffect  

Quest Property SkyrimUnbound Auto
SkyrimUnboundModuleLocations Property SkyrimUnboundLocations Auto
SkyrimUnboundMCMScript Property SkyrimUnboundMCM Auto

Event OnInit()
	if SkyrimUnbound.GetStage() < 100
		return
	endif
	if Input.IsKeyPressed(42) ;LShift
		SkyrimUnboundMCM.DebugSelectLocation()
	endif
	SkyrimUnboundLocations.SelectLocation()
	SkyrimUnboundLocations.TeleportPlayer(true)
endEvent
