Scriptname sweepingOrganizesStuffShelfScript extends Quest

Event OnInit()
	bDone = False
	ObjectReference[] refs = PO3_SKSEFunctions.FindAllReferencesOfFormType(playerRef, 28, 10000)
	int i = refs.length
	While i
		i -= 1
		PlayerBookShelfContainerScript ref = refs[i] as PlayerBookShelfContainerScript
		If ref
			Message BookShelfFirstActivateMESSAGE = ref.BookShelfFirstActivateMESSAGE
			Message BookShelfNoMoreRoomMESSAGE = ref.BookShelfNoMoreRoomMESSAGE
			Message BookShelfNotABookMESSAGE = ref.BookShelfNotABookMESSAGE
			Message BookShelfRoomLeftMESSAGE = ref.BookShelfRoomLeftMESSAGE
			ref.BookShelfFirstActivateMESSAGE = None
			ref.BookShelfNoMoreRoomMESSAGE = None
			ref.BookShelfNotABookMESSAGE = None
			ref.BookShelfRoomLeftMESSAGE = None
			ref.OnActivate(playerRef)
			ref.BookShelfFirstActivateMESSAGE = BookShelfFirstActivateMESSAGE
			ref.BookShelfNoMoreRoomMESSAGE = BookShelfNoMoreRoomMESSAGE
			ref.BookShelfNotABookMESSAGE = BookShelfNotABookMESSAGE
			ref.BookShelfRoomLeftMESSAGE = BookShelfRoomLeftMESSAGE
		EndIf
	EndWhile
	bDone = True
EndEvent

Actor Property playerRef Auto
bool Property bDone Auto