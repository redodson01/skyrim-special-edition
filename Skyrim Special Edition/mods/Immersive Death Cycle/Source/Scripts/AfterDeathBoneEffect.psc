Scriptname AfterDeathBoneEffect extends ActiveMagicEffect  

ObjectReference TheBones 
Activator Property BoneActivator Auto
FormList Property CurrentObjects Auto

Function OnEffectStart(Actor akTarget, Actor akCaster)
	TheBones = akTarget.PlaceAtMe(BoneActivator, 1, false, false)
	CurrentObjects.AddForm(TheBones)
	TheBones.SetPosition(TheBones.GetPositionX(), TheBones.GetPositionY(), TheBones.GetPositionZ() - 28)
	akTarget.Unequipall()
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)
EndFunction