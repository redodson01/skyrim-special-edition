scriptName AMMCO_NPC_CombatCheck extends ActiveMagicEffect

import ObjectReference

event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetAnimationVariableInt("AMMCO_State", 1)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetAnimationVariableInt("AMMCO_State", 0)
endEvent


