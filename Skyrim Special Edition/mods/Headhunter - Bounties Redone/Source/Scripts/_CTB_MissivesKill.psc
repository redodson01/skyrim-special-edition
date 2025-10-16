Scriptname _CTB_MissivesKill Extends Quest Hidden

LocationAlias Property Alias_Hold Auto
LocationAlias Property Alias_Dungeon Auto
ReferenceAlias Property Alias_Steward Auto
ReferenceAlias Property Alias_Missive Auto
ReferenceAlias Property Alias_Target Auto
ReferenceAlias Property Alias_Jarl Auto
ReferenceAlias Property Alias_MissiveBoard Auto
GlobalVariable Property GoldReward  Auto
MiscObject Property Gold001  Auto 

ReferenceAlias Property Alias_HEAD Auto
ReferenceAlias Property Alias_HeadOwner Auto 
ReferenceAlias Property Alias_Player Auto
Faction Property _CTB_BanditJailed Auto

;BEGIN FRAGMENT Fragment_0 Stage20 f90b3
Function Fragment_20()
;BEGIN CODE
;Debug.Notification("Stage20")
SetObjectiveDisplayed(20);Start

if(Alias_Target.GetActorRef().IsDead())
SetStage(30)
Alias_Head.GetReference().Enable()
Alias_Target.GetActorReference().Additem(Alias_Head.GetReference())
;Add head to dead target
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16 Stage30 GetHead
Function Fragment_30()
;Debug.Notification("Stage30")
;BEGIN CODE
SetObjectiveCompleted(20)
;SetObjectiveDisplayed(30) ;GetHead
If IsObjectiveDisplayed(50) ;Follow player
SetObjectiveFailed(50) ; if dead when follow player
Endif
;END CODE
EndFunction
;END FRAGMENT


;BEGIN FRAGMENT Fragment_17 Stage35 Follow player
Function Fragment_35()
;Debug.Notification("Stage35")
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(50) ;Follow player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2 Stage40 GetReward
Function Fragment_40()
;Debug.Notification("Stage40")
;BEGIN CODE
If IsObjectiveDisplayed(20)
SetObjectiveCompleted(20)
endif
If IsObjectiveDisplayed(30)
SetObjectiveCompleted(30)
endif
If IsObjectiveDisplayed(50)
SetObjectiveCompleted(50)
endif
if(Alias_Steward.GetRef())
SetObjectiveDisplayed(40) ;GetReward
else
SetObjectiveDisplayed(41)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4 Stage100 Complete
Function Fragment_100()
;BEGIN CODE
CompleteAllObjectives()
Alias_Player.GetRef().AddItem(Gold001, GoldReward.GetValue() as int)
Alias_Player.GetRef().RemoveItem(Alias_HEAD.GetRef()) ; remove TargetHead

;If Jailed & not dead(not arrive prison yet), mark factionrank to 1 to remove faction when dead.
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7 Stage105 Fail
Function Fragment_105()
;BEGIN CODE
FailAllObjectives()
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9 Stage110
Function Fragment_110()
;BEGIN CODE
if(Alias_MissiveBoard.GetRef().GetItemCount(Alias_Missive.GetRef()) > 0)
Alias_MissiveBoard.GetRef().RemoveItem(Alias_Missive.GetRef())
;Debug.Trace("Missive Removed from Board")
elseif(Alias_Player.GetRef().GetItemCount(Alias_Missive.GetRef()) > 0)
Alias_Player.GetRef().RemoveItem(Alias_Missive.GetRef())
;Debug.Trace("Missive Removed from Player")
endIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment