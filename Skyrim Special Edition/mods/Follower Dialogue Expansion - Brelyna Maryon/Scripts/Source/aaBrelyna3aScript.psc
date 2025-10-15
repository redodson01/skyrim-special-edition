Scriptname aaBrelyna3aScript extends Quest  

Event OnUpdate()
aaBrelynaNeloth.Value = 5
EndEvent

Event OnUpdateGameTime()
if BrelynaRef.GetParentCell() == DLC2TelMithryn && PlayerRef.GetParentCell() == DLC2TelMithryn
	aaBrelynaNeloth1.Start()
endif
EndEvent

GlobalVariable Property aaBrelynaNeloth  Auto  

Quest Property aaBrelynaNeloth1  Auto  

Actor Property BrelynaRef  Auto  

Cell Property DLC2TelMithryn  Auto  

Actor Property PlayerRef  Auto  
