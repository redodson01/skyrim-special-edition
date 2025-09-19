Scriptname SSM_JavelinThrowDamage extends activemagiceffect  

float Property SetDamage Auto

perk Property Armsman00 Auto
perk Property Armsman20 Auto
perk Property Armsman40 Auto
perk Property Armsman60 Auto
perk Property Armsman80 Auto
perk Property DeadlyAim Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	if SetDamage < 1
		SetDamage = 1
	endif
	
	float OneHanded = akCaster.GetAV("OneHanded")
	int iBaseDamage = (SetDamage * (1.0 + (OneHanded/100))) as int
	float BaseDamage = 2.5 * iBaseDamage as float
	float Damage = BaseDamage
	
	if akCaster.HasPerk(Armsman80)
		Damage = BaseDamage * 2.0
	elseif akCaster.HasPerk(Armsman60)
		Damage = BaseDamage * 1.8
	elseif akCaster.HasPerk(Armsman40)
		Damage = BaseDamage * 1.6
	elseif akCaster.HasPerk(Armsman20)
		Damage = BaseDamage * 1.4
	elseif akCaster.HasPerk(Armsman00)
		Damage = BaseDamage * 1.2
	endif
	
	if akCaster.isSneaking()
		if !akCaster.isDetectedBy(akTarget)
			if akCaster.HasPerk(DeadlyAim)
				Damage = Damage * 3
				debug.Notification("Sneak attack for 3X damage!")
			else
				Damage = Damage * 2
				debug.Notification("Sneak attack for 2X damage!")
			endif
			Game.AdvanceSkill("Sneak", 2.5)
		endif
	endif
	
	
	If !akTarget.IsDead()
		akTarget.DamageActorValue("Health", Damage)
		Game.AdvanceSkill("OneHanded", 6.3)
	EndIf

EndEvent
