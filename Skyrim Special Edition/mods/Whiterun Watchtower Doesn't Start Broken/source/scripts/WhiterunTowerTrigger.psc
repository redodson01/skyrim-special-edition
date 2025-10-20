Scriptname WhiterunTowerTrigger extends ObjectReference  
Quest Property MQ104 Auto
ObjectReference Property EnableFortDestruction  Auto  
ObjectReference Property DisableFortNiceThings  Auto  
bool Alreadydestroyed = false
 
Event OnTriggerEnter(ObjectReference akTriggerRef)

Int Stage = MQ104.GetStage()

	if akTriggerRef == Game.GetPlayer() && Stage > 11 && Alreadydestroyed == false
EnableFortDestruction.Enable()
DisableFortNiceThings.Disable()
Alreadydestroyed = true
	endif
EndEvent


