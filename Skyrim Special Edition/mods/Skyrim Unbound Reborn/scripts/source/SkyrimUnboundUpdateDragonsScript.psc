Scriptname SkyrimUnboundUpdateDragonsScript extends Quest  

SkyrimUnboundModuleDragons Property SkyrimUnboundDragons Auto

;this condition is set on the quest node and is true when this runs
;(DelayDragonTime > 0 && DaysPassed >= DelayDragonTime) || (DelayDragonLevel > 0 && PlayerRef.GetLevel() >= DelayDragonLevel)
;i.e. this only runs when timed or leveled delay is used and it's time to enable some dragons

Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	SkyrimUnboundDragons.SetDragons(locationChange = true)
	Stop()
endEvent
