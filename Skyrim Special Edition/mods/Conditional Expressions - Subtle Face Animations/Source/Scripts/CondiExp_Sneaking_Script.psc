Scriptname CondiExp_Sneaking_Script extends ActiveMagicEffect  
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
KhajiitLikestoSneak()
EndEvent

Function KhajiitLikestoSneak()
MfgConsoleFunc.SetModifier(PlayerRef,12,45)
MfgConsoleFunc.SetModifier(PlayerRef,13,45)
MfgConsoleFunc.SetModifier(PlayerRef,2,20)

Int Order = Utility.RandomInt(1,12)
If Order < 3
LookLeft()
LookRight()
Elseif Order == 3
LookLeft()
Elseif Order == 4
LookRight()
Elseif Order == 5
LookRight()
LookLeft()
Endif
EndFunction


Event OnEffectFinish(Actor akTarget, Actor akCaster)

MfgConsoleFunc.SetModifier(PlayerRef,12,0)
MfgConsoleFunc.SetModifier(PlayerRef,13,0)
MfgConsoleFunc.SetModifier(PlayerRef,2,0)

EndEvent




Function LookLeft()

int i = 0

while i < 70
MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
i = i + 5
if (i >70)
i = 70
Endif
Utility.Wait(0.01)
endwhile

Utility.Wait(0.8)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction


Function LookRight()

int i = 0

while i < 70
MfgConsoleFunc.SetModifier(PlayerRef, 10,i)
i = i + 5
if (i >70)
i = 70
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(1.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 10,i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction
