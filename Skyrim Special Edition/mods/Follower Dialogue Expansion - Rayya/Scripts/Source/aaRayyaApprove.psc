Scriptname aaRayyaApprove extends Quest  

Function ap(int modifier)

	int modify = modifier

		aaRayyaApproval.Mod(modifier)
		if modify >= 1
			aaRayyaApproveMessage.Show()
		elseif modify < 0
			aaRayyaDisapproveMessage.Show()
		endif
	
EndFunction

Event OnUpdateGameTime()
	If BYOHHousecarlFalkreathRef.IsInFaction(CurrentFollowerFaction)
		aaRayyaApproval.Mod(1)
	EndIf
	RegisterForSingleUpdateGameTime(24)
EndEvent

Function Kiss()
aaRayyaKissMessage.Show()
EndFunction

GlobalVariable Property aaRayyaApproval  Auto  

Message Property aaRayyaApproveMessage  Auto  
Message Property aaRayyaDisapproveMessage  Auto  
Faction Property CurrentFollowerFaction  Auto  

Actor Property BYOHHousecarlFalkreathRef  Auto  

Message Property aaRayyaKissMessage  Auto  
