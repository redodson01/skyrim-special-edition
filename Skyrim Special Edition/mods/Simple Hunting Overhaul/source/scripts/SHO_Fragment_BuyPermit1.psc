;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SHO_Fragment_BuyPermit1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SHO_GuardDialogueTracker.SetValue(0)
PlayerRef.RemoveItem(Gold001, 500)

If akspeaker.IsInFaction(CrimeFactionEastmarch)
PlayerRef.AddItem(SHO_PermitEastmarch, 1)

elseif akspeaker.IsInFaction(CrimeFactionFalkreath)
PlayerRef.AddItem(SHO_PermitFalkreath, 1)

elseif akspeaker.IsInFaction(CrimeFactionHaafingar)
PlayerRef.AddItem(SHO_PermitHaafingar, 1)

elseif akspeaker.IsInFaction(CrimeFactionHjaalmarch)
PlayerRef.AddItem(SHO_PermitHjaalmarch, 1)

elseif akspeaker.IsInFaction(CrimeFactionRift)
PlayerRef.AddItem(SHO_PermitRift, 1)

elseif akspeaker.IsInFaction(CrimeFactionPale)
PlayerRef.AddItem(SHO_PermitThePale, 1)

elseif akspeaker.IsInFaction(CrimeFactionReach)
PlayerRef.AddItem(SHO_PermitTheReach, 1)

elseif akspeaker.IsInFaction(CrimeFactionWhiterun)
PlayerRef.AddItem(SHO_PermitWhiterun, 1)

elseif akspeaker.IsInFaction(CrimeFactionWinterhold)
PlayerRef.AddItem(SHO_PermitWinterhold, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SHO_GuardDialogueTracker Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionWinterhold Auto

Book Property SHO_PermitEastmarch Auto
Book Property SHO_PermitFalkreath Auto
Book Property SHO_PermitHaafingar Auto
Book Property SHO_PermitHjaalmarch Auto
Book Property SHO_PermitRift Auto
Book Property SHO_PermitThePale Auto
Book Property SHO_PermitTheReach Auto
Book Property SHO_PermitWhiterun Auto
Book Property SHO_PermitWinterhold Auto

Actor Property PlayerRef Auto
MiscObject Property Gold001 Auto