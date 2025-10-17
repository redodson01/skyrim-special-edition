Scriptname ImmersiveHuntingFunctions extends Quest  

Import Debug
import IED

Actor Property PlayerRef  Auto  

ImmersiveHuntingPlayerAlias Property ihPlayerAlias Auto
ImmersiveHuntingAnimalAlias Property ihAnimalAlias Auto
ImmersiveHuntingHISSkinning Property ihRealisticSkin Auto

GlobalVariable Property IH_ChickenDisplay Auto
GlobalVariable Property IH_DeerDisplay Auto
GlobalVariable Property IH_DogDisplay Auto
GlobalVariable Property IH_ElkDisplay Auto
GlobalVariable Property IH_ElkFemaleDisplay Auto
GlobalVariable Property IH_FoxDisplay Auto
GlobalVariable Property IH_FoxSnowDisplay Auto
GlobalVariable Property IH_GoatDisplay Auto
GlobalVariable Property IH_HareDisplay Auto
GlobalVariable Property IH_MudcrabDisplay Auto
GlobalVariable Property IH_FishDisplay Auto
GlobalVariable Property IH_SkeeverDisplay Auto
GlobalVariable Property IH_ValeDeerDisplay Auto
GlobalVariable Property IH_WolfDisplay Auto
GlobalVariable Property IH_WolfIceDisplay Auto

GlobalVariable Property IH_LootMode Auto
GlobalVariable Property IH_EnableProcess Auto
GlobalVariable Property IH_EnableRemoveArrow Auto
GlobalVariable Property IH_EnableSkin Auto
GlobalVariable Property IH_EnableHarvest Auto
GlobalVariable Property IH_EnableButcher Auto
GlobalVariable Property IH_EnableExtract Auto
GlobalVariable Property IH_PossibleAnimations Auto
GlobalVariable Property IH_DaggerPosition Auto
GlobalVariable Property IH_UseLastDagger Auto
GlobalVariable Property IH_RequireDagger Auto
GlobalVariable Property IH_EnablePickUp Auto
GlobalVariable Property IH_ForceThirdPerson Auto
GlobalVariable Property IH_SheatheWeapons Auto
GlobalVariable Property IH_EnableDisplays Auto
GlobalVariable Property IH_EnableTorch Auto
GlobalVariable Property IH_EnableSouls Auto
GlobalVariable Property IH_EnableQuickLoot Auto
GlobalVariable Property IH_EnableCampfire Auto
GlobalVariable Property IH_EnableDispose Auto
GlobalVariable Property IH_EnableShovelDispose Auto
GlobalVariable Property IH_EnableRealisticSkin Auto
GlobalVariable Property IH_RequireBottle Auto
GlobalVariable Property IH_UseBowAnim Auto
GlobalVariable Property IH_AnimTrigger Auto
GlobalVariable Property IH_HasArrows Auto
GlobalVariable Property IH_HasPelt Auto
GlobalVariable Property IH_HasMaterial Auto
GlobalVariable Property IH_HasMeat Auto
GlobalVariable Property IH_HasPotion Auto

Form Property AnimObjectIronKnife Auto
FormList Property IH_FL_ClawRaces Auto

MiscObject Property IH_SkinnedToken Auto
MiscObject Property IH_HarvestedToken Auto
MiscObject Property IH_ButcheredToken Auto
MiscObject Property IH_ExtractedToken Auto
MiscObject Property IH_ProcessedToken Auto

Container Property IH_CO_DummyContainer Auto

Faction Property WolfFaction Auto

Message Property IH_MSG_LootPrompt Auto

Perk Property IH_PK_ImmersiveHunting Auto

Race Property ChickenRace Auto
Race Property DeerRace Auto
Race Property DLC1DeerGlowRace Auto
Race Property DogRace Auto
Race Property ElkRace Auto
Race Property FoxRace Auto
Race Property GoatRace Auto
Race Property GoatDomesticsRace Auto
Race Property HareRace Auto
Race Property MudcrabRace Auto
Race Property SlaughterfishRace Auto
Race Property SkeeverRace Auto
Race Property WolfRace Auto	

Bool Property isModEnabled Auto Hidden
Bool Property isIEDInstalled Auto Hidden
Bool Property isQuickLootAnim Auto Hidden
Bool Property bVenomRequiresBottles Auto Hidden

Form Property fHuntingPelt Auto Hidden
Form Property fHuntingArrow Auto Hidden
Form Property fHuntingBolt Auto Hidden
Form Property fHuntingMaterial Auto Hidden
Form Property fHuntingFood Auto Hidden
Form Property fHuntingPotion Auto Hidden
Form Property fCookedFood Auto Hidden

Bool isPlayerFemale
Bool isSmall
Bool isFast
Bool isDrawnWeapon
Bool isBusy
Bool hasTorch
Bool isFirstPerson
Bool isProcessing
Bool bArrowRemoved
Bool useBow

Int iQueueCurrent
Int iAnimCount
Int iQueueTotal
Int iCameraPluginVersion

Form fLeftHandItem
Form fHuntingDagger 
Form fEmptyBottle

Float[] fArrayPosition
Float[] fArrayRotation
Float fScale
Float fCurrentTime

GlobalVariable DynamicActivationKey
GlobalVariable FP_EnableLootAnimals
GlobalVariable FP_AnimTrigger

String sFilePath = "../StorageUtilData/ImmersiveHunting/"
 
; -- Stand up by Moving/Drawing/Jumping/Getting hit
;
Event OnControlDown(String control)
	If control == "Forward" || control == "Back" || control == "Strafe Left" || control == "Strafe Right" || control == "Jump"
		If PlayerRef.GetAnimationVariableBool("bAnimationDriven") && control != "Jump"
			StandUp()
		Else
			SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
			
			If PlayerRef.GetAnimationVariableBool("bInJumpState")
				SendAnimationEvent(PlayerRef, "JumpLand")
			EndIf
			
			isDrawnWeapon = False
		EndIf
		EndAnim(True)
	EndIf
EndEvent

; -- Tracks if player is still in animation event. There is a possibility that the animations get interrupted with some unexpected ways, this update here will cancel the process.
;
Event OnUpdate()
	If PlayerRef.GetAnimationVariableBool("bAnimationDriven")
		RegisterForSingleUpdate(4)
	Else
		EndAnim(True)
	EndIf
EndEvent

; -- Loads settings
Function LoadSettings()
	Utility.Wait(3)
	; Checks if IED is installed and verifies player sex 
	If GetScriptVersion() >= 8 
		isIEDInstalled = True

		If isPlayerFemale != PlayerRef.GetActorBase().GetSex()
			DeleteAll("ImmersiveHunting.esp")  ; Deletes all displays if player sex is different than before
		EndIf
		
		; Disable AnimObjects and uses IED displays functions instead if 
		If IH_EnableDisplays.GetValue()
			AnimObjectIronKnife.SetWorldModelPath("AnimObjects\\AnimObjectHuntingDagger_Invisible.nif")
		Else
			AnimObjectIronKnife.SetWorldModelPath("AnimObjects\\AnimObjectHuntingDagger.nif")
		EndIf
		isPlayerFemale = PlayerRef.GetActorBase().GetSex()
	Else
		isIEDInstalled = False
		EnablePickup(False)
		; Enable AnimObjects otherwise
		AnimObjectIronKnife.SetWorldModelPath("AnimObjects\\AnimObjectHuntingDagger.nif")
	EndIf
	
	If IH_EnableQuickLoot.GetValue()
		ihPlayerAlias.RegisterForLootMenu(True)
	EndIf
	
	If Game.IsPluginInstalled("Dynamic Activation Key.esp") ; Checks if DAK is installed
		DynamicActivationKey = Game.GetFormFromFile(0x000801, "Dynamic Activation Key.esp") as GlobalVariable
	Else
		DynamicActivationKey = None
	EndIf
	
	; Checks if Alchemy Requires Bottles is installed
	If Game.IsPluginInstalled("Alchemy Requires Bottles Redux.esp")
		fEmptyBottle = Game.GetFormFromFile(0x000800, "Alchemy Requires Bottles Redux.esp")
	Else
		fEmptyBottle = None
	EndIf
	
	; Checks if Venom Requires Empty Bottles is installed
	bVenomRequiresBottles = Game.IsPluginInstalled("Venom Requires Empty Bottles.esp")
	
	; Checks if First Person Interactions is installed
	If Game.IsPluginInstalled("FirstPersonInteractions.esp")
		FP_EnableLootAnimals = Game.GetFormFromFile(0x000805, "FirstPersonInteractions.esp") as GlobalVariable
		FP_AnimTrigger = Game.GetFormFromFile(0x000802, "FirstPersonInteractions.esp") as GlobalVariable
	Else
		FP_EnableLootAnimals = None
		FP_AnimTrigger = None
	EndIf

	; Checks if ImprovedCameraSE is installed
	iCameraPluginVersion = SKSE.GetPluginVersion("ImprovedCameraSE")

EndFunction

; -- Starts mod and gives the perk necessary to interact with carcasses to the player 
Function StartMod(Bool doEnable = True)
	If doEnable
		PlayerRef.AddPerk(IH_PK_ImmersiveHunting)
	Else
		PlayerRef.RemovePerk(IH_PK_ImmersiveHunting)
	EndIf
	
	isModEnabled = doEnable
EndFunction

; -- Enables/Disables QuickLoot support
Function EnableQuickLootSupport(Bool doEnable)
	If doEnable
		ihPlayerAlias.RegisterForLootMenu(True)
	Else
		ihPlayerAlias.RegisterForLootMenu(False)
		isQuickLootAnim = doEnable
	EndIf
	
	IH_EnableQuickLoot.SetValue(doEnable as Float)
EndFunction

; -- Enables/Disables Pick up; If enabled, register for grab event, otherwise unregister and clear all displays.
Function EnablePickup(Bool doEnable = True)
	If doEnable
		ihPlayerAlias.RegisterForPickup(True)
	Else
		ihPlayerAlias.RegisterForPickup(False)
		IH_ChickenDisplay.SetValue(0)
		IH_DeerDisplay.SetValue(0)
		IH_DogDisplay.SetValue(0)
		IH_ElkDisplay.SetValue(0)
		IH_ElkFemaleDisplay.SetValue(0)
		IH_FoxDisplay.SetValue(0)
		IH_FoxSnowDisplay.SetValue(0)
		IH_GoatDisplay.SetValue(0)
		IH_HareDisplay.SetValue(0)
		IH_MudcrabDisplay.SetValue(0)
		IH_FishDisplay.SetValue(0)
		IH_SkeeverDisplay.SetValue(0)
		IH_ValeDeerDisplay.SetValue(0)
		IH_WolfDisplay.SetValue(0)
		IH_WolfIceDisplay.SetValue(0)
	EndIf
	
	IH_EnablePickUp.SetValue(doEnable as Float)
EndFunction

; -- Enables/Disables "Use last dagger" 
Function UpdateDagger(Bool doEnable = True)
	If isIEDInstalled
		If !doEnable
			; If disabling "Use last dagger" feature when it was enabled previously, gets last dagger equipped and use it in every animation, until the option is enabled back again.
			GetLastEquippedDagger()
		EndIf
	EndIf
	
	IH_UseLastDagger.SetValue(doEnable as Float)
EndFunction

;-- Function responsible for the interaction with carcasses
Function CheckAnimal(Actor akActor, ObjectReference akTargetRef)
	If DynamicActivationKey && DynamicActivationKey.GetValue() ; DAK is trying to interact with this carcass, stops functions here
		Return
	EndIf
	
	If PlayerRef.GetAnimationVariableInt("i1stPerson") 
		If !IH_LootMode.GetValue() ; Not prompt/process mode
			If FP_EnableLootAnimals && FP_EnableLootAnimals.GetValue() ; First Person Interactions is enabled, do nothing here.
				ihAnimalAlias.ForceRefTo(akTargetRef)
				Utility.Wait(0.2)
			
				While UI.IsMenuOpen("ContainerMenu") 
					Utility.Wait(0.1)
				EndWhile
				
				ihAnimalAlias.Clear()
				Return
			ElseIf !IH_ForceThirdPerson.GetValue() ; Force third camera is disabled, just activate carcass.
				ihAnimalAlias.ForceRefTo(akTargetRef)
				akTargetRef.Activate(akActor)
				Utility.Wait(0.2)
			
				While UI.IsMenuOpen("ContainerMenu") 
					Utility.Wait(0.1)
				EndWhile
				
				ihAnimalAlias.Clear()
				Return
			EndIf
		EndIf
	EndIf
	
	useBow = False
		
	If IH_UseBowAnim.GetValue() && PlayerRef.isWeaponDrawn() && PlayerRef.GetEquippedItemType(1) == 7
		useBow = True	
	Else
		CheckWeaponsDrawn()
	EndIf
	
	If !PlayerRef.isWeaponDrawn() || useBow
		isQuickLootAnim = False
		isSmall = CheckTypeOfAnimal(akTargetRef as Actor)
		
		If !IH_AnimTrigger.GetValue() && !useBow
			DoAnim()
		EndIf
		
		If IH_LootMode.GetValue() > 0 ; Prompt or Process option is enabled
			; Check carcass items
			CheckCarcassItems(AkTargetRef)
			LootAnimalPrompt(akActor, akTargetRef)
		Else
			ihAnimalAlias.ForceRefTo(akTargetRef) 
			akTargetRef.Activate(akActor)
			Utility.Wait(0.2)
			
			; Waits for looting menu to be closed
			While UI.IsMenuOpen("ContainerMenu") 
				Utility.Wait(0.1)
			EndWhile

			Utility.Wait(0.5)

			; Waits for all animations to be finished.
			While isBusy ; 
				Utility.Wait(0.1)
			EndWhile
			
			; Temporary solution to not call the exit animation if looting menu is still open. Player can exit and open the looting menu many times while the animations are still playing. Not very reliable, since the menu could be from another source, hopefully shouldn't happen
			If !UI.IsMenuOpen("ContainerMenu")
				Utility.Wait(0.8)
				ihAnimalAlias.Clear()
				
				If !useBow
					StandUp()
				EndIf
				
				EndAnim(True)
			EndIf
		EndIf
	Else
		ihAnimalAlias.ForceRefTo(akTargetRef)
		akTargetRef.Activate(akActor)
		Utility.Wait(0.4)
		While UI.IsMenuOpen("ContainerMenu") 
			Utility.Wait(0.1)
		EndWhile
		ihAnimalAlias.Clear()
	EndIf
EndFunction

;-- Function to call the animations when choosing the options from the prompt(Message Box) or process
Function LootAnimalPrompt(Actor akActor, ObjectReference akTargetRef)
	ihPlayerAlias.GoToState("")
	Int iFormIndex = akTargetRef.GetNumItems()
	Form fItem
	Bool doSkip = False
			
	If PlayerRef.GetAnimationVariableInt("i1stPerson")
		If FP_EnableLootAnimals && FP_EnableLootAnimals.GetValue() ; First Person Interactions is enabled, skip
			Utility.Wait(0.9)
			doSkip = True
		ElseIf !IH_ForceThirdPerson.GetValue() ; First person and force third camera is disabled, skip
			doSkip = True
		EndIf
	EndIf
	
	If IH_LootMode.GetValue() == 2 ; Process carcass
		If iFormIndex && akTargetRef.GetItemCount(IH_ProcessedToken) == 0
			; Creates a temporary container to store items from the carcass to give them to the player after the animation.
			ObjectReference orTempContainer = PlayerRef.PlaceAtMe(IH_CO_DummyContainer)
			; Workaround to not remove equipped armor (textures) on the carcass.
			While iFormIndex
				iFormIndex -= 1
				fItem = akTargetRef.GetNthForm(iFormIndex)
				
				If fItem.HasKeywordString("VendorItemPotion") || fItem.HasKeywordString("VendorItemPoison") || (fItem.GetType() == 46 && !(fItem as Potion).IsFood()) ; Potions/Poisons
					If CheckForBottles(True)
						akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
					Else
						IH_HasPotion.SetValue(0)
					EndIf
				ElseIf fItem.GetType() != 26 ; Armor
					akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
				EndIf
			EndWhile

			If !doSkip
				DoProcessAnim(akTargetRef as Actor)
			EndIf
			
			orTempContainer.RemoveAllItems(PlayerRef) ; Moves non-quest items from tempContainer to player
			orTempContainer.RemoveAllItems(akTargetRef, abRemoveQuestItems = True) ; Sends back quest items to the carcass
			orTempContainer.Disable()
			orTempContainer.Delete()
			akTargetRef.AddItem(IH_ProcessedToken, 1)

			If doSkip && IH_HasPelt.GetValue()
				Utility.Wait(0.3)
			
				If IH_AnimTrigger.GetValue() == 106
					Utility.Wait(2.5)
				EndIf
					
				SkinAnimal(akTargetRef as Actor)
			EndIf
			
			StandUp()
			EndAnim(True)
		Else
			If iFormIndex
				Bool doBreak
				
				While iFormIndex && !doBreak
					iFormIndex -= 1
					If akTargetRef.GetNthForm(iFormIndex).IsPlayable()
						doBreak = True
					EndIf
				EndWhile
				
				If doBreak
					akTargetRef.Activate(akActor)
					
					While UI.IsMenuOpen("ContainerMenu")  
						Utility.Wait(0.1)
					EndWhile
					
					StandUp()
					EndAnim(True)
				Else
					If IH_EnableDispose.GetValue()
						StandUp(True, akTargetRef as Actor)
					Else
						StandUp()
					EndIf
					
					EndAnim(True)
				EndIf
			Else
				If IH_EnableDispose.GetValue()
					StandUp(True, akTargetRef as Actor)
				Else
					StandUp()
				EndIf
				
				EndAnim(True)
			EndIf
		EndIf
	Else ; Prompt options
		Int iChoice = IH_MSG_LootPrompt.Show()
		If iChoice < 5
			; Creates a temporary container to store items from the carcass to give them to the player after the animation.
			; Each action will use a loop to search for the items available
			ObjectReference orTempContainer = PlayerRef.PlaceAtMe(IH_CO_DummyContainer)
			iFormIndex = akTargetRef.GetNumItems()
			If iChoice == 0 ; Remove arrows
				While iFormIndex
					iFormIndex -= 1
					fItem = akTargetRef.GetNthForm(iFormIndex)
					If fItem.IsPlayable()
						If fItem.GetType() == 42 ; Ammo
							akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
							If (fItem as Ammo).isBolt()
								fHuntingBolt = (fItem as Ammo).GetProjectile() as Form 
							Else	
								fHuntingArrow = (fItem as Ammo).GetProjectile() as Form 
							EndIf
						EndIf
					EndIf
				EndWhile
				
				DoAnim(4, False , akTargetRef as Actor)
			ElseIf iChoice == 1; Extract
				If CheckForBottles(True)
					While iFormIndex
						iFormIndex -= 1
						fItem = akTargetRef.GetNthForm(iFormIndex)
						If fItem.IsPlayable()
							If fItem.HasKeywordString("VendorItemPotion") || fItem.HasKeywordString("VendorItemPoison") || (fItem.GetType() == 46 && !(fItem as Potion).IsFood()) ; Potions/Poisons
								akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
								fHuntingPotion = fItem
							EndIf
						EndIf
					EndWhile
					
					DoAnim(5, False , akTargetRef as Actor)
					akTargetRef.AddItem(IH_ExtractedToken, 1)
				ElseIf !doSkip
					RegisterForMovement()
				EndIf
			ElseIf iChoice == 2; Skin
				While iFormIndex
					iFormIndex -= 1
					fItem = akTargetRef.GetNthForm(iFormIndex)
					If fItem.IsPlayable()
						If fItem.HasKeywordString("VendorItemAnimalHide") && fItem.GetType() != 26 ; Pelt
							akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
							fHuntingPelt = fItem
						EndIf
					EndIf
				EndWhile
				
				DoAnim(1, False , akTargetRef as Actor)
				akTargetRef.AddItem(IH_SkinnedToken, 1)
			ElseIf iChoice == 3; Harvest
				While iFormIndex
					iFormIndex -= 1
					fItem = akTargetRef.GetNthForm(iFormIndex)
					If fItem.IsPlayable()
						If fItem.HasKeywordString("VendorItemAnimalPart") || fItem.HasKeywordString("VendorItemIngredient") || fItem.GetType() == 30 ; Materials
							akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
							fHuntingMaterial = fItem
						EndIf
					EndIf
				EndWhile
				
				DoAnim(2, False , akTargetRef as Actor)
				akTargetRef.AddItem(IH_HarvestedToken, 1)
			ElseIf iChoice == 4; Butcher
				While iFormIndex
					iFormIndex -= 1
					fItem = akTargetRef.GetNthForm(iFormIndex)
					If fItem.IsPlayable()
						If fItem.HasKeywordString("VendorItemFood") || fItem.HasKeywordString("VendorItemFoodRaw") || (fItem as Potion).IsFood() ; Meats
							akTargetRef.RemoveItem(fItem, akTargetRef.GetItemCount(fItem), False, orTempContainer)
							fHuntingFood = fItem
						EndIf
					EndIf
				EndWhile
				
				DoAnim(3, False , akTargetRef as Actor)
				akTargetRef.AddItem(IH_ButcheredToken, 1)
			EndIf
			
			orTempContainer.RemoveAllItems(PlayerRef)
			orTempContainer.Disable()
			orTempContainer.Delete()
			
			If doSkip && iChoice == 2
				Utility.Wait(0.3)
				
				If IH_AnimTrigger.GetValue() == 106
					Utility.Wait(2.5)
				EndIf	
				
				SkinAnimal(akTargetRef as Actor)
			EndIf
		ElseIf iChoice == 5 ; Search
			akTargetRef.Activate(akActor)
			
			If !doSkip
				RegisterForMovement()
			EndIf
		ElseIf iChoice == 6 ; Dispose
			StandUp(True, akTargetRef as Actor)
			EndAnim(True)
		Else ; Cancel
			StandUp()
			EndAnim(True)
		EndIf
	EndIf
	IH_HasArrows.SetValue(0)
	IH_HasPotion.SetValue(0)
	IH_HasPelt.SetValue(0)
	IH_HasMaterial.SetValue(0)
	IH_HasMeat.SetValue(0)
	isBusy = False
EndFunction

;-- Function to call the animations when removing items from the animals
;	There are some failsafes around here to ensure the animations and displays play correctly.
;	Several things can happen that could break this functionality of the mod...
Function LootAnimal(Int iTypeAction, ObjectReference akTargetRef)
	If PlayerRef.GetAnimationVariableInt("i1stPerson")
		If (FP_EnableLootAnimals && FP_EnableLootAnimals.GetValue()) || !IH_ForceThirdPerson.GetValue() 
			Return
		EndIf
	EndIf
	
	If iAnimCount >= IH_PossibleAnimations.GetValue(); Possible number of animations are also limited here
		Return
	EndIf
	
	If PlayerRef.IsWeaponDrawn()
		If isQuickLootAnim && PlayerRef.IsWeaponDrawn()
			useBow = False
			If IH_UseBowAnim.GetValue() && PlayerRef.GetEquippedItemType(1) == 7
				useBow = True
			EndIf
		EndIf
		If !useBow
			If iTypeAction == 1
				SkinAnimal(akTargetRef as Actor)
			EndIf
			
			Return
		EndIf
	EndIf
	
	Bool canProcess
	
	If iQueueTotal < 0 || iQueueTotal == 0
		iQueueTotal = 0
		If IH_EnableProcess.GetValue()
			canProcess = True
		EndIf
	EndIf
	
	; If QuickLoot is being used, set up some additional parameters
	If isQuickLootAnim 
		If !IH_AnimTrigger.GetValue() && !useBow
			DoAnim()
		EndIf
		
		isSmall = CheckTypeOfAnimal(akTargetRef as Actor)
	EndIf
	
	If PlayerRef.isWeaponDrawn() 
		iAnimCount = IH_PossibleAnimations.GetValue() as Int
	Else
		iAnimCount += 1 ; Limits the animations
		iQueueTotal += 1 ; Two separated queue counters in order to properly finish the animations, since player can press Take All or take items too fast and close the inventory menu before animations are properly finished.
	EndIf
	
	isBusy = True
	Utility.Wait(0.4)
	
	If iQueueCurrent < 0 
		iQueueCurrent = 0
	EndIf
	
	If isProcessing
		Return
	EndIf
	
	While iQueueCurrent > 0 ; If there are animations in queue, the script will wait.
		Utility.Wait(0.1)
	EndWhile
	
	iQueueCurrent += 1
	
	If canProcess && iQueueTotal > 1 ; Take all button was probably pressed, tries to process carcass
		isProcessing = True
	EndIf
	
	If !IH_EnableSouls.GetValue() 
		While Utility.IsInMenuMode() 
			Utility.Wait(0.1)
		EndWhile
	EndIf
	
	If isProcessing
		DoProcessAnim(akTargetRef as Actor)
		If !useBow 
			StandUp()
		EndIf
		EndAnim(True)
	Else
		DoAnim(iTypeAction, False, akTargetRef as Actor)

		iQueueCurrent -= 1
		iQueueTotal -= 1
		Utility.Wait(0.1)

		If iQueueTotal <= 0 ; All animations are finished, good to go.
			isBusy = False
			If isQuickLootAnim
				While UI.IsMenuOpen("LootMenu") || isBusy
					Utility.Wait(0.1)
				EndWhile
				Utility.Wait(0.4)
				If !isBusy
					If !useBow
						StandUp()
					EndIf
					EndAnim(True)
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

;-- Function to check items on the carcass
Function CheckCarcassItems(ObjectReference akTargetRef)
	; Loop that will check for items present in the carcass to enable the choices in the prompt or check possible animations while processing.
	Int iFormIndex = akTargetRef.GetNumItems()
	Form fItem
	
	While iFormIndex
		iFormIndex -= 1
		fItem = akTargetRef.GetNthForm(iFormIndex)
		If fItem.IsPlayable()
			If fItem.GetType() == 42 ; Ammo
				IH_HasArrows.SetValue(1)
				fHuntingArrow = fItem
			ElseIf fItem.HasKeywordString("VendorItemAnimalHide") && fItem.GetType() != 26 ; Pelt
				If akTargetRef.GetItemCount(IH_SkinnedToken) == 0
					IH_HasPelt.SetValue(1)
					fHuntingPelt = fItem
				EndIf
			ElseIf fItem.HasKeywordString("VendorItemAnimalPart") || fItem.HasKeywordString("VendorItemIngredient") || fItem.GetType() == 30 ; Materials
				If akTargetRef.GetItemCount(IH_HarvestedToken) == 0
					IH_HasMaterial.SetValue(1)
					fHuntingMaterial = fItem
				EndIf
			ElseIf fItem.HasKeywordString("VendorItemFood") || fItem.HasKeywordString("VendorItemFoodRaw") || (fItem as Potion).IsFood() ; Meats
				If akTargetRef.GetItemCount(IH_ButcheredToken) == 0
					IH_HasMeat.SetValue(1)
					fHuntingFood = fItem
				EndIf
			ElseIf fItem.HasKeywordString("VendorItemPotion") || fItem.HasKeywordString("VendorItemPoison") || (fItem.GetType() == 46 && !(fItem as Potion).IsFood()) ; Potions/Poisons
				If akTargetRef.GetItemCount(IH_ExtractedToken) == 0
					IH_HasPotion.SetValue(1)
					fHuntingPotion = fItem
				EndIf
			EndIf
		EndIf
	EndWhile
EndFunction

;-- Function to check for small animals
Bool Function CheckTypeOfAnimal(Actor akActor)
	If akActor.GetRace() == ChickenRace || akActor.GetRace() == DogRace || akActor.GetRace() == GoatRace || akActor.GetRace() == GoatDomesticsRace || akActor.GetRace() == HareRace || akActor.GetRace() == FoxRace || akActor.GetRace() == SlaughterfishRace || akActor.GetRace() == SkeeverRace
		Return True
	ElseIf akActor.HasKeywordString("LootingSmallAnimal")
		Return True
	Else
		Return False
	EndIf
EndFunction

; -- Function to check if weapon is drawn to sheathe it 
Function CheckWeaponsDrawn(Bool bToggle = True)	
	If bToggle
		If PlayerRef.IsWeaponDrawn() && IH_SheatheWeapons.GetValue()
			;PlayerRef.SheatheWeapon()
			SendAnimationEvent(PlayerRef, "Unequip") ; Uses this instead since some mods can break the SheatheWeapon() function
			While PlayerRef.GetAnimationVariableBool("IsUnequipping")
				Utility.wait(0.1)
			EndWhile
			isDrawnWeapon = True
		EndIf
	Else
		If isDrawnWeapon
			PlayerRef.DrawWeapon()
			While PlayerRef.GetAnimationVariableBool("IsEquipping")
				Utility.wait(0.1)
			EndWhile
			isDrawnWeapon = False
		EndIf
	EndIf
EndFunction

; -- Function to check if camera is in first/third person to switch it accordingly
Function CheckCameraState(Bool bToggle = True)	
	If bToggle
		If PlayerRef.GetAnimationVariableInt("i1stPerson")
			If IH_ForceThirdPerson.GetValue()
				Game.ForceThirdPerson()
				
				If iCameraPluginVersion < 0
					isFirstPerson = True
				Else
					isFirstPerson = False
				EndIf
			
				If isDrawnWeapon
					Utility.Wait(0.4)
				EndIf
			EndIf
		EndIf
	Else
		If isFirstPerson
			Game.ForceFirstPerson()
			isFirstPerson = False
		EndIf
	EndIf
EndFunction

; -- Function to check if torch or shield is equipped on the left hand. Unequips the item and equips it back when animations are finished. 
Function CheckLeftHand(Bool bToggle = True)
	If bToggle
		If PlayerRef.GetEquippedItemType(0) == 10 || PlayerRef.GetEquippedItemType(0) == 11
			fLeftHandItem = PlayerRef.GetEquippedObject(0)
			hasTorch = False
			; Checks if it's a torch
			If fLeftHandItem.GetType() == 31
				hasTorch = True
				Return
			EndIf
			PlayerRef.UnequipItem(fLeftHandItem, False, True)
		EndIf
	Else
		If fLeftHandItem && !PlayerRef.GetEquippedItemType(0)
			If PlayerRef.GetItemCount(fLeftHandItem) > 0 ; Equip item back
				PlayerRef.EquipItem(fLeftHandItem, False, True)
			EndIf
		EndIf
		fLeftHandItem = None
		hasTorch = False
	EndIf
EndFunction

; -- Removes torch from player and place at the ground, if enabled
Function UnequipTorch()
	If hasTorch
		If PlayerRef.GetItemCount(fLeftHandItem) > 0
			PlayerRef.UnequipItem(fLeftHandItem, False, True)
		EndIf
		If IH_EnableTorch.GetValue()
			CreateDisplay(6, "HuntingTorch")
			EnableDisplay("HuntingTorch")
		EndIf
	EndIf
EndFunction

; -- Checks if the last equipped dagger is in player's inventory
Int Function CheckForDagger()
	If isIEDInstalled && IH_EnableDisplays.GetValue()
		If IH_RequireDagger.GetValue()
			; Checks if last equipped dagger is available
			If PlayerRef.GetItemCount(fHuntingDagger) > 0
				; Player has a dagger
				Return 1
			ElseIf IH_FL_ClawRaces.HasForm(PlayerRef.GetRace())
				; Player is from one of the "claw" races, can use the claw animations
				Return 2
			Else
				; No daggers, using a generic animation with a sharp rock
				Return 3
			EndIf
		EndIf
		; Always use a dagger if MCM option is disabled
		Return 1
	EndIf
	; Always use a dagger if IED is not installed/enabled
	Return 1
EndFunction

; -- Checks if the player has empty bottles
Bool Function CheckForBottles(Bool isProcess)
	If fEmptyBottle && IH_RequireBottle.GetValue()
		If PlayerRef.GetItemCount(fEmptyBottle) > 0
			If isProcess || !bVenomRequiresBottles
				PlayerRef.RemoveItem(fEmptyBottle, 1)
			EndIf
			
			Return True
		Else
			If isProcess || !bVenomRequiresBottles
				Notification("$_ih_RequiresBottle")
			EndIf
			
			Return False
		EndIf
	Else
		Return True
	EndIf
EndFunction

;-- Function to process carcass
Function DoProcessAnim(Actor akTargetRef)
	; Checks possible animations to "Process". Either Skin and Harvest, Skin and Butcher or Butcher and Harvest.
	; If it's none of the animations above, plays the first animation found
	If IH_HasPelt.GetValue() && (IH_HasMaterial.GetValue() || IH_HasMeat.GetValue()) || IH_HasMaterial.GetValue() && IH_HasMeat.GetValue()
		If IH_HasMeat.GetValue()
			fHuntingMaterial = fHuntingFood
		EndIf
		DoAnim(akTargetRef = akTargetRef, isProcess = True)
	ElseIf IH_HasPelt.GetValue()
		DoAnim(1, False, akTargetRef)
	ElseIf IH_HasMaterial.GetValue() 
		DoAnim(2, False, akTargetRef)
	ElseIf IH_HasMeat.GetValue()
		DoAnim(3, False, akTargetRef)
	ElseIf IH_HasPotion.GetValue()
		DoAnim(5, False, akTargetRef)
	ElseIf IH_HasArrows.GetValue()
		DoAnim(4, False, akTargetRef)
	EndIf
EndFunction

;-- Function to perform animations and enable displays
Function DoAnim(Int iTypeAction = 0, Bool abToggle = False, Actor akTargetRef = None, Bool isProcess = False, Bool abForceSmall = False, Form fForcedDagger = None, Int iForcedTypeOfDagger = 0)
	If PlayerRef.GetAnimationVariableInt("i1stPerson")
		If (FP_EnableLootAnimals && FP_EnableLootAnimals.GetValue()) || !IH_ForceThirdPerson.GetValue() ; First Person Interactions is enabled, skip
			Return
		EndIf
	EndIf
	
	CheckCameraState()
	RegisterForCancel()
	UnregisterForMovement()
	Int iTypeOfDagger

	If fForcedDagger
		; Uses forced dagger by another mod
		fHuntingDagger = fForcedDagger
		iTypeOfDagger = 1
	Else
		; check for available daggers in player inventory
		If iForcedTypeOfDagger <= 1
			GetLastEquippedDagger()
			iTypeOfDagger = CheckForDagger()
		Else ; Uses forced type of dagger by another mod
			iTypeOfDagger = iForcedTypeOfDagger
		EndIf
	EndIf
	
	CreateDisplay()
	
	If iTypeAction == 0 && !isProcess; Check carcass
		If !IH_AnimTrigger.GetValue()
			If iTypeOfDagger != 1
				IH_AnimTrigger.SetValue(10)
				SendAnimationEvent(PlayerRef, "IdleKneeling")
			Else	
				IH_AnimTrigger.SetValue(11)
				SendAnimationEvent(PlayerRef, "IdleKneeling")
				Utility.Wait(0.5)
				EnableDisplay("HuntingDagger")
			EndIf
		EndIf
		
		If IH_LootMode.GetValue() || isQuickLootAnim || (!IH_LootMode.GetValue() && !IH_EnableSouls.GetValue())
			Utility.Wait(0.8)	
		EndIf
		
		Return
	EndIf
	
	; Disables headtracking during the animations, if using True Direcional Movement
	TrueDirectionalMovement.ToggleDisableHeadtracking("ImmersiveHunting.esp", True)
	
	CheckLeftHand()
	
	If iTypeAction != 6
		UnequipTorch()
	EndIf
	
	If abForceSmall	
		isSmall = True
	EndIf
	
	If isProcess ; Process animation
		; Animations have specific timers to when an action needs to be done, such as create a display or trigger blood splatters.
		; Also, the animations have different durations depending on the knife position.
		; These variables here will control the timers to make sure the animations end when they need to. 
		; -- First variable is the time it needs to take before creatinga display for food/potion item or to trigger blood splatter.
		; -- Second variable is the time the animation needs to end, it's not the total lenght of the animation, but a bit before that. 
		; Since the script needs to tell OAR to switch the animations (by updating global variables) with a somewhat precicion, it was needed to use these functions, because scripts run differently for everyone...
		; Added a new fail safe to force end the animation on the event "AnimObjectUnequip", that is sent at the end of the animations that use a dagger.
		Float fProcessTime1 = 3.0
		Float fProcessTime2 = 2.8
		Float fProcessTime3 = 2.0
		akTargetRef.ClearExtraArrows() ; Process animation removes extra arrows too
		
		If iTypeOfDagger == 1; Dagger animation	
			CreateDisplay(8, "HuntingMisc")
			IH_AnimTrigger.SetValue(50)
			Utility.Wait(fProcessTime1)
			
			If IH_HasPelt.GetValue() || fHuntingPelt; has pelt to skin?
				SkinAnimal(akTargetRef)
			EndIf
			
			Utility.Wait(fProcessTime2)
			EnableDisplay("HuntingMisc")
		Else
			If iTypeOfDagger == 2 ; Claw animation
				fProcessTime1 = 2.8
				fProcessTime3 = 1.6
				IH_AnimTrigger.SetValue(51)
				Utility.Wait(fProcessTime1)
			ElseIf iTypeOfDagger == 3 ; Sharp rock animation
				fProcessTime1 = 4
				fProcessTime3 = 1
				IH_AnimTrigger.SetValue(52)
				Utility.Wait(fProcessTime1)
			EndIf
			
			If IH_HasPelt.GetValue() || fHuntingPelt; has pelt to skin?
				SkinAnimal(akTargetRef)
			EndIf
		EndIf

		Utility.Wait(fProcessTime3)
	ElseIf iTypeAction == 1
		; Skin Animation
		Float fSkinTime1
		Float fSkinTime2
		akTargetRef.ClearExtraArrows() ; Skin animation removes extra arrows too
		If iTypeOfDagger == 2 ; Claw animations
			fSkinTime1 = 3.0
			fSkinTime2 = 1.0
			IH_AnimTrigger.SetValue(120)
		ElseIf iTypeOfDagger == 3 ; Sharp rock animations
			fSkinTime1 = 4.0
			fSkinTime2 = 1.0
			IH_AnimTrigger.SetValue(52)
		Else
			; Dagger animations
			If abToggle ; Failed skin animation
				IH_AnimTrigger.SetValue(102)
				
				If IH_DaggerPosition.GetValue() == 10
					fSkinTime1 = 4.4
					fSkinTime2 = 3.5
				Else
					fSkinTime1 = 6.3
					fSkinTime2 = 3.8
				EndIf				
			Else
				IH_AnimTrigger.SetValue(100)
				
				If PlayerRef.isWeaponDrawn()
					SendAnimationEvent(PlayerRef, "IdleCombatStretchingStart")
					Utility.Wait(0.8)
					EnableDisplay("HuntingDagger", True)
					fSkinTime1 = 5.0
					fSkinTime2 = 1.0
				Else					
					fSkinTime1 = 3.0
					fSkinTime2 = 1.0
				EndIf
			EndIf
		EndIf
		
		fCurrentTime = Utility.GetCurrentRealTime()
		Utility.Wait(fSkinTime1)
		SkinAnimal(akTargetRef)
		Utility.Wait(fSkinTime2)
		
		If PlayerRef.isWeaponDrawn()	
			EnableDisplay("HuntingDagger", False)
			Utility.Wait(0.8)
			EndAnim(True)
			Return
		EndIf
		
	ElseIf iTypeAction == 2
		; Harvest Animation
		If abToggle ; Failed harvest animation
			IH_AnimTrigger.SetValue(202)
			Utility.Wait(4)
		Else
			CreateDisplay(iTypeAction, "HuntingMisc")
			
			If PlayerRef.isWeaponDrawn()
				IH_AnimTrigger.SetValue(200)
				SendAnimationEvent(PlayerRef, "IdleCombatStretchingStart")
				Utility.Wait(2)
				EnableDisplay("HuntingMisc")
				Utility.Wait(2.3)
				EnableDisplay("HuntingMisc", False)
				Utility.Wait(0.5)
				EndAnim(True)
				Return
			Else
				If iTypeOfDagger != 2 && iTypeOfDagger != 3
					IH_AnimTrigger.SetValue(200)
				Else
					IH_AnimTrigger.SetValue(201)
				EndIf
				
				Utility.Wait(3.0)
				EnableDisplay("HuntingMisc")
				Utility.Wait(2.0)
				EnableDisplay("HuntingMisc", False)
				Utility.Wait(1.0)
			EndIf
		EndIf
	ElseIf iTypeAction == 3
		; Butcher animation
		Float fButcherTime1
		Float fButcherTime2
		
		If iTypeOfDagger == 2 ; Claw animations
			fButcherTime1 = 4.5
			fButcherTime2 = 2.0
			IH_AnimTrigger.SetValue(320)
		ElseIf iTypeOfDagger == 3 ; Sharp rock animations
			IH_AnimTrigger.SetValue(52)
			Utility.Wait(5)
			EndAnim()
			Return
		Else ; Dagger animations
			If PlayerRef.isWeaponDrawn()
				IH_AnimTrigger.SetValue(300)
				SendAnimationEvent(PlayerRef, "IdleCombatStretchingStart")
				Utility.Wait(0.5)
				EnableDisplay("HuntingDagger")
				Utility.Wait(3.8)
				EnableDisplay("HuntingDagger", False)
				Utility.Wait(0.8)
				EndAnim(True)
				Return
			Else
				If isSmall
					IH_AnimTrigger.SetValue(300)
					fButcherTime1 = 2.0
					fButcherTime2 = 1.8
				Else ; Larger animals
					IH_AnimTrigger.SetValue(301)
					fButcherTime1 = 2.8
					fButcherTime2 = 2.7
				EndIf
			EndIf
		EndIf
		
		CreateDisplay(iTypeAction, "HuntingMisc")
		fCurrentTime = Utility.GetCurrentRealTime()
		Utility.Wait(fButcherTime1)
		EnableDisplay("HuntingMisc")
		Utility.Wait(fButcherTime2)
		EnableDisplay("HuntingMisc", False)
		Utility.Wait(0.8)
	ElseIf iTypeAction == 4 && !bArrowRemoved
		; Remove Arrows Animation
		akTargetRef.ClearExtraArrows()
		If fHuntingBolt
			fHuntingArrow = fHuntingBolt
			IH_AnimTrigger.SetValue(401)
		Else
			IH_AnimTrigger.SetValue(400)
		EndIf
		CreateDisplay(iTypeAction, "HuntingArrow")
		EnableDisplay("HuntingDagger", False)
		
		If PlayerRef.isWeaponDrawn()
			SendAnimationEvent(PlayerRef, "IdleCombatStretchingStart")
			EnableDisplay("HuntingArrow")
			Utility.Wait(1.6) 
			EnableDisplay("HuntingArrow", False)
			Utility.Wait(1.5)
			EndAnim(True)
		Else
			EnableDisplay("HuntingArrow")
			Utility.Wait(1.7) 
			EnableDisplay("HuntingArrow", False)
			bArrowRemoved = True
			Utility.Wait(0.4)
		EndIf
		
		EnableDisplay("HuntingDagger")
	ElseIf iTypeAction == 5
		; Extract Animation
		If iTypeOfDagger == 2 ; Using claws
			IH_AnimTrigger.SetValue(51) ; same as process for now
			Utility.Wait(4.4)
		ElseIf iTypeOfDagger == 3 ; Not using a knife or using a sharp rock
			IH_AnimTrigger.SetValue(52) ; generic rock animation
			Utility.Wait(5)
		Else ; Using a dagger
			IH_AnimTrigger.SetValue(500)
			CreateDisplay(iTypeAction, "HuntingMisc")
			Utility.Wait(2.2)
			EnableDisplay("HuntingMisc")
			Utility.Wait(3.0)
			EnableDisplay("HuntingMisc", False)
			Utility.Wait(1.0)
		EndIf
	ElseIf iTypeAction == 6 
		; Cooking
		If PlayerRef.GetSitState() != 0
			Return
		EndIf
		
		iQueueCurrent = 0		
		Game.DisablePlayerControls(False, False, False, False, False, False, True, False) ; Disable Activate options while in the cooking animation
		
		If iQueueCurrent == 0
			If iTypeOfDagger != 1 ; Not using a dagger
				IH_AnimTrigger.SetValue(620)
				SendAnimationEvent(PlayerRef, "IdleKneeling")
				fCurrentTime = Utility.GetCurrentRealTime()
				WaitForCancel(2.5)
			Else
				IH_AnimTrigger.SetValue(600)
				SendAnimationEvent(PlayerRef, "IdleKneeling")
				fCurrentTime = Utility.GetCurrentRealTime()
				WaitForCancel(1.1)
				EnableDisplay("HuntingDagger")
				WaitForCancel(1.4)
			EndIf
		EndIf
		
		ihPlayerAlias.CheckForCooking(True)
		
		While UI.IsMenuOpen("Crafting Menu") || iQueueCurrent > 0
			Utility.Wait(0.1)
		EndWhile
		
		ihPlayerAlias.CheckForCooking(False)
		fCurrentTime = Utility.GetCurrentRealTime() - fCurrentTime
		
		If fCurrentTime > 4
			fCurrentTime = 4
		EndIf
		
		If fCurrentTime < 4
			WaitForCancel(1.5)
		EndIf
		
		SendAnimationEvent(PlayerRef, "IdleStop")
		iQueueCurrent = 0
		
		If IH_DaggerPosition.GetValue() == 0
			Utility.Wait(1.5)
		Else
			Utility.Wait(0.8)
		EndIf
		
		EnableDisplay("HuntingDagger", False)
		Utility.Wait(0.4)
		EndAnim(True)
		Game.EnablePlayerControls()	
		Return
	ElseIf iTypeAction == 7 
		; Primitive cooking (item crafted)
		If PlayerRef.GetAnimationVariableBool("bAnimationDriven") 
			iQueueCurrent += 1
			
			If iTypeOfDagger != 1 ; Not using a dagger
				IH_AnimTrigger.SetValue(621)
			Else
				If abToggle
					CreateDisplay()
					EnableDisplay("HuntingDagger")
				EndIf
				IH_AnimTrigger.SetValue(601)
			EndIf
			
			Utility.Wait(0.2)
			
			If !isIEDInstalled || !IH_EnableDisplays.GetValue()
				WaitForCancel(10)
			Else
				fCurrentTime = Utility.GetCurrentRealTime()
				CreateDisplay(iTypeAction, "CookingKnife")
				If iQueueCurrent <= 1
					EnableDisplay("CookingKnife")
				EndIf
			EndIf
			
			If iQueueCurrent <= 1
				If !abToggle 
					If iTypeOfDagger != 1 ; Not using a dagger
						IH_AnimTrigger.SetValue(620)
					Else
						IH_AnimTrigger.SetValue(600)
					EndIf
					If hasTorch
						EnableDisplay("HuntingTorch", False)
						CheckLeftHand(False)
					EndIf
				ElseIf PlayerRef.GetAnimationVariableBool("bAnimationDriven") 
					IH_AnimTrigger.SetValue(10)
				EndIf
			EndIf
			
			iQueueCurrent -= 1
		EndIf
		Return
	EndIf
	
	EndAnim()
EndFunction

; -- Function to check if a "cancel" action was done (jump, getting hit, drawing weapon).
;	 Is there a good way to interrupt an ongoing function? There are several "Waits" and "Displays" functions along the animations that can be interrupted, so the loop here will only wait if the animation was not interrupted.
;	 There are also some additional checks to "Return" the function if it was interrupted. Not very elegant, but hey, as long as it works.
Function WaitForCancel(Float fTimeToWait)
	If fTimeToWait > 0
		Float fTimeFrag = fTimeToWait / 10
		While fTimeToWait > 0 && PlayerRef.GetAnimationVariableBool("bAnimationDriven")
			Utility.Wait(fTimeFrag)
			fTimeToWait -= fTimeFrag
		EndWhile
	EndIf
EndFunction

; -- Function to control when an action is complete
;
Function EndAnim(Bool doAll = False)
	; Disable some displays
	EnableDisplay("HuntingMisc", False)
	EnableDisplay("HuntingTorch", False)
	EnableDisplay("HuntingArrow", False)
	iAnimCount = 0
	TrueDirectionalMovement.ToggleDisableHeadtracking("ImmersiveHunting.esp", False)
	
	If doAll ; Considers all actions as complete
		; Disable more displays
		EnableDisplay("HuntingDagger", False)
		EnableDisplay("CookingKnife", False)
		EnableDisplay("CookedKnife", False)
		UnregisterForCancel()
		
		isBusy = False
		isProcessing = False
		bArrowRemoved = False
		iQueueCurrent = 0
		iQueueTotal = 0
		useBow = False
		fHuntingPelt = None
		fHuntingArrow = None
		fHuntingBolt = None
		fHuntingMaterial = None
		fHuntingFood = None
		fHuntingPotion = None
		fCookedFood = None
		
		IH_HasArrows.SetValue(0)
		IH_HasPotion.SetValue(0)
		IH_HasPelt.SetValue(0)
		IH_HasMaterial.SetValue(0)
		IH_HasMeat.SetValue(0)
		
		; Checks for camera and weapons sheathed
		CheckCameraState(False)
		CheckWeaponsDrawn(False)
		IH_AnimTrigger.SetValue(0)

	Else ; Finished action while still interacting with a carcass, sends animation to "check" carcass again
		IH_AnimTrigger.SetValue(11)
		CheckLeftHand(False)
		; Movement can now exit animation
		RegisterForMovement()
	EndIf
EndFunction

; -- Functions to interrupt anim when player gets hit, draws weapon or jumps. 
Function RegisterForCancel()
	RegisterForControl("Jump")
	RegisterForSingleUpdate(4)
	ihPlayerAlias.RegisterForHit(True)
	ihPlayerAlias.RegisterForWeaponDrawn(True)
EndFunction

Function RegisterForMovement()
	If !PlayerRef.IsWeaponDrawn()
		RegisterForControl("Forward")
		RegisterForControl("Back")
		RegisterForControl("Strafe Left")
		RegisterForControl("Strafe Right")
		ihPlayerAlias.RegisterForMagicEffectMov(True)
	EndIf
EndFunction

Function UnregisterForCancel()
	UnregisterForControl("Jump")
	UnregisterForControl("Forward")
	UnregisterForControl("Back")
	UnregisterForControl("Strafe Left")
	UnregisterForControl("Strafe Right")
	ihPlayerAlias.RegisterForHit(False)
	ihPlayerAlias.RegisterForWeaponDrawn(False)
	ihPlayerAlias.RegisterForMagicEffectMov(False)
EndFunction

Function UnregisterForMovement()
	UnregisterForControl("Forward")
	UnregisterForControl("Back")
	UnregisterForControl("Strafe Left")
	UnregisterForControl("Strafe Right")
	ihPlayerAlias.RegisterForMagicEffectMov(False)
EndFunction

Function SkinAnimal(Actor akTargetRef)
	If akTargetRef
		If IH_LootMode.GetValue() && Game.IsPluginInstalled("Simple Hunting Overhaul.esp")
			Quest SHOQuest = Game.GetFormFromFile(0x0000E7F, "Simple Hunting Overhaul.esp") as Quest
			(SHOQuest.GetNthAlias(0) as ReferenceAlias).OnItemAdded(fHuntingPelt, 1, None, akTargetRef)
		ElseIf IH_EnableRealisticSkin.GetValue()
			ihRealisticSkin.HISRealisticSkinning(akTargetRef, fHuntingPelt)
		EndIf
	EndIf
EndFunction

; -- Function to get what kind of carcass is being grabbed to enable the displays.
GlobalVariable Function GetCarcass(Actor akTargetRef)
	Race rCarcassRace = akTargetRef.GetRace()
	If rCarcassRace == ChickenRace
		DoPickupAnim(901)
		Return IH_ChickenDisplay
	ElseIf rCarcassRace == DeerRace
		doPickupAnim(902)
		Return IH_DeerDisplay
	ElseIf rCarcassRace == DLC1DeerGlowRace
		doPickupAnim(902)
		Return IH_ValeDeerDisplay
	ElseIf rCarcassRace == DogRace
		doPickupAnim(902)
		Return IH_DogDisplay
	ElseIf rCarcassRace == ElkRace
		doPickupAnim(902)
		If akTargetRef.GetActorBase().GetSex()
			Return IH_ElkFemaleDisplay
		Else
			Return IH_ElkDisplay
		EndIf
	ElseIf rCarcassRace == FoxRace
		DoPickupAnim(902)
		If StringUtil.Find(PO3_SKSEFunctions.GetFormEditorID(akTargetRef.GetActorBase()), "Arctic") != -1
			Return IH_FoxSnowDisplay
		Else
			Return IH_FoxDisplay
		EndIf
	ElseIf rCarcassRace == GoatRace || rCarcassRace == GoatDomesticsRace
		doPickupAnim(905)
		Return IH_GoatDisplay
	ElseIf rCarcassRace == HareRace
		doPickupAnim(901)
		Return IH_HareDisplay
	ElseIf rCarcassRace == MudcrabRace
		doPickupAnim(906)
		Return IH_MudcrabDisplay
	ElseIf rCarcassRace == SlaughterfishRace
		doPickupAnim(908)
		Return IH_FishDisplay
	ElseIf rCarcassRace == SkeeverRace
		doPickupAnim(902)
		Return IH_SkeeverDisplay
	ElseIf rCarcassRace == WolfRace || akTargetRef.GetFactionRank(WolfFaction) >= 0
		doPickupAnim(902)
		If StringUtil.Find(PO3_SKSEFunctions.GetFormEditorID(akTargetRef.GetActorBase()), "Ice") != -1 || StringUtil.Find(PO3_SKSEFunctions.GetFormEditorID(akTargetRef.GetActorBase()), "White") != -1
			Return IH_WolfIceDisplay
		Else
			Return IH_WolfDisplay
		EndIf
	EndIf
EndFunction

; -- Function to determine what type of pickup animation is going to be used
Function doPickupAnim(Int iTypeAction)
	If !PlayerRef.IsWeaponDrawn() && !PlayerRef.GetAnimationVariableBool("bIsRiding") && !PlayerRef.IsSwimming() && !PlayerRef.GetAnimationVariableBool("isStaggering") && Game.GetCameraState() != 0
		IH_AnimTrigger.SetValue(iTypeAction)
		; 901 - both arms placing on hips
		; 902 - left arm placing on left shoulder
		; 903 - right arm placing on right shoulder
		; 904 - both arms placing on neck
		; 905 - Left arm placing on neck
		; 906 - both arms from back
		; 908 - Left arm from back
		SendAnimationEvent(PlayerRef, "IdlePickUp_Ground")
		IH_AnimTrigger.SetValue(0)
	EndIf
EndFunction

; -- Function to standup
Function StandUp(Bool doDispose = False, Actor akTargetRef = None)
	If PlayerRef.GetAnimationVariableInt("i1stPerson")
		If (FP_EnableLootAnimals && FP_EnableLootAnimals.GetValue()) || !IH_ForceThirdPerson.GetValue() 
			; Skip
		Else
			SendAnimationEvent(PlayerRef, "IdleStop")
			Utility.Wait(0.5)
			EnableDisplay("HuntingDagger", False)
			Utility.Wait(1.5)
		EndIf
	Else
		SendAnimationEvent(PlayerRef, "IdleStop")
		Utility.Wait(0.5)
		EnableDisplay("HuntingDagger", False)
		Utility.Wait(1.5)
	EndIf
	
	If doDispose
		If IH_EnableShovelDispose.GetValue() && Game.IsPluginInstalled("ShovelBody.esp") ; Checks if Shovel Bury Bodies is installed
			Quest ShovelBodyQuest = (Game.GetFormFromFile(0x0000800, "ShovelBody.esp") as Quest) as ShovelBodyMCMScript
			ShovelBodyAliasScript ShovelBodyAlias = ShovelBodyQuest.GetAlias(1) as ShovelBodyAliasScript
			
			If PO3_SKSEFunctions.GetQuestItems(akTargetRef).Length == 0
				ShovelBodyAlias.ShovelBody(akTargetRef)
			ElseIf ShovelBodyAlias.ShovelBodyQuestItemMessage.Show() == 0
				ShovelBodyAlias.ShovelBody(akTargetRef)
			EndIf
		Else
			akTargetRef.SetCriticalStage(akTargetRef.CritStage_DisintegrateEnd)
		EndIf
	EndIf
EndFunction

; -- Function to get last equipped dagger
Function GetLastEquippedDagger()
	If isIEDInstalled && IH_EnableDisplays.GetValue()
		If IH_UseLastDagger.GetValue()
			If GetLastEquippedForm(PlayerRef, 34, True, False) ; Checks if player has equipped a dagger
				fHuntingDagger = GetLastEquippedForm(PlayerRef, 34, True, False)
			Else ; or uses an Iron Dagger as default
				fHuntingDagger = Game.GetFormFromFile(0x001397E, "Skyrim.esm")
			EndIf
		ElseIf !fHuntingDagger
			; Fallback to an Iron Dagger
			fHuntingDagger = Game.GetFormFromFile(0x001397E, "Skyrim.esm")
		EndIf
	EndIf
EndFunction

; -- Function to create IED Displays
;
Function CreateDisplay(Int iTypeOfDisplay = 1, String sDisplay = "HuntingDagger")
	If iTypeOfDisplay > 1 && IH_AnimTrigger.GetValue() == 0
		Return
	EndIf
	
	If isIEDInstalled && IH_EnableDisplays.GetValue()
		If iTypeOfDisplay == 1 ; Dagger display
			; Sets dagger position for animations
			;SetItemTransform(iTypeOfDisplay, fHuntingDagger)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingDagger, False, "Weapon")
				SetItemRemoveScabbardActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, True)
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingDagger)
			EndIf
			Return
		; Harvest display
		ElseIf iTypeOfDisplay == 2
			SetItemTransform(iTypeOfDisplay, fHuntingMaterial)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingMaterial, False, "NPC R Hand [RHnd]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingMaterial)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale,  "NPC R Hand [RHnd]") 
			EndIf	
		; Removing meat from carcass
		ElseIf iTypeOfDisplay == 3
			SetItemTransform(iTypeOfDisplay, fHuntingFood)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingFood, False, "NPC L Hand [LHnd]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingFood)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale,  "NPC L Hand [LHnd]") 
			EndIf
		; Sets arrow for removing animation
		ElseIf iTypeOfDisplay == 4
			; Arrow on right hand
			SetItemTransform(iTypeOfDisplay, fHuntingArrow, 1)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand") 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, fHuntingArrow, False, "Weapon")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, fHuntingArrow)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, "Weapon") 
			EndIf
			SetItemRemoveTracersActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, True)
			SetItemScaleActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, fScale)
			SetItemPositionActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, fArrayPosition)
			SetItemRotationActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, fArrayRotation)
			
			; Arrow on carcass
			SetItemTransform(iTypeOfDisplay, fHuntingArrow)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingArrow, False, "AnimObjectA")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingArrow)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, "AnimObjectA") 
			EndIf
			SetItemRemoveTracersActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, True)
		; Sets vial for blood/poison extract
		ElseIf iTypeOfDisplay == 5
			SetItemTransform(iTypeOfDisplay, fHuntingPotion)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingPotion, False, "NPC L Hand [LHnd]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingPotion)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, "NPC L Hand [LHnd]") 
			EndIf
		; Torch on the ground
		ElseIf iTypeOfDisplay == 6
			SetItemTransform(iTypeOfDisplay, fLeftHandItem)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fLeftHandItem, False,  "NPC Root [Root]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fLeftHandItem)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale,   "NPC Root [Root]") 
			EndIf
			SetItemAttachLightActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, True)
		; Cooking food
		ElseIf iTypeOfDisplay == 7
			; Raw food on knife
			SetItemTransform(iTypeOfDisplay, fHuntingMaterial, 1) 
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife") 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife", isPlayerFemale, fHuntingMaterial, False, "NPC R Hand [RHnd]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife", isPlayerFemale, fHuntingMaterial)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife", isPlayerFemale,  "NPC R Hand [RHnd]") 
			EndIf
			SetItemScaleActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife", isPlayerFemale, fScale)
			SetItemPositionActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife", isPlayerFemale, fArrayPosition)
			SetItemRotationActor(PlayerRef, "ImmersiveHunting.esp", "CookingKnife", isPlayerFemale, fArrayRotation)
			
			; Cooked food on knife
			SetItemTransform(iTypeOfDisplay, fCookedFood, 1) 
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife") 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, fCookedFood, False, "NPC R Hand [RHnd]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, fCookedFood)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale,  "NPC R Hand [RHnd]") 
			EndIf
			SetItemScaleActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, fScale)
			SetItemPositionActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, fArrayPosition)
			SetItemRotationActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, fArrayRotation)

			Return
		; Process display
		ElseIf iTypeOfDisplay == 8
			SetItemTransform(iTypeOfDisplay, fHuntingMaterial)
			If !ItemExistsActor(PlayerRef, "ImmersiveHunting.esp", sDisplay) 
				CreateItemActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingMaterial, False, "NPC L Hand [LHnd]")
			Else
				SetItemFormActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fHuntingMaterial)
				SetItemNodeActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale,  "NPC L Hand [LHnd]") 
			EndIf	
		EndIf
				
		SetItemDisableHavokActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, True)
		SetItemScaleActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fScale)
		SetItemPositionActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fArrayPosition)
		SetItemRotationActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, fArrayRotation)
	EndIf
	
EndFunction

; -- Function to enable/disable displays
;
Function EnableDisplay(String sDisplay, Bool doEnable = True)
	If isIEDInstalled
		If doEnable && IH_AnimTrigger.GetValue() == 0
			Return
		EndIf
		
		If sDisplay == "HuntingArrow"
			If doEnable
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, True)
				If PlayerRef.isWeaponDrawn()
					Utility.Wait(0.5)
				Else
					Utility.Wait(1.0)
				EndIf
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, False)
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, True)
			Else
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, doEnable)
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay+"Hand", isPlayerFemale, doEnable)
			EndIf
		ElseIf sDisplay == "CookingKnife"
			If doEnable
				WaitForCancel(2.1)
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, True)
				
				WaitForCancel(6.2 - (Utility.GetCurrentRealTime() - fCurrentTime))
				fCurrentTime = Utility.GetCurrentRealTime()
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, False)
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, True)
				
				WaitForCancel(3.0 - (Utility.GetCurrentRealTime() - fCurrentTime))
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, False)
			Else
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, doEnable)
				SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", "CookedKnife", isPlayerFemale, doEnable)
			EndIf
		Else
			If doEnable && !IH_EnableDisplays.GetValue()
				Return
			EndIf
			
			SetItemEnabledActor(PlayerRef, "ImmersiveHunting.esp", sDisplay, isPlayerFemale, doEnable)
		EndIf
	EndIf
EndFunction

; -- Function to toggle or delete all displays
;
Function ToggleDisplays(Bool doEnable)
	If doEnable
		AnimObjectIronKnife.SetWorldModelPath("AnimObjects\\AnimObjectHuntingDagger_Invisible.nif")
	Else
		DeleteAll("ImmersiveHunting.esp")
		AnimObjectIronKnife.SetWorldModelPath("AnimObjects\\AnimObjectHuntingDagger.nif")
		EndAnim(True)
	EndIf
EndFunction

; --- Function to set transform for the displays. If PapyrusUtil is installed, then reads from json, otherwise sets default values
;
Function SetItemTransform(Int iTypeOfTransform, Form fItemtoFind, Int iTypeOfItem = 0)
	fArrayPosition = New Float[3]
	fArrayRotation = New Float[3]
	If iTypeOfTransform == 1 ; Not used anymore
	ElseIf iTypeOfTransform == 2 ; Harvest Animation
		If !ReadTransformFromJson("HarvestList", "HarvestDefault", fItemtoFind.GetWorldModelPath())
			fArrayPosition[0] = -2
			fArrayPosition[1] = -3.5
			fArrayPosition[2] = 8.5
			fArrayRotation[0] = -98
			fArrayRotation[1] = 108.5
			fArrayRotation[2] = 0
			fScale = 1
		EndIf
	ElseIf iTypeOfTransform == 3 ; Butcher Animation
		If !ReadTransformFromJson("ButcherList", "ButcherDefault", fItemtoFind.GetWorldModelPath())
			fArrayPosition[0] = -0.5
			fArrayPosition[1] = -2.5
			fArrayPosition[2] = 6.5
			fArrayRotation[0] = 0
			fArrayRotation[1] = 3
			fArrayRotation[2] = 91
			fScale = 1
		EndIf
	ElseIf iTypeOfTransform == 4 ; Arrow Animation
		If iTypeOfItem == 0 ; Arrow placed on carcass
			If !ReadTransformFromJson("ArrowList", "ArrowDefault_Carcass", fItemtoFind.GetWorldModelPath()+"_Carcass")
				fArrayPosition[0] = 5
				fArrayPosition[1] = 0
				fArrayPosition[2] = 0
				fArrayRotation[0] = 0
				fArrayRotation[1] = -18.50
				fArrayRotation[2] = -87.00
				fScale = 1
			EndIf
		Else ; Arrow placed on hand
			If !ReadTransformFromJson("ArrowList", "ArrowDefault_Hand", fItemtoFind.GetWorldModelPath()+"_Hand")	
				fArrayPosition[0] = -0.5
				fArrayPosition[1] = 26.5
				fArrayPosition[2] = -1
				fArrayRotation[0] = 0
				fArrayRotation[1] = 0
				fArrayRotation[2] = 0
				fScale = 1
			EndIf
		EndIf
	ElseIf iTypeOfTransform == 5 ; Extract Animation
		If !ReadTransformFromJson("ExtractList", "ExtractDefault", fItemtoFind.GetWorldModelPath())
			fArrayPosition[0] = 7.5
			fArrayPosition[1] = -11.5
			fArrayPosition[2] = 12
			fArrayRotation[0] = 50.5
			fArrayRotation[1] = 169
			fArrayRotation[2] = -97.5
			fScale = 1
		EndIf
	ElseIf iTypeOfTransform == 6 ; Torch display
		If !ReadTransformFromJson("TorchList", "TorchDefault", fItemtoFind.GetWorldModelPath())
			fArrayPosition[0] = 40
			fArrayPosition[1] = 0
			fArrayPosition[2] = 10
			fArrayRotation[0] = 0
			fArrayRotation[1] = 0
			fArrayRotation[2] = 90
			fScale = 1
		EndIf
	ElseIf iTypeOfTransform == 7 ; Cooking
		If iTypeOfItem == 0 ; Food placed on left hand
			If !ReadTransformFromJson("CookingList", "CookingDefault_Hand", fItemtoFind.GetWorldModelPath()+"_Hand")
				fArrayPosition[0] = -0.5
				fArrayPosition[1] = -2.5
				fArrayPosition[2] = 6.5
				fArrayRotation[0] = 0
				fArrayRotation[1] = 3
				fArrayRotation[2] = 90
				fScale = 1
			EndIf
		Else ; Food placed on knife
			If !ReadTransformFromJson("CookingList", "CookingDefault_Knife", fItemtoFind.GetWorldModelPath()+"_Knife")
				fArrayPosition[0] = 21
				fArrayPosition[1] = -2.5
				fArrayPosition[2] = 9.5
				fArrayRotation[0] = -90
				fArrayRotation[1] = 0
				fArrayRotation[2] = 60
				fScale = 1
			EndIf
		EndIf
	ElseIf iTypeOfTransform == 8 ; Process Animation
		If !ReadTransformFromJson("ProcessList", "ProcessDefault", fItemtoFind.GetWorldModelPath())
			fArrayPosition[0] = -0.5
			fArrayPosition[1] = -2.5
			fArrayPosition[2] = 6.5
			fArrayRotation[0] = 0
			fArrayRotation[1] = 3
			fArrayRotation[2] = 91
			fScale = 1
		EndIf
	EndIf
EndFunction

Bool Function ReadTransformFromJson(String sFileName, String sDefault, String sModelPath)
	; Checks if PapyrusUtil is installed
	If !PapyrusUtil.GetScriptVersion()
		Return False
	EndIf
	
	String sItemNif = sModelPath
	; Gets model path and splits it with the delimiter '\' to get the mesh file name
	If StringUtil.Find(sModelPath, "\\") != -1
		String [] sModelPathArray = StringUtil.Split(sModelPath, "\\" )
		sItemNif = sModelPathArray[sModelPathArray.Length - 1]
	EndIf
	
	; Finds additional files in the folder. This is useful if someone decides to make patch for other items; It's possible to create new files with the same names, but with a prefix/suffix.
	; Example: IH_CookingList_SomeCampfireMod.json
	; The functions below will try to look for the sItemNif in the file above first, then search the default files if not found.
	String[] sFolderArray = JsonUtil.JsonInFolder(sFilePath)
	String sFileNameDefault = sFileName
	Int iArrayIndex = sFolderArray.Length
	Bool doBreak
	
	If iArrayIndex > 7 ;  If the number of files in the folder is not greater than 7(default configs), there is no need to search for additional files.
		While iArrayIndex && !doBreak
			iArrayIndex -= 1
			If StringUtil.Find(sFolderArray[iArrayIndex], sFileName) != -1 && (sFileName + ".json") != sFolderArray[iArrayIndex]
				If JsonUtil.FloatListCount(sFilePath + sFolderArray[iArrayIndex], sItemNif) > 0
					sFileName = sFolderArray[iArrayIndex]
					doBreak = True
				EndIf
			EndIf
		EndWhile
	EndIf
	
	; Checks integrity of file
	If !JsonUtil.IsGood(sFilePath + sFileName)
		Return False
	EndIf
	
	If JsonUtil.FloatListCount(sFilePath + sFileName, sItemNif) > 0 ; Checks if the form has config
		fArrayPosition[0] = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 0)
		fArrayPosition[1] = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 1)
		fArrayPosition[2] = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 2)
		fArrayRotation[0] = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 3)
		fArrayRotation[1] = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 4)
		fArrayRotation[2] = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 5)
		fScale = JsonUtil.FloatListGet(sFilePath + sFileName, sItemNif, 6)
	ElseIf JsonUtil.FloatListCount(sFilePath + sFileNameDefault, sDefault) > 0 ; If not, then read default values
		fArrayPosition[0] = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 0)
		fArrayPosition[1] = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 1)
		fArrayPosition[2] = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 2)
		fArrayRotation[0] = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 3)
		fArrayRotation[1] = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 4)
		fArrayRotation[2] = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 5)
		fScale = JsonUtil.FloatListGet(sFilePath + sFileNameDefault, sDefault, 6)
	Else ; Didn't find config, return false
		Return False
	EndIf
	
	Return True
EndFunction