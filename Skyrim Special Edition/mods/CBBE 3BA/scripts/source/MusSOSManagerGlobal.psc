Scriptname MusSOSManagerGlobal  

function SOSPhysicsAccess(actor target, bool isEnable) global
	CBPCSOS(target, isEnable)
endFunction

function CBPCSOS(actor target, bool isEnable) global
	string SOS01Name = "GenitalsLag01"
	string SOS02Name = "GenitalsLag02"
	string SOS03Name = "GenitalsLag03"
	string SOS04Name = "GenitalsLag04"
	string SOS05Name = "GenitalsLag05"
	string SOS06Name = "GenitalsLag06"

	if isEnable
		CBPCPluginScript.StartPhysics(target, SOS01Name)
		CBPCPluginScript.StartPhysics(target, SOS02Name)
		CBPCPluginScript.StartPhysics(target, SOS03Name)
		CBPCPluginScript.StartPhysics(target, SOS04Name)
		CBPCPluginScript.StartPhysics(target, SOS05Name)
		CBPCPluginScript.StartPhysics(target, SOS06Name)
	else
		CBPCPluginScript.StopPhysics(target, SOS01Name)
		CBPCPluginScript.StopPhysics(target, SOS02Name)
		CBPCPluginScript.StopPhysics(target, SOS03Name)
		CBPCPluginScript.StopPhysics(target, SOS04Name)
		CBPCPluginScript.StopPhysics(target, SOS05Name)
		CBPCPluginScript.StopPhysics(target, SOS06Name)

		CBPCSOSReset(target)
	endif
endFunction

function CBPCSOSReset(actor target) global
	string SOS01Name = "GenitalsLag01"
	string SOS02Name = "GenitalsLag02"
	string SOS03Name = "GenitalsLag03"
	string SOS04Name = "GenitalsLag04"
	string SOS05Name = "GenitalsLag05"
	string SOS06Name = "GenitalsLag06"
	
	float[] EmptyPoint
	EmptyPoint		= new Float[3]
	EmptyPoint[0] = 0.0
	EmptyPoint[1] = 0.0
	EmptyPoint[2] = 0.0

	NetImmerse.SetNodeLocalPosition(target as ObjectReference, SOS01Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, SOS01Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, SOS02Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, SOS02Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, SOS03Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, SOS03Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, SOS04Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, SOS04Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, SOS05Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, SOS05Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, SOS06Name, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, SOS06Name, EmptyPoint, false)
endFunction


