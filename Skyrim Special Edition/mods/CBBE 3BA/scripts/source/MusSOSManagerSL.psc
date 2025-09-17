Scriptname MusSOSManagerSL extends Quest  

SexLabFramework function GetSL()
	Quest SexLab = Game.GetFormFromFile(0x00000D62, "SexLab.esm") as Quest
	return (SexLab as SexLabFramework)
endfunction

Event OnInit()
	RegisterForModEvent("AnimationStart", "OnSexLabEVStart")
	RegisterForModEvent("AnimationEnd", "OnSexLabEVEnd")
	Debug.Notification("SOS Physics Manager Register done")
EndEvent

function toggleSOSSL(bool isEnable, String _args)
	SexLabFramework SexLab = GetSL()

	int tid = _args as int
	sslThreadController thread = Sexlab.GetController(tid)
	
	int size = thread.Positions.Length
	int index = 0
	
	while index < size
		actor target = thread.Positions[index] as actor
		MusSOSManagerGlobal.SOSPhysicsAccess(target, isEnable)
		if isEnable
			miscutil.PrintConsole("[MusSOSManager] enable actor : " + target.GetActorBase().GetName())
		else
			miscutil.PrintConsole("[MusSOSManager] disable actor : " + target.GetActorBase().GetName())
		endif
		index += 1
	endwhile
endfunction

event OnSexLabEVStart(String _eventName, String _args, Float _argc, Form _sender)
	toggleSOSSL(false, _args)
endEvent

Event OnSexLabEVEnd(String _eventName, String _args, Float _argc, Form _sender)
	toggleSOSSL(true, _args)
endEvent
