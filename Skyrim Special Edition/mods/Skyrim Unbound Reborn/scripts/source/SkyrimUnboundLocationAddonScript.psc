Scriptname SkyrimUnboundLocationAddonScript extends Quest Hidden

function PrepareStart(ObjectReference teleportMarker, string locationTypeParam, string locationParam)
endFunction

function TeleportPlayer(bool dontCompleteStartUntilPrepareStartReturns = false)
	(Game.GetFormFromFile(0xBDFB6B, "Skyrim Unbound.esp") as SkyrimUnboundAddonQuestManager).AllowTeleportationAndWait(dontCompleteStartUntilPrepareStartReturns)
endFunction
