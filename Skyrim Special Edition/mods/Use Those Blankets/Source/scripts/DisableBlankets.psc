Scriptname DisableBlankets extends ObjectReference  

Event OnCellDetach()
If Self.IsEnabled()
		Self.Disable()
		Self.Delete()
endif
endevent
