Scriptname SeasonsFrameworkAbilityTrigger extends ActiveMagicEffect  

SeasonsFrameworkMain Property SFMain Auto

GlobalVariable Property CurrentMonthCheck Auto
GlobalVariable Property GameMonth Auto

Event OnEffectStart(actor Target, actor Caster)
	CurrentMonthCheck.SetValue(GameMonth.GetValue())
	SFMain.Season(True)
EndEvent