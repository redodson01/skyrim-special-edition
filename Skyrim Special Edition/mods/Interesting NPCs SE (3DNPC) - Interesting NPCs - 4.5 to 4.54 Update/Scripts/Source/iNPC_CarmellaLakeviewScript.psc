Scriptname iNPC_CarmellaLakeviewScript extends ObjectReference  Conditional

Quest Property DialogueCarmella Auto

Auto State Waiting
    Event OnLoad()
        if DialogueCarmella.GetStageDone(10)
            goToState("Done")
            Self.DisableNoWait()
        endif
    endEvent
endState
        
State Done
endState