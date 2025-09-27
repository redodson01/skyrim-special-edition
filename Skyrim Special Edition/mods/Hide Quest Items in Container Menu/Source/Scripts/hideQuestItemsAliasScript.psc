Scriptname hideQuestItemsAliasScript extends ReferenceAlias  

event onPlayerLoadGame()
	hideQuestItemsQuest.refresh()
endEvent

hideQuestItemsQuestScript property hideQuestItemsQuest auto