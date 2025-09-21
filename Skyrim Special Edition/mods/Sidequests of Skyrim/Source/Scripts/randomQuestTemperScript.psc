;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname randomQuestTemperScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY containerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_containerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY itemNameAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_itemNameAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY noteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_noteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY itemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_itemAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY questGiverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_questGiverAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
Actor player = Game.GetPlayer()

player.AddItem(Alias_noteAlias.GetRef())
player.AddItem(Alias_itemAlias.GetRef())

player.AddItem(randomQuestTemperIronIngot, player.GetItemCount(IngotIron), true)
player.AddItem(randomQuestTemperSteelIngot, player.GetItemCount(IngotSteel), true)

Alias_PlayerAlias.AddInventoryEventFilter(randomQuestTemperIronIngot)
Alias_PlayerAlias.AddInventoryEventFilter(randomQuestTemperSteelIngot)
Alias_PlayerAlias.AddInventoryEventFilter(IngotIron)
Alias_PlayerAlias.AddInventoryEventFilter(IngotSteel)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
ObjectReference note = Alias_NoteAlias.GetRef()
ObjectReference containerRef = Alias_ContainerAlias.GetRef()
Actor player = Game.GetPlayer()
player.RemoveItem(note)
player.RemoveItem(randomQuestTemperIronIngot, player.GetItemCount(randomQuestTemperIronIngot), true)
player.RemoveItem(randomQuestTemperSteelIngot, player.GetItemCount(randomQuestTemperSteelIngot), true)
containerRef.RemoveAllItems()
Stop()
PO3_SKSEFunctions.ClearReadFlag(note.GetBaseObject() as Book)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor questGiver = Alias_QuestGiverAlias.GetActorRef()
ObjectReference item = Alias_ItemAlias.GetRef()

randomQuestMaster.GiveReward(questGiver, self)
questGiver.AddItem(item)
randomQuestMaster.ImproveRelationship(questGiver)
CompleteAllObjectives()
CompleteQuest()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
FailAllObjectives()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
ObjectReference item = Alias_ItemAlias.GetRef()
Actor questGiver = Alias_QuestGiverAlias.GetActorRef()

questGiver.AddItem(item)

FailAllObjectives()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

Alias_PlayerAlias.RemoveAllInventoryEventFilters()
Alias_PlayerAlias.AddInventoryEventFilter(randomQuestEmptyFormList)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

randomQuestMasterScript Property randomQuestMaster Auto

MiscObject Property randomQuestTemperIronIngot Auto
MiscObject Property randomQuestTemperSteelIngot Auto

MiscObject Property IngotIron Auto
MiscObject Property IngotSteel Auto

FormList Property randomQuestEmptyFormList Auto
