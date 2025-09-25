Scriptname ImmersiveHuntingMCM extends MCM_ConfigBase  

ImmersiveHuntingFunctions Property ihFunctions Auto

Event OnGameReload()
    Parent.OnGameReload()
	LoadSettings()
EndEvent

Event OnConfigInit()
	LoadSettings()
EndEvent

Event OnSettingChange(String a_ID)
	If a_ID == "iStartMod:Main"
		ihFunctions.StartMod(GetModSettingInt(a_ID) as Bool)
	ElseIf a_ID == "iLootMode:Main"
		ihFunctions.IH_LootMode.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableProcess:Main"
		ihFunctions.IH_EnableProcess.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableRemoveArrow:Main"
		ihFunctions.IH_EnableRemoveArrow.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableSkin:Main"
		ihFunctions.IH_EnableSkin.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableHarvest:Main"
		ihFunctions.IH_EnableHarvest.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableButcher:Main"
		ihFunctions.IH_EnableButcher.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableExtract:Main"
		ihFunctions.IH_EnableExtract.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iPossibleAnimations:Main"
		ihFunctions.IH_PossibleAnimations.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnablePickup:Main"
		ihFunctions.EnablePickup(GetModSettingInt(a_ID) as Bool)
	ElseIf a_ID == "iEnableCampfire:Main"
		ihFunctions.IH_EnableCampfire.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableDisplay:Main"
		ihFunctions.IH_EnableDisplays.SetValue(GetModSettingInt(a_ID) as Int)
		ihFunctions.ToggleDisplays(ihFunctions.IH_EnableDisplays.GetValue())
	ElseIf a_ID == "iRequireDagger:Main"
		ihFunctions.IH_RequireDagger.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iDaggerPosition:Main"
		If GetModSettingInt("iDaggerPosition:Main") == 0
			ihFunctions.IH_DaggerPosition.SetValue(0)
		Else
			ihFunctions.IH_DaggerPosition.SetValue(10)
		EndIf
		IED.Evaluate(ihFunctions.PlayerRef)
	ElseIf a_ID == "iUpdateDagger:Main"
		ihFunctions.UpdateDagger(GetModSettingInt(a_ID) as Bool)
	ElseIf a_ID == "iEnableTorch:Main"
		ihFunctions.IH_EnableTorch.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableDispose:Main"
		ihFunctions.IH_EnableDispose.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableShovel:Main"
		ihFunctions.IH_EnableShovelDispose.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iForceThirdPerson:Main"
		ihFunctions.IH_ForceThirdPerson.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iSheatheWeapons:Main"
		ihFunctions.IH_SheatheWeapons.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableSouls:Main"
		ihFunctions.IH_EnableSouls.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableQuickLoot:Main"
		ihFunctions.EnableQuickLootSupport(GetModSettingInt("iEnableQuickLoot:Main") as Bool)
	ElseIf a_ID == "iEnableRequireBottle:Main"
		ihFunctions.IH_RequireBottle.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableBowAnim:Main"
		ihFunctions.IH_UseBowAnim.SetValue(GetModSettingInt(a_ID) as Int)
	ElseIf a_ID == "iEnableRealisticSkin:Main"
		ihFunctions.IH_EnableRealisticSkin.SetValue(GetModSettingInt(a_ID) as Int)
	EndIf
EndEvent

Function LoadSettings()
	Utility.Wait(3)
	
	If GetModSettingInt("iDaggerPosition:Main") == 0
		ihFunctions.IH_DaggerPosition.SetValue(0)
	Else
		ihFunctions.IH_DaggerPosition.SetValue(10)
	EndIf
	
	ihFunctions.StartMod(GetModSettingInt("iStartMod:Main") as Bool)
	ihFunctions.IH_LootMode.SetValue(GetModSettingInt("iLootMode:Main") as Int)
	ihFunctions.IH_EnableProcess.SetValue(GetModSettingInt("iEnableProcess:Main") as Int)
	ihFunctions.IH_EnableRemoveArrow.SetValue(GetModSettingInt("iEnableRemoveArrow:Main") as Int)
	ihFunctions.IH_EnableSkin.SetValue(GetModSettingInt("iEnableSkin:Main") as Int)
	ihFunctions.IH_EnableHarvest.SetValue(GetModSettingInt("iEnableHarvest:Main") as Int)
	ihFunctions.IH_EnableButcher.SetValue(GetModSettingInt("iEnableButcher:Main") as Int)
	ihFunctions.IH_EnableExtract.SetValue(GetModSettingInt("iEnableExtract:Main") as Int)
	ihFunctions.IH_PossibleAnimations.SetValue(GetModSettingInt("iPossibleAnimations:Main") as Int)
	ihFunctions.EnablePickup(GetModSettingInt("iEnablePickup:Main") as Bool)
	ihFunctions.IH_EnableCampfire.SetValue(GetModSettingInt("iEnableCampfire:Main") as Int)
	ihFunctions.IH_EnableDisplays.SetValue(GetModSettingInt("iEnableDisplay:Main") as Int)
	ihFunctions.ToggleDisplays(ihFunctions.IH_EnableDisplays.GetValue())
	ihFunctions.UpdateDagger(GetModSettingInt("iUpdateDagger:Main") as Bool)
	ihFunctions.IH_RequireDagger.SetValue(GetModSettingInt("iRequireDagger:Main") as Int)
	ihFunctions.IH_EnableTorch.SetValue(GetModSettingInt("iEnableTorch:Main") as Int)
	ihFunctions.IH_EnableDispose.SetValue(GetModSettingInt("iEnableDispose:Main") as Int)
	ihFunctions.IH_EnableShovelDispose.SetValue(GetModSettingInt("iEnableShovel:Main") as Int)
	ihFunctions.IH_ForceThirdPerson.SetValue(GetModSettingInt("iForceThirdPerson:Main") as Int)
	ihFunctions.IH_SheatheWeapons.SetValue(GetModSettingInt("iSheatheWeapons:Main") as Int)
	ihFunctions.IH_EnableSouls.SetValue(GetModSettingInt("iEnableSouls:Main") as Int)
	ihFunctions.EnableQuickLootSupport(GetModSettingInt("iEnableQuickLoot:Main") as Bool)
	ihFunctions.IH_RequireBottle.SetValue(GetModSettingInt("iEnableRequireBottle:Main") as Int)
	ihFunctions.IH_UseBowAnim.SetValue(GetModSettingInt("iEnableBowAnim:Main") as Int)
	ihFunctions.IH_EnableRealisticSkin.SetValue(GetModSettingInt("iEnableRealisticSkin:Main") as Int)
	
	If !ihFunctions.isIEDInstalled
		SetModSettingInt("iEnablePickup:Main", 0)
	EndIf
	
EndFunction