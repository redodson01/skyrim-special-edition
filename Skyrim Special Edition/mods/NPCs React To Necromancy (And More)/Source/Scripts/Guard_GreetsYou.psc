;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname Guard_GreetsYou Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Reactions_Guard.SetValue(1)

If akspeaker.GetVoiceType() == MaleGuard
Alias_TheGuard.ForceRefTo(akspeaker)

elseif akspeaker.GetVoiceType() == FemaleNord
Alias_TheGuardFemale.ForceRefTo(akspeaker)
else
Alias_NordCommander.ForceRefTo(akspeaker)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TheGuard Auto
ReferenceAlias Property Alias_TheGuardFemale Auto
ReferenceAlias Property Alias_NordCommander Auto
GlobalVariable Property Reactions_Guard Auto

VoiceType Property MaleGuard Auto
VoiceType Property MaleNordCommander Auto
VoiceType Property FemaleNord Auto
