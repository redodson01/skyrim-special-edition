Scriptname NPCPotion_AssassinPotion extends activemagiceffect  
import PoisonWeaponNative
Globalvariable Property NPCpotion_ChanceGlobal Auto
Globalvariable Property NPCpotion_MaxPotion Auto
Globalvariable Property NPCpotion_DropPotion Auto
MagicEffect Property AlchInvisibillity Auto
Potion Property RestoreHealth01 Auto
Potion Property RestoreHealth02 Auto
Potion Property RestoreHealth03 Auto
Potion Property RestoreHealth04 Auto
Potion Property RestoreHealth05 Auto
Potion Property RestoreHealth06 Auto
Potion Property Invisibility01 Auto
Potion Property Invisibility02 Auto
Potion Property DefaultPoison Auto
Potion Property FrostbiteVenom Auto 
Potion Property DB03Poison Auto
Potion Property Paralyze01 Auto 
Potion Property Paralyze02 Auto 
Potion Property NPCPotion_VenomUse Auto
Spell Property NPCpotions_SpellAssassin auto
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
		int TypeofPotion = RandomInt(1, 8)
		; 50% to use poison, 20% to use Health potion, 30% chance to hidden strike
		If TypeofPotion > 5
			PotionTypeToConsume = "Health"
		elseif TypeofPotion > 3
			PotionTypeToConsume = "Poison"
		else
			PotionTypeToConsume = "HiddenStrike"
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
	ElseIf PotionTypeToConsume == "Poison" && CanConsumePotion() && GetPoisonWeaponCharges(ThisActor, false) <= 0 && !ThisActor.HasMagicEffect(AlchInvisibillity)
		ApplyPoison()
	ElseIf PotionTypeToConsume == "HiddenStrike" && CanConsumePotion() && WornObject.GetPoison(ThisActor, 1, 0) == None
		HiddenStrikeSetup()
		; Switch off Hidden Strike
		int TypeofPotion = RandomInt(1, 10)
		If TypeofPotion > 5
			PotionTypeToConsume = "Health"
		else
			PotionTypeToConsume = "Poison"
		endif
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

Function ApplyPoison()
	If NPCLevel < 10
		PoisonActorWeapon(ThisActor, false, DefaultPoison, 2)
		ThisActor.EquipItem(NPCPotion_VenomUse)
	elseif NPCLevel > 10 && NPCLevel < 20
		PoisonActorWeapon(ThisActor, false, FrostbiteVenom, 2)
		ThisActor.EquipItem(NPCPotion_VenomUse)
	elseif NPCLevel > 20 && NPCLevel < 30
		PoisonActorWeapon(ThisActor, false, DB03Poison, 2)
		ThisActor.EquipItem(NPCPotion_VenomUse)
	elseif NPCLevel > 40 
		PoisonActorWeapon(ThisActor, false, Paralyze01, 1)
		ThisActor.EquipItem(NPCPotion_VenomUse)
	Endif
	NumOfPotions = NumOfPotions - 1
EndFunction

Function HiddenStrikeSetup()
	ThisActor.EquipItem(Invisibility02)
	PoisonActorWeapon(ThisActor, false, Paralyze01, 1)
	NumOfPotions = NumOfPotions - 1
EndFunction

State NoPotionsLeft
	Event OnUpdate()
		; Do Nothing
	EndEvent
EndState

Bool Function CanConsumePotion()
	return NumOfPotions > 0 && !ThisActor.IsDead() && !ThisActor.IsInKillMove() && ThisActor.GetEquippedItemType(1) > 0 && ThisActor.GetEquippedItemType(1) < 8
EndFunction

Int Function RandomInt(Int min, Int max)
	return Utility.RandomInt(min, max)
EndFunction

Event OnDeath(Actor akKiller)
	NumOfPotions = 0
	GoToState("NoPotionsLeft")
	ThisActor.RemoveSpell(NPCpotions_SpellAssassin)
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
		ElseIf PotionTypeToConsume == "Poison"
			If NPCLevel < 10
				ThisActor.AddItem(Invisibility01)
				elseif NPCLevel > 10 && NPCLevel < 20
				ThisActor.AddItem(FrostbiteVenom)
				elseif NPCLevel > 20
				ThisActor.AddItem(Paralyze01)
				Endif
		Endif
	Endif
EndEvent

Event OnCellDetach()
	ThisActor.RemoveSpell(NPCpotions_SpellAssassin)
Endevent