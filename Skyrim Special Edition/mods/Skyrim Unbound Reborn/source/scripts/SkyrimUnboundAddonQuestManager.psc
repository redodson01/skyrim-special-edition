Scriptname SkyrimUnboundAddonQuestManager extends Quest  

Actor Property PlayerRef Auto

Quest Property QuestToRun Auto Hidden
ObjectReference Property TeleportMarker Auto Hidden
string Property LocationParam Auto Hidden
string Property LocationTypeParam Auto Hidden

bool Property TeleportationAllowed = true Auto Hidden
bool Property StartCompletionAllowed = true Auto Hidden

Cell OldPlayerCell


Event OnUpdate()
	if QuestToRun
		if !QuestToRun.IsRunning()
			QuestToRun.Start()
		endif
		(QuestToRun as SkyrimUnboundLocationAddonScript).PrepareStart(TeleportMarker, LocationTypeParam, LocationParam)
		TeleportationAllowed = true
		StartCompletionAllowed = true
	endif
endEvent

function AllowTeleportationAndWait(bool dontCompleteStartUntilPrepareStartReturns = false)
	if !TeleportationAllowed
		OldPlayerCell = PlayerRef.GetParentCell()
		TeleportationAllowed = true
		StartCompletionAllowed = !dontCompleteStartUntilPrepareStartReturns
		if TeleportMarker.GetParentCell() != OldPlayerCell
			while PlayerRef.GetParentCell() == OldPlayerCell
			endwhile
		endif
	endif
endFunction
