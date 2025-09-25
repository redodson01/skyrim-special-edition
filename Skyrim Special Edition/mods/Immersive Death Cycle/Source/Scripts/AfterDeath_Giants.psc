Scriptname AfterDeath_Giants extends ActiveMagicEffect  

Armor Property BearOutfit Auto
Armor Property Bearoutfit2 Auto
Armor Property BearOutfit3 Auto
Armor Property BearOutfit4 Auto
Armor Property BearOutfit5 Auto
Armor Property BearOutfit6 Auto

Armor Property Armor_Giant1 Auto
Armor Property Armor_Giant2 Auto

Armor Property SkinGiant01 Auto
Armor Property SkinGiant02 Auto


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

If akTarget.GetLeveledActorBase().GetSkin()  == SkinGiant01
;half skirt model
akTarget.EquipItem(Armor_Giant1, true)

elseif akTarget.GetLeveledActorBase().GetSkin()  == SkinGiant02
akTarget.EquipItem(Armor_Giant2, true)

endif

endfunction