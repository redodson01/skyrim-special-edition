Scriptname buyAndSellTorchesScript extends ReferenceAlias

Event OnInit()
	SetUp()
EndEvent

Event OnPlayerLoadGame()
	SetUp()
EndEvent

Function SetUp()
	RegisterForMenu("BarterMenu")
EndFunction

Event OnMenuOpen(String MenuName)
	GoToState("busy")
	If MenuName == "BarterMenu"
		Actor vendor = Game.GetCurrentCrosshairRef() as Actor
		ObjectReference vendorContainer = None
		If vendor
			Faction vendorFaction = PO3_SKSEFunctions.GetVendorFaction(vendor)
			If vendorFaction
				vendorContainer = PO3_SKSEFunctions.GetVendorFactionContainer(vendorFaction)
				If vendorContainer
					int vendorCount = vendorContainer.GetItemCount(Torch01)
					If vendorCount
						vendorContainer.RemoveItem(Torch01, vendorCount)
						vendorContainer.AddItem(buyAndSellTorchesMiscItem, vendorCount)
						vendor.AddItem(buyAndSellTorchesMiscItem, 1)
						vendor.RemoveItem(buyAndSellTorchesMiscItem, 1)
					EndIf
				EndIf
			EndIF
		EndIf

		int playerTorchCount = PlayerRef.GetItemCount(Torch01)
		If playerTorchCount && !Game.IsObjectFavorited(Torch01)
			PlayerRef.RemoveItem(Torch01, playerTorchCount, abSilent=true)
			PlayerRef.AddItem(buyAndSellTorchesMiscItem, playerTorchCount, abSilent=true)
		EndIf

		While (Utility.IsInMenuMode())
			Utility.Wait(0.1)
		EndWhile

		playerTorchCount = PlayerRef.GetItemCount(buyAndSellTorchesMiscItem)
		If playerTorchCount 
			PlayerRef.RemoveItem(buyAndSellTorchesMiscItem, playerTorchCount, abSilent=true)
			PlayerRef.AddItem(Torch01, playerTorchCount, abSilent=true)
		EndIf

		If vendorContainer
			int vendorCount = vendorContainer.GetItemCount(buyAndSellTorchesMiscItem)
			If vendorCount
				vendorContainer.RemoveItem(buyAndSellTorchesMiscItem, vendorCount)
				vendorContainer.AddItem(Torch01, vendorCount)
			EndIf
		EndIf
	EndIf
	GoToState("")
EndEvent

State Busy
	Event OnMenuOpen(String MenuName)
	EndEvent
EndState

Light Property Torch01 Auto
MiscObject Property buyAndSellTorchesMiscItem Auto
Actor Property PlayerRef Auto
