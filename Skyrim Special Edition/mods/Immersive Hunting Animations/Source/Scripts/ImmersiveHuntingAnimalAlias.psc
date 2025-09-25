Scriptname ImmersiveHuntingAnimalAlias extends ReferenceAlias  

ImmersiveHuntingFunctions Property ihFunctions Auto

; --- Tracks what's being removed from the carcass to perform the corresponding animations

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If akDestContainer != ihFunctions.PlayerRef
		Return
	EndIf
	
	ObjectReference orAnimalRef = Self.GetReference()
	
	If ihFunctions.IH_EnableSkin.GetValue() && akBaseItem.HasKeywordString("VendorItemAnimalHide") && akBaseItem.GetType() != 26
		If orAnimalRef.GetItemCount(ihFunctions.IH_SkinnedToken) == 0
			orAnimalRef.AddItem(ihFunctions.IH_SkinnedToken, 1)
			ihFunctions.IH_HasPelt.SetValue(1)
			ihFunctions.LootAnimal(1, orAnimalRef)
		EndIf
		
		Return
	EndIf
	
	If  ihFunctions.IH_EnableHarvest.GetValue() && (akBaseItem.HasKeywordString("VendorItemAnimalPart") || akBaseItem.HasKeywordString("VendorItemIngredient") || akBaseItem.GetType() == 30)
		ihFunctions.fHuntingMaterial = akBaseItem
		If orAnimalRef.GetItemCount(ihFunctions.IH_HarvestedToken) == 0
			orAnimalRef.AddItem(ihFunctions.IH_HarvestedToken, 1)
			ihFunctions.IH_HasMaterial.SetValue(1)
			ihFunctions.LootAnimal(2, orAnimalRef)
		EndIf
		
		Return
	EndIf
	
	If ihFunctions.IH_EnableButcher.GetValue() && (akBaseItem.HasKeywordString("VendorItemFood") || akBaseItem.HasKeywordString("VendorItemFoodRaw") || (akBaseItem as Potion && (akBaseItem as Potion).IsFood()))
		ihFunctions.fHuntingFood = akBaseItem
		If orAnimalRef.GetItemCount(ihFunctions.IH_ButcheredToken) == 0
			orAnimalRef.AddItem(ihFunctions.IH_ButcheredToken, 1)
			ihFunctions.IH_HasMeat.SetValue(1)
			ihFunctions.LootAnimal(3, orAnimalRef)
		EndIf
		
		Return
	EndIf
	
	If  ihFunctions.IH_EnableRemoveArrow.GetValue() && akBaseItem.GetType() == 42
		If (akBaseItem as Ammo).isBolt()
			ihFunctions.fHuntingBolt = (akBaseItem as Ammo).GetProjectile() as Form
		Else
			ihFunctions.fHuntingArrow = (akBaseItem as Ammo).GetProjectile() as Form 
		EndIf
	
		ihFunctions.IH_HasArrows.SetValue(1)
		ihFunctions.LootAnimal(4, orAnimalRef)
		Return
	EndIf
	
	If ihFunctions.IH_EnableExtract.GetValue() && (akBaseItem.HasKeywordString("VendorItemPotion") || akBaseItem.HasKeywordString("VendorItemPoison") || (akBaseItem as Potion && !(akBaseItem as Potion).IsFood()))
		If ihFunctions.CheckForBottles(False)
			ihFunctions.fHuntingPotion = akBaseItem
			
			If orAnimalRef.GetItemCount(ihFunctions.IH_ExtractedToken) == 0
				orAnimalRef.AddItem(ihFunctions.IH_ExtractedToken, 1)
				ihFunctions.IH_HasPotion.SetValue(1)
				ihFunctions.LootAnimal(5, orAnimalRef)
			EndIf
			
			Return
		ElseIf !ihFunctions.bVenomRequiresBottles
			akDestContainer.RemoveItem(akBaseItem, 1, True, orAnimalRef)
		EndIf
	EndIf
EndEvent
