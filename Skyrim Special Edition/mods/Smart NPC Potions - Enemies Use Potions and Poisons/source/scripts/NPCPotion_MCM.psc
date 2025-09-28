Scriptname NPCPotion_MCM extends Ski_configbase

GlobalVariable Property NPCPotion_DropPotion Auto
GlobalVariable Property NPCPotion_ChanceGlobal Auto
GlobalVariable Property NPCPotion_MaxPotion Auto
GlobalVariable Property NPCPotion_Warriors1 Auto
GlobalVariable Property NPCPotion_Mages1 Auto
GlobalVariable Property NPCPotion_Assassins1 Auto

int chanceglobal_s
int maxpotion_s
int droppotion_s
int bandits
int mages
int assassins

float chanceglobal = 40.0
float maxpotion = 4.0
float droppotion = 15.0

bool banditsToggle = true
bool magesToggle = true
bool assassinsToggle = true


 event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "Settings"
EndEvent

Event OnPageReset(string page)

	If (page == "")
		
		LoadCustomContent("MCM/MCM_Potion.dds", 0.0, 0.0)
		Else
		UnloadCustomContent()
	Endif

	If (page == "Settings")
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("Custom Values")
		AddHeaderOption("NPC Types")
		AddEmptyOption()
		AddEmptyOption()
		chanceglobal_s = AddSliderOption("Chance of NPC using potions:", chanceglobal, "{0}% chance")
		Bandits = AddToggleOption("Bandits may use potions", banditsToggle)
		maxpotion_s = AddSliderOption("Max number of potions:", maxpotion, "{0} potions")
		Mages = AddToggleOption("Mages may use potions", MagesToggle)
		droppotion_s = AddSliderOption("Chance of dropping potion:", droppotion, "{0}% chance")
		Assassins = AddToggleOption("Assassins may use potions", AssassinsToggle)
Endif
EndEvent


event OnOptionSliderOpen(int option)
	if (option == chanceglobal_s)
		SetSliderDialogStartValue(chanceglobal)
		SetSliderDialogDefaultValue(40.0)
		SetSliderDialogRange(0.0, 95.0)
		SetSliderDialogInterval(1.0)

		elseif (option == maxpotion_s)
		SetSliderDialogStartValue(maxpotion)
		SetSliderDialogDefaultValue(4.0)
		SetSliderDialogRange(1.0, 15.0)
		SetSliderDialogInterval(1.0)
	
		elseif (option == droppotion_s)
		SetSliderDialogStartValue(droppotion)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(0.0, 95.0)
		SetSliderDialogInterval(1.0)
	
endif
endevent

event OnOptionSliderAccept(int option, float value)
	if (option == chanceglobal_s)
		chanceglobal = value
		NPCpotion_ChanceGlobal.SetValue(chanceglobal)
		SetSliderOptionValue(chanceglobal_S, chanceglobal, "{0}% chance")

	elseIf (option == maxpotion_s)
		maxpotion = value
		NPCPotion_MaxPotion.SetValue(maxpotion)
		SetSliderOptionValue(maxpotion_S, maxpotion, "{0}% potions")

	elseIf (option == droppotion_s)
		droppotion = value
		npcpotion_droppotion.SetValue(droppotion)
		SetSliderOptionValue(droppotion_S, droppotion, "{0} chance")

	endIf
endEvent

event OnOptionHighlight(int option) 
if (option == chanceglobal_s) 
SetInfoText("Likelihood that an enemy NPC uses potions during a fight.\nOnly bandits, mages and assassins are affected. Default: 40%") 
elseif (option == maxpotion_s) 
SetInfoText("Maximum number of potions an affected NPC can use during a fight.\nFinal number is random, but this defines the maximum. Default: 4") 
elseif (option == droppotion_s) 
SetInfoText("Chance that the affected NPC will have a lootable unused potion\non their corpse after the fight. Default: 15%") 
elseif (option == Bandits) 
SetInfoText("Disables bandits from being affected by my mod. This will exempt them from the system.") 
elseif (option == Mages) 
SetInfoText("Disables mages, necromancers and the like from being affected by my mod. This will exempt them from the system.") 
elseif (option == Assassins) 
SetInfoText("Disables assassins, thieves and the like from being affected by my mod. This will exempt them from the system.") 
endIf 
endEvent

event OnOptionSelect(int option)

	if (option == Bandits) && BanditsToggle == True
		BanditsToggle = False
		SetToggleOptionValue(Bandits, BanditsToggle)
		NPCpotion_Warriors1.SetValue(0)
	elseif (option == Bandits) && BanditsToggle == False
		BanditsToggle = True
		SetToggleOptionValue(Bandits, BanditsToggle)
		NPCpotion_Warriors1.SetValue(1)
	elseif (option == Mages) && MagesToggle == True
		MagesToggle = False
		SetToggleOptionValue(Mages, MagesToggle)
		NPCpotion_Mages1.SetValue(0)
	elseif (option == Mages) && MagesToggle == False
		MagesToggle = True
		SetToggleOptionValue(Mages, MagesToggle)
		NPCpotion_Mages1.SetValue(1)
	elseif (option == Assassins) && AssassinsToggle == True
		AssassinsToggle = False
		SetToggleOptionValue(Assassins, AssassinsToggle)
		NPCpotion_Assassins1.SetValue(0)
	elseif (option == Assassins) && AssassinsToggle == False
		AssassinsToggle = True
		SetToggleOptionValue(Assassins, AssassinsToggle)
		NPCpotion_Assassins1.SetValue(1)
Endif
EndEvent

