Scriptname IrisEffectCount2 extends ActiveMagicEffect  

GLOBALVARIABLE PROPERTY RUNE3TIMES AUTO

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	if RUNE3TIMES.GetValue()>= 80
		RUNE3TIMES.SetValue(RUNE3TIMES.GetValue() + 1)
	endif
ENDEVENT



