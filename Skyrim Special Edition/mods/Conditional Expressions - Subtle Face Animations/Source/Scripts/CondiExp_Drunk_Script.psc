Scriptname CondiExp_Drunk_Script extends activemagiceffect  
Actor Property PlayerRef Auto
GlobalVariable Property CondiExp_PlayerIsDrunk Auto
GlobalVariable Property Condiexp_CurrentlyBusy Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
Drunk()
EndEvent

Function Drunk()

int randomhappy
int randomsmile 

Condiexp_CurrentlyBusy.SetValue(1)
PlayerRef.SetExpressionOverride(2,80)

RegisterForSingleUpdateGameTime(0.2)
EndFunction

Event OnUpdateGameTime()
CondiExp_PlayerIsDrunk.SetValue(0)
Condiexp_CurrentlyBusy.SetValue(0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
PlayerRef.ClearExpressionOverride()
EndEvent





