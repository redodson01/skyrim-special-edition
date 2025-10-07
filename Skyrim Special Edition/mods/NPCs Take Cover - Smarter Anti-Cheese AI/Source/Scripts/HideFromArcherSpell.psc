Scriptname HideFromArcherSpell extends ActiveMagicEffect  

Actor property PlayerRef Auto
Spell Property Courage Auto
Topic property Hide_Dialogue Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

akTarget.Say(Hide_dialogue)
Courage.cast(PlayerRef, akTarget)

endEVENT