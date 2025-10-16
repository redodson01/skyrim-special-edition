Scriptname TauntingPlayer extends ActiveMagicEffect  

Actor property PlayerRef Auto
Idle Property CombatIdleABC Auto
Idle Property voicestart auto
Idle Property voicereleaseweaponout auto 

;Potions;
Potion Property Taunting_PlayerPotion Auto
Potion Property Taunting_PotionMaleHuman Auto
Potion Property Taunting_PotionMaleArgonian Auto
Potion Property Taunting_PotionMaleKhajiit Auto
Potion Property Taunting_PotionMaleOrc Auto
Potion Property Taunting_PotionFemaleOrc Auto
Potion Property Taunting_PotionFemaleKhajiit Auto
Potion Property Taunting_PotionFemaleArgonian Auto
Potion Property Taunting_PotionFemaleElf Auto
Potion Property Taunting_PotionFemaleHuman Auto

;VoiceTypes;
VoiceType Property FemaleEvenToned Auto
VoiceType Property MaleOrc Auto
VoiceType Property FemaleOrc Auto
VoiceType Property MaleKhajiit Auto
VoiceType Property FemaleKhajiit Auto
VoiceType Property MaleArgonian Auto
VoiceType Property FemaleArgonian Auto

globalvariable property taunting_sounds auto
globalvariable property taunt_condexp auto



Function OnEffectStart(Actor akTarget, Actor akCaster)

	If PlayerRef.IsInCombat() == False
		Debug.notification("You must be in combat!")
	elseif PlayerRef.IsWeaponDrawn() == false
		Debug.notification("You must unsheathe your weapon!")
else

	GlobalVariable Temp = Game.GetFormFromFile(0x000801, "IFPVDetector.esl") as GlobalVariable

if Game.GetCameraState() == 0 || Temp.GetValue() == 1 || PlayerRef.GetEquippedItemType(1) == 8  || PlayerRef.GetEquippedItemType(1) == 0 || PlayerRef.GetEquippedItemType(1) == 9

playerref.playidle(voicestart)
utility.wait(0.6)
playerref.playidle(voicereleaseweaponout)

else

	PlayerRef.PlayIdle(CombatIdleABC)
endif

	Potion()

If taunt_condexp.GetValue() == 1
	HumanOuch()
endif
endif
endFunction

Function Potion()
If taunting_sounds.GetValue() == 0
			PlayerRef.EquipItem(Taunting_PlayerPotion, false, true)

elseif PlayerRef.GetActorBase().GetSex() == 0

if PlayerRef.GetVoiceType() == MaleKhajiit
			PlayerRef.EquipItem(Taunting_PotionMaleKhajiit, false, true)

elseif PlayerRef.GetVoiceType() == MaleOrc
			PlayerRef.EquipItem(Taunting_PotionMaleOrc, false, true)

elseif PlayerRef.GetVoiceType() == MaleArgonian
			PlayerRef.EquipItem(Taunting_PotionMaleArgonian, false, true)

else
			PlayerRef.EquipItem(Taunting_PotionMaleHuman, false, true)
	endif

else
		if PlayerRef.GetVoiceType() == FemaleKhajiit
			PlayerRef.EquipItem(Taunting_PotionFemaleKhajiit, false, true)

	elseif PlayerRef.GetVoiceType() == FemaleOrc
			PlayerRef.EquipItem(Taunting_PotionFemaleOrc, false, true)

	elseif PlayerRef.GetVoiceType() == FemaleArgonian
			PlayerRef.EquipItem(Taunting_PotionFemaleArgonian, false, true)

	elseif PlayerRef.GetVoiceType() == FemaleEvenToned			
	PlayerRef.EquipItem(Taunting_PotionFemaleHuman, false, true)

	else
			PlayerRef.EquipItem(Taunting_PotionFemaleElf, false, true)
endif
endif
endfunction

Function HumanOuch()
  int i = 0
  while i < 100
    MfgConsoleFunc.SetPhoneMe(PlayerRef, 10,i)
    i = i + 12
  if (i > 100)
    i = 100
  Endif
    Utility.Wait(0.0001)
  endwhile

  Utility.Wait(0.2)

  while i > 0
    MfgConsoleFunc.SetPhoneMe(PlayerRef, 10,i)
    i = i - 15
    if (i < 0)
      i = 0
    Endif
    Utility.Wait(0.0001)
    endwhile
EndFunction