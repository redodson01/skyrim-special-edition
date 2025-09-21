;BEGIN FRAGMENT CODE - Do not edit anything between this and the End comment
;NEXT FRAGMENT INDEX 2
Scriptname DAK_PlanterPerkScript Extends Perk Hidden

Quest Property AddonsCollectionQuest Auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
    ;BEGIN CODE
    ; (akTargetRef as BYOHPlanterContainerScript).Activate(Game.GetPlayer(), FALSE)
    ; Debug.Notification(akTargetRef.GetBaseObject().GetName())
    DAK_AddonsCollectionQuestScript AddonQuest = AddonsCollectionQuest.GetAlias(0) as DAK_AddonsCollectionQuestScript
    If AddonQuest && AddonQuest.LastSeed
        BYOHPlanterSoilScript soil = akTargetRef as BYOHPlanterSoilScript
        If soil
            BYOHPlanterContainerScript cont = soil.PlanterContainer as BYOHPlanterContainerScript
            If cont
                If akActor.GetItemCount(AddonQuest.LastSeed) > 0
                    cont.AddItem(AddonQuest.LastSeed, 1)
                    akActor.RemoveItem(AddonQuest.LastSeed, 1, True)
                Else
                    AddonQuest.DAK_NoMoreSeeds.Show()
                EndIf
            EndIf
        EndIf
    EndIf
    ;End CODE
EndFunction
;End FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
    ;BEGIN CODE
    DAK_AddonsCollectionQuestScript AddonQuest = AddonsCollectionQuest.GetAlias(0) as DAK_AddonsCollectionQuestScript
    ObjectReference[] objectReferencesList = AddonQuest.GetAllPlantsFromPlanters(akActor)
    Int iIndex = 0
    while objectReferencesList[iIndex] && iIndex < 100
        ; Debug.Notification("Flora is " + objectReferencesList[iIndex].GetBaseObject().GetName())
        objectReferencesList[iIndex].Activate(akActor, FALSE)
        iIndex += 1
    EndWhile
    ;End CODE
EndFunction
;End FRAGMENT

;End FRAGMENT CODE - Do not edit anything between this and the begin comment

