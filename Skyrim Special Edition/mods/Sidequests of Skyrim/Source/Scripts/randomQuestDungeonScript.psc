;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname randomQuestDungeonScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY containerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_containerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HoldAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LocationAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY questGiverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_questGiverAlias Auto
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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_noteAlias.GetRef())
SetObjectiveDisplayed(10)
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
SetObjectiveCompleted(10)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

randomQuestMasterScript Property randomQuestMaster Auto
