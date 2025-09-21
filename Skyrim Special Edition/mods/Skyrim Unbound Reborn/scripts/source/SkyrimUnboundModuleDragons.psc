Scriptname SkyrimUnboundModuleDragons extends SkyrimUnboundModule  

int Property ChoiceDragons Auto Hidden

Quest Property SkyrimUnbound Auto

ObjectReference Property DefaultDragonEnableMarker Auto
GlobalVariable Property DragonsReturned Auto
GlobalVariable Property DragonsEnabled Auto
GlobalVariable Property GameDaysPassed Auto

GlobalVariable Property RandomDragons Auto
GlobalVariable Property DelayDragons Auto
GlobalVariable Property DelayDragonTime Auto
GlobalVariable Property DelayDragonMin Auto
GlobalVariable Property DelayDragonMax Auto
GlobalVariable Property DelayDragonLevel Auto
GlobalVariable Property DelayDragonLevel1 Auto
GlobalVariable Property DelayDragonLevel2 Auto
GlobalVariable Property AllDragonsAppeared Auto

int DelayTime1 = -1
int DelayTime2 = -1


function BeforeTeleportation()
	ApplyDragonsOption()
endFunction

function SavePreset(string fileName)
	JsonUtil.SetIntValue(fileName, "Dragons", ChoiceDragons)
	JsonUtil.SetIntValue(fileName, "DelayDragonMin", DelayDragonMin.GetValueInt())
	JsonUtil.SetIntValue(fileName, "DelayDragonMax", DelayDragonMax.GetValueInt())
	JsonUtil.SetIntValue(fileName, "DelayDragonLevel1", DelayDragonLevel1.GetValueInt())
	JsonUtil.SetIntValue(fileName, "DelayDragonLevel2", DelayDragonLevel2.GetValueInt())
endFunction

bool function LoadPreset(string fileName) ; returns false if there is any missing content, otherwise true
	ChoiceDragons = JsonUtil.GetIntValue(fileName, "Dragons")
	DelayDragonMin.SetValue(JsonUtil.GetIntValue(fileName, "DelayDragonMin"))
	DelayDragonMax.SetValue(JsonUtil.GetIntValue(fileName, "DelayDragonMax"))
	DelayDragonLevel1.SetValue(JsonUtil.GetIntValue(fileName, "DelayDragonLevel1"))
	DelayDragonLevel2.SetValue(JsonUtil.GetIntValue(fileName, "DelayDragonLevel2"))
	if SkyrimUnbound.GetStage() >= 100
		ApplyDragonsOption()
	endif
	return true
endFunction

function ApplyDragonsOption()

	if ChoiceDragons == 0
		DragonsEnabled.SetValue(1)
		RandomDragons.SetValue(1)
		DelayDragons.SetValue(1)
	elseif ChoiceDragons == 1
		DragonsEnabled.SetValue(1)
		RandomDragons.SetValue(1)
		DelayDragons.SetValue(2)
	elseif ChoiceDragons == 2
		DragonsEnabled.SetValue(0)
		RandomDragons.SetValue(0)
		DelayDragons.SetValue(0)
	elseif ChoiceDragons == 3
		DragonsEnabled.SetValue(1)
		RandomDragons.SetValue(1)
		DelayDragons.SetValue(0)
	elseif ChoiceDragons == 4
		DragonsEnabled.SetValue(1)
		RandomDragons.SetValue(0)
		DelayDragons.SetValue(0)
	elseif ChoiceDragons == 5
		DragonsEnabled.SetValue(1)
		RandomDragons.SetValue(0)
		DelayDragons.SetValue(1)
	elseif ChoiceDragons == 6
		DragonsEnabled.SetValue(1)
		RandomDragons.SetValue(0)
		DelayDragons.SetValue(2)
	endif

	SetDragons()

endFunction

function SetDragons(bool locationChange = false, bool timedDelayTimesMidgameChange = false)

	int delayDragonsMode = DelayDragons.GetValueInt()

	if delayDragonsMode == 0 ; No Delay
	
		if DragonsEnabled.GetValue()
			DefaultDragonEnableMarker.Enable()
			DragonsReturned.SetValue(RandomDragons.GetValue())
		else
			DefaultDragonEnableMarker.Disable()
			DragonsReturned.SetValue(0)
		endif
		DelayDragonTime.SetValue(0)
		DelayDragonLevel.SetValue(0)

	elseif delayDragonsMode == 1 ; Timed

		DelayDragonLevel.SetValue(0)

		int delayMin = DelayDragonMin.GetValueInt()
		int delayMax = DelayDragonMax.GetValueInt()
		int daysPassed = GameDaysPassed.GetValueInt()

		if DelayTime1 == -1 || timedDelayTimesMidgameChange
			DelayTime1 = Utility.RandomInt(delayMin, delayMax)
			DelayTime2 = -1
		endif
		if daysPassed < DelayTime1 || (locationChange && DefaultDragonEnableMarker.IsDisabled() && PlayerRef.GetCurrentLocation().HasKeywordString("LocTypeDragonLair"))
			DefaultDragonEnableMarker.Disable()
			DragonsReturned.SetValue(0)
			DelayDragonTime.SetValue(DelayTime1)
		else
			DefaultDragonEnableMarker.Enable()
			if !RandomDragons.GetValue()
				DragonsReturned.SetValue(0)
				DelayDragonTime.SetValue(0)
			else
				if DelayTime2 == -1
					DelayTime2 = DelayTime1 + Utility.RandomInt(delayMin, delayMax)
				endif
				if DaysPassed < DelayTime2
					DragonsReturned.SetValue(0)
					DelayDragonTime.SetValue(DelayTime2)
				else
					DragonsReturned.SetValue(1)
					DelayDragonTime.SetValue(0)
				endif
			endif
		endif

	elseif delayDragonsMode == 2 ; Leveled

		DelayDragonTime.SetValue(0)

		int dragonLevel1 = DelayDragonLevel1.GetValueInt()
		int dragonLevel2 = DelayDragonLevel2.GetValueInt()

		if PlayerRef.GetLevel() < dragonLevel1 || (locationChange && DefaultDragonEnableMarker.IsDisabled() && PlayerRef.GetCurrentLocation().HasKeywordString("LocTypeDragonLair"))
			DefaultDragonEnableMarker.Disable()
			DragonsReturned.SetValue(0)
			DelayDragonLevel.SetValue(dragonLevel1)
		else
			DefaultDragonEnableMarker.Enable()
			if !RandomDragons.GetValue()
				DragonsReturned.SetValue(0)
				DelayDragonLevel.SetValue(0)
			elseif PlayerRef.GetLevel() < dragonLevel2
				DragonsReturned.SetValue(0)
				DelayDragonLevel.SetValue(dragonLevel2)
			else
				DragonsReturned.SetValue(1)
				DelayDragonLevel.SetValue(0)
			endif
		endif

	endif

	AllDragonsAppeared.SetValue((DelayDragonTime.GetValueInt() == 0 && DelayDragonLevel.GetValueInt() == 0) as float)

endFunction
