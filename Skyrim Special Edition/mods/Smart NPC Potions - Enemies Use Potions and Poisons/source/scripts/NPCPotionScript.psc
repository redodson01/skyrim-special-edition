Scriptname NPCPotionScript extends Quest  
Quest property NPCPotion_NPCQuest Auto

Event OnUpdate() 
NPCPotion_NPCQuest.Stop() 
Utility.Wait(0.5) 
NPCPotion_NPCQuest.Start()
EndEvent