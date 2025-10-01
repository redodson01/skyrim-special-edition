Scriptname Keyhole_Exit extends ReferenceAlias  

import SimplyKnockSKSE ;Not needed currently, but might use it to detect doors connected to cells
import ui
import consoleutil ;Optional, it offers some extra functionalities

Actor Property PlayerREF Auto
ObjectReference TheDoor
ObjectReference Chair1
ObjectReference Chair2
furniture property keyhole_chair auto
furniture property keyhole_chair_2 auto
GlobalVariable Property keyhole_mode Auto
GlobalVariable Property SittingAngleLimit Auto
spell property SpyThroughKeyholespell auto
Int ActivateKey
idle property IdleLockPick Auto
ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
ImageSpaceModifier Property FadeToBlackImod  Auto 
ImageSpaceModifier Property FadeToBlackBackImod Auto 
Bool DoorWasLocked
Spell property Invisibility auto
SoundCategory Property VFX Auto
SoundCategory Property VOCGeneral Auto

idle property IdleStop_Loose auto
Keyhole Property ThisQuestHello  Auto  

;;Messages;;
Message Property Spy_PressE Auto
Message Property KeyHole_CombatMessage Auto
Message Property KeyHole_DoorBlockedMessage Auto
Message Property KeyHole_FaceDoorMessage Auto
Message Property KeyHole_RestEyesMessage Auto
Message Property KeyHole_WeaponsMessage Auto

GlobalVariable Property Keyhole_BlockDoor Auto
Globalvariable property keyhole_changefov auto
Globalvariable property keyhole_defaultfov auto
Globalvariable property keyhole_tempfov auto
Globalvariable property keyhole_movement auto
Globalvariable property keyhole_DisableSaving auto
Globalvariable property keyhole_NoForcedThirdPerson auto
Globalvariable property keyhole_sneakmethod auto
Globalvariable property SomewhaLimited_keyhole auto
Formlist property Keyhole_DoorExceptions auto
perk property _takeapeekperk auto

DialogueFollowerScript Property DialogueFollower Auto

int[] bFollowNFF
bool bFollow


Event OnInIt()
PlayerRef.AddPerk(_takeapeekperk)
Endevent

Event OnPlayerLoadGame()
If PlayerRef.HasPerk(_TakeAPeekPerk) == 0
PlayerRef.AddPerk(_takeapeekperk)
endif
endevent

;;;;;;;;; ABILITY HAS TRIGGERED ;;;;;;;;;;


Event OnSpellCast(Form akSpell)

If akspell == SpyThroughKeyholespell && keyhole_mode.GetValue() == 0 && PlayerRef.IsWeaponDrawn()
KeyHole_WeaponsMessage.Show() 

elseif akspell == SpyThroughKeyholespell && keyhole_mode.GetValue() == 0 && PlayerRef.IsInCombat()
KeyHole_CombatMessage.Show() 

elseif akspell == SpyThroughKeyholespell && keyhole_mode.GetValue() > 0
KeyHole_RestEyesMessage.Show() 

elseif akspell == SpyThroughKeyholespell && keyhole_mode.GetValue() == 0
	takingapeek()

endif
endevent


;;;;;;;;;;;;;;;;; Now The Same, But NO ABILITY edition ;;;;;;;;;;;;;;;;;



Function RegisterSneak()

If keyhole_sneakmethod.GetValue() == 1
	RegisterForControl("Sneak") 
else
	UnregisterForControl("Sneak") 
endif
Endfunction





;;;;;;; Continuation of NO ABILITY edition ;;;;;;;;;;;


Event OnControlUp(string control, float HoldTime)
	
If control == "Sneak" && HoldTime > 1 && keyhole_mode.GetValue() == 0 && PlayerRef.IsWeaponDrawn()
KeyHole_WeaponsMessage.Show() 

elseif control == "Sneak" && HoldTime > 1 && keyhole_mode.GetValue() > 0
KeyHole_RestEyesMessage.Show() 

elseif control == "Sneak" && HoldTime > 1 && keyhole_mode.GetValue() > 0 && PlayerRef.IsInCombat()
KeyHole_CombatMessage.Show() 

elseif control == "Sneak" && HoldTime > 1 && keyhole_mode.GetValue() == 0
	takingapeek()
endif
endevent



;;;;;;;;;;;;;;;;;;;; The actual fun stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;

Function TakingAPeek()

If PlayerRef.IsWeaponDrawn()
KeyHole_WeaponsMessage.Show() 
return

elseif keyhole_mode.GetValue() > 0
KeyHole_RestEyesMessage.Show() 
return

elseif PlayerRef.IsInCombat()
KeyHole_CombatMessage.Show() 
return
endif

	TheDoor = Game.GetCurrentCrosshairRef()    
;;;;;ObjectReference linked_door = GetLinkedDoor(TheDoor)

If TheDoor.GetBaseObject() as Door && TheDoor.GetOpenState() == 3 && Keyhole_DoorExceptions.HasForm(TheDoor.GetBaseObject()) == false
;;;;;&& linked_door

DoorWasLocked = False

Keyhole_BlockDoor.SetValue(1)

If TheDoor.IsLocked()
	DoorWasLocked = True
	TheDoor.Lock(false)
Endif

If Game.GetCameraState() == 0
	;nothing
else
	PlayerRef.PlayIdle(IdleLockPick)
	utility.wait(0.8)
endif

FadeToBlackImod.Apply()
utility.wait(1.1)
FadeToBlackImod.PopTo(FadeToBlackHoldImod)
Debug.SendanimationEvent(PlayerRef, "IdleForceDefaultState")
FollowerStaph()
playerRef.PlayIdle(IdleStop_Loose)
PlayerRef.AddSpell(Invisibility, false)
PlayerREF.SetAlpha(0.0)
PlayerREF.SetGhost(True)
Game.ForceFirstPerson()
Chair1 = PlayerRef.PlaceAtMe(keyhole_chair)

If Keyhole_DisableSaving.GetValue() == 1
	; nothing, player disabled the mod messing with this
else
	Game.SetInChargen(true, true, false)
endif

keyhole_mode.SetValue(1)

If keyhole_movement.GetValue() == 1
	Game.DisablePlayerControls(True, True, True, False, True, False, False)
else
	Game.DisablePlayerControls(True, True, True, True, True, False, False)
endif

If SomewhaLimited_keyhole.GetValue() == 1
	SittingAngleLimit.SetValue(0.15)
endif

VFX.Mute()
TheDoor.Activate(PlayerRef)
Utility.Wait(1)
							VOCGeneral.SetVolume(0.25)

 if (TheDoor.GetParentCell() == PlayerRef.GetParentCell())
;Player might have a longer activate animation or door might be in the middle of opening, give it an extra second 
Utility.Wait(1.4)
endif

ExecuteCommand("tdetect")

Chair2 = PlayerRef.PlaceAtMe(keyhole_chair_2)
PlayerRef.Moveto(chair2)
Utility.Wait(0.1)
	Keyhole.OpenKeyholeMenu()

If keyhole_changefov.GetValue() == 1
	ExecuteCommand("fov " + keyhole_tempfov.GetValue())
endif

FadeToBlackHoldImod.Remove()

RegisterForControl("Activate")
RegisterForKey(ActivateKey)

	Utility.Wait(2)
	VFX.UnMute()

Spy_PressE.ShowAsHelpMessage("Activate", 5, 1,1)
Keyhole_BlockDoor.SetValue(0)

elseif TheDoor.GetBaseObject() as Door 
KeyHole_DoorBlockedMessage.Show() 

else
KeyHole_FaceDoorMessage.Show() 
endif

EndFunction


;;;;;;;;;;;;;;; EVENT TO EXIT THE KEYHOLE MODE ;;;;;;;;;;;;;;;;;;;;;;;
;Also, hi! Curious person reading source. I'm a complete scripting noob with 0 actual experience. Please forgive any foolish stuff ;

Event OnControlDown(string control)

If control == "Activate" && keyhole_mode.GetValue() == 1

FadeToBlackHoldImod.Apply()
SittingAngleLimit.SetValue(0)
		PlayerRef.Moveto(chair1)
		chair2.Disable()
		Utility.Wait(0.3)
		chair2.delete()
		chair2 = none
		PlayerRef.Moveto(chair1)
		keyhole_mode.SetValue(2)
		Keyhole.CloseKeyholeMenu() 


If TheDoor.GetLockLevel() == 0
TheDoor.Lock()
TheDoor.lock(false)
	;we do this to make sure the door is closed in case it was not a loading cell door
endif

If DoorWasLocked == False
TheDoor.Lock()
TheDoor.Lock(false)
endif

If DoorWasLocked == True
TheDoor.Lock()
endif

If keyhole_NoForcedThirdPerson.GetValue() == 0
		Game.ForceThirdPerson()
endif
			VOCGeneral.SetFrequency(1)
			VFX.SetFrequency(1)
			VOCGeneral.SetVolume(1)
		Utility.Wait(0.2)

If keyhole_changefov.GetValue() == 1
ExecuteCommand("fov " + keyhole_defaultfov.GetValue())
endif

		ExecuteCommand("tdetect")
		Game.EnablePlayerControls(True, True, True, True, True, True, True)
		PlayerRef.RemoveSpell(Invisibility)
		PlayerREF.SetAlpha(1.0)
		PlayerREF.SetGhost(False)

If Keyhole_DisableSaving.GetValue() == 1
	; nothing, player disabled the mod messing with this
else
	Game.SetInChargen(false, false, false)
endif

UnregisterForControl("Activate")
FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
;FadeToBlackBackImod.Apply()
FollowerFollow()

Utility.Wait(1)
FadeToBlackBackImod.Remove()
FadeToBlackImod.Remove()
FadeToBlackHoldImod.Remove()


Utility.Wait(3.5)
;VFX.UnMute()
chair1.Disable()
Utility.Wait(3.5)
keyhole_mode.SetValue(0)
chair1.delete()
chair1 = none
endif
EndEvent


Function FollowerStaph()
    Quest f = Game.getFormFromFile(0x0000434F, "nwsFollowerFramework.esp") as Quest   
    bFollowNFF = new int[12]
    if(f)
        nwsfollowercontrollerscript NFC = f as nwsfollowercontrollerscript
        int count = 0
        While count < 12
            ReferenceAlias CA = NFC.varScript.DialogueFollower.GetAlias(count) as ReferenceAlias
            if CA
                actor follower = CA.GetActorReference()
                if follower 
                    if follower.GetActorValue("WaitingForPlayer") == 0
                        NFC.FollowerWaitHere(follower)
                        bFollowNFF[count] = 1
                    Else
                        bFollowNFF[count] = 0
                    EndIf
                EndIf
            EndIf
            count += 1
        EndWhile
    else
        if DialogueFollower.pFollowerAlias && DialogueFollower.pFollowerAlias.GetActorReference().GetActorValue("WaitingForPlayer") == 0
            DialogueFollower.FollowerWait()
            DialogueFollower.AnimalWait()
            bFollow = True
        Else
            bFollow = False
        EndIf
    endIf
endfunction
Function FollowerFollow()
    Quest f = Game.getFormFromFile(0x0000434F, "nwsFollowerFramework.esp") as Quest
    if(f)
        nwsfollowercontrollerscript NFC = f as nwsfollowercontrollerscript
        int count = 0
        While count < 12           
            ReferenceAlias CA = NFC.varScript.DialogueFollower.GetAlias(count) as ReferenceAlias
            if CA
                actor follower = CA.GetActorReference()
                if follower 
                    if bFollowNFF[count] == 1
                        NFC.FollowerFollowMe(follower)
                    EndIf
                EndIf
            EndIf
            count += 1
        EndWhile
    else
        if bFollow == True
            DialogueFollower.FollowerFollow()
            DialogueFollower.AnimalFollow()
        EndIf
    endif
endfunction