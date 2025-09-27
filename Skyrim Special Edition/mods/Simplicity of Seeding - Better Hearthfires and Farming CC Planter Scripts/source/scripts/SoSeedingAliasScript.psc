Scriptname SoSeedingAliasScript extends ReferenceAlias  

Event OnPlayerLoadGame()
	GoToState("busy")
	UpdateNamesForSoilHearthfires()
	UpdateNamesForSoilBeAFarmer()
	GoToState("")
EndEvent

Event OnInit()
	GoToState("busy")
	UpdateNamesForSoilHearthfires()
	UpdateNamesForSoilBeAFarmer()
	GoToState("")
EndEvent

State busy
	Event OnPlayerLoadGame()
	EndEvent

	Event OnInit()
	EndEvent
EndState

Function UpdateNamesForSoilHearthfires()
	ObjectReference[] akSoilRefs = PO3_SKSEFunctions.FindAllReferencesOfType(PlayerRef, BYOHPlanterSoil, 0)
	int i = akSoilRefs.Length
	While i
		i -=1
		(akSoilRefs[i] as BYOHPlanterSoilScript).UpdateName()
	EndWhile
EndFunction

Function UpdateNamesForSoilBeAFarmer()
	Form akSoil = Game.GetFormFromFile(0x86E, "ccvsvsse004-beafarmer.esl")
	If akSoil
		ObjectReference[] akSoilRefs = PO3_SKSEFunctions.FindAllReferencesOfType(PlayerRef, akSoil, 0)
		int i = akSoilRefs.Length
		While i
			i -=1
			(akSoilRefs[i] as ccVSVSSE004_PlanterSoilScript).UpdateName()
		EndWhile
	EndIf
EndFunction

Actor Property PlayerRef Auto
Activator Property BYOHPlanterSoil Auto