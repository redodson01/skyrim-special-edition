Scriptname Taunting_MCM extends SKI_ConfigBase  

GlobalVariable Property Taunting_Sounds Auto
GlobalVariable Property Taunt_Hotkey Auto 
GlobalVariable Property Taunt_Forced Auto 

Actor Property PlayerRef Auto
Spell Property TauntingMatters_PlayerSpell Auto


bool HideAbility_Toggle = False
bool sounds_toggle = True
bool forced_toggle = false

int HideAbility_b
int sounds_b
int forced_b

event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "Settings"
EndEvent

Event OnPageReset(string page)

	If (page == "")
		
		LoadCustomContent("MCM/MCM_Taunt.dds", 0.0, 0.0)
		Else
		UnloadCustomContent()
	Endif

	If (page == "Settings")
SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("Method of Activation")
		AddHeaderOption("Additional Options")
		AddEmptyOption()
		AddEmptyOption()
		HideAbility_B = AddToggleOption("Hide Ability", HideAbility_Toggle)
		Sounds_B = AddToggleOption("Enable Sounds", Sounds_Toggle)
		AddKeyMapOptionST("FILLHOTKEY","Taunt Hotkey", Taunt_Hotkey.GetValue() as int, OPTION_FLAG_WITH_UNMAP)
		Forced_B = AddToggleOption("Grunting Expression", Forced_Toggle)
	endif
endevent



event OnOptionSelect(int option)

If (option == HideAbility_B) && HideAbility_Toggle == True
		HideAbility_Toggle = False
		SetToggleOptionValue(HideAbility_B, HideAbility_Toggle)
		PlayerRef.AddSpell(TauntingMatters_PlayerSpell)

	elseif (option == HideAbility_B) && HideAbility_Toggle == False
		HideAbility_Toggle = True
		SetToggleOptionValue(HideAbility_B, HideAbility_Toggle)
		PlayerRef.RemoveSpell(TauntingMatters_PlayerSpell)

elseif (option == sounds_B) && sounds_Toggle == True
		sounds_Toggle = False
		SetToggleOptionValue(sounds_B, sounds_Toggle)
		Taunting_Sounds.SetValue(0)

	elseif (option == sounds_B) && sounds_Toggle == False
		sounds_Toggle = True
		SetToggleOptionValue(sounds_B, sounds_Toggle)
		Taunting_Sounds.SetValue(1)

elseif (option == forced_B) && forced_Toggle == True
		forced_Toggle = False
		SetToggleOptionValue(forced_B, forced_Toggle)
		Taunt_forced.SetValue(0)

	elseif (option == forced_B) && forced_Toggle == False
		forced_Toggle = True
		SetToggleOptionValue(forced_B, forced_Toggle)
		Taunt_forced.SetValue(1)
endif
endevent

STATE FILLHOTKEY
    Event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
        UnregisterForKey(Taunt_Hotkey.GetValueInt())
		Taunt_Hotkey.SetValue(keyCode)
        SetKeyMapOptionValueST(Taunt_Hotkey.GetValueInt(), OPTION_FLAG_WITH_UNMAP)
		RegisterForKey(keycode)
    EndEvent

    Event OnHighlightST()  
        SetInfoText("OPTIONAL: You can set a hotkey to activate the taunt ability.")
    EndEvent
ENDSTATE

Event OnKeyDown(Int KeyCode)

    int TheHotkey = Taunt_Hotkey.GetValue() as int
	UnregisterForKey(TheHotkey)

    If !UI.IsTextInputEnabled() && !Utility.IsInMenuMode()
        if(KeyCode == TheHotkey)
		TauntingMatters_PlayerSpell.cast(playerref)
	endif
	endif

    if (TheHotkey> -1)
        RegisterForKey(TheHotkey)
    endif

EndEvent

Event OnOptionHighlight(int option) 

if (option == HideAbility_b) 
SetInfoText("This removes the Taunt ability from your menu.\nYou can still activate the taunt ability via the hotkey. Default: Off.") 
elseif (option == sounds_b) 
SetInfoText("Disable this if you don't want your character to grunt while taunting.\nThis is boring but hey, your choice! Default: Off.") 
elseif (option == forced_b) 
SetInfoText("This requires MFG, Conditional Expressions or similar. Your character will open\ntheir mouth while grunting. You usually can't see it so up to you. Default: Off.") 
endif
endevent