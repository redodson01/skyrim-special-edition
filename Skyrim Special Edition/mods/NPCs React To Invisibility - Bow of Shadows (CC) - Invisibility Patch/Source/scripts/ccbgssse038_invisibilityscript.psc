
scriptName ccBGSSSE038_InvisibilityScript extends activemagiceffect

;-- Properties --------------------------------------
spell property myInvisibility auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function ForceMovementSpeedUpdate(Actor akTarget)

	akTarget.DamageActorValue("CarryWeight", 0.100000)
	akTarget.RestoreActorValue("CarryWeight", 0.100000)
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)

	self.ForceMovementSpeedUpdate(akTarget)
	akTarget.DispelSpell(myinvisibility)
endFunction

function OnEffectStart(Actor akTarget, Actor akCaster)

	myInvisibility.Cast(akCaster as objectreference, akCaster as objectreference)
	self.ForceMovementSpeedUpdate(akTarget)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
