Scriptname ImmersiveHuntingCooking extends ObjectReference  

ImmersiveHuntingFunctions ihFunctions

Event OnActivate(ObjectReference akActionRef)
	ihFunctions = (Game.GetFormFromFile(0x0000800, "ImmersiveHunting.esp") as Quest) as ImmersiveHuntingFunctions
	ihFunctions.CheckWeaponsDrawn()
	ihFunctions.doAnim(6)
	ihFunctions.CheckWeaponsDrawn(False)
EndEvent

