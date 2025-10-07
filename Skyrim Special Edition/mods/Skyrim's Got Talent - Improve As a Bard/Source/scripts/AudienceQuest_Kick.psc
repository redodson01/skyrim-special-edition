;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname AudienceQuest_Kick Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AudienceLocation5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AudienceLocation2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AudienceLocation3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player_Follower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player_Follower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AudienceLocation1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dog
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dog Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AudienceLocation4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AudienceLocation4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BardLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Horse Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
If _Talent_IsPerformingTerrible.GetValue() == 1
_Talent_BardAudienceAnimals.Start()
else
BardAudienceQuestScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BardAudienceQuestScene  Auto  

Scene Property _Talent_BardAudienceAnimals  Auto  

GlobalVariable Property _Talent_IsPerformingTerrible  Auto  
