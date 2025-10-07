Scriptname HealFollowers_GivePerk extends ReferenceAlias  

Perk Property HealFollowers_Perk  Auto  
Actor Property PlayerRef Auto

Event OnInIt()
PlayerRef.AddPerk(HealFollowers_Perk)
EndEvent