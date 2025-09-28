Scriptname NPCPotion_Playerdrinks extends ReferenceAlias  
Sound Property ITMPotionUse  Auto  
Actor Property PlayerRef Auto
keyword property VendorItemPotion Auto
Formlist property NPCPotion_DrinkList Auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
If akBaseObject.haskeyword(VendorItemPotion) 
Playsound()
elseif NPCPotion_DrinkList.HasForm(akBaseObject)
Playsound()
Endif
EndEvent

Function PlaySound()
int instanceID = ITMPotionUse.play(PlayerRef)     
Sound.SetInstanceVolume(instanceID, 1.0)
EndFunction
