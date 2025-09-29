;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DialogueSalumEi_0209A517 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Among_the_Hist
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Among_the_Hist Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
viranyaquest.setstage(500)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectivecompleted(6)
if DialogueRinori.getstage() == 0
(WiCourier as WICourierScript).AddItemToContainer(LetterfromRinori)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WICourier  Auto  

Book Property LetterfromRinori  Auto  

Quest Property DialogueRinori  Auto  

Quest Property ViranyaQuest  Auto  

VoiceType Property MaleArgonian  Auto  

Scene Property athscene2  Auto  
