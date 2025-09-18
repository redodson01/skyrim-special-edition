Scriptname RentRoomScript extends Actor  Conditional
{script for anyone who rents a room}

ObjectReference Property Bed  Auto  
{bed to rent}

WIFunctionsScript Property WI Auto
{Pointer to WIFunctionsScript attached to WI quest}

; rent room or clear rental
function RentRoom(DialogueGenericScript pQuestScript)
	Bed.SetActorOwner(Game.GetPlayer().GetActorBase())
	RegisterForSingleUpdateGameTime (pQuestScript.RentHours)
	Game.GetPlayer().RemoveItem(pQuestScript.Gold, pQuestScript.RoomRentalCost.GetValueInt())
	; used to conditionalize innkeeper dialogue
	SetActorValue("Variable09", 1.0)

	ShowPlayerRoom()
endFunction

function ClearRoom()
; 	debug.trace(self + " ClearRoom called on RentRoomScript - room rental expired")
	; clear ownership - either rental expired or I died
	Bed.SetActorOwner((self as Actor).GetActorBase())
	UnregisterForUpdateGameTime()
	; used to conditionalize innkeeper dialogue
	SetActorValue("Variable09", 0.0)
endFunction

; when this is called, reset the ownership on the bed
event OnUpdateGameTime()
	ClearRoom()
endEvent

; if I die, clear the room rental as well, to stop the timer
Event OnDeath(Actor akKiller)
	ClearRoom()
endEvent

function ShowPlayerRoom()
	GlobalVariable TAIF_Settings_ShowRoom = Game.GetFormFromFile(0x00000807, "TavernAIFix.esp") as GlobalVariable
	FormList TAIF_ShowRoomExcludeList = Game.GetFormFromFile(0x00000806, "TavernAIFix.esp") as FormList
	
	if (TAIF_Settings_ShowRoom.GetValue() == 0.0 || TAIF_Settings_ShowRoom.GetValue() == 1.0 && TAIF_ShowRoomExcludeList.HasForm(GetBaseObject()))
		return
	endif

	TAIF_ShowRoomExcludeList.AddForm(GetBaseObject())
	WI.ShowPlayerRoom(self, Bed)	
endfunction