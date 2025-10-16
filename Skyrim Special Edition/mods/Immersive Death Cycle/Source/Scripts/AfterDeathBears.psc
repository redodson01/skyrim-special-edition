Scriptname AfterDeathBears extends ActiveMagicEffect  
Armor Property BearOutfit Auto
Armor Property Bearoutfit2 Auto
Armor Property BearOutfit3 Auto
Armor Property BearOutfit4 Auto
Armor Property BearOutfit5 Auto
Armor Property BearOutfit6 Auto

Function OnEffectStart(Actor akTarget, Actor akCaster)
Int RandomNum = utility.randomint(1,6)

If RandomNum == 1
aktarget.EquipItem(BearOutfit, true)

elseif RandomNum == 2
aktarget.EquipItem(BearOutfit2, true)

elseif RandomNum == 3
aktarget.EquipItem(BearOutfit3, true)

elseif RandomNum == 4
aktarget.EquipItem(BearOutfit4, true)

elseif RandomNum == 5
aktarget.EquipItem(BearOutfit5, true)

else
aktarget.EquipItem(BearOutfit6, true)
endif
endfunction