Scriptname MusSOSManagerOstim extends Quest  

actor dom
actor sub
actor third

Event OnInit()
	RegisterForModEvent("ostim_start", "OstimEVStart")
	RegisterForModEvent("ostim_prestart", "OstimEVPreStart")
	RegisterForModEvent("ostim_thirdactor_join", "OstimEVThirdJoin")
	RegisterForModEvent("ostim_thirdactor_leave", "OstimEVThirdLeave")
	RegisterForModEvent("ostim_end", "OstimEVEnd")
EndEvent


function disableSOSOstim()
	OSexIntegrationMain ostim = OUtils.GetOStim()

	dom = ostim.GetDomActor()
	sub = ostim.GetSubActor()
	third = ostim.GetThirdActor()

	MusSOSManagerGlobal.SOSPhysicsAccess(dom, false)
	miscutil.PrintConsole("[MusSOSManager] disable actor : " + dom.GetActorBase().GetName())
	MusSOSManagerGlobal.SOSPhysicsAccess(sub, false)
	miscutil.PrintConsole("[MusSOSManager] disable actor : " + sub.GetActorBase().GetName())
	
	if third != none
		MusSOSManagerGlobal.SOSPhysicsAccess(third, false)
	miscutil.PrintConsole("[MusSOSManager] disable actor : " + third.GetActorBase().GetName())
	endif
endfunction

function enableSOSOstim()
	MusSOSManagerGlobal.SOSPhysicsAccess(dom, true)
	miscutil.PrintConsole("[MusSOSManager] enable actor : " + dom.GetActorBase().GetName())
	MusSOSManagerGlobal.SOSPhysicsAccess(sub, true)
	miscutil.PrintConsole("[MusSOSManager] enable actor : " + sub.GetActorBase().GetName())
	
	if third != none
		MusSOSManagerGlobal.SOSPhysicsAccess(third, true)
	miscutil.PrintConsole("[MusSOSManager] enable actor : " + third.GetActorBase().GetName())
	endif
endfunction

function disableThirdSOSOstim()
	OSexIntegrationMain ostim = OUtils.GetOStim()
	third = ostim.GetThirdActor()
	MusSOSManagerGlobal.SOSPhysicsAccess(third, false)
	miscutil.PrintConsole("[MusSOSManager] disable actor : " + third.GetActorBase().GetName())
endfunction

function enableThirdSOSOstim()
	MusSOSManagerGlobal.SOSPhysicsAccess(third, true)
	miscutil.PrintConsole("[MusSOSManager] enable actor : " + third.GetActorBase().GetName())
endfunction

event OstimEVPreStart(string eventname, string strarg, float numarg, form sender)
	disableSOSOstim()
endevent

event OstimEVStart(string eventname, string strarg, float numarg, form sender)
	disableSOSOstim()
endevent

event OstimEVThirdJoin(string eventname, string strarg, float numarg, form sender)
	disableThirdSOSOstim()
endevent

event OstimEVThirdLeave(string eventname, string strarg, float numarg, form sender)
	enableThirdSOSOstim()
endevent

event OstimEVEnd(string eventname, string strarg, float numarg, form sender)
	enableSOSOstim()
endevent

