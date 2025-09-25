Scriptname AfterDeathFalmerEffect extends ActiveMagicEffect  


;;Male Undead Models
Armor Property SkinFalmer_Undead1 Auto
Armor Property SkinFalmer_Undead2 Auto
Armor Property SkinFalmer_Undead3 Auto
Armor Property SkinFalmer_Undead4 Auto
Armor Property SkinFalmer_Undead5 Auto

;;Male Undead Armors
Armor Property SkinFalmer_Armor0 Auto
Armor Property SkinFalmer_Armor1 Auto
Armor Property SkinFalmer_Armor2 Auto
Armor Property SkinFalmer_Armor3 Auto
Armor Property SkinFalmer_Armor4 Auto
Armor Property SkinFalmer_Armor5 Auto
Armor Property SkinFalmer_Armor6 Auto

;;Vanilla Male Armors
Armor Property SkinFalmer01 Auto
Armor Property SkinFalmer02 Auto
Armor Property SkinFalmer03 Auto
Armor Property SkinFalmer04 Auto
Armor Property SkinFalmer05 Auto
Armor Property SkinFalmer06 Auto

;;Female Armors
Armor Property SkinFalmerFemale_Armor0 Auto
Armor Property SkinFalmerFemale_Armor1 Auto

;;Female Undead Armors
Armor Property SkinFalmerFemale_Undead1 Auto
Armor Property SkinFalmerFemale_Undead2 Auto

;;Vanilla Female Armors
Armor Property DLC1SkinFalmerFemale Auto
Armor Property DLC1SkinFalmerFemale01 Auto



Function OnEffectStart(Actor akTarget, Actor akCaster)
Int RandomNum = utility.randomint(1,5)

If AkTarget.GetLeveledActorBase().GetSex() == 1
	If RandomNum > 2
			aktarget.EquipItem(SkinFalmerFemale_Undead1, true)
	else
			aktarget.EquipItem(SkinFalmerFemale_Undead2, true)
	endif

If akTarget.GetLeveledActorBase().GetSkin()  == DLC1SkinFalmerFemale
			aktarget.EquipItem(SkinFalmerFemale_Armor0, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == DLC1SkinFalmerFemale01
				aktarget.EquipItem(SkinFalmerFemale_Armor1, true)
Endif


else

If RandomNum == 1
aktarget.EquipItem(SkinFalmer_Undead1, true)

elseif RandomNum == 2
aktarget.EquipItem(SkinFalmer_Undead2, true)

elseif RandomNum == 3
aktarget.EquipItem(SkinFalmer_Undead3, true)

elseif RandomNum == 4
aktarget.EquipItem(SkinFalmer_Undead4, true)

else
aktarget.EquipItem(SkinFalmer_Undead5, true)

endif

If akTarget.GetLeveledActorBase().GetSkin()  == SkinFalmer01 
akTarget.EquipItem(SkinFalmer_Armor1, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == SkinFalmer02
akTarget.EquipItem(SkinFalmer_Armor2, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == SkinFalmer03
akTarget.EquipItem(SkinFalmer_Armor3, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == SkinFalmer04
akTarget.EquipItem(SkinFalmer_Armor4, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == SkinFalmer05
akTarget.EquipItem(SkinFalmer_Armor5, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == SkinFalmer06
akTarget.EquipItem(SkinFalmer_Armor6, true)

else
akTarget.EquipItem(SkinFalmer_Armor0, true)
endif
endif
endfunction