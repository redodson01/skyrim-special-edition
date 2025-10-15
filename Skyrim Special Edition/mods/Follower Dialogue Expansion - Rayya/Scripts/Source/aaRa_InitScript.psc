Scriptname aaRa_InitScript extends ReferenceAlias  

Event OnActivate(ObjectReference akActivator)
if akActivator == PlayerRef
	if SiddgeirRef.IsInFaction(JobJarlFaction)
		aaRayyaJarlStart.Value = 0
	else
		aaRayyaJarlStart.Value = 1
	endif
endif
EndEvent

Actor Property SiddgeirREF  Auto  

Faction Property JobJarlFaction  Auto  

Bool Property Done  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property aaRayyaJarlStart  Auto  
