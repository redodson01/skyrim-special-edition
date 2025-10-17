;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname randomQuestShoppingScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY containerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_containerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY noteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_noteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY item4Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_item4Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY item2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_item2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY questGiverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_questGiverAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY item3Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_item3Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY item1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_item1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
UpdateCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
FailAllObjectives()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)
Game.GetPlayer().AddItem(Alias_noteAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Form item1 = Alias_Item1Alias.GetRef().GetBaseObject()
Form item2 = Alias_Item2Alias.GetRef().GetBaseObject()
Form item3 = Alias_Item3Alias.GetRef().GetBaseObject()
Form item4 = Alias_Item4Alias.GetRef().GetBaseObject()

int count1 = Utility.RandomInt(1, 3)
int count2 = Utility.RandomInt(1, 3)
int count3 = Utility.RandomInt(1, 3)
int count4 = Utility.RandomInt(1, 3)

randomQuestShopping1Goal.SetValueInt(count1)
randomQuestShopping2Goal.SetValueInt(count2)
randomQuestShopping3Goal.SetValueInt(count3)
randomQuestShopping4Goal.SetValueInt(count4)

randomQuestShopping1Current.SetValueInt(0)
randomQuestShopping2Current.SetValueInt(0)
randomQuestShopping3Current.SetValueInt(0)
randomQuestShopping4Current.SetValueInt(0)

UpdateCurrentInstanceGlobal(randomQuestShopping1Goal)
UpdateCurrentInstanceGlobal(randomQuestShopping2Goal)
UpdateCurrentInstanceGlobal(randomQuestShopping3Goal)
UpdateCurrentInstanceGlobal(randomQuestShopping4Goal)

Alias_PlayerAlias.AddInventoryEventFilter(item1)
Alias_PlayerAlias.AddInventoryEventFilter(item2)
Alias_PlayerAlias.AddInventoryEventFilter(item3)
Alias_PlayerAlias.AddInventoryEventFilter(item4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
FailAllObjectives()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
ObjectReference note = Alias_NoteAlias.GetRef()
ObjectReference containerRef = Alias_ContainerAlias.GetRef()
Game.GetPlayer().RemoveItem(note)
containerRef.RemoveAllItems()
Stop()
PO3_SKSEFunctions.ClearReadFlag(note.GetBaseObject() as Book)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(50)
SetObjectiveCompleted(51)
SetObjectiveDisplayed(60)

ObjectReference alias1 = Alias_Item1Alias.GetRef()
ObjectReference alias2 = Alias_Item2Alias.GetRef()
ObjectReference alias3 = Alias_Item3Alias.GetRef()
ObjectReference alias4 = Alias_Item4Alias.GetRef()

Form item1 = alias1.GetBaseObject()
Form item2 = alias2.GetBaseObject()
Form item3 = alias3.GetBaseObject()
Form item4 = alias4.GetBaseObject()

Actor player = Game.GetPlayer()

player.RemoveItem(item1, 1, abSilent=true)
player.RemoveItem(item2, 1, abSilent=true)
player.RemoveItem(item3, 1, abSilent=true)
player.RemoveItem(item4, 1, abSilent=true)
player.AddItem(alias1, abSilent=true)
player.AddItem(alias2, abSilent=true)
player.AddItem(alias3, abSilent=true)
player.AddItem(alias4, abSilent=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor questGiver = Alias_QuestGiverAlias.GetActorRef()

Form item1 = Alias_Item1Alias.GetRef().GetBaseObject()
Form item2 = Alias_Item2Alias.GetRef().GetBaseObject()
Form item3 = Alias_Item3Alias.GetRef().GetBaseObject()
Form item4 = Alias_Item4Alias.GetRef().GetBaseObject()

int count1 = randomQuestShopping1Goal.GetValueInt()
int count2 = randomQuestShopping2Goal.GetValueInt()
int count3 = randomQuestShopping3Goal.GetValueInt()
int count4 = randomQuestShopping4Goal.GetValueInt()

randomQuestMaster.GiveReward(questGiver, self)
player.RemoveItem(item1, count1, questGiver)
player.RemoveItem(item2, count2, questGiver)
player.RemoveItem(item3, count3, questGiver)
player.RemoveItem(item4, count4, questGiver)
randomQuestMaster.ImproveRelationship(questGiver)
CompleteAllObjectives()
CompleteQuest()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function UpdateCount()
	Actor player = Game.GetPlayer()
	int oldCount1 = randomQuestShopping1Current.GetValueInt()
	int oldCount2 = randomQuestShopping2Current.GetValueInt()
	int oldCount3 = randomQuestShopping3Current.GetValueInt()
	int oldCount4 = randomQuestShopping4Current.GetValueInt()

	Form item1 = Alias_Item1Alias.GetRef().GetBaseObject()
	Form item2 = Alias_Item2Alias.GetRef().GetBaseObject()
	Form item3 = Alias_Item3Alias.GetRef().GetBaseObject()
	Form item4 = Alias_Item4Alias.GetRef().GetBaseObject()

	int count1 = player.GetItemCount(item1)
	int count2 = player.GetItemCount(item2)
	int count3 = player.GetItemCount(item3)
	int count4 = player.GetItemCount(item4)

	int goal1 = randomQuestShopping1Goal.GetValueInt()
	int goal2 = randomQuestShopping2Goal.GetValueInt()
	int goal3 = randomQuestShopping3Goal.GetValueInt()
	int goal4 = randomQuestShopping4Goal.GetValueInt()

	If count1 > goal1
		count1 = goal1
	EndIf
	If count2 > goal2
		count2 = goal2
	EndIf
	If count3 > goal3
		count3 = goal3
	EndIf
	If count4 > goal4
		count4 = goal4
	EndIf

	randomQuestShopping1Current.SetValueInt(count1)
	randomQuestShopping2Current.SetValueInt(count2)
	randomQuestShopping3Current.SetValueInt(count3)
	randomQuestShopping4Current.SetValueInt(count4)

	UpdateCurrentInstanceGlobal(randomQuestShopping1Current)
	UpdateCurrentInstanceGlobal(randomQuestShopping2Current)
	UpdateCurrentInstanceGlobal(randomQuestShopping3Current)
	UpdateCurrentInstanceGlobal(randomQuestShopping4Current)

	If oldCount1 != count1 || !IsObjectiveDisplayed(50)
		SetObjectiveDisplayed(50, true, true)
	EndIf
	If oldCount2 != count2 || !IsObjectiveDisplayed(51)
		SetObjectiveDisplayed(51, true, true)
	EndIf
	If oldCount3 != count3 || !IsObjectiveDisplayed(52)
		SetObjectiveDisplayed(52, true, true)
	EndIf
	If oldCount4 != count4 || !IsObjectiveDisplayed(53)
		SetObjectiveDisplayed(53, true, true)
	EndIf

	If count1 == goal1
		SetObjectiveCompleted(50)
	EndIf
	If count2 == goal2
		SetObjectiveCompleted(51)
	EndIf
	If count3 == goal3
		SetObjectiveCompleted(52)
	EndIf
	If count4 == goal4
		SetObjectiveCompleted(53)
	EndIf

	If count1 >= goal1 && count2 >= goal2 && count3 >= goal3 && count4 >= goal4 && GetStage() == 50
		SetStage(60)
	EndIf
EndFunction

randomQuestMasterScript Property randomQuestMaster Auto

GlobalVariable Property randomQuestShopping1Current Auto
GlobalVariable Property randomQuestShopping2Current Auto
GlobalVariable Property randomQuestShopping3Current Auto
GlobalVariable Property randomQuestShopping4Current Auto
GlobalVariable Property randomQuestShopping1Goal Auto
GlobalVariable Property randomQuestShopping2Goal Auto
GlobalVariable Property randomQuestShopping3Goal Auto
GlobalVariable Property randomQuestShopping4Goal Auto

