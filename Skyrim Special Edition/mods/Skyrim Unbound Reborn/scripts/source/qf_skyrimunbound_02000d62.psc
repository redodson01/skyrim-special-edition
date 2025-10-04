;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname qf_skyrimunbound_02000d62 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE SkyrimUnboundQuestScript
Quest __temp = self as Quest
SkyrimUnboundQuestScript kmyQuest = __temp as SkyrimUnboundQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartSkyrimUnbound()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
