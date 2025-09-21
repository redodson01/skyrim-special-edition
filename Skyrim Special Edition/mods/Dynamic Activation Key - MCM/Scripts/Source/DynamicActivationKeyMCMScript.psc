ScriptName DynamicActivationKeyMCMScript Extends MCM_ConfigBase

;--- Imports --------------------------------------------------------------
import DynamicActivationKey

;--- Functions ------------------------------------------------------------

; Returns version of this script.
Int Function GetVersion()
    return 1 ;MCM Helper
EndFunction 

; Called when game is reloaded.
Event OnGameReload()
    parent.OnGameReload()
    If GetModSettingBool("bLoadSettingsonReload:Maintenance")
        LoadSettings()
        VerboseMessage("OnGameReload: Settings autoloaded!")
    EndIf
EndEvent

; Called when this config menu is initialized.
Event OnConfigInit()
    parent.OnConfigInit()
    LoadSettings()
EndEvent

; Called when setting changed to different value.
Event OnSettingChange(String a_ID)
    parent.OnSettingChange(a_ID)
    If a_ID == "iHotkey:General"
        SetModKeySetting(GetModSettingInt("iHotkey:General"))
    ElseIf a_ID == "iAssignKey:Controller"
        SetModControllerKeySetting(265 + GetModSettingInt("iAssignKey:Controller"))
    EndIf
EndEvent

; Called when a new page is selected, including the initial empty page.
Event OnPageSelect(String a_page)
    parent.OnPageSelect(a_page)
EndEvent

Function Default()
    SetModSettingInt("iHotkey:General", 42)
    SetModSettingInt("iAssignKey:Controller", 9)
    SetModSettingBool("bEnabled:Maintenance", True)
    SetModSettingInt("iLoadingDelay:Maintenance", 0)
    SetModSettingBool("bLoadSettingsonReload:Maintenance", True)
    SetModSettingBool("bVerbose:Maintenance", False)
    VerboseMessage("Settings reset!")
    Load()
EndFunction

Function Load()
    SetModKeySetting(GetModSettingInt("iHotkey:General"))
    SetModControllerKeySetting(265 + GetModSettingInt("iAssignKey:Controller"))
    VerboseMessage("Settings applied!")
EndFunction

Function LoadSettings()
    If GetModSettingBool("bEnabled:Maintenance") == false
        return
    EndIf
    Utility.Wait(GetModSettingInt("iLoadingDelay:Maintenance"))
    VerboseMessage("Settings autoloaded!")
    Load()
EndFunction

Function VerboseMessage(String m)
    Debug.Trace("[Dynamic Activation Key] " + m)
    If GetModSettingBool("bVerbose:Maintenance")
        Debug.Notification("[Dynamic Activation Key] " + m)
    EndIf
EndFunction
