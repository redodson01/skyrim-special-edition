Scriptname SimpleHuntingOverhaul_Alias extends ReferenceAlias  

Armor Property _SkinnedWolf Auto
Armor Property _SkinnedBear Auto
Armor Property _SkinnedCow Auto
Armor Property _SkinnedDeer Auto
Armor Property _SkinnedElk Auto
Armor Property _SkinnedFox Auto
Armor Property _SkinnedGoat Auto
Armor Property _SkinnedHorker Auto
Armor Property _SkinnedHorse Auto
Armor Property _SkinnedMammoth Auto
Armor Property _SkinnedRabbit Auto
Armor Property _SkinnedSabre Auto
Armor Property _SkinnedTroll Auto
Armor Property _SkinnedSkeever Auto

MiscObject Property HorseHide Auto
race property elkrace auto

VoiceType Property CRWolfVoice Auto
VoiceType Property CRSkeeverVoice Auto
VoiceType Property CRBearVoice Auto
VoiceType Property CRCowVoice Auto
VoiceType Property CRDeerVoice Auto
VoiceType Property CRFoxVoice Auto
VoiceType Property CRGoatVoice Auto
VoiceType Property CRHorkerVoice Auto
VoiceType Property CRMammothVoice Auto
VoiceType Property CRHorseVoice Auto
VoiceType Property CRHareVoice Auto
VoiceType Property CRSabreCatVoice Auto
VoiceType Property CRTrollVoice Auto

Actor Property PlayerRef Auto
Formlist property _VanillaPelts Auto
Formlist property _Brumapelts Auto
Formlist property SHO_Blacklist Auto
Perk Property _PickUpPerkForPickingUp Auto
Sound Property _SkinSound Auto

GlobalVariable Property _HuntingXP Auto
GlobalVariable Property GameHour Auto
GlobalVariable Property _FadeTimePass Auto
GlobalVariable Property _RemovePelts Auto

;Hello MaskedRPGFan, fancy meeting you here!
; _FadeTimePass == 0 means that no time passes and there's no fadeout of the screen
; _FadeTimePass == 1 means both time and fadeout of the screen happen. This is the default.
; _FadeTimePass == 2 means only fadeout of the screen happens
; _FadeTimePass == 3 means only time passes

MiscObject Property _MeatTracker Auto
Formlist property _IngredientsAndMeats Auto

Event OnInIt()
AddInventoryEventFilter(_VanillaPelts)
AddInventoryEventFilter(_Brumapelts)
AddInventoryEventFilter(_IngredientsAndMeats)
PlayerRef.AddPerk(_PickUpPerkForPickingUp)
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	Actor TheActor = akSourceContainer as actor 

If TheActor.IsDead() && !SHO_Blacklist.HasForm(TheActor.GetActorBase())

If _IngredientsAndMeats.HasForm(akBaseItem)
akSourceContainer.AddItem(_MeatTracker, 1)
;This adds a token invisible item that will let us know the animal has been poached already, which means you cannot pick it up anymore
;this is also a good way for _anyone_ to add animations for getting meat here. Hello, my favorite pigeon in NexusMods.

elseif _VanillaPelts.HasForm(akBaseItem) || _BrumaPelts.HasForm(akBaseItem)

	If TheActor.GetVoiceType() == CrWolfVoice
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
       			       TheActor.EquipItem(_SkinnedWolf, true)
				endif

		elseif TheActor.GetVoiceType() == CRBearVoice
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedBear, true)
				endif

		elseif TheActor.GetVoiceType() == CRCowVoice
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedCow, true)
				endif

		elseif TheActor.GetVoiceType() == CRDeerVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
						If TheActor.GetRace() == ElkRace
								TheActor.EquipItem(_SkinnedElk, true)
						else
			              	TheActor.EquipItem(_SkinnedDeer, true)
						endif
				endif

		elseif TheActor.GetVoiceType() == CRFoxVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedFox, true)
				endif

		elseif TheActor.GetVoiceType() == CRGoatVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedGoat, true)
				endif

		elseif TheActor.GetVoiceType() == CRMammothVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedMammoth, true)
				endif

		elseif TheActor.GetVoiceType() == CRHorseVoice && akBaseItem == HorseHide
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedHorse, true)
				endif

		elseif TheActor.GetVoiceType() == CRHareVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedRabbit, true)
				endif

		elseif TheActor.GetVoiceType() == CRSabreCatVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedSabre, true)
				endif

		elseif TheActor.GetVoiceType() == CRSkeeverVoice 
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedSkeever, true)
				endif

		elseif TheActor.GetVoiceType() == CRTrollVoice
					GlobalCheck()
				If _RemovePelts.GetValue() == 1
			              TheActor.EquipItem(_SkinnedTroll, true)
				endif
	endIf
endif
endif
endEvent



Function GlobalCheck()
	XP()
	
	If _FadeTimePass.GetValue() == 0
	;nothing happens

	elseif _FadeTimePass.GetValue() == 3 
	PassTime()

	else
	FadeOut()
	endif
endfunction


Function XP()
If _HuntingXP.Getvalue() < 100
_HuntingXP.SetValue(_HuntingXP.GetValue() + 1)
endif
EndFunction


Function PassTime()

float howlong
float currentXP = _HuntingXP.GetValue()

If  currentXP < 10
	howlong = 2.0
Debug.notification("Two hours pass while you retrieve the pelt...")
elseif currentXP < 20
	howlong = 1.5
Debug.notification("An hour and half pass while you retrieve the pelt...")
elseif currentXP < 30
	howlong = 1.3
Debug.notification("Around one hour passes...")
elseif currentXP < 40
	howlong = 1.0
Debug.notification("One hour passes...")
elseif currentXP < 50
	howlong = 0.7
Debug.notification("Less than one hour passes...")
elseif currentXP < 60
	howlong = 0.5
Debug.notification("Half an hour passes...")
elseif currentXP < 70
	howlong = 0.4
Debug.notification("Less than half an hour passes...")
elseif currentXP < 80
	howlong = 0.3
Debug.notification("A quarter of an hour passes...")
elseif currentXP < 90
	howlong = 0.2
Debug.notification("Ten minutes pass...")
else
	howlong = 0.1
Debug.notification("A few minutes pass...")
endif

float time = GameHour.getValue()
	GameHour.setValue(time + howlong)
EndFunction


Function FadeOut()

Game.FadeOutGame(false, true, 0.7, 1.6)
_SkinSound.Play(PlayerRef)
UI.Invoke("ContainerMenu", "_root.Menu_mc.onExitMenuRectClick")
	if _FadeTimePass.GetValue() == 1
		PassTime()
	endif
EndFunction

