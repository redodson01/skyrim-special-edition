Scriptname NPCpotion_Mages extends activemagiceffect  

Globalvariable Property NPCpotion_ChanceGlobal Auto
Globalvariable Property NPCpotion_MaxPotion Auto
Globalvariable Property NPCpotion_DropPotion Auto
Potion Property RestoreHealth01 Auto
Potion Property RestoreHealth02 Auto
Potion Property RestoreHealth03 Auto
Potion Property RestoreHealth04 Auto
Potion Property RestoreHealth05 Auto
Potion Property RestoreHealth06 Auto
Potion Property RestoreMagicka01 Auto
Potion Property RestoreMagicka02 Auto
Potion Property RestoreMagicka03 Auto
Potion Property RestoreMagicka04 Auto
Potion Property RestoreMagicka05 Auto
Potion Property RestoreMagicka06 Auto
Spell Property NPCpotions_SpellMage Auto
Actor Property PlayerRef Auto
Actor ThisActor
Int NumOfPotions
Int NPCLevel
string PotionTypeToConsume
Topic Property TopicHealth Auto

Event OnEffectStart(Actor Target, Actor Caster)
	ThisActor = Target
	Int ChanceForPotion = RandomInt(1,100)
	NPCLevel = ThisActor.GetLevel()
	If ChanceForPotion < NPCpotion_ChanceGlobal.GetValueInt()
		NumOfPotions = RandomInt(1, NPCpotion_MaxPotion.GetValueInt())
		int TypeofPotion = RandomInt(1, 10)
		; 40% to use health potion, 60% to use Magicka
		If TypeofPotion > 6
			PotionTypeToConsume = "Health"
		elseif TypeofPotion < 7
			PotionTypeToConsume = "Magicka"
		endif
	else
		NumOfPotions = 0
		GoToState("NoPotionsLeft")
	endif
	RegisterForSingleUpdate(RandomInt(1,4))
EndEvent


Event OnUpdate()
	If PotionTypeToConsume == "Health" && CanConsumePotion() && ThisActor.GetAvPercentage("Health") < 0.5
		ConsumeHealthPotion()
	ElseIf PotionTypeToConsume == "Magicka" && CanConsumePotion() && ThisActor.GetAvPercentage("Magicka") < 0.7
		ConsumeMagickaPotion()
	Endif

	If !CanConsumePotion()
		GoToState("NoPotionsLeft")
	Endif
	RegisterForSingleUpdate(RandomInt(1,4))
EndEvent

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

Function ConsumeMagickaPotion()
	If NPCLevel < 10
		ThisActor.EquipItem(RestoreMagicka02)
	elseif NPCLevel > 10 && NPCLevel < 20
		ThisActor.EquipItem(RestoreMagicka03)
	elseif NPCLevel > 20 && NPCLevel < 30
		ThisActor.EquipItem(RestoreMagicka04)
	elseif NPCLevel > 40 && NPCLevel < 50
		ThisActor.EquipItem(RestoreMagicka05)
	else
		ThisActor.EquipItem(RestoreMagicka06)
	Endif
	NumOfPotions = NumOfPotions - 1
EndFunction

State NoPotionsLeft
	Event OnUpdate()
		; Do Nothing
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		; Do Nothing
	EndEvent
EndState

Bool Function CanConsumePotion()
	return NumOfPotions > 0 && !ThisActor.IsDead() && !ThisActor.IsInKillMove()
EndFunction

Int Function RandomInt(Int min, Int max)
	return Utility.RandomInt(min, max)
EndFunction

Event OnDeath(Actor akKiller)
	NumOfPotions = 0
	GoToState("NoPotionsLeft")
	ThisActor.RemoveSpell(NPCpotions_SpellMage)
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
		ElseIf PotionTypeToConsume == "Magicka"
			If NPCLevel < 10
				ThisActor.AddItem(RestoreMagicka01)
			elseif NPCLevel > 10 && NPCLevel < 20
				ThisActor.AddItem(RestoreMagicka02)
			elseif NPCLevel > 20
				ThisActor.AddItem(RestoreMagicka03)
			Endif
		Endif
	Endif
EndEvent

Event OnCellDetach()
	ThisActor.RemoveSpell(NPCpotions_SpellMage)
EndEvent