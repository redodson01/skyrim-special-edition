
Scriptname Irisscript extends ObjectReference  

Perk Property IrisPerk2 auto
Perk Property IrisPerk auto

Event OnEquipped(Actor akActor)
    akActor.AddPerk(IrisPerk2)
    akActor.AddPerk(IrisPerk)
EndEvent

Event OnUnEquipped(Actor akActor)
    akActor.RemovePerk(IrisPerk2)
    akActor.RemovePerk(IrisPerk)
EndEvent