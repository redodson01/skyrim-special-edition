Scriptname sweepingOrganizesStuffThreadScript extends Quest  

Event OnInit()
	bDone = False
	ObjectReference[] refs = PO3_SKSEFunctions.FindAllReferencesOfFormType(playerRef, iType, 10000)
	int i = refs.length
	While i
		i -= 1
		ObjectReference ref = refs[i]
		If !PO3_SKSEFunctions.IsGeneratedForm(ref) && ref.Is3dLoaded() && PO3_SKSEFunctions.GetMotionType(ref) != 4 && ref.GetNumReferenceAliases() == 0
			ref.MoveToMyEditorLocation()
		EndIf
	EndWhile
	bDone = True
EndEvent

int Property iType Auto
Actor Property playerRef Auto
bool Property bDone Auto