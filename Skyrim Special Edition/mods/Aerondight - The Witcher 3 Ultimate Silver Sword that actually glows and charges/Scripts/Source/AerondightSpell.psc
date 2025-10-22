Scriptname AerondightSpell extends ActiveMagicEffect
{Scripted magic effect for simulating Casting another spell so it can have different casting types.}

import utility
import Debug

;======================================================================================;
;  PROPERTIES  /
;=============/

Spell property CastSpellName auto
{The name of the new Spell we will cast.}

Spell property CastSpellName1 auto
{The name of the new Spell we will cast.}

Spell property CastSpellName2 auto
{The name of the new Spell we will cast.}

Spell property CastSpellName3 auto
{The name of the new Spell we will cast.}

Bool Property AimAtTargets = false auto
{Do you want to aim at targets.}

GlobalVariable Property LKS_AKUC  Auto  

;======================================================================================;
;  VARIABLES   /
;=============/

Actor CasterRef
Actor TargetRef


;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	CasterRef = Caster
	TargetRef = Target
	if AimAtTargets == True
; 		Debug.Trace("Other Spell Target is: "+ TargetRef)
; 		Debug.Trace("and the Castor is: "+ CasterRef)
		wait(RandomFloat(0,0.8))
		CastSpellName.cast(Caster,TargetRef)
		CastSpellName1.cast(Caster,TargetRef)
	else
		float currentValue = LKS_AKUC.GetValue()
			if currentValue < 50
				CastSpellName.cast(Caster,none)
				CastSpellName1.cast(Caster,none)
			else
				CastSpellName2.cast(Caster,none)
				CastSpellName3.cast(Caster,none)
			endif
	endif
EndEvent

