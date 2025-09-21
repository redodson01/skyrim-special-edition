Scriptname randomQuestOtherActorScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(210)
EndEvent