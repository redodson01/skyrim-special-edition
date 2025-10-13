Scriptname aaIlliaApprove extends Quest  

Function ap(int modifier)

	int modify = modifier

		aaIlliaApproval.Mod(modifier)
		if modify >= 1
			aaIlliaApproveMessage.Show()
		elseif modify < 0
			aaIlliaDisapproveMessage.Show()
		endif
	
EndFunction

Event OnUpdateGameTime()
	If IlliaREF.IsInFaction(CurrentFollowerFaction)
		aaIlliaApproval.Mod(1)
	EndIf
	RegisterForSingleUpdateGameTime(24)
EndEvent

GlobalVariable Property aaIlliaApproval  Auto  

Message Property aaIlliaApproveMessage  Auto  
Message Property aaIlliaDisapproveMessage  Auto  
Faction Property CurrentFollowerFaction  Auto  

Actor Property illiaRef  Auto  
