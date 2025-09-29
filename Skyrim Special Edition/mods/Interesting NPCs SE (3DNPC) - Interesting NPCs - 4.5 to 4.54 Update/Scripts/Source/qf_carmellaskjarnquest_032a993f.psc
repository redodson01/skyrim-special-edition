;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 35
Scriptname QF_CarmellaSkjarnQuest_032A993F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Edwayne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Edwayne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjarn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skjarn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Carmella
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Carmella Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro4002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro4002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY vampire1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_vampire1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaveRoof
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveRoof Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro4000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro4000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Light
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Light Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CarmellaOld
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CarmellaOld Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro4003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro4003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro4001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro4001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY vampire2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_vampire2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necro6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necro6 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
If getstagedone(98) && getstagedone (97)
setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
CSQScene6.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
SetObjectiveDisplayed(91)
SetObjectiveDisplayed(92)
Alias_Skjarn.GetActorRef().GetActorBase().SetProtected(False)
Alias_Skjarn.GetActorRef().GetActorBase().SetEssential(False)
CSQScene4.Stop()
Alias_Light.GetRef().Disable()
FXFireOut.Play(game.GetPlayer())
Alias_Hunter3.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
CSQScene4.Stop()
Alias_Carmella.GetActorRef().GetActorBase().SetProtected(False)
Alias_Carmella.GetActorRef().GetActorBase().SetEssential(False)
Alias_Necro5.GetActorRef().StartCombat(Alias_Skjarn.GetActorRef())
Alias_Necro6.GetActorRef().StartCombat(Alias_Skjarn.GetActorRef())
Alias_Necro5.GetActorRef().SetActorValue("aggression", 1)
Alias_Necro6.GetActorRef().SetActorValue("aggression", 1)
Alias_Carmella.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Carmella.GetActorRef().Moveto(CarmellaSpot)
Alias_Necro1.GetActorRef().Kill()
Alias_Necro2.GetActorRef().Kill()
Alias_Necro3.GetActorRef().Kill()
Alias_Necro4.GetActorRef().Kill()
Alias_Necro1.GetActorRef().Disable()
Alias_Necro2.GetActorRef().Disable()
Alias_Necro3.GetActorRef().Disable()
Alias_Necro4.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(40)
setstage(45)
CSQScene3.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
CSQScene4.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
If getstagedone(87) && getstagedone(88) && getstagedone (89)
setstage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Carmella.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
CSQScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
Alias_CarmellaOld.GetActorRef().disable()
Alias_Carmella.GetActorRef().enable()
Alias_Carmella.GetActorRef().moveto(s3DNPC_CarmellaQuestREF)
if Alias_Skjarn.GetActorref().isinfaction(Currentfollowerfaction)
else
Alias_Skjarn.GetActorRef().moveto(s3DNPC_CarmellaREF2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_Necro6.GetActorRef().enable()
Alias_Necro5.GetActorRef().moveto(xmarkerN)
Alias_Necro6.GetActorRef().moveto(xmarkerN)
setstage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
If getstagedone(86) && getstagedone(88) && getstagedone (89)
setstage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if Alias_Carmella.GetActorRef().GetDistance(CarmellaSpot) >= 2048
Alias_Carmella.GetActorRef().Moveto(CarmellaSpot)
endif
if Alias_Skjarn.GetActorRef().GetDistance(Game.getPlayer()) >= 2048
Alias_Skjarn.GetActorRef().Moveto(SkjarnSpot)
endif
Alias_Necro4.GetActorRef().kill()
Alias_Necro1.GetActorRef().disable()
Alias_Necro2.GetActorRef().disable()
Alias_Necro3.GetActorRef().disable()
Alias_Necro4000.GetActorRef().disable()
Alias_Necro4001.GetActorRef().disable()
Alias_Necro4002.GetActorRef().disable()
Alias_Necro4003.GetActorRef().disable()
Alias_Necro4003.GetActorRef().disable()
Alias_Necro9.GetActorRef().disable()
Alias_Necro8.GetActorRef().disable()
Alias_Necro7.GetActorRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
If getstagedone(87) && getstagedone(88) && getstagedone (86)
setstage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
SetObjectiveCompleted(86)
SetObjectiveCompleted(92)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
Game.GetPlayer().Additem(LItemEnchArmorHeavyHelmet, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_Necro6.GetActorRef().enable()
Alias_Necro5.GetActorRef().moveto(xmarkerN)
Alias_Necro6.GetActorRef().moveto(xmarkerN)
setstage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
SetObjectiveCompleted(85)
SetObjectiveCompleted(91)
Alias_Light.GetRef().Enable()
if !(Getstagedone(5))
SetObjectiveFailed(86)
SetObjectiveFailed(92)
CSQScene5.Start()
else
CSQScene8.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
If getstagedone(97) && getstagedone (99)
setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
Alias_Skjarn.GetActorRef().GetActorBase().SetProtected(False)
Alias_Skjarn.GetActorRef().GetActorBase().SetEssential(False)
SetObjectiveDisplayed(85)
SetObjectiveDisplayed(86)
CSQScene4.Stop()
Alias_Light.GetRef().Disable()
FXFireOut.Play(game.GetPlayer())
Alias_Vampire.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
CSQScene7.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveDisplayed(40)
s3DNPC_CarmellaSkjarnShackleREF.enable()
Alias_Necro1.GetActorRef().disable()
Alias_Necro2.GetActorRef().disable()
Alias_Necro3.GetActorRef().disable()
Alias_Necro4000.GetActorRef().disable()
Alias_Necro4001.GetActorRef().disable()
Alias_Necro4002.GetActorRef().disable()
Alias_Necro4003.GetActorRef().disable()
Alias_Necro4003.GetActorRef().disable()
Alias_Necro7.GetActorRef().disable()
Alias_Necro8.GetActorRef().disable()
Alias_Necro9.GetActorRef().disable()

Actor EdwayneRef = Alias_Edwayne.GetActorRef()
Actor SkjarnRef = Alias_Skjarn.GetActorRef()

EdwayneRef.MoveTo(s3DNPC_CarmellaSkjarnShackleREF)

Alias_Carmella.GetActorRef().RemoveFromFaction(CaptiveFaction)
EdwayneRef.SetAV("Aggression", 0)
SkjarnRef.SetAV("Aggression", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
If getstagedone(98) && getstagedone (99)
setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
if Alias_Carmella.GetActorRef().GetDistance(CarmellaSpot) >= 2048
Alias_Carmella.GetActorRef().Moveto(CarmellaSpot)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
If getstagedone(87) && getstagedone(86) && getstagedone (89)
setstage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CSQScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
setstage(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property CSQScene1  Auto  

Scene Property CSQScene2  Auto  

Scene Property CSQScene3  Auto  

Scene Property CSQScene4  Auto  

ObjectReference Property CarmellaSpot  Auto  

Objectreference Property SkjarnSpot  Auto  

ObjectReference Property xmarkerN  Auto  

Sound Property FXFireOut  Auto  

Scene Property CSQScene5  Auto  

Scene Property CSQScene6  Auto  

Scene Property CSQScene7  Auto  

Scene Property CSQScene8  Auto  


LeveledItem Property LItemEnchArmorHeavyHelmet  Auto  

ObjectReference Property s3DNPC_CarmellaQuestREF  Auto  

Faction Property CurrentFollowerFaction  Auto  

ObjectReference Property s3DNPC_CarmellaREF2  Auto  

ObjectReference Property s3DNPC_CarmellaSkjarnShackleREF  Auto  

Faction Property CaptiveFaction  Auto  
