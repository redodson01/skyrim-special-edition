Scriptname ImmersiveHuntingHISSkinning Extends Quest

;====================================================================
;;																	
;;					  REALISTIC SKINNING FEATURE
;;
;;		This script allows the mod to use the Realistic Skinning 
;;      from Hunting in Skyrim(HiS). 
;;		If HiS' installed, the script will update the 
;;		skinning statistics and XP awarded after skinning a 
;;		supported animal.
;;		If HiS' not installed, however, the script will still 					
;;		"equip" the skinned armor on the animal, provided that the
;;		user have installed the textures and meshes from HiS.
;;
;;
;====================================================================

Armor Property HISSkinnedBearSkinAll Auto
Armor Property HISSkinnedCowSkinAll Auto
Armor Property HISSkinnedDeerSkinAll Auto
Armor Property HISSkinnedElkSkinAll Auto
Armor Property HISSkinnedFoxSkinAll Auto
Armor Property HISSkinnedGoatSkinAll Auto
Armor Property HISSkinnedHorkerSkinAll Auto
Armor Property HISSkinnedHorseSkinAll Auto
Armor Property HISSkinnedMammothSkinAll Auto
Armor Property HISSkinnedRabbitSkinAll Auto
Armor Property HISSkinnedSabreSkinAll Auto
Armor Property HISSkinnedTrollSkinAll Auto
Armor Property HISSkinnedWolfSkinAll Auto
Armor Property SHOSkinnedSkeeverSkinAll Auto
Armor Property SHOSkinnedWereWolfSkinAll Auto

Race Property BearBlackRace Auto
Race Property BearBrownRace Auto
Race Property BearSnowRace Auto
Race Property CartHorseRace Auto
Race Property CowRace Auto
Race Property DeerRace Auto
Race Property DLC1DeerGlowRace Auto
Race Property ElkRace Auto
Race Property FoxRace Auto
Race Property GoatDomesticsRace Auto
Race Property GoatRace Auto
Race Property HareRace Auto
Race Property HorkerRace Auto
Race Property HorseRace Auto
Race Property MammothRace Auto
Race Property SabreCatRace Auto
Race Property SabreCatSnowyRace Auto
Race Property DLC1SabreCatGlowRace Auto
Race Property TrollFrostRace Auto
Race Property TrollRace Auto
Race Property SkeeverRace Auto	
Race Property SkeeverWhiteRace Auto	
Race Property WerewolfRace Auto	
Race Property WolfRace Auto	

Function HISRealisticSkinning(Actor aCarcass, Form moPelt)
	Race rCarcassRace = aCarcass.GetRace()
	Quest HISHBQuest = Game.GetFormFromFile(0x0013F719, "Hunting in Skyrim.esp") as Quest
	
	HISStatsNoteScript1 HiSStatsScript
	HISRealisticSkinningScript HiSRealSkin
	HISModOptionsScript HiSModOptions
	HISHBSkinningScript HiSScript
	
	If HISHBQuest && !HiSScript; Is Hunting in Skyrim (normal) present, and object 0x0013F719 available?
		If !HISHBQuest.IsRunning()
			HISHBQuest.Start()
		EndIf
		HiSScript = (HISHBQuest as Quest) as HISHBSkinningScript
		HiSStatsScript = (Game.GetFormFromFile(0x000356BD, "Hunting in Skyrim.esp") as Quest) as HISStatsNoteScript1
		HiSRealSkin = (Game.GetFormFromFile(0x000356BD, "Hunting in Skyrim.esp") as Quest) as HISRealisticSkinningScript
		HiSModOptions = (Game.GetFormFromFile(0x000356BD, "Hunting in Skyrim.esp") as Quest) as HISModOptionsScript
		
		HiSModOptions.HISRealisticSkinningEnabled.SetValue(0) ; Disable Realistic Skinning System from Hunting and Skyrim and it use here instead.
	Else
		HiSScript = None
		HiSStatsScript = None
		HiSRealSkin = None
		HiSModOptions = None
	EndIf
	
	If rCarcassRace == BearBrownRace || rCarcassRace == BearBlackRace || rCarcassRace == BearSnowRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedBearSkinAll, True)
		If HiSStatsScript
			If rCarcassRace == BearBrownRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsBear)
			ElseIf rCarcassRace == BearBlackRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsBearCave)
			ElseIf rCarcassRace == BearSnowRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsBearSnow)
			EndIf
			
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == CowRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedCowSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsCow)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == DeerRace || rCarcassRace == DLC1DeerGlowRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedDeerSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsDeer)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == ElkRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedElkSkinAll, True)
		If HiSStatsScript
			If aCarcass.GetActorBase().GetSex()
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsElkFem)
			Else
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsElk)
			EndIf
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == FoxRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedFoxSkinAll, True)
		If HiSStatsScript
			If moPelt == (HiSRealSkin.FoxPeltSnow)
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsFoxSnow)
			Else
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsFox)
			EndIf
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == GoatRace || rCarcassRace == GoatDomesticsRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedGoatSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsGoat)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == HareRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedRabbitSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsHare)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == HorkerRace 
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedHorkerSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsHorker)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == HorseRace || rCarcassRace == CartHorseRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedHorseSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsHorse)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
		
	ElseIf rCarcassRace == MammothRace
		aCarcass.UnequipAll()
		aCarcass.EquipItem(HISSkinnedMammothSkinAll, True)
		If HiSStatsScript
			HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsMammoth)
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		EndIf
				
	ElseIf rCarcassRace == SabreCatRace || rCarcassRace == DLC1SabreCatGlowRace || rCarcassRace == SabreCatSnowyRace || (HiSScript && rCarcassRace == HiSScript.HISSabreCatBlackRace)
		aCarcass.UnequipAll()
		
		If HiSStatsScript
			If rCarcassRace == SabreCatRace || rCarcassRace == DLC1SabreCatGlowRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsSabre)
				aCarcass.EquipItem(HISSkinnedSabreSkinAll, True)
			ElseIf rCarcassRace == SabreCatSnowyRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsSabreSnow)
				HiSScript.SkinAnimalActual(aCarcass)
			Else
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsSabreBlack)
				HiSScript.SkinAnimalActual(aCarcass)
			EndIf
			
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		Else
			aCarcass.EquipItem(HISSkinnedSabreSkinAll, True)
		EndIf
				
	ElseIf rCarcassRace == TrollRace || rCarcassRace == TrollFrostRace || (HiSScript && rCarcassRace == HiSScript.HISTrollBossRace)
		aCarcass.UnequipAll()
		
		If HiSStatsScript
			HiSScript.SkinAnimalActual(aCarcass)
			
			If rCarcassRace == TrollFrostRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsTrollFrost)
			Else
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsTroll)
			EndIf
			
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		Else
			aCarcass.EquipItem(HISSkinnedTrollSkinAll, True)
		EndIf
									
	ElseIf rCarcassRace == WolfRace || (HiSScript && (rCarcassRace == HiSScript.HISWolfTimberRace || rCarcassRace == HiSScript.HISWolfWhiteRace))
		aCarcass.UnequipAll()

		If HiSStatsScript
			HiSScript.SkinAnimalActual(aCarcass)
			
			If moPelt == HiSRealSkin.WolfIcePelt
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsWolfIce)
			ElseIf rCarcassRace == WolfRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsWolf)
			ElseIf rCarcassRace == HiSScript.HISWolfTimberRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsWolfTimber)
				
			ElseIf rCarcassRace == HiSScript.HISWolfWhiteRace
				HiSStatsScript.AnimalSkinned(HiSRealSkin.HISSkinsWolfWhite)
			EndIf
			
			If HiSRealSkin.HISSkinDblEnable.Value == 1
				Game.GetPlayer().AddItem(moPelt, 1)
			EndIf
		Else
			aCarcass.EquipItem(HISSkinnedWolfSkinAll, True)
		EndIf
		
	ElseIf Game.IsPluginInstalled("Simple Hunting Overhaul.esp")
		If rCarcassRace == WerewolfRace
			aCarcass.UnequipAll()

			If HiSStatsScript
				If HiSRealSkin.HISSkinDblEnable.Value == 1
					Game.GetPlayer().AddItem(moPelt, 1)
				EndIf
			EndIf
			
			aCarcass.EquipItem(SHOSkinnedWereWolfSkinAll, True)
		ElseIf rCarcassRace == SkeeverRace || rCarcassRace == SkeeverWhiteRace
			aCarcass.UnequipAll()

			If HiSStatsScript
				If HiSRealSkin.HISSkinDblEnable.Value == 1
					Game.GetPlayer().AddItem(moPelt, 1)
				EndIf
			EndIf
			
			aCarcass.EquipItem(SHOSkinnedSkeeverSkinAll, True)
		EndIf
	EndIf
	
	If HiSStatsScript
		Float fXP = HiSRealSkin.GetSkinXPTotal(aCarcass)
		HiSStatsScript.AddXP(fXP, "skin")
		HiSStatsScript.UpdateCraftingStats()
	EndIf
	
EndFunction

