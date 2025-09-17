scriptName Survival_DiseaseContractMessageScript extends ActiveMagicEffect

;-- Properties --------------------------------------
spell property DiseaseSpell auto
{The disease to remove after the effect is dispelled.}
globalvariable property Survival_DiseaseProgressionSpeed auto
{How quickly this disease progresses, in hours.}
message property DiseaseMessage auto
{The message to display when contracting this disease.}
spell property DiseaseToProgressInto auto
{The disease that this disease progresses into.}
survival_attributeeffectwatchscript property NeedAlias auto
{The ReferenceAlias for the Need.}
Bool property ProgressibleDisease auto
{Whether this disease progresses or not.}
Bool property AffectsAttribute auto
{Whether this disease affects an attribute (Health, Magicka, Stamina).}

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnUpdateGameTime()

	Actor target = self.GetTargetActor()
	if target
		if AffectsAttribute
			;NeedAlias.HandleAttributeDiseaseApply(DiseaseToProgressInto, self as ActiveMagicEffect, target)
		else
			self.Dispel()
			target.AddSpell(DiseaseToProgressInto, false)
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	if DiseaseSpell
		akTarget.RemoveSpell(DiseaseSpell)
	endIf
endFunction

function OnEffectStart(Actor akTarget, Actor akCaster)

	if DiseaseMessage
		DiseaseMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
	if ProgressibleDisease
		self.RegisterForSingleUpdateGameTime(Survival_DiseaseProgressionSpeed.GetValueInt() as Float)
	endIf
endFunction

