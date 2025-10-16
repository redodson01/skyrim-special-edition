Scriptname ReactToInvisibility extends ActiveMagicEffect  

keyword property magicinvisibility auto
Actor Property PlayerRef Auto
Bool property WasPlayerInvisible auto

Quest Property NPCsReactToInvisibility Auto

Function OnEffectStart(Actor akTarget, Actor akCaster)

NPCsReactToInvisibility.Start()

If PlayerRef.HasMagicEffectWithKeyword(magicinvisibility)
WasPlayerInvisible = true
else
WasPlayerInvisible = false
endif

endfunction

Event OnEffectFinish(Actor akTarget, Actor akCaster)

NPCsReactToInvisibility.Stop()

If WasPlayerInvisible == true
NPCsReactToInvisibility.Start()
Utility.Wait(6)
NPCsReactToInvisibility.Stop()
endif

EndEvent
