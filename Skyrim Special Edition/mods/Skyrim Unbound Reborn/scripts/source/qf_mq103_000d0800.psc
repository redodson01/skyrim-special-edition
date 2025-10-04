;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 111
Scriptname QF_MQ103_000D0800 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BleakFallsBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BleakFallsBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farengar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farengar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonsreachCellTracker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonsreachCellTracker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riverwood
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Riverwood Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragonStone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragonStone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BleakFallsLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BleakFallsLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Balgruuf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Balgruuf Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_97
Function Fragment_97()
;BEGIN CODE
; setting this stage prior to stage 10 makes Balgruuf sit on the throne and Farengar approach Balgruuf
; instead of Balgruuf leading the player to Farengar
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
; Delphine scene ends, Delphine can leave
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
; quest starts running so book is in Bleak Falls from game start
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
; set up Delphine scene if player gets tablet in Bleak Falls after starting MQ103
; move Delphine to Dragonsreach
Alias_Delphine.TryToMoveTo(DelphineMoveMarker)
Alias_Delphine.GetActorRef().SetOutfit(DelphineSpyOutfit)
; enable Farengar's book
FarengarBook.Enable()
; enable outro trigger
OutroTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
; player approaches Farengar & Delphine
OutroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
; if player has Dragonstone already, kill the intro scene so Balgruuf can start walking to MQ104 position
IntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; start quest on Imperial side
; debug.trace("MQ Quickstart " + self)
;MQ102.setstage(1) ; SUR - disabled
MQ102.setstage(50)
MQ102.setstage(80)
MQ102.setstage(100)
MQ102.setstage(110)
MQ102.setstage(150)
MQ102.setstage(160)
; debug.trace("MQ Quickstart " + self)

MQReserved.SetStage(10)
FarengarReserved.Clear()

; open the 1st dragon mound
dunDragonMoundQST.SetStage(10)
; open 2 more dragon mounds
dunDragonMoundQST.SetStage(20)

GlobalVariable MQ103IntegrityReport = Game.GetFormFromFile(0x855726, "Skyrim Unbound.esp") as GlobalVariable
if MQ103Reward
    MQ103IntegrityReport.SetValue(2)
else
    MQ103IntegrityReport.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
; trigger Irileth/guard conversation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(50)
BleakFallsMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN AUTOCAST TYPE MQ103NewScript
Quest __temp = self as Quest
MQ103NewScript kmyQuest = __temp as MQ103NewScript
;END AUTOCAST
;BEGIN CODE
; Farengar mentions Dragon War
kmyQuest.MQ00.DragonWarFlag = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_106
Function Fragment_106()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; debug.trace(self + " stage 200 - stopping quest")
if IsObjectiveDisplayed(100)
    SetObjectiveCompleted(100)
endif
if IsObjectiveDisplayed(101)
    SetObjectiveCompleted(101)
endif
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
; empty
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
; empty
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_108
Function Fragment_108()
;BEGIN CODE
SetObjectiveDisplayed(101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_89
Function Fragment_89()
;BEGIN CODE
; intro scene done, Balgruuf can walk away
(Alias_DragonsreachCellTracker as SURMQ103DragonsreachCellTrackerScript).GoToState("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
; everyone's in Farengar's room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
SetObjectiveDisplayed(10)
Actor BalgruufRef = Alias_Balgruuf.GetActorReference()
if BalgruufRef.GetDistance(Alias_Farengar.GetReference()) < 600
    SetStage(9)
endif
(Alias_DragonsreachCellTracker as SURMQ103DragonsreachCellTrackerScript).GoToState("StopIntroSceneOnDetach")
IntroScene.Start()
FarengarLabTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_99
Function Fragment_99()
;BEGIN CODE
;give reward
Actor PlayerRef = Game.GetPlayer()
Actor BalgruufRef = Alias_Balgruuf.GetActorReference()
PlayerRef.AddItem(MQ103Reward)
if BalgruufRef.IsInFaction(JobJarlFaction) && BalgruufRef.GetRelationshipRank(PlayerRef) < 2
    if WhiterunThanePrerequisite.GetValueInt() != 1
        if WhiterunThanePrerequisite.GetValueInt() == 3
            if BalgruufNoticedTree.GetValue()
                BalgruufRef.SetRelationshipRank(PlayerRef, 2)
            elseif BalgruufRef.GetRelationshipRank(PlayerRef) < 1
                BalgruufRef.SetRelationshipRank(PlayerRef, 1)
            endif
        else 
            BalgruufRef.SetRelationshipRank(PlayerRef, 2)
        endif
    endif
    if BalgruufRef.GetRelationshipRank(PlayerRef) < 1
        BalgruufRef.SetRelationshipRank(PlayerRef, 1)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
; enable Riverwood guards
RiverwoodGuardsEnableMarker.Enable()
RiverwoodGuardCampEnableMarker.Enable()
(CW as CWScript).AddGarrisonBackToWar(Alias_Riverwood.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
; Jarl introduces you to Farengar, or you persuade him that you aren't a moron
; he's now willing to talk to you about the book
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; player has gotten the book
SetObjectiveCompleted(50) ; completed - retrieve the book
SetObjectiveDisplayed(80); DISPLAYED Give the book to Farengar
UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; player speaks to Farengar
SetStage(185)
IntroScene.Stop()  ; in case player has dragonstone when he arrives
;OutroScene.Stop()
;Alias_Delphine.TryToEvaluatePackage()
Game.GetPlayer().RemoveItem(Alias_Dragonstone.GetReference(), 1)
SetObjectiveCompleted(80)
Game.AddAchievement(2)
if Alias_Balgruuf.GetActorReference().IsInFaction(JobJarlFaction)
    SetStage(191)
else
    SetStage(192)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CW  Auto  

Quest Property MQ102  Auto  

Scene Property IntroScene  Auto  

ObjectReference Property RiverwoodGuardsEnableMarker  Auto  

ObjectReference Property RiverwoodGuardCampEnableMarker  Auto  

ObjectReference Property DelphineMoveMarker  Auto  

Outfit Property DelphineSpyOutfit  Auto  

ObjectReference Property OutroTrigger  Auto  

Scene Property OutroScene  Auto  

ObjectReference Property FarengarLabTrigger  Auto  

ObjectReference Property BleakFallsMapMarker  Auto  

ObjectReference Property FarengarBook  Auto  

Quest Property dunDragonMoundQST  Auto  

ObjectReference Property SleepingGiantIntroTrigger  Auto  

ObjectReference Property RiverwoodGuardMarker  Auto  

Quest Property MQReserved  Auto   

ReferenceAlias Property FarengarReserved  Auto  

LeveledItem Property MQ103Reward  Auto  

Faction Property JobJarlFaction  Auto  

GlobalVariable Property WhiterunThanePrerequisite  Auto

GlobalVariable Property BalgruufNoticedTree  Auto
