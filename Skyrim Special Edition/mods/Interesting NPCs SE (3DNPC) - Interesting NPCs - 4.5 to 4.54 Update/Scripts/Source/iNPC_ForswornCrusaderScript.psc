Scriptname iNPC_ForswornCrusaderScript extends ReferenceAlias  

ObjectReference Property Ynvar Auto 

ObjectReference Property Yseld Auto 

ObjectReference Property Briarheart Auto 

Auto State Waiting
Event OnLoad()
    Quest CrusaderQuest = Game.GetFormFromFile(0x83C, "CCMTYSSE001-KnightsOfTheNine.esl") As Quest
        if CrusaderQuest == None
            Ynvar.EnableNoWait( )
            Yseld.EnableNoWait( )
            Briarheart.EnableNoWait( )
        elseif CrusaderQuest.GetStageDone(100)
            GoToState("Done")
            Ynvar.EnableNoWait( )
            Yseld.EnableNoWait( )
            Briarheart.EnableNoWait( )
        else
            Ynvar.DisableNoWait( )
            Yseld.DisableNoWait( )
            Briarheart.DisableNoWait( )
        endif
EndEvent
EndState


State Done
EndState