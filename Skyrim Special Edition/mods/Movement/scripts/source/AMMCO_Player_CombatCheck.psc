scriptName AMMCO_Player_CombatCheck extends ActiveMagicEffect

import ObjectReference

event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetAnimationVariableInt("AMMCO_State", 3)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetAnimationVariableInt("AMMCO_State", 2)
endEvent


