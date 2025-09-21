Scriptname SURMQ103DragonsreachCellTrackerScript extends ReferenceAlias  

Scene Property MQ103IntroScene Auto
Quest Property CW03 Auto

State StopIntroSceneOnDetach

	Event OnCellDetach()
		MQ103IntroScene.Stop()
		GoToState("")
	endEvent

endState

Event OnCellAttach()
	; stop quest if Whiterun siege has started
	if CW03.GetStageDone(240) || CW03.GetStageDone(245)
		if !GetOwningQuest().GetStageDone(10)
			GetOwningQuest().Stop()
		endif
	endif
endEvent
