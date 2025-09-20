Scriptname ProducersOfSkyrimSFOBaitAddonScript extends ReferenceAlias  

Keyword Property VendorItemFisherman Auto
FormList Property AnimatedFishing_Bait Auto


event OnInit()
	AddKeywordToBait()
endEvent

event OnPlayerLoadGame()
	AddKeywordToBait()
endEvent

function AddKeywordToBait()
	Form[] SFOBait = AnimatedFishing_Bait.ToArray()
	int i = SFOBait.Length
	while i > 0
		i -= 1
		PO3_SKSEFunctions.AddKeywordToForm(SFOBait[i], VendorItemFisherman)
	endwhile
endFunction
