Scriptname SkyrimUnboundInitScript extends Quest  
{processes OnInit in a separate thread}

SkyrimUnboundQuestScript Property SU Auto
FormList Property SkyrimUnboundModules Auto
Message Property SkyrimUnboundNewGameRequiredMessage Auto
Message Property SkyrimUnboundSKSENotDetectedMessage Auto
Message Property SkyrimUnboundRenumberedFormIDsMessage Auto


Event OnInit()
	
	;float addonsLoadingStartTime = Utility.GetCurrentRealTime()
	Form[] modules = SkyrimUnboundModules.ToArray()
	int i = 0
	int numberOfModules = modules.Length
	while i < numberOfModules
		(modules[i] as SkyrimUnboundModule).BeforeLoadingAddons()
		i += 1
	endwhile
	if PapyrusUtil.GetVersion()
		string[] addonFileNames = JsonUtil.JsonInFolder("../SkyrimUnbound/Addons")
		int numFiles = addonFileNames.Length
		int iFile = 0
		while iFile < numFiles
			string fileName = "../SkyrimUnbound/Addons/" + addonFileNames[iFile]
			if !JsonUtil.IsGood(fileName)
				Debug.Messagebox(fileName + "\n" + JsonUtil.GetErrors(fileName))
			elseif IsAddonCompatible(fileName)
				i = 0
				while i < numberOfModules
					(modules[i] as SkyrimUnboundModule).LoadAddon(fileName)
					i += 1
				endwhile
			endif
			JsonUtil.Unload(fileName, false)
			iFile += 1
		endwhile
	endif
	i = 0
	while i < numberOfModules
		(modules[i] as SkyrimUnboundModule).AfterLoadingAddons()
		i += 1
	endwhile
	;Debug.Messagebox("Addons loaded in " + (Utility.GetCurrentRealTime() - addonsLoadingStartTime) + "s")

	SU.AreAddonsLoaded = true
	ModEvent.Send(ModEvent.Create("SkyrimUnbound_OnAddonsLoaded"))
	
	if MiscUtil.FileExists("Data/SKSE/Plugins/SkyrimUnbound/Presets/Default/Custom.json")
		SU.LoadPreset("Default/Custom.json")
	endif

	SU.IsFullyInitialized = true

	DoOnInitChecks()

endEvent

function DoOnInitChecks() 

	if Game.QueryStat("Days Passed") > 0 || Game.GetPlayer().GetLevel() > 1
		SkyrimUnboundNewGameRequiredMessage.Show()
	endif

	if !SKSE.GetVersion()
		SkyrimUnboundSKSENotDetectedMessage.Show()
	endif

	if Game.GetFormFromFile(0xC30B71, "Skyrim Unbound.esp") != Self as Form
		SkyrimUnboundRenumberedFormIDsMessage.Show()
	endIf

	if SKSE.GetVersion()
		string anotherAltStartModFoundName = ""
		if Game.GetModByName("Alternate Start - Live Another Life.esp") != 255
			anotherAltStartModFoundName = "Alternate Start - Live Another Life"
		elseif Game.GetModByName("Realm of Lorkhan - Custom Alternate Start - Choose your own adventure.esp") != 255
			anotherAltStartModFoundName = "Realm of Lorkhan"
		elseif Game.GetModByName("AlternatePerspective.esp") != 255
			anotherAltStartModFoundName = "Alternate Perspective"
		elseif Game.GetModByName("Random Alternate Start Reborn SE.esp") != 255
			anotherAltStartModFoundName = "Random Alternate Start Reborn"
		elseif Game.GetModByName("Random Alternate Start.esp") != 255
			anotherAltStartModFoundName = "Random Alternate Start"
		elseif Game.GetModByName("Original Opening Scene.esp") != 255
			anotherAltStartModFoundName = "Opening Scene Overhaul"
		elseif Game.GetModByName("Quick Start - SE.esp") != 255 || Game.GetModByName("Quick Start.esp") != 255
			anotherAltStartModFoundName = "Optional Quick Start"
		elseif Game.GetModByName("helgen express.esp") != 255
			anotherAltStartModFoundName = "Helgen Express (quick start)"
		elseif Game.GetModByName("Paradigm.esp") != 255 || Game.GetModByName("Paradigm - Extended.esp") != 255
			anotherAltStartModFoundName = "Paradigm - A Quick Start Overhaul"
		endif
		if anotherAltStartModFoundName
			Debug.Messagebox("Skyrim Unbound: Found an incompatible mod installed (" + anotherAltStartModFoundName + ").\n\nRemove or disable it (including not only the .esp but all the mod files) and start a new game.")
		endif
	endif

endFunction

bool function IsAddonCompatible(string fileName)

	if !JsonUtil.CanResolvePath(fileName, ".requirements")
		return true
	endif

	string[] pathMembers = JsonUtil.PathMembers(fileName, ".requirements")
	int i = pathMembers.Length
	while i > 0
		i -= 1
		if pathMembers[i] != "required" && pathMembers[i] != "incompatible" && pathMembers[i] != "requiredAny"
			Debug.Messagebox(fileName + "\n.requirements\nUnknown property \"" + pathMembers[i] + "\"")
		endif
	endwhile

	string[] requiredPluginNames = JsonUtil.PathStringElements(fileName, "requirements.required")
	i = requiredPluginNames.Length
	while i > 0
		i -= 1
		if Game.GetModByName(requiredPluginNames[i]) == 255
			return false
		endif
	endwhile

	string[] incompatiblePluginNames = JsonUtil.PathStringElements(fileName, "requirements.incompatible")
	i = incompatiblePluginNames.Length
	while i > 0
		i -= 1
		if Game.GetModByName(incompatiblePluginNames[i]) != 255
			return false
		endif
	endwhile

	string[] requiredAnyPluginNames = JsonUtil.PathStringElements(fileName, "requirements.requiredAny")
	i = requiredAnyPluginNames.Length
	if i == 0
		return true
	else
		while i > 0
			i -= 1
			if Game.GetModByName(requiredAnyPluginNames[i]) != 255
				return true
			endif
		endwhile
		return false
	endif

endFunction
