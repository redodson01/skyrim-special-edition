;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname aaJe_QF_aaJenassaAmor5Romance_0506B20E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Jenassa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jenassa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RefugeesRestLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RefugeesRestLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(4)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(3)
SetObjectiveDisplayed(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Boss.GetActorRef().Resurrect()
Alias_Boss.GetActorRef().Enable()

Alias_BanditBoss.GetActorRef().PlaceAtMe(EncWolfIce, 6)

SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(4)

aaJenassaAmor5.SetStage(5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(2)
SetObjectiveDisplayed(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
aaJenassaAmor5RomanceQuestScene.Start()
Utility.Wait(3)
SetObjectiveCompleted(1)
SetObjectiveDisplayed(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property aaJenassaAmor5RomanceQuestScene  Auto  

ActorBase Property EncWolfIce  Auto  

Faction Property PotentialMarriageFaction  Auto  

Quest Property aaJenassaAmor5  Auto  

ActorBase Property EncWolf  Auto  
