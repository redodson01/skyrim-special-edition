Scriptname HealFollowers_SpellScript extends ActiveMagicEffect  

Float InitialTargetCarryweight
FormList Property HealFollowers_Filter Auto
Formlist Property HealFollowers_CoveredVoices Auto
Actor Property PlayerRef Auto
Keyword property MagicAlchRestoreHealth Auto
GlobalVariable Property HealFollowers_Quick Auto
Topic Property HealFollowers_HealedDialogue Auto
message property HealFollowers_NoPotionsMessage auto
faction property HealFollowers_TempFaction auto
Potion Property HealFollowers_PotDummy Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

If HealFollowers_Quick.GetValue() == 1

	Form[] items = PlayerRef.GetContainerForms()
	int i = items.Length

	Potion HealthPotion

	while i
		i -= 1
		Potion p = items[i] as Potion
		if p && !p.IsFood() && p.GetNumEffects() == 1 && p.HasKeyword(MagicAlchRestoreHealth)
			if HealthPotion == none
			HealthPotion = p
			endif

			if HealthPotion.GetGoldValue() > p.GetGoldValue()
			HealthPotion = p
			endif
		endif
	endwhile

	If HealthPotion == none
	HealFollowers_NoPotionsMessage.Show()
	else
	akTarget.AddToFaction(HealFollowers_TempFaction)
		float Magn = HealthPotion.GetNthEffectMagnitude(0)
		int Durat = HealthPotion.GetNthEffectDuration(0)
		HealFollowers_PotDummy.SetNthEffectDuration(0, Durat)
		HealFollowers_PotDummy.SetNthEffectMagnitude(0, Magn)
		akTarget.EquipItem(HealFollowers_PotDummy)
		PlayerRef.RemoveItem(HealthPotion, 1)

;; New code to get around certain characters refusing to talk while bleeding out

	(akTarget as actor).AllowBleedoutDialogue(true)

	VoiceType ActorVoice = akTarget.GetVoiceType()

	If !HealFollowers_CoveredVoices.HasForm(ActorVoice)
	;Nothing, no voice found

	elseif akTarget.IsInCombat() && akTarget.IsBleedingOut()
	If aktarget.IsPlayerTeammate()
			aktarget.SetplayerTeammate(false)
			aktarget.Activate(PlayerRef)
			aktarget.SetplayerTeammate(true)
	else
			aktarget.Activate(PlayerRef)
	endif

	else
	utility.wait(1.5)
	aktarget.Say(HealFollowers_HealedDialogue)
	endif

	utility.wait(0.5)
	akTarget.RemoveFromFaction(HealFollowers_TempFaction)
	(akTarget as actor).AllowBleedoutDialogue(false)
endif


else

initialTargetCarryweight = akTarget.GetBaseActorValue("carryweight")
akTarget.SetActorValue("carryweight", initialTargetCarryweight + 1) ; to bypass the limit when gifting items.
akTarget.ShowGiftMenu(True, HealFollowers_Filter)
akTarget.SetActorValue("carryweight", InitialTargetCarryweight)	; set carryweight back to normal.

		While (Utility.IsInMenuMode())
		Utility.Wait(0.1)
		EndWhile

	Form[] items = akTarget.GetContainerForms()
	int i = items.Length

	Potion HealthPotion

	while i
		i -= 1
		Potion p = items[i] as Potion
		if p && !p.IsFood() && p.GetNumEffects() == 1 && p.HasKeyword(MagicAlchRestoreHealth)
			if HealthPotion == none
			HealthPotion = p
			endif

			if HealthPotion.GetGoldValue() > p.GetGoldValue()
			HealthPotion = p
			endif
		endif
	endwhile

	If HealthPotion == none
	HealFollowers_NoPotionsMessage.Show()
	else
	akTarget.AddToFaction(HealFollowers_TempFaction)
		float Magn = HealthPotion.GetNthEffectMagnitude(0)
		int Durat = HealthPotion.GetNthEffectDuration(0)
		HealFollowers_PotDummy.SetNthEffectDuration(0, Durat)
		HealFollowers_PotDummy.SetNthEffectMagnitude(0, Magn)
		akTarget.EquipItem(HealFollowers_PotDummy)
		PlayerRef.RemoveItem(HealthPotion, 1)

;; New code to get around certain characters refusing to talk while bleeding out

		(akTarget as actor).AllowBleedoutDialogue(true)

	VoiceType ActorVoice = akTarget.GetVoiceType()

	If !HealFollowers_CoveredVoices.HasForm(ActorVoice)
	;Nothing, no voice found

	elseif akTarget.IsInCombat() && akTarget.IsBleedingOut()
	If aktarget.IsPlayerTeammate()
			aktarget.SetplayerTeammate(false)
			aktarget.Activate(PlayerRef)
			aktarget.SetplayerTeammate(true)
	else
			aktarget.Activate(PlayerRef)
	endif

	else
	utility.wait(1.5)
	aktarget.Say(HealFollowers_HealedDialogue)
	endif

	utility.wait(0.5)
	akTarget.RemoveFromFaction(HealFollowers_TempFaction)
	(akTarget as actor).AllowBleedoutDialogue(false)
endif

endif
EndEvent