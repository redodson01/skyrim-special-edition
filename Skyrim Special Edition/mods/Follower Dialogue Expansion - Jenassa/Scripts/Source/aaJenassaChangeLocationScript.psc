Scriptname aaJenassaChangeLocationScript extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
if akNewLoc == RefugeesRestLocation
	GetOwningQuest().SetStage(2)
endif
EndEvent

Location Property RefugeesRestLocation  Auto  
