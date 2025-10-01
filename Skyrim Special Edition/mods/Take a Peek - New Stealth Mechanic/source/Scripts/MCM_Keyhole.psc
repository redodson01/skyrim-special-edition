Scriptname MCM_Keyhole extends ski_configbase  

GlobalVariable Property keyhole_changefov Auto
GlobalVariable Property keyhole_defaultFOV Auto
GlobalVariable Property keyhole_tempFOV Auto
GlobalVariable Property keyhole_movement Auto
GlobalVariable Property keyhole_reactions Auto
GlobalVariable Property keyhole_sneakmethod Auto

GlobalVariable Property keyhole_DisableSaving Auto
GlobalVariable Property keyhole_NoForcedThirdPerson Auto
GlobalVariable Property SomewhaLimited_keyhole Auto

Spell property SpyThroughKeyhole_spell auto
actor property playerref auto

int hotkey_B
int camera_B
int ChangeFov_B
int AllowReactions_B
int DefaultFOV_s
int KeyHoleFOV_s
int DisableSaving_b
int NoThird_b
int Limited_b

float DefaultFov = 75.0
float KeyHoleFOV = 115.0

bool Hotkey_Toggle = False
bool Camera_Toggle = True
bool ChangeFov_Toggle = True
bool AllowReactions_Toggle = True
bool disablesaving_Toggle = False
bool nothird_toggle = False
bool limited_toggle = True


keyhole_exit Property Player auto

event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "Settings"
EndEvent

Event OnPageReset(string page)

	If (page == "")
		
		LoadCustomContent("MCM/MCM_KeyHole.dds", 0.0, 0.0)
		Else
		UnloadCustomContent()
	Endif

	If (page == "Settings")
SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("Method of Activation")
		AddHeaderOption("Camera Movement")
		AddEmptyOption()
		AddEmptyOption()
		hotkey_B = AddToggleOption("Activate With Hotkey", Hotkey_Toggle)
		Camera_B = AddToggleOption("Allow Camera Movement", Camera_Toggle)
		AddEmptyOption()
		Limited_B = AddToggleOption("Realistic Vision Limit", Limited_Toggle)
		AddEmptyOption()
		AddEmptyOption()
		AddHeaderOption("NPC Reactions")
		AddHeaderOption("FOV Options")
		AddEmptyOption()
		AddEmptyOption()
		AllowReactions_B = AddToggleOption("Allow Reactions", AllowReactions_Toggle)
		ChangeFOV_B = AddToggleOption("Change FOV", ChangeFOV_Toggle)
		NoThird_b = AddToggleOption("Stay In First Person", NoThird_Toggle)		
if ChangeFOV_Toggle == True
		DefaultFOV_s = AddSliderOption("Normal FOV:", DefaultFov, "{0}")
		DisableSaving_b = AddToggleOption("Turn Off Auto-Save Disabling", DisableSaving_Toggle)
		KeyHoleFOV_s = AddSliderOption("Keyhole FOV:", KeyHoleFOV, "{0}")

else
		AddEmptyOption()
		DisableSaving_b = AddToggleOption("Turn Off Auto-Save Disabling", DisableSaving_Toggle)
endif
	Endif
EndEvent


event OnOptionSelect(int option)

If (option == hotkey_B) && hotkey_Toggle == True
		hotkey_Toggle = False
		SetToggleOptionValue(Hotkey_B, Hotkey_Toggle)
		keyhole_sneakmethod.SetValue(0)
		PlayerRef.AddSpell(SpyThroughKeyhole_spell)
		Player.RegisterSneak()
	elseif (option == hotkey_B) && hotkey_Toggle == False
		hotkey_Toggle = True
		SetToggleOptionValue(hotkey_B, hotkey_Toggle)
		keyhole_sneakmethod.SetValue(1)
		PlayerRef.RemoveSpell(SpyThroughKeyhole_spell)
		Player.RegisterSneak()

elseif (option == Camera_B) && Camera_Toggle == True
		Camera_Toggle = False
		SetToggleOptionValue(Camera_B, Camera_Toggle)
		keyhole_movement.SetValue(0)
	elseif (option == Camera_B) && Camera_Toggle == False
		Camera_Toggle = True
		SetToggleOptionValue(Camera_B, Camera_Toggle)
		keyhole_movement.SetValue(1)

elseif (option == ChangeFOV_B) && ChangeFOV_Toggle == True
		ChangeFOV_Toggle = False
		SetToggleOptionValue(ChangeFOV_B, ChangeFOV_Toggle)
		keyhole_changefov.SetValue(0)
		ForcePageReset()
	elseif (option == ChangeFOV_B) && ChangeFOV_Toggle == False
		ChangeFOV_Toggle = True
		SetToggleOptionValue(ChangeFOV_B, ChangeFOV_Toggle)
		keyhole_changefov.SetValue(1)
		ForcePageReset()

elseif (option == AllowReactions_B) && AllowReactions_Toggle == True
		AllowReactions_Toggle = False
		SetToggleOptionValue(AllowReactions_B, AllowReactions_Toggle)
		keyhole_reactions.SetValue(0)
	elseif (option == AllowReactions_B) && AllowReactions_Toggle == False
		AllowReactions_Toggle = True
		SetToggleOptionValue(AllowReactions_B, AllowReactions_Toggle)
		keyhole_reactions.SetValue(1)

elseif (option == DisableSaving_B) && DisableSaving_Toggle == True
		DisableSaving_Toggle = False
		SetToggleOptionValue(DisableSaving_B, DisableSaving_Toggle)
		keyhole_DisableSaving.SetValue(0)
	elseif (option == DisableSaving_B) && DisableSaving_Toggle == False
		DisableSaving_Toggle = True
		SetToggleOptionValue(DisableSaving_B, DisableSaving_Toggle)
		keyhole_DisableSaving.SetValue(1)

elseif (option == NoThird_B) && NoThird_Toggle == True
		NoThird_Toggle = False
		SetToggleOptionValue(NoThird_B, NoThird_Toggle)
		keyhole_NoForcedThirdPerson.SetValue(0)
	elseif (option == NoThird_B) && NoThird_Toggle == False
		NoThird_Toggle = True
		SetToggleOptionValue(NoThird_B, NoThird_Toggle)
		keyhole_NoForcedThirdPerson.SetValue(1)

elseif (option == Limited_B) && Limited_Toggle == True
		Limited_Toggle = False
		SetToggleOptionValue(Limited_B, Limited_Toggle)
		SomewhaLimited_keyhole.SetValue(0)
	elseif (option == Limited_B) && Limited_Toggle == False
		Limited_Toggle = True
		SetToggleOptionValue(Limited_B, Limited_Toggle)
		SomewhaLimited_keyhole.SetValue(1)
endif
endevent

event OnOptionSliderOpen(int option)
	if (option == DefaultFOV_s)
		SetSliderDialogStartValue(defaultFOV)
		SetSliderDialogDefaultValue(75.0)
		SetSliderDialogRange(50.0, 180.0)
		SetSliderDialogInterval(1.0)
	
		elseif (option == KeyHoleFOV_s)
		SetSliderDialogStartValue(KeyHoleFOV)
		SetSliderDialogDefaultValue(115.0)
		SetSliderDialogRange(35.0, 250.0)
		SetSliderDialogInterval(1.0)
	endif
endevent


event OnOptionSliderAccept(int option, float value)
	if (option == defaultFOV_s)
		defaultFOV = value
		keyhole_defaultFOV.SetValue(defaultFOV )
		SetSliderOptionValue(defaultFOV_S, defaultFOV, "{0}")

	elseIf (option == KeyHoleFOV_s)
		KeyHoleFOV= value
		keyhole_tempFOV.SetValue(KeyHoleFOV)
		SetSliderOptionValue(KeyHoleFOV_S, KeyHoleFOV, "{0}")
	endIf
endEvent

event OnOptionHighlight(int option) 

if (option == ChangeFov_b) 
SetInfoText("Only works if you have ConsoleUtil Installed.\nThis will enable a different FOV when in 'peeking' mode. Default: On.") 
elseif (option == hotkey_b) 
SetInfoText("Removes the 'Peeking' spell from your list of abilities. Instead, you can activate the ability\n by pressing your SNEAK key for longer than a second. Default: Off.") 
elseif (option == camera_b) 
SetInfoText("You can move the camera while in 'peeking' mode.\nDisable this to lock the camera in place. More realistic, but less fun. Default: On.") 
elseif (option == AllowReactions_b) 
SetInfoText("If enabled, NPCs might react to your peeking if seen exiting the mode.\nThey will be like 'I saw you do that, you know!' Default: On.") 
elseif (option == defaultFOV_s) 
SetInfoText("You should enter your preferred normal-gameplay FOV here.\nThe game will return to this value after exiting 'peeking mode'. Default: 75.") 
elseif (option == keyholeFOV_s) 
SetInfoText("FOV value while in Peeking mode. Reduce this for more a focused/zoomed\n camera, or increase it for a more 'fish eye' lens effect. Default: 115.") 
elseif (option == disablesaving_b) 
SetInfoText("My mod disables auto-saves and saving while you're peeking.Very recommended to leave this off\n but adding the option in case you use a mod that disables saving already. Default: Off.") 
elseif (option == nothird_b) 
SetInfoText("After peeking, the game returns you to the Third Person camera.\nEnabling this option will always return you back to first person, no matter what. Default: Off.") 
elseif (option == limited_b) 
SetInfoText("Camera movement while peeking is allowed, but realistically limited. Please, note: For this to work,\nthe option above must be enabled. IFPV users do not benefit from this option. Default: On.") 
Endif
EndEvent
