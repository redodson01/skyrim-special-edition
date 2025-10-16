Scriptname _CTB_BanditDeathMissives extends ReferenceAlias  

int Property Stage = 30 Auto
referencealias property Alias_Head auto
;miscobject property head auto

Event OnDeath(Actor akKiller)
if(GetOwningQuest().GetStage() > 0 && GetOwningQuest().GetStage() < 40)
; Stage > 0 to make sure the head not enable when player do not accept quest 
; Stage < 40 to Exclude Gaint goes away & Dead after follow gurad
	;Debug.Notification("Death,SetStage30")
	Alias_Head.GetReference().Enable()
	self.GetActorReference().Additem(Alias_Head.GetReference())
	GetOwningQuest().SetStage(Stage)
endif	

EndEvent





