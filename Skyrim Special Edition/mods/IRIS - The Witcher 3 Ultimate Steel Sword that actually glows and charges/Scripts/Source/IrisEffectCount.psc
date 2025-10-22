Scriptname IrisEffectCount extends ActiveMagicEffect  

GLOBALVARIABLE PROPERTY RUNE3TIMES AUTO

EVENT OnEffectStart(ACTOR target, ACTOR caster)

	RUNE3TIMES.SetValue(RUNE3TIMES.GetValue() + 1)

ENDEVENT


