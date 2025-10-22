Scriptname Aerondightscript extends ObjectReference  

Perk Property AerondightPerk2 auto
Perk Property AerondightPerk auto

Event OnEquipped(Actor akActor)
	akActor.AddPerk(AerondightPerk2)
	akActor.AddPerk(AerondightPerk)
EndEvent

Event OnUnEquipped(Actor akActor)
	akActor.RemovePerk(AerondightPerk2)
	akActor.RemovePerk(AerondightPerk)
EndEvent
