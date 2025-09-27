Scriptname hideQuestItemsQuestScript extends Quest  

event onInit()
	refresh()
endEvent

function refresh()
	unregisterForAllMenus()
	registerForMenu("ContainerMenu")
	registerForMenu("GiftMenu")
endFunction

state busy
	event onMenuOpen(string menuName)
		debug.notification("Hide quest items cancelled: busy")
	endEvent
endState

event onMenuOpen(string menuName)
	gotoState("busy")
	setup()
	utility.wait(0.01)
	takedown()
	gotoState("")
endEvent

function setup()
	objectReference containerRef = game.getCurrentCrosshairRef()
	if PO3_SKSEFunctions.IsQuestItem(containerRef) || PO3_SKSEFunctions.IsVIP(containerRef) || hideQuestItemsDisabled.getValueInt() || PO3_SKSEFunctions.getQuestItems(containerRef).Length || hiddenItems
		return
	endIf
	hiddenItems = PO3_SKSEFunctions.getQuestItems(playerRef)
	int n = hiddenItems.Length
	while n
		n -= 1
		Form hiddenItem = hiddenItems[n]
		PO3_SKSEFunctions.SetRecordFlag(hiddenItem, 0x4)
	endWhile
	playerRef.addItem(hideQuestItemsToken, abSilent=true)
	playerRef.removeItem(hideQuestItemsToken, abSilent=true)
endFunction

function takedown()
	if !hiddenItems
		return
	endIf
	int n = hiddenItems.Length
	while n
		n -= 1
		Form hiddenItem = hiddenItems[n]
		PO3_SKSEFunctions.ClearRecordFlag(hiddenItem, 0x4)
	endWhile
	hiddenItems = none
endFunction

form[] hiddenItems
actor property playerRef auto
globalVariable property hideQuestItemsDisabled auto
miscObject property hideQuestItemsToken auto