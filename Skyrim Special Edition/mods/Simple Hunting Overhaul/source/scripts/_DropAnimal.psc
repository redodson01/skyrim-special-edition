Scriptname _DropAnimal extends ObjectReference  

Actor TheDeadAnimal
Actor Property PlayerRef Auto 
ActorBase Property EncAnimal Auto


Event OnLoad()

TheDeadAnimal = PlayerRef.PlaceAtMe(EncAnimal, 1, false, true) as actor
TheDeadAnimal.Kill()
Self.Disable()
Utility.Wait(0.3)
TheDeadAnimal.Enable()
Self.DeleteWhenAble()
EndEvent

