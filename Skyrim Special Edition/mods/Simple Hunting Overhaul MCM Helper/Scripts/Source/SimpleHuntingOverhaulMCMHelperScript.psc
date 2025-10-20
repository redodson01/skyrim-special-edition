ScriptName SimpleHuntingOverhaulMCMHelperScript Extends MCM_ConfigBase

;--- Properties -----------------------------------------------------------
GlobalVariable Property _HuntingXP Auto
Formlist Property _SHO_Blacklist Auto
GlobalVariable Property _FadeTimePass Auto
GlobalVariable Property _EnablePermits Auto
GlobalVariable Property _RemovePelts Auto
GlobalVariable Property SHO_EnablePlayerHorseSkinning Auto
GlobalVariable Property SHO_EnableDebugMessages Auto
GlobalVariable Property SHO_S Auto
GlobalVariable Property SHO_M Auto
GlobalVariable Property SHO_L Auto
GlobalVariable Property SHO_XL Auto
GlobalVariable Property SHO_XXL Auto
GlobalVariable Property _MinExperienceMult Auto
GlobalVariable Property _MinSkinningTime Auto
GlobalVariable Property _MaxSkinningTime Auto
GlobalVariable Property _SkinningTimeMammothDragon Auto
GlobalVariable Property _SkinningTimeBear Auto
GlobalVariable Property _SkinningTimeTrollWereWolf Auto
GlobalVariable Property _SkinningTimeSabreCat Auto
GlobalVariable Property _SkinningTimeHorseCow Auto
GlobalVariable Property _SkinningTimeElkDeer Auto
GlobalVariable Property _SkinningTimeWolfBoar Auto
GlobalVariable Property _SkinningTimeSkeeverDog Auto
GlobalVariable Property _SkinningTimeGoat Auto
GlobalVariable Property _SkinningTimeFox Auto
GlobalVariable Property _SkinningTimeRabbit Auto

;--- Private Variables ----------------------------------------------------
Bool migrated = False

;--- Functions ------------------------------------------------------------

; Returns version of this script.
Int Function GetVersion()
    return 1 ;MCM Helper
EndFunction 

; Event called periodically if the active magic effect/alias/form is registered for update events. This event will not be sent if the game is in menu mode. 
Event OnUpdate()
    parent.OnUpdate()
    MigrateToMCMHelperCheck("OnUpdate")
EndEvent

; Called when game is reloaded.
Event OnGameReload()
    parent.OnGameReload()
    MigrateToMCMHelperCheck("OnGameReload")
    If GetModSettingBool("bLoadSettingsonReload:Maintenance")
        LoadSettings()
        VerboseMessage("OnGameReload: Settings autoloaded!")
    EndIf
EndEvent

; Called when this config menu is opened.
Event OnConfigOpen()
    parent.OnConfigOpen()
    MigrateToMCMHelperCheck("OnConfigOpen")
    SetModSettingString("sCurrentHuntingXP:General", _HuntingXP.GetValueInt() as String)
EndEvent

; Called when this config menu is initialized.
Event OnConfigInit()
    parent.OnConfigInit()
    migrated = True
    LoadSettings()
EndEvent

; Called when setting changed to different value.
Event OnSettingChange(String a_ID)
    parent.OnSettingChange(a_ID)
    If a_ID == "iLootingTheAnimal:General"
        _FadeTimePass.SetValue(GetModSettingInt("iLootingTheAnimal:General") as Float)
    ElseIf a_ID == "bHuntersPermit:General"
        _EnablePermits.SetValue(GetModSettingBool("bHuntersPermit:General") as Float)
    ElseIf a_ID == "bSkinnedAnimalLook:General"
        _RemovePelts.SetValue(GetModSettingBool("bSkinnedAnimalLook:General") as Float)
    ElseIf a_ID == "bHorseSkinning:General"
        SHO_EnablePlayerHorseSkinning.SetValue(GetModSettingBool("bHorseSkinning:General") as Float)
    ElseIf a_ID == "iChangeXP:Cheats"
        _HuntingXP.SetValue(GetModSettingInt("iChangeXP:Cheats") as Float)
        SetModSettingString("sCurrentHuntingXP:General", _HuntingXP.GetValueInt() as String)
        RefreshMenu()
    ElseIf a_ID == "bDebugMessages:Debug"
        SHO_EnableDebugMessages.SetValue(GetModSettingBool("bDebugMessages:Debug") as Float)
    ElseIf a_ID == "iSmall:CarcassRewards"
        SHO_S.SetValue(GetModSettingInt("iSmall:CarcassRewards") as Float)
    ElseIf a_ID == "iMedium:CarcassRewards"
        SHO_M.SetValue(GetModSettingInt("iMedium:CarcassRewards") as Float)
    ElseIf a_ID == "iLarge:CarcassRewards"
        SHO_L.SetValue(GetModSettingInt("iLarge:CarcassRewards") as Float)
    ElseIf a_ID == "iXLarge:CarcassRewards"
        SHO_XL.SetValue(GetModSettingInt("iXLarge:CarcassRewards") as Float)
    ElseIf a_ID == "iXXLarge:CarcassRewards"
        SHO_XXL.SetValue(GetModSettingInt("iXXLarge:CarcassRewards") as Float)
    ElseIf a_ID == "iXPMinSkinningTime:SkinningTime"
        _MinExperienceMult.SetValue(GetModSettingInt("iXPMinSkinningTime:SkinningTime") / 100 as Float)
    ElseIf a_ID == "fMinimalSkinningTime:SkinningTime"
        _MinSkinningTime.SetValue(GetModSettingFloat("fMinimalSkinningTime:SkinningTime") as Float)
    ElseIf a_ID == "fMaximalSkinningTime:SkinningTime"
        _MaxSkinningTime.SetValue(GetModSettingFloat("fMaximalSkinningTime:SkinningTime") as Float)
    ElseIf a_ID == "fMammothDragon:AnimalsSkinningTime"
        _SkinningTimeMammothDragon.SetValue(GetModSettingFloat("fMammothDragon:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fBear:AnimalsSkinningTime"
        _SkinningTimeBear.SetValue(GetModSettingFloat("fBear:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fTrollWerewolf:AnimalsSkinningTime"
        _SkinningTimeTrollWereWolf.SetValue(GetModSettingFloat("fTrollWerewolf:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fSabrecat:AnimalsSkinningTime"
        _SkinningTimeSabreCat.SetValue(GetModSettingFloat("fSabrecat:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fHorseCow:AnimalsSkinningTime"
        _SkinningTimeHorseCow.SetValue(GetModSettingFloat("fHorseCow:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fElkDeer:AnimalsSkinningTime"
        _SkinningTimeElkDeer.SetValue(GetModSettingFloat("fElkDeer:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fWolfBoar:AnimalsSkinningTime"
        _SkinningTimeWolfBoar.SetValue(GetModSettingFloat("fWolfBoar:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fSkeeverDog:AnimalsSkinningTime"
        _SkinningTimeSkeeverDog.SetValue(GetModSettingFloat("fSkeeverDog:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fGoat:AnimalsSkinningTime"
        _SkinningTimeGoat.SetValue(GetModSettingFloat("fGoat:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fFox:AnimalsSkinningTime"
        _SkinningTimeFox.SetValue(GetModSettingFloat("fFox:AnimalsSkinningTime") as Float)
    ElseIf a_ID == "fRabbit:AnimalsSkinningTime"
        _SkinningTimeRabbit.SetValue(GetModSettingFloat("fRabbit:AnimalsSkinningTime") as Float)
    EndIf
EndEvent

; Called when a new page is selected, including the initial empty page.
Event OnPageSelect(String a_page)
    parent.OnPageSelect(a_page)
    If a_page == "$General_Page"
        SetModSettingString("sCurrentHuntingXP:General", "$1" as String)
        RefreshMenu()
    EndIf
EndEvent

Function Default()
    SetModSettingInt("iLootingTheAnimal:General", 1)
    SetModSettingBool("bHuntersPermit:General", True)
    SetModSettingBool("bSkinnedAnimalLook:General", True)
    SetModSettingBool("bHorseSkinning:General", False)
    SetModSettingInt("iChangeXP:Cheats", 1)
    SetModSettingBool("bDebugMessages:Debug", False)
    SetModSettingInt("iSmall:CarcassRewards", 20)
    SetModSettingInt("iMedium:CarcassRewards", 50)
    SetModSettingInt("iLarge:CarcassRewards", 75)
    SetModSettingInt("iXLarge:CarcassRewards", 100)
    SetModSettingInt("iXXLarge:CarcassRewards", 300)
    SetModSettingInt("iXPMinSkinningTime:SkinningTime", 20)
    SetModSettingFloat("fMinimalSkinningTime:SkinningTime", 0.15)
    SetModSettingFloat("fMaximalSkinningTime:SkinningTime", 4.0)
    SetModSettingFloat("fMammothDragon:AnimalsSkinningTime", 4.0)
    SetModSettingFloat("fBear:AnimalsSkinningTime", 2.66)
    SetModSettingFloat("fTrollWerewolf:AnimalsSkinningTime", 2.5)
    SetModSettingFloat("fSabrecat:AnimalsSkinningTime", 2.33)
    SetModSettingFloat("fHorseCow:AnimalsSkinningTime", 2.0)
    SetModSettingFloat("fElkDeer:AnimalsSkinningTime", 1.33)
    SetModSettingFloat("fWolfBoar:AnimalsSkinningTime", 1.0)
    SetModSettingFloat("fSkeeverDog:AnimalsSkinningTime", 0.75)
    SetModSettingFloat("fGoat:AnimalsSkinningTime", 0.66)
    SetModSettingFloat("fFox:AnimalsSkinningTime", 0.5)
    SetModSettingFloat("fRabbit:AnimalsSkinningTime", 0.15)
    SetModSettingBool("bEnabled:Maintenance", True)
    SetModSettingInt("iLoadingDelay:Maintenance", 0)
    SetModSettingBool("bLoadSettingsonReload:Maintenance", True)
    SetModSettingBool("bVerbose:Maintenance", False)
    VerboseMessage("Settings reset!")
    Load()
EndFunction

Function Load()
    _FadeTimePass.SetValue(GetModSettingInt("iLootingTheAnimal:General") as Float)
    _EnablePermits.SetValue(GetModSettingBool("bHuntersPermit:General") as Float)
    _RemovePelts.SetValue(GetModSettingBool("bSkinnedAnimalLook:General") as Float)
    SHO_EnablePlayerHorseSkinning.SetValue(GetModSettingBool("bHorseSkinning:General") as Float)
    SHO_EnableDebugMessages.SetValue(GetModSettingBool("bDebugMessages:Debug") as Float)
    SHO_S.SetValue(GetModSettingInt("iSmall:CarcassRewards") as Float)
    SHO_M.SetValue(GetModSettingInt("iMedium:CarcassRewards") as Float)
    SHO_L.SetValue(GetModSettingInt("iLarge:CarcassRewards") as Float)
    SHO_XL.SetValue(GetModSettingInt("iXLarge:CarcassRewards") as Float)
    SHO_XXL.SetValue(GetModSettingInt("iXXLarge:CarcassRewards") as Float)
    _MinExperienceMult.SetValue(GetModSettingInt("iXPMinSkinningTime:SkinningTime") / 100 as Float)
    _MinSkinningTime.SetValue(GetModSettingFloat("fMinimalSkinningTime:SkinningTime") as Float)
    _MaxSkinningTime.SetValue(GetModSettingFloat("fMaximalSkinningTime:SkinningTime") as Float)
    _SkinningTimeMammothDragon.SetValue(GetModSettingFloat("fMammothDragon:AnimalsSkinningTime") as Float)
    _SkinningTimeBear.SetValue(GetModSettingFloat("fBear:AnimalsSkinningTime") as Float)
    _SkinningTimeTrollWereWolf.SetValue(GetModSettingFloat("fTrollWerewolf:AnimalsSkinningTime") as Float)
    _SkinningTimeSabreCat.SetValue(GetModSettingFloat("fSabrecat:AnimalsSkinningTime") as Float)
    _SkinningTimeHorseCow.SetValue(GetModSettingFloat("fHorseCow:AnimalsSkinningTime") as Float)
    _SkinningTimeElkDeer.SetValue(GetModSettingFloat("fElkDeer:AnimalsSkinningTime") as Float)
    _SkinningTimeWolfBoar.SetValue(GetModSettingFloat("fWolfBoar:AnimalsSkinningTime") as Float)
    _SkinningTimeSkeeverDog.SetValue(GetModSettingFloat("fSkeeverDog:AnimalsSkinningTime") as Float)
    _SkinningTimeGoat.SetValue(GetModSettingFloat("fGoat:AnimalsSkinningTime") as Float)
    _SkinningTimeFox.SetValue(GetModSettingFloat("fFox:AnimalsSkinningTime") as Float)
    _SkinningTimeRabbit.SetValue(GetModSettingFloat("fRabbit:AnimalsSkinningTime") as Float)
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

Function MigrateToMCMHelperCheck(String EventName)
    If !migrated
    	migrated = True
    	If MiscUtil.FileExists("Data/MCM/Settings/Simple Hunting Overhaul MCM Helper.ini")
    		VerboseMessage(EventName + ": Settings file found, importing aborted!")
    		Return
    	EndIf
    	MigrateToMCMHelper()
    	VerboseMessage(EventName + ": Settings imported!")
    EndIf
EndFunction

Function MigrateToMCMHelper()
    ; Migrating to MCM Helper
    SetModSettingInt("iLootingTheAnimal:General", _FadeTimePass.GetValue() as Int)
    SetModSettingBool("bHuntersPermit:General", _EnablePermits.GetValue() as Bool)
    SetModSettingBool("bSkinnedAnimalLook:General", _RemovePelts.GetValue() as Bool)
    SetModSettingBool("bHorseSkinning:General", SHO_EnablePlayerHorseSkinning.GetValue() as Bool)
    SetModSettingBool("bDebugMessages:Debug", SHO_EnableDebugMessages.GetValue() as Bool)
    SetModSettingInt("iSmall:CarcassRewards", SHO_S.GetValue() as Int)
    SetModSettingInt("iMedium:CarcassRewards", SHO_M.GetValue() as Int)
    SetModSettingInt("iLarge:CarcassRewards", SHO_L.GetValue() as Int)
    SetModSettingInt("iXLarge:CarcassRewards", SHO_XL.GetValue() as Int)
    SetModSettingInt("iXXLarge:CarcassRewards", SHO_XXL.GetValue() as Int)
    SetModSettingInt("iXPMinSkinningTime:SkinningTime", (_MinExperienceMult.GetValue() * 100) as Int)
    SetModSettingFloat("fMinimalSkinningTime:SkinningTime", _MinSkinningTime.GetValue())
    SetModSettingFloat("fMaximalSkinningTime:SkinningTime", _MaxSkinningTime.GetValue())
    SetModSettingFloat("fMammothDragon:AnimalsSkinningTime", _SkinningTimeMammothDragon.GetValue())
    SetModSettingFloat("fBear:AnimalsSkinningTime", _SkinningTimeBear.GetValue())
    SetModSettingFloat("fTrollWerewolf:AnimalsSkinningTime", _SkinningTimeTrollWereWolf.GetValue())
    SetModSettingFloat("fSabrecat:AnimalsSkinningTime", _SkinningTimeSabreCat.GetValue())
    SetModSettingFloat("fHorseCow:AnimalsSkinningTime", _SkinningTimeHorseCow.GetValue())
    SetModSettingFloat("fElkDeer:AnimalsSkinningTime", _SkinningTimeElkDeer.GetValue())
    SetModSettingFloat("fWolfBoar:AnimalsSkinningTime", _SkinningTimeWolfBoar.GetValue())
    SetModSettingFloat("fSkeeverDog:AnimalsSkinningTime", _SkinningTimeSkeeverDog.GetValue())
    SetModSettingFloat("fGoat:AnimalsSkinningTime", _SkinningTimeGoat.GetValue())
    SetModSettingFloat("fFox:AnimalsSkinningTime", _SkinningTimeFox.GetValue())
    SetModSettingFloat("fRabbit:AnimalsSkinningTime", _SkinningTimeRabbit.GetValue())
EndFunction

Function VerboseMessage(String m)
    Debug.Trace("[Simple Hunting Overhaul] " + m)
    If GetModSettingBool("bVerbose:Maintenance")
        Debug.Notification("[Simple Hunting Overhaul] " + m)
    EndIf
EndFunction
