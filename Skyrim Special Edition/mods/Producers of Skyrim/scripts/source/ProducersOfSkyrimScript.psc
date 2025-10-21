Scriptname ProducersOfSkyrimScript extends Quest  

Perk Property ProducersDontBuyPerk Auto
Quest Property FreeformRiften17 Auto
GlobalVariable Property RedbellyMineChanceNoneBefore Auto
GlobalVariable Property RedbellyMineChanceNoneAfter Auto


Event OnInit()
	if !PO3_SKSEFunctions.GetPapyrusExtenderVersion()
		Debug.Messagebox("Producers of Skyrim error: powerofthree's Papyrus Extender is not installed or not working.")
	endif
	Game.GetPlayer().AddPerk(ProducersDontBuyPerk)
	if FreeformRiften17.GetStage() >= 200
		OnUpdateGameTime()
	else
		PO3_Events_Form.RegisterForQuest(self, FreeformRiften17)
	endif
endEvent

Event OnQuestStop(Quest akQuest)
	PO3_Events_Form.UnregisterForQuest(self, FreeformRiften17)
	RegisterForSingleUpdateGameTime(168.0) ; 7 days
endEvent

Event OnUpdateGameTime()
	RedbellyMineChanceNoneBefore.SetValue(100)
	RedbellyMineChanceNoneAfter.SetValue(0)
endEvent
