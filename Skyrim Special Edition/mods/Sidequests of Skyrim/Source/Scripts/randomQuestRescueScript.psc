;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname randomQuestRescueScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY nameSuffix
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_nameSuffix Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY nameMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_nameMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY containerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_containerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY namePrefix
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_namePrefix Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY victimBoundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_victimBoundAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HoldAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY noteAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_noteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY questGiverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_questGiverAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LocationAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY victimEssentialAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_victimEssentialAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor questGiver = Alias_QuestGiverAlias.GetActorRef()
Actor victim = Alias_VictimAlias.GetActorRef()

randomQuestMaster.GiveReward(questGiver, self)
randomQuestMaster.ImproveRelationship(questGiver)
victim.EvaluatePackage()

CompleteAllObjectives()
CompleteQuest()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
ObjectReference victimBound = Alias_VictimBoundAlias.GetRef()
Actor victim = Alias_VictimAlias.GetActorRef()
Actor questGiver = Alias_QuestGiverAlias.GetActorRef()
Actor player = Game.GetPlayer()
victim.GoToState("")
victim.MoveTo(victimBound)
victim.SetRestrained(true)

victim.SetCrimeFaction(questGiver.GetCrimeFaction())
victim.SetRelationshipRank(player, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
ObjectReference victimBound = Alias_VictimBoundAlias.GetRef()
victimBound.Delete()
ObjectReference namePrefix = Alias_NamePrefix.GetRef()
namePrefix.Delete()
ObjectReference nameSuffix = Alias_NameSuffix.GetRef()
namePrefix.Delete()

Actor victim = Alias_VictimAlias.GetActorRef()

ObjectReference note = Alias_NoteAlias.GetRef()
ObjectReference containerRef = Alias_ContainerAlias.GetRef()
Game.GetPlayer().RemoveItem(note)
containerRef.RemoveAllItems()
Stop()
PO3_SKSEFunctions.ClearReadFlag(note.GetBaseObject() as Book)
(victim as randomQuestDelayedDeleteScript).Despawn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_VictimEssentialAlias.Clear()

SetObjectiveCompleted(10)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

Actor victim = Alias_VictimAlias.GetActorRef()
Actor player = Game.GetPlayer()

victim.SetRelationshipRank(player, victim.GetRelationshipRank(player) + 1)
victim.SetRestrained(false)
victim.EvaluatePackage()
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

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
FailAllObjectives()
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(50)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

randomQuestMasterScript Property randomQuestMaster Auto

bool victimWasEssential
