Scriptname CondiExp_StartMod extends ReferenceAlias  

Spell Property CondiExp_Fatigue1 Auto
Actor Property PlayerRef Auto
Formlist property CondiExp_Drugs Auto
Formlist property CondiExp_Drinks Auto
Keyword Property VendorItemFood Auto
Keyword Property VendorItemIngredient Auto
GlobalVariable Property CondiExp_CurrentlyBusy Auto
GlobalVariable Property CondiExp_PlayerIsHigh Auto
GlobalVariable Property CondiExp_PlayerIsDrunk Auto
GlobalVariable Property CondiExp_PlayerJustAte Auto
GlobalVariable Property Condiexp_GlobalCold Auto
GlobalVariable Property Condiexp_ColdMethod Auto
GlobalVariable Property Condiexp_Sounds Auto
GlobalVariable Property Condiexp_GlobalEating Auto


Race Property KhajiitRace Auto
Race Property KhajiitRaceVampire Auto
Race Property OrcRace Auto
Race Property OrcRaceVampire Auto

Event OnInit()
StartMod()
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
If CondiExp_Drugs.HasForm(akBaseObject)
CondiExp_PlayerIsHigh.SetValue(1)

elseif  CondiExp_Drinks.HasForm(akBaseObject)
CondiExp_PlayerIsDrunk.SetValue(1)

elseif akBaseObject.HasKeyWord(VendorItemFood)
CondiExp_PlayerJustAte.SetValue(1)
utility.wait(5)
CondiExp_PlayerJustAte.SetValue(0)

elseif akBaseObject.HasKeyword(VendorItemIngredient)

If  Condiexp_GlobalEating.GetValue() == 2
	CondiExp_PlayerJustAte.SetValue(1)
	utility.wait(5)
	CondiExp_PlayerJustAte.SetValue(0)

elseif Condiexp_GlobalEating.GetValue() == 1

	Condiexp_GlobalEating.SetValue(2)
	CondiExp_PlayerJustAte.SetValue(1)
	utility.wait(5)
	CondiExp_PlayerJustAte.SetValue(0)
	Condiexp_GlobalEating.SetValue(1)
endif


Endif
EndEvent

Function StartMod()
CondiExp_CurrentlyBusy.SetValue(0)
MfgConsoleFunc.ResetPhonemeModifier(PlayerRef)

Utility.Wait(0.5)
PlayerRef.AddSpell(CondiExp_Fatigue1, false)

If CondiExp_Sounds.GetValue() > 0
NewRace()
Endif

If Condiexp_GlobalCold.GetValue() == 1
	; SKSE Mean no papyrus errors :D
	If Game.IsPluginInstalled("Frostfall.esp")
		;Frostfall Installed
		Condiexp_ColdMethod.SetValue(1)
	elseif Game.IsPluginInstalled("Frostbite.esp")
		;Frostbite Installed
		Condiexp_ColdMethod.SetValue(2)
	else
		; vanilla cold weathers
		Condiexp_ColdMethod.SetValue(3)
endif
endif
Endfunction


Event OnRaceSwitchComplete()
If CondiExp_Sounds.GetValue() > 0
NewRace()
Endif
EndEvent


Function NewRace()
ActorBase PlayerBase = PlayerRef.GetActorBase()

If PlayerBase.GetSex() == 0

	if PlayerRef.GetRace() == KhajiitRace || PlayerRef.GetRace() == KhajiitRaceVampire
		Condiexp_Sounds.SetValue(1)

	elseif PlayerRef.GetRace() == OrcRace || PlayerRef.GetRace() == OrcRaceVampire
		Condiexp_Sounds.SetValue(2)
	else
		Condiexp_Sounds.SetValue(3)
	endif
else
	if PlayerRef.GetRace() == KhajiitRace || PlayerRef.GetRace() == KhajiitRaceVampire
		Condiexp_Sounds.SetValue(4)

	elseif PlayerRef.GetRace() == OrcRace || PlayerRef.GetRace() == OrcRaceVampire
		Condiexp_Sounds.SetValue(5)
	else
		Condiexp_Sounds.SetValue(6)
	endif
endif
endfunction