Scriptname NPCPotion_WeaponAttack extends activemagiceffect  

Globalvariable Property NPCpotion_ChanceGlobal Auto
Globalvariable Property NPCpotion_MaxPotion Auto
Globalvariable Property NPCpotion_DropPotion Auto
Potion Property RestoreHealth01 Auto
Potion Property RestoreHealth02 Auto
Potion Property RestoreHealth03 Auto
Potion Property RestoreHealth04 Auto
Potion Property RestoreHealth05 Auto
Potion Property RestoreHealth06 Auto
Potion Property RestoreStamina01 Auto
Potion Property RestoreStamina02 Auto
Potion Property RestoreStamina03 Auto
Potion Property RestoreStamina04 Auto
Potion Property RestoreStamina05 Auto
Potion Property RestoreStamina06 Auto
Potion Property Invisibility02 Auto
Potion Property NPCPotion_Fear Auto
Spell Property NPCpotions_Spell auto
Actor Property PlayerRef Auto
Actor ThisActor
Topic Property TopicHealth Auto
Int NumOfPotions
Int NPCLevel
string PotionTypeToConsume
string StateToReturn
; Assume PO3 Extender is installed

Event OnEffectStart(Actor Target, Actor Caster)
	ThisActor = Target
	Int ChanceForPotion = RandomInt(1,100)
	NPCLevel = ThisActor.GetLevel()
	If ChanceForPotion < NPCpotion_ChanceGlobal.GetValueInt()
		NumOfPotions = RandomInt(1, NPCpotion_MaxPotion.GetValueInt())
		int TypeofPotion = RandomInt(1, 10)
		; 70% to use health potion, 20% to use stamina, 10% to use flee potion OR do nothing if player level too low
		If TypeofPotion > 3
			PotionTypeToConsume = "Health"
		elseif TypeofPotion > 1
			PotionTypeToConsume = "Stamina"
		elseif NPCLevel < PlayerRef.GetLevel()
			GoToState("HasFleePotion")
		else ; If the player level is lower than NPC, just do nothing as at this point none of the potions would've ever applied anyway
			NumOfPotions = 0
			GoToState("NoPotionsLeft")
		endif
	else
		NumOfPotions = 0
		GoToState("NoPotionsLeft")
	endif
	RegisterForSingleUpdate(RandomInt(1, 4))
EndEvent


Event OnUpdate()
	If PotionTypeToConsume == "Health" && CanConsumePotion() && ThisActor.GetAvPercentage("Health") < 0.5
		ConsumeHealthPotion()
	ElseIf PotionTypeToConsume == "Stamina" && CanConsumePotion() && ThisActor.GetAvPercentage("Stamina") < 0.7
		ConsumeStaminaPotion()
	Endif

	If !CanConsumePotion()
		GoToState("NoPotionsLeft")		
	Endif

	RegisterForSingleUpdate(RandomInt(1, 4))
EndEvent

State HasFleePotion
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("Busy")
		if ThisActor.GetAvPercentage("Health") < 0.15 && CanConsumePotion()
			ThisActor.EquipItem(NPCPotion_Fear)
			ThisActor.EquipItem(Invisibility02)
			NumOfPotions = 0
			GoToState("NoPotionsLeft")
		else
			GoToState("HasFleePotion")
		endif
	EndEvent

	Event OnUpdate()
		; Do nothing
	EndEvent
EndState

State Busy
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		; Do Nothing
	EndEvent
EndState

State NoPotionsLeft
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		; Do Nothing
	EndEvent

	Event OnUpdate()
		; Do Nothing
	EndEvent
EndState

Bool Function CanConsumePotion()
	return NumOfPotions > 0 && !ThisActor.IsDead() && !ThisActor.IsInKillMove()
EndFunction

Int Function RandomInt(Int min, Int max)
	return Utility.RandomInt(min, max)
EndFunction

Function ConsumeHealthPotion()
	If NPCLevel < 10
		ThisActor.EquipItem(RestoreHealth02)
	elseif NPCLevel > 10 && NPCLevel < 20
		ThisActor.EquipItem(RestoreHealth03)
	elseif NPCLevel > 20 && NPCLevel < 30
		ThisActor.EquipItem(RestoreHealth04)
	elseif NPCLevel > 40 && NPCLevel < 50
		ThisActor.EquipItem(RestoreHealth05)
	else
		ThisActor.EquipItem(RestoreHealth06)
	Endif
	NumOfPotions = NumOfPotions - 1

Utility.Wait(1)
ThisActor.Say(TopicHealth)

EndFunction

Function ConsumeStaminaPotion()
	If NPCLevel < 10
		ThisActor.EquipItem(RestoreStamina02)
	elseif NPCLevel > 10 && NPCLevel < 20
		ThisActor.EquipItem(RestoreStamina03)
	elseif NPCLevel > 20 && NPCLevel < 30
		ThisActor.EquipItem(RestoreStamina04)
	elseif NPCLevel > 40 && NPCLevel < 50
		ThisActor.EquipItem(RestoreStamina05)
	else
		ThisActor.EquipItem(RestoreStamina06)
	Endif
	NumOfPotions = NumOfPotions - 1
EndFunction

Event OnDeath(Actor akKiller)
	NumOfPotions = 0
	GoToState("NoPotionsLeft")
	ThisActor.RemoveSpell(NPCpotions_Spell)
	Int PotionDropChance = RandomInt (1, 100)

	If PotionDropChance < NPCpotion_DropPotion.GetValue()
		If PotionTypeToConsume == "Health"
			If NPCLevel < 10
				ThisActor.AddItem(RestoreHealth01)
			elseif NPCLevel > 10 && NPCLevel < 20
				ThisActor.AddItem(RestoreHealth02)
			elseif NPCLevel > 20
				ThisActor.AddItem(RestoreHealth03)
			Endif
		ElseIf PotionTypeToConsume == "Stamina"
			If NPCLevel < 10
				ThisActor.AddItem(RestoreStamina01)
			elseif NPCLevel > 10 && NPCLevel < 20
				ThisActor.AddItem(RestoreStamina02)
			elseif NPCLevel > 20
				ThisActor.AddItem(RestoreStamina03)
			Endif
		Endif
	Endif
EndEvent

Event OnCellDetach()
	ThisActor.RemoveSpell(NPCpotions_Spell)
EndEvent