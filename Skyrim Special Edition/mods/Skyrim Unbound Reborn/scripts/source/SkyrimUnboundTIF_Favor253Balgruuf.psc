;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SkyrimUnboundTIF_Favor253Balgruuf Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BalgruufNoticedTree.SetValue(1)
Actor PlayerRef = Game.GetPlayer()
if akSpeaker.GetRelationshipRank(PlayerRef) < 2 && WhiterunThanePrerequisite.GetValueInt() != 0
	if WhiterunThanePrerequisite.GetValueInt() == 3 
        if MQ103.IsCompleted()
            akSpeaker.SetRelationshipRank(PlayerRef, 2)
        elseif akSpeaker.GetRelationshipRank(PlayerRef) < 1
            akSpeaker.SetRelationshipRank(PlayerRef, 1)
        endif
    else 
        akSpeaker.SetRelationshipRank(PlayerRef, 2)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property WhiterunThanePrerequisite  Auto

GlobalVariable Property BalgruufNoticedTree  Auto

Quest Property MQ103  Auto
