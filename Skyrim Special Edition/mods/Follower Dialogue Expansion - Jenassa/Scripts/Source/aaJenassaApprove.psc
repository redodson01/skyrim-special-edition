Scriptname aaJenassaApprove extends Quest  

Function ap(int modifier)

	int modify = modifier

		aaJenassaApproval.Mod(modifier)
		if modify >= 1
			aaJenassaApproveMessage.Show()
		elseif modify < 0
			aaJenassaDisapproveMessage.Show()
		endif
	
EndFunction

Event OnUpdateGameTime()
	If HirelingJenassaRef.IsInFaction(CurrentFollowerFaction)
		aaJenassaApproval.Mod(1)
	EndIf
	RegisterForSingleUpdateGameTime(24)
EndEvent

Function Kiss()
aaJenassaKissMessage.Show()
EndFunction

GlobalVariable Property aaJenassaApproval  Auto  

Message Property aaJenassaApproveMessage  Auto  
Message Property aaJenassaDisapproveMessage  Auto  
Faction Property CurrentFollowerFaction  Auto  

Actor Property HirelingJenassaRef  Auto  

Message Property aaJenassaKissMessage  Auto  

