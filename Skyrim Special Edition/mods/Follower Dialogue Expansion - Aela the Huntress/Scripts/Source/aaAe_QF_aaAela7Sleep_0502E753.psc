;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname aaAe_QF_aaAela7Sleep_0502E753 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE aaAelaSleepScript
Quest __temp = self as Quest
aaAelaSleepScript kmyQuest = __temp as aaAelaSleepScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForSleep()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
