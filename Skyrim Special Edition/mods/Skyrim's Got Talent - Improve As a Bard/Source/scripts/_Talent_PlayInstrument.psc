Scriptname _Talent_PlayInstrument extends activemagiceffect 

Actor Property PlayerRef Auto
idle property IdleToPlay Auto
Idle Property IdleStop_Loose Auto
GlobalVariable Property ExpertiseGlobal Auto
GlobalVariable Property _Talent_DummyForALLGUD Auto
GlobalVariable Property _Talent_IsPerformingGood Auto
GlobalVariable Property _Talent_IsPerformingTerrible Auto
GlobalVariable Property _Talent_ReceiveOvation Auto
GlobalVariable Property _Talent_FollowerPlays Auto
GlobalVariable Property _Talent_EnableMovement Auto

bool returntofirstperson
bool ALLGUD_Was_On

Sound Property CluelessSongs Auto
Sound Property BeginnerSongs Auto
Sound Property HalfDecentSongs Auto
Sound Property BardLevelSongs Auto
Sound Property DuoSongs_1 Auto
Sound Property DuoSongs_2 Auto
Sound Property ProSongs Auto
Sound Property OBJCWBarricadeDestroyed Auto
MusicType Property _Talent_Silence Auto
Spell Property WellRested Auto
Spell Property Rested Auto
Spell Property MarriageRested Auto
BardSongsScript Property BardSongs  Auto
Scene Property _talent_BardAudienceQuestScene Auto
Scene Property _talent_LetsPlayTogether1 Auto
Scene Property _talent_LetsPlayTogether2 Auto
Quest Property _talent_BardAudienceQuest Auto
Quest Property CollegeRecover Auto
ReferenceAlias Property Buddy Auto

keyword property LocTypeInn Auto
Int SongToPlay
Int Broken
Spell Property Instrumentspell Auto

Message Property _Message_Standing Auto

Message Property _Talent_Clueless_Broken Auto
Message Property _Talent_Clueless_OK Auto
Message Property _Talent_Clueless_Negative Auto
Message Property _Talent_BardLevel_Positive Auto
Message Property _Talent_BardLevel_OK Auto
Message Property _Talent_Beginner_Negative Auto
Message Property _Talent_Beginner_OK Auto
Message Property _Talent_Decent_OK2 Auto
Message Property _Talent_Beginner_OK1 Auto
Message Property _Talent_Decent_OK Auto
Message Property _Talent_Pro_Positive Auto
Message Property _Talent_Pro_OK Auto

Message Property _Talent_Clueless_OK1 Auto
Message Property _Talent_Clueless_OK2 Auto
Message Property _Talent_Clueless_OK3 Auto
Message Property _Talent_Clueless_OK4 Auto
Message Property _Talent_Clueless_OK5 Auto
Message Property _Talent_Clueless_OK6 Auto
Message Property _Talent_Clueless_OK7 Auto
Message Property _Talent_Clueless_OK8 Auto
Message Property _Talent_Clueless_Broken1 Auto
Message Property _Talent_Clueless_Broken2 Auto
Message Property _Talent_Clueless_Broken3 Auto
Message Property _Talent_Decent_OK3 Auto
Message Property _Talent_BardLevel_OK1 Auto
Message Property _Talent_BardLevel_OK2 Auto
Message Property _Talent_Pro_OK1 Auto
Message Property _Talent_Pro_OK2 Auto
Message Property _Talent_Pro_OK3 Auto

ReferenceAlias Property Bard Auto
Int SpecialInstrument 
Potion Property Positive1 Auto
Potion Property Positive2 Auto
Potion Property Negative1 Auto
Potion Property Negative2 Auto
Potion Property _Talent_KynePeace Auto
MagicEffect Property Negative Auto
Quest Property MS05 Auto

MiscObject Property Instrument Auto
MiscObject Property DummyInstrument Auto
MiscObject Property Gold Auto
Light Property Torch01 Auto

Import TrueDirectionalMovement

Event OnEffectStart(Actor akTarget, Actor akCaster)


If PlayerRef.GetSitState() > 0 || PlayerRef.IsSwimming() == 1
Game.GetPlayer().RemoveSpell(InstrumentSpell)
	_Message_Standing.Show()
return
endif

RegisterForControl("Activate")
RegisterForControl("Jump")

_Talent_IsPerformingTerrible.SetValue(0)
_Talent_IsPerformingGood.SetValue(0)
_Talent_ReceiveOvation.SetValue(0)

If _Talent_DummyForAllGud.GetValue() == 1
_Talent_DummyForAllgud.SetValue(0)
ALLGUD_Was_On = true
endif

If _Talent_EnableMovement.GetValue() == 1
Game.DisablePlayerControls(false, true, false, false, false, false, true, false, 0)
PlayerRef.AddItem(DummyInstrument, 1, true)
else
Game.DisablePlayerControls(true, true, false, false, false, false, true, false, 0)
endif

Playerref.UnequipItemSlot(39)

if SKSE.GetVersion()
 Light playerTorch = PlayerRef.GetEquippedObject(0) as Light
 if playerTorch
 PlayerRef.UnequipItemEx(playerTorch, 0)
 endif
else
 if (Playerref.GetEquippedItemType(0) == 11)
 PlayerRef.UnequipItem(Torch01)
 endif
endif

if PlayerRef.IsWeaponDrawn()
PlayerRef.SheatheWeapon()
Utility.Wait(2)
endIf

_Talent_Silence.Add()

If PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn)
       BardSongs.StopAllSongs()
endif


While Utility.IsInMenuMode() == True
utility.WaitMenuMode(0.5)
endwhile

utility.wait(0.3)

If Game.GetCameraState() == 0
Game.ForceThirdPerson()
returntofirstperson = true
endif

Utility.Wait(0.1)
PlayMusic()
RegisterForSingleUpdate(32.8)
EndEvent

Function PlayMusic()
Utility.Wait(0.1)
PlayerRef.PlayIdle(IdleToPlay)
ToggleDisableHeadtracking(False, True)
Utility.Wait(0.9)
Float Expertise = ExpertiseGlobal.GetValue()

If Expertise < 26
;Clueless
	SongToPlay = CluelessSongs.Play(PlayerRef)
	PlayerRef.SetExpressionOverride(3, 75)
Utility.Wait(2)
_Talent_IsPerformingTerrible.Setvalue(1)
_talent_BardAudienceQuest.SetStage(10)

elseif Expertise < 46
	SongToPlay = BeginnerSongs.Play(PlayerRef)
	PlayerRef.SetExpressionOverride(4, 60)
Utility.Wait(2)
_Talent_IsPerformingTerrible.Setvalue(1)
_talent_BardAudienceQuest.SetStage(10)

elseif Expertise < 66
;Medium Player
;Reusing this global so I don't have to make a new one. I'm smarter now!
	SongToPlay = HalfDecentSongs.Play(PlayerRef)
		PlayerRef.SetExpressionOverride(2, 50)
Utility.Wait(2)
_Talent_IsPerformingGood.Setvalue(2)


elseif Expertise < 86
;Advanced
_Talent_IsPerformingGood.Setvalue(1)
_talent_BardAudienceQuest.SetStage(10)

PlayerRef.SetExpressionOverride(2, 60)
If _Talent_FollowerPlays.GetValue() == 0
	SongToPlay = BardLevelSongs.Play(PlayerRef)
elseif _Talent_FollowerPlays.GetValue() == 1
	SongToPlay = DuoSongs_1.Play(PlayerRef)
else 
	SongToPlay = DuoSongs_2.Play(PlayerRef)
endif
_Talent_FollowerPlays.SetValue(0)

else
;SuperPro
_Talent_IsPerformingGood.Setvalue(1)
PlayerRef.SetExpressionOverride(2, 70)
_talent_BardAudienceQuest.SetStage(10)
	Int RandomNum = Utility.RandomInt(1,4)

If _Talent_FollowerPlays.GetValue() == 0
	If RandomNum == 1
	SongToPlay = BardLevelSongs.Play(PlayerRef)
	else
SongToPlay = ProSongs.Play(PlayerRef)
endif
	elseif _Talent_FollowerPlays.GetValue() == 1
	SongToPlay = DuoSongs_1.Play(PlayerRef)
else 
	SongToPlay = DuoSongs_2.Play(PlayerRef)
endif
_Talent_FollowerPlays.SetValue(0)
endif


;Sound.SetInstanceVolume(SongToPlay, 1)
endfunction


Event OnControlUp(string control, float HoldTime)
;ForceExit
		If control == "Activate" || control == "Jump" 
		Game.GetPlayer().RemoveSpell(InstrumentSpell)
		_talent_LetsPlayTogether1.Stop()
		_talent_LetsPlayTogether2.Stop()

If _Talent_EnableMovement.GetValue() == 1
PlayerRef.RemoveItem(DummyInstrument, 1, true)
endif

		If Buddy.GetActorReference() == none
		else
		Buddy.GetActorReference().ClearLookAt()
		endif
		Endif
EndEvent


Event OnUpdate()
	Game.GetPlayer().RemoveSpell(InstrumentSpell)
	MessageAndEXP()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
_Talent_IsPerformingTerrible.Setvalue(0)
_Talent_IsPerformingGood.Setvalue(0)
ToggleDisableHeadtracking(False, False)

If _Talent_EnableMovement.GetValue() == 1
PlayerRef.RemoveItem(DummyInstrument, 1, true)
endif

if ALLGUD_Was_ON == True
_Talent_DummyForAllgud.SetValue(1)
ALLGUD_Was_On = false
endif

If _talent_BardAudienceQuest.GetStage() == 10
_talent_BardAudienceQuest.SetStage(20)
endif

	UnregisterForUpdate()
	UnregisterForControl("Activate")
	UnregisterForControl("Jump")
	PlayerRef.ClearExpressionOverride()
	PlayerRef.PlayIdle(IdleStop_Loose)
		Utility.Wait(0.3)
	Sound.StopInstance(SongToPlay)
	game.EnablePlayerControls()
	_Talent_Silence.Remove()

	If returntofirstperson == true
	Utility.Wait(2.5)
	Game.ForceFirstPerson()
	returntofirstperson = false
	endif

Utility.Wait(4.5)
If _talent_BardAudienceQuest.GetStage() == 20
;This is a failsafe in case the crowd doesn't stop applauding for some reason
_talent_BardAudienceQuest.SetStage(200)
endif

;This is a final check to ensure the reactions stop fo' sho
_Talent_IsPerformingTerrible.Setvalue(0)
_Talent_IsPerformingGood.Setvalue(0)

endevent





Function MessageAndEXP()
	Float Expertise = ExpertiseGlobal.GetValue()
	Int RandomNum = Utility.RandomInt(1,14)
	_Talent_ReceiveOvation.SetValue(1)

If Expertise < 26

SpecialInstrument = CollegeRecover.GetStage()

;Clueless
		If RandomNum == 1 && SpecialInstrument != 40 && SpecialInstrument != 15
			;broken
		Int MessageRandom = Utility.RandomInt(1,4)
			if MessageRandom == 1
			_Talent_Clueless_Broken.Show()
			elseif MessageRandom == 2
			_Talent_Clueless_Broken2.Show()
			elseif MessageRandom == 3
			_Talent_Clueless_Broken1.Show()
			else
			_Talent_Clueless_Broken3.Show()
			endif
			Broken = OBJCWBarricadeDestroyed.Play(PlayerRef)
			PlayerRef.RemoveItem(Instrument)


		elseif RandomNum > 1 && RandomNum < 6
			;Negative
			PlayerRef.EquipItem(Negative2, false, true)
			_Talent_Clueless_Negative.Show()
		
		elseif RandomNum == 6
			_Talent_Clueless_OK.Show()
		elseif RandomNum == 7
							_Talent_Clueless_OK1.Show()
		elseif RandomNum == 8
							_Talent_Clueless_OK2.Show()
		elseif RandomNum == 9
							_Talent_Clueless_OK3.Show()
		elseif RandomNum == 10
							_Talent_Clueless_OK4.Show()
		elseif RandomNum == 11
							_Talent_Clueless_OK5.Show()
		elseif RandomNum == 12
							_Talent_Clueless_OK6.Show()
		elseif RandomNum == 13
							_Talent_Clueless_OK7.Show()

			else			
			_Talent_Clueless_OK8.Show()
			endif

elseif Expertise < 46
		If RandomNum < 8
			;Negative
			_Talent_Beginner_Negative.Show()
			PlayerRef.EquipItem(Negative1, false, true)
		
		elseif RandomNum < 10
			;No effect
			_Talent_Beginner_OK.Show()
		else
			_Talent_Beginner_OK1.Show()
			endif


elseif Expertise < 66
;Medium Player

		If RandomNum < 4
			;NoEffect
			_Talent_Decent_OK.Show()

		elseif RandomNum < 8
			_Talent_Decent_OK2.Show()

		else	
			_Talent_Decent_OK3.Show()
			endif


elseif Expertise < 86
;Advanced
If PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn)
Int Money = Utility.RandomInt(1,10)
Utility.Wait(1.4)
Debug.SendanimationEvent(PlayerRef, "idlesilentbow")
PlayerRef.Additem(Gold, Money)
endif

		If RandomNum < 7
			;Positive
			PlayerRef.EquipItem(Positive1, false, true)
			_Talent_BardLevel_Positive.Show()
		
		elseif RandomNum < 9
			;No effect
			_Talent_BardLevel_OK.Show()

		elseif RandomNum < 12
			_Talent_BardLevel_OK2.Show()
		else
			_Talent_BardLevel_OK1.Show()
			endif
else
;SuperPro

PlayerRef.EquipItem(_Talent_KynePeace, false, true)

If PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn)
Int Money = Utility.RandomInt(4,25)
Utility.Wait(1.4)
Debug.SendanimationEvent(PlayerRef, "idlesilentbow")
PlayerRef.Additem(Gold, Money)
endif

		If RandomNum < 7
			;Positive
			PlayerRef.EquipItem(Positive2, false, true)
			_Talent_Pro_Positive.Show()
		
		elseif RandomNum < 9
			_Talent_Pro_OK1.Show()
		elseif RandomNum < 11
			_Talent_Pro_OK2.Show()
		elseif RandomNum < 13
			_Talent_Pro_OK3.Show()
			else	
			;No effect
			_Talent_Pro_OK.Show()
			endif
endif



Int Exp = Utility.RandomInt(1,3)

Float Speech = PlayerRef.GetActorValue("Speechcraft")
	If Speech > 24 && Speech < 51
		Exp = Exp +1
	elseif Speech >50 && Speech < 75
		Exp = Exp +2
	elseif Speech > 74
		Exp = Exp +3
endif

If MS05.GetStage() == 300
Exp = Exp + 2
Endif

If PlayerRef.HasMagicEffect(Negative)
Exp = Exp - 2
endif

If PlayerRef.HasSpell(Rested) || PlayerRef.HasSpell(WellRested) || PlayerRef.HasSpell(MarriageRested)
Exp = Exp +2
endif

If Exp < 1
Exp = 0
endif

ExpertiseGlobal.SetValue(ExpertiseGlobal.GetValue() + Exp)
EndFunction