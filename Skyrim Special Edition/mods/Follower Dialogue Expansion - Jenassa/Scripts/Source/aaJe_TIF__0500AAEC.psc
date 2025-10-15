;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname aaJe_TIF__0500AAEC Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If !(akspeaker.IsInFaction(DismissedFollowerFaction))
  (pDialogueFollower as DialogueFollowerScript).DismissFollower(0, 0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.SetAV("Aggression", 3)
akSpeaker.StartCombat(PlayerRef)
akSpeaker.GetActorBase().SetEssential(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Quest Property pDialogueFollower  Auto  

Faction Property DismissedFollowerFaction  Auto  
