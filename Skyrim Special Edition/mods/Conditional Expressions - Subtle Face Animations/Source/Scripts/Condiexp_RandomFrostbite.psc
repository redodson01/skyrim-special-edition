Scriptname Condiexp_RandomFrostbite extends activemagiceffect  

Actor Property PlayerRef Auto
GlobalVariable Property Condiexp_CurrentlyCold Auto
GlobalVariable Property Condiexp_ColdGlobal Auto
GlobalVariable Property Condiexp_CurrentlyBusy Auto
GlobalVariable Property CondiExp_PlayerIsHigh Auto
GlobalVariable Property CondiExp_PlayerIsDrunk Auto
GlobalVariable Property Condiexp_GlobalRandomFrequency Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

If Condiexp_ColdGlobal.GetValue() == 1
Spell Cold1 = Game.GetFormFromFile(0x00029028, "Frostbite.esp") as Spell
Spell Cold2 = Game.GetFormFromFile(0x00029029, "Frostbite.esp") as Spell
Spell Cold3 = Game.GetFormFromFile(0x0002902C, "Frostbite.esp") as Spell
If PlayerRef.HasSpell(Cold1) || PlayerRef.HasSpell(Cold2) || PlayerRef.HasSpell(Cold3)  
Condiexp_CurrentlyCold.SetValue(1)
else
Condiexp_CurrentlyCold.SetValue(0)
endif

If Condiexp_CurrentlyCold.GetValue() == 0 && Condiexp_CurrentlyBusy.GetValue() == 0
Utility.Wait(0.5)
Random()
endif
endif
EndEvent

Function Random()

Int Order = Utility.RandomInt(1, 80)
If Order == 1 || Order == 33
LookLeft(70)
LookRight()
Elseif Order == 2 || Order == 34 || Order == 61
LookLeft(50)
LookRight()
Elseif Order == 3 || Order == 35 || Order == 62
Angry()
Elseif Order == 4 || Order == 36 || Order == 63
Frown(50)
Elseif Order == 5 || Order == 37 || Order == 64
Smile(25)
Elseif Order == 6 || Order == 38 || Order == 65
Smile(60)
elseif Order == 7 || Order == 39 || Order == 66
Puzzled(25)
Elseif Order == 8 || Order == 40 || Order == 67
BrowsUpSmile(45)
Elseif Order == 9 || Order == 47 || Order == 68
BrowsUpSmile(30)
Elseif Order == 10 || Order == 41 || Order == 69
LookLeft(70)
Elseif Order == 11 || Order == 42 || Order == 70
LookRight()
Elseif Order == 12 || Order == 43 || Order == 71
Squint()
Elseif Order == 13 || Order == 44 || Order == 72
Smile(50)
Elseif Order == 14 || Order == 45 || Order == 73
Disgust(60)
Elseif Order == 15 || Order == 46 || Order == 74
Frown(80)
Elseif Order == 16
Yawn()
Elseif Order == 17 
LookDown()
Elseif Order == 18 || Order == 48 || Order == 75
BrowsUp()
Elseif Order == 19 || Order == 49
Thinking(15)
Elseif Order == 20 || Order == 50 || Order == 80
Thinking(50)
Elseif Order == 21 || Order == 51
Thinking(30)
Elseif Order == 22 || Order == 52
BrowsUpSmile(40)
Elseif Order == 23 || Order == 53 || Order == 76
BrowsUpSmile(15)
elseif Order == 24 || Order == 54
Disgust(25)
elseif Order == 25 || Order == 55
Puzzled(50)
elseif Order == 26 || Order == 56
Happy(40)
elseif Order == 27 || Order == 77
Happy(25)
elseif Order == 28 || Order == 59
Happy(60)
elseif Order == 29 || Order == 58
Lookleft(50)
elseif Order == 30 || Order == 60
Squint()
Lookleft(25) || Order == 78
Elseif Order == 31
Smile(15)
Elseif Order == 32 || Order == 79
Smile(35)
Endif

Utility.Wait(1)
If PlayerRef.IsRunning() || PlayerRef.GetAnimationVariableInt("i1stPerson")
else
Int Seconds = Utility.RandomInt(2, 5)
RegisterForSingleUpdate(Seconds)
endif

EndFunction


Function LookLeft(int n)
int i = 0

while i < n
MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
i = i + 5
if (i >n)
i = n
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


Function Squint()

int i = 0

while i < 55
MfgConsoleFunc.SetModifier(PlayerRef, 12, i)
MfgConsoleFunc.SetModifier(PlayerRef, 13, i)
i = i + 5
if (i >55)
i = 55
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(3.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 12, i)
MfgConsoleFunc.SetModifier(PlayerRef, 13, i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction

Function Frown(int n)

int i = 0

while i < n
MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
i = i + 5
if (i > n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(2.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction

Function Smile(int n)

int i = 0

while i < n
MfgConsoleFunc.SetPhoneMe(PlayerRef, 4, i)
i = i + 5
if (i >n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(3)

while i > 0
MfgConsoleFunc.SetPhoneMe(PlayerRef, 4, i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction

Function Angry()

int i = 0

while i < 70
MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
i = i + 5
if (i > 70)
i = 70
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(1.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 2, i)
MfgConsoleFunc.SetModifier(PlayerRef, 3, i)
MfgConsoleFunc.SetModifier(PlayerRef, 9,i)
i = i - 2
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction

Function Thinking(int n)

int i = 0

while i < n
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
MfgConsoleFunc.SetPhoneMe(PlayerRef, 7,i)
i = i + 5
if (i > n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(2.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
MfgConsoleFunc.SetPhoneMe(PlayerRef, 7,i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction

Function Yawn()

int i = 0

while i < 75
MfgConsoleFunc.SetModifier(PlayerRef, 0, i)
MfgConsoleFunc.SetModifier(PlayerRef, 1, i)
MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
MfgConsoleFunc.SetPhoneMe(PlayerRef, 1,i)
i = i + 3
if (i > 75)
i = 75
Endif
Utility.Wait(0.000001)
endwhile

int yawnduration = Utility.RandomInt(1,3)
if yawnduration == 1
Utility.Wait(0.7)
elseif yawnduration == 2
Utility.Wait(1)
elseif yawnduration == 2
Utility.Wait(1.5)
endif

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 0, i)
MfgConsoleFunc.SetModifier(PlayerRef, 1, i)
MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
MfgConsoleFunc.SetPhoneMe(PlayerRef, 1,i)
i = i - 3
if (i < 0)
i = 0
Endif
Utility.Wait(0.0000001)
endwhile
endfunction

Function LookDown()

int i = 0

while i < 40
MfgConsoleFunc.SetModifier(PlayerRef, 8,i)
i = i + 5
if (i >40)
i = 40
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(1.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 8,i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction

Function BrowsUp()

int i = 0

while i < 75
MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
i = i + 10
if (i > 75)
i = 75
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(2)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction


Function BrowsUpSmile(int n)

int i = 0

while i < n
MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
MfgConsoleFunc.SetPhoneMe(PlayerRef, 5, i)

i = i + 5
if (i > n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(1.5)

while i > 0
MfgConsoleFunc.SetModifier(PlayerRef, 6, i)
MfgConsoleFunc.SetModifier(PlayerRef, 7, i)
MfgConsoleFunc.SetPhoneMe(PlayerRef, 5, i)

i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
endfunction


Function Disgust(int n)
int i = 0

while i < n
PlayerRef.SetExpressionOverride(14,i)

i = i + 5
if (i > n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(1.5)

while i > 0
PlayerRef.SetExpressionOverride(14,i)

i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
PlayerRef.ClearExpressionOverride()
endfunction

Function Happy(int n)

int i = 0

while i < n
PlayerRef.SetExpressionOverride(10,i)

i = i + 5
if (i > n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(4.5)

while i > 0
PlayerRef.SetExpressionOverride(10,i)

i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
PlayerRef.ClearExpressionOverride()
endfunction


Function Puzzled(int n)

int i = 0

while i < n
PlayerRef.SetExpressionOverride(13,i)

i = i + 5
if (i > n)
i = n
Endif
Utility.Wait(0.05)
endwhile

Utility.Wait(3.5)

while i > 0
PlayerRef.SetExpressionOverride(13,i)

i = i - 5
if (i < 0)
i = 0
Endif
Utility.Wait(0.01)
endwhile
PlayerRef.ClearExpressionOverride()
endfunction


Event OnUpdate()
If PlayerRef.GetAnimationVariableInt("i1stPerson")
else
	If Condiexp_CurrentlyBusy.GetValue() == 1
	else
	Random()
	EndIf
endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

If Condiexp_CurrentlyBusy.GetValue() == 1
else
PlayerRef.ClearExpressionOverride()
MfgConsoleFunc.ResetPhonemeModifier(PlayerRef)
endif

EndEvent