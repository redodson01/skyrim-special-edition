Scriptname ItsBlanketTime extends referencealias

Actor property PlayerRef Auto

; Leaving this script here to unregister for the "Wait" key for those that have updated mid-playthrough

Event OnControlDown(string control)
If control == "Wait" && UI.IsMenuOpen("Sleep/Wait Menu") && PlayerRef.GetSleepState() == 3 || PlayerRef.GetSitState() == 3 
UnregisterForControl("Wait")
Endif
endevent

