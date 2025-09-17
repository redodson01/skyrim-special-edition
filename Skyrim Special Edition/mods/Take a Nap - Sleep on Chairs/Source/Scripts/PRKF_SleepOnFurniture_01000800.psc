;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 35
Scriptname PRKF_SleepOnFurniture_01000800 Extends Perk Hidden


import GTB_UIUtil

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
bool GoToBedInstalled = True

Int iHoursSlept = Game.QueryStat("Hours Slept")

if skse.GetPluginVersion("GoToBed") == -1
GoToBedInstalled = false
endif

Nap_AnimationStatus.SetValue(1)
If PlayerRef.GetSitState() == 0
akTargetRef.Activate(PlayerRef)
Utility.wait(2)
endif

FadeToBlackImod.Apply()

MfgConsoleFunc.SetModifier(PlayerRef,0,80)
MfgConsoleFunc.SetModifier(PlayerRef,1,80)

	utility.wait(1.7)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)


if GoToBedInstalled == false
	Debug.SendanimationEvent(PlayerRef, "IdleForceDefaultState")
	ImaginaryBedroll = PlayerRef.Placeatme(BedrollGround)
	ImaginaryBedroll.SetActorOwner(PlayerRef.GetActorBase())
utility.wait(0.2)
	Game.SetInChargen(true, false, false)
	ImaginaryBedroll.Activate(PlayerRef)

else
utility.wait(0.2)
ShowSleepWaitMenu(true)
endif

	int MaximumHours = Nap_MaximumHours.GetValueint()
	UI.SetInt("Sleep/Wait Menu", "_root.SleepWaitMenu_mc.HoursSlider._maximum", MaximumHours)
Nap_TextReplace1.forcerefto(text5)
Nap_TextReplace2.forcerefto(text5)
Nap_TextReplace3.forcerefto(text5)
Nap_TextReplace4.forcerefto(text5)

	While Utility.IsInMenuMode() == True
	Endwhile

	utility.wait(0.1)

if GoToBedInstalled == false
PlayerRef.MoveTo(akTargetRef)
endif

	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	utility.wait(1.5)
	FadeToBlackHoldImod.Remove()


	PlayerRef.RemoveSpell(WellRested)
	PlayerRef.RemoveSpell(Rested)
	PlayerRef.RemoveSpell(MarriageRested)

If Nap_BackPain.GetValue() > 0
If Game.QueryStat("Hours Slept") > iHoursSlept 
	PlayerRef.AddSpell(Nap_BackPainSpell, false)
		If skse.GetPluginVersion("SurvivalModeImproved") > -1
		Debug.notification(Nap_TextReplace5.GetName())
		endif
endif
endif

	Utility.Wait(2)

MfgConsoleFunc.ResetPhonemeModifier(PlayerRef)

if GoToBedInstalled == false
        ImaginaryBedroll.Disable()
        ImaginaryBedroll.Delete()
		if Nap_BackPain.GetValue() > 0
		Debug.notification(Nap_TextReplace5.GetName())
;		Nap_BackPainMessage.Show()
		endif
endif

	Nap_AnimationStatus.SetValue(0)
	Game.SetInChargen(false, false, false)

Nap_TextReplace1.forcerefto(text1)
Nap_TextReplace2.forcerefto(text2)
Nap_TextReplace3.forcerefto(text3)
Nap_TextReplace4.forcerefto(text4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Furniture Property BedrollGround  Auto  

Actor Property PlayerRef  Auto  

Idle Property IdleGive  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  

ObjectReference Property ImaginaryBedroll  Auto  

GlobalVariable Property Nap_BackPain  Auto  

GlobalVariable Property Nap_MaximumHours  Auto  

GlobalVariable Property Nap_AnimationStatus  Auto  

SPELL Property Nap_BackPainSpell  Auto  

SPELL Property WellRested  Auto  

SPELL Property Rested  Auto  

SPELL Property MarriageRested  Auto  

ReferenceAlias Property Nap_TextReplace1  Auto  

ReferenceAlias Property Nap_TextReplace2  Auto  

ReferenceAlias Property Nap_TextReplace3  Auto  

ReferenceAlias Property Nap_TextReplace4  Auto 

ReferenceAlias Property Nap_TextReplace5  Auto 

ObjectReference Property Text1 Auto

ObjectReference Property Text2 Auto

ObjectReference Property Text3 Auto

ObjectReference Property Text4 Auto

ObjectReference Property Text5 Auto

