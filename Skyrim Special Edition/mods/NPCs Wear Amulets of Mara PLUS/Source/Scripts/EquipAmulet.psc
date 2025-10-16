Scriptname EquipAmulet extends ActiveMagicEffect  

armor property AmuletOfMara auto

function OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.EquipItem(AmuletOfMara)
;debug.notification("It worked")
endFunction