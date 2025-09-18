Scriptname WITavernScript extends Quest Conditional

LocationAlias Property myLocation Auto

Scene Property WITavernGreeting Auto

Scene Property WITavernPlayerSits Auto

Int Property ServerGreeted Auto Hidden Conditional		;used to control behavior of Server aliases asking the player if he wants anything
int Property PlayerSatDown Auto Hidden Conditional		;used to control behavior of Server aliases asking the player if he wants anything

event PlayerSatDown()
	_RegisterForLOS()
endevent

event PlayerGotUp()
	_UnregisterForLOS()
endevent

event PlayerChangedLocation()
	if (!Game.GetPlayer().IsInLocation(myLocation.GetLocation()))
		Stop()
	endif
endevent

event OnGainLOS(Actor a_viewer, ObjectReference a_target)
	GlobalVariable TAIF_Settings_GreetPlayer = Game.GetFormFromFile(0x00000808, "TavernAIFix.esp") as GlobalVariable

	if (TAIF_Settings_GreetPlayer.GetValue() == 0.0 || TAIF_Settings_GreetPlayer.GetValue() == 1.0 && ServerGreeted)
		return
	endif

	Actor innkeeper = (GetAlias(2) as ReferenceAlias).GetActorRef()

	if (a_viewer == innkeeper)
		; start server-innkeeper scene
		WITavernPlayerSits.Start()
	endif

	GreetPlayer()
endevent

function GreetPlayer()
	; start server greeting package
	PlayerSatDown = 1
	ServerGreeted = 0
endfunction

function _RegisterForLOS()
	Actor player = Game.GetPlayer()
	Actor innkeeper = (GetAlias(2) as ReferenceAlias).GetActorRef()
	Actor server1 = (GetAlias(3) as ReferenceAlias).GetActorRef()
	Actor server2 = (GetAlias(4) as ReferenceAlias).GetActorRef()

	if (innkeeper)
		RegisterForSingleLOSGain(innkeeper, player)
	endif

	if (server1)
		RegisterForSingleLOSGain(server1, player)
	endif

	if (server2)
		RegisterForSingleLOSGain(server2, player)
	endif
endfunction

function _UnregisterForLOS()
	Actor player = Game.GetPlayer()
	Actor innkeeper = (GetAlias(2) as ReferenceAlias).GetActorRef()
	Actor server1 = (GetAlias(3) as ReferenceAlias).GetActorRef()
	Actor server2 = (GetAlias(4) as ReferenceAlias).GetActorRef()

	if (innkeeper)
		UnregisterForLOS(innkeeper, player)
	endif

	if (server1)
		UnregisterForLOS(server1, player)
	endif

	if (server2)
		UnregisterForLOS(server2, player)
	endif
endfunction