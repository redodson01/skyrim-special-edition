Scriptname IrisSpellscript2 extends ActiveMagicEffect
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

GlobalVariable Property LKS_IREC  Auto  

Bool Property AimAtTargets = false auto
{Do you want to aim at targets.}


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
		CastSpellName1.cast(Caster,TargetRef)
	else
		CastSpellName1.cast(Caster,none)
	endif
EndEvent


Event OnEffectFinish(Actor Target, Actor Caster)
	CasterRef = Caster
	TargetRef = Target
	if AimAtTargets == True
; 		Debug.Trace("Other Spell Target is: "+ TargetRef)
; 		Debug.Trace("and the Castor is: "+ CasterRef)
		wait(RandomFloat(0,0.8))
		CastSpellName.cast(Caster,TargetRef)
		CastSpellName2.cast(Caster,TargetRef)
		CastSpellName3.cast(Caster,TargetRef)
	else
		CastSpellName.cast(Caster,none)
		CastSpellName2.cast(Caster,none)
		float currentValue = LKS_IREC.GetValue()
		if currentValue >=60 
			CastSpellName3.cast(Caster,none)
		endif
	endif
EndEvent


