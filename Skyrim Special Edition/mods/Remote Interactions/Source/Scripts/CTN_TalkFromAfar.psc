Scriptname CTN_TalkFromAfar extends ActiveMagicEffect  

Actor Property PlayerRef Auto
ReferenceAlias Property ChosenNPC Auto

Function OnEffectStart(Actor akTarget, Actor akCaster)
ChosenNPC.GetActorReference().Activate(PlayerRef, true)
EndFunction