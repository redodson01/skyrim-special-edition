Scriptname SkyrimUnboundPlayerAliasScript extends ReferenceAlias  

Event OnInit()
	(GetOwningQuest() as SkyrimUnboundQuestScript).OnGameLoad()
endEvent

Event OnPlayerLoadGame()
	(GetOwningQuest() as SkyrimUnboundQuestScript).OnGameLoad()
endEvent
