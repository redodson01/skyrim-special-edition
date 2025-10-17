;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname randomQuestGatherScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY questGiverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_questGiverAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY item1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_item1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY noteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_noteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY containerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_containerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY item2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_item2Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
FailAllObjectives()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Form item1 = Alias_Item1Alias.GetRef().GetBaseObject()
Form item2 = Alias_Item2Alias.GetRef().GetBaseObject()
Form backup1 = randomQuestGatherBackup1.GetBaseObject()
Form backup2 = randomQuestGatherBackup2.GetBaseObject()

If item1 == item2
  If item2 != backup1
    Alias_Item2Alias.ForceRefTo(randomQuestGatherBackup1)
    item2 = backup1
  ElseIf item2 != backup2
    Alias_Item2Alias.ForceRefTo(randomQuestGatherBackup2)
    item2 = backup2
  EndIf
EndIf

int count1 = Utility.RandomInt(2, 6)
int count2 = Utility.RandomInt(2, 6)

randomQuestGather1Goal.SetValueInt(count1)
randomQuestGather2Goal.SetValueInt(count2)
randomQuestGather1Current.SetValueInt(0)
randomQuestGather2Current.SetValueInt(0)

UpdateCurrentInstanceGlobal(randomQuestGather1Goal)
UpdateCurrentInstanceGlobal(randomQuestGather2Goal)

Alias_PlayerAlias.AddInventoryEventFilter(item1)
Alias_PlayerAlias.AddInventoryEventFilter(item2)
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

Form item1 = alias1.GetBaseObject()
Form item2 = alias2.GetBaseObject()

Actor player = Game.GetPlayer()

player.RemoveItem(item1, 1, abSilent=true)
player.RemoveItem(item2, 1, abSilent=true)
player.AddItem(alias1, abSilent=true)
player.AddItem(alias2, abSilent=true)
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
int count1 = randomQuestGather1Goal.GetValueInt()
int count2 = randomQuestGather2Goal.GetValueInt()

randomQuestMaster.GiveReward(questGiver, self)
player.RemoveItem(item1, count1, questGiver)
player.RemoveItem(item2, count2, questGiver)
randomQuestMaster.ImproveRelationship(questGiver)
CompleteAllObjectives()
CompleteQuest()
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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
UpdateCount()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function UpdateCount()
	Actor player = Game.GetPlayer()
	int oldCount1 = randomQuestGather1Current.GetValueInt()
	int oldCount2 = randomQuestGather2Current.GetValueInt()

	Form item1 = Alias_Item1Alias.GetRef().GetBaseObject()
	Form item2 = Alias_Item2Alias.GetRef().GetBaseObject()

	int count1 = player.GetItemCount(item1)
	int count2 = player.GetItemCount(item2)
	int goal1 = randomQuestGather1Goal.GetValueInt()
	int goal2 = randomQuestGather2Goal.GetValueInt()

	If count1 > goal1
		count1 = goal1
	EndIf
	If count2 > goal2
		count2 = goal2
	EndIf

	randomQuestGather1Current.SetValueInt(count1)
	randomQuestGather2Current.SetValueInt(count2)

	UpdateCurrentInstanceGlobal(randomQuestGather1Current)
	UpdateCurrentInstanceGlobal(randomQuestGather2Current)

	If oldCount1 != count1 || !IsObjectiveDisplayed(50)
		SetObjectiveDisplayed(50, true, true)
	EndIf
	If oldCount2 != count2 || !IsObjectiveDisplayed(51)
		SetObjectiveDisplayed(51, true, true)
	EndIf

	If count1 == goal1
		SetObjectiveCompleted(50)
	EndIf
	If count2 == goal2
		SetObjectiveCompleted(51)
	EndIf

	If count1 >= goal1 && count2 >= goal2 && GetStage() == 50
		SetStage(60)
	EndIf
EndFunction

GlobalVariable Property randomQuestGather1Current Auto
GlobalVariable Property randomQuestGather2Current Auto
GlobalVariable Property randomQuestGather1Goal  Auto  
GlobalVariable Property randomQuestGather2Goal  Auto  
randomQuestMasterScript Property randomQuestMaster Auto
ObjectReference Property randomQuestGatherBackup1  Auto  
ObjectReference Property randomQuestGatherBackup2  Auto  
