Scriptname SkyrimUnboundModule extends Quest  

Actor Property PlayerRef Auto

int Property MISSING_INT = -999 AutoReadOnly Hidden


function BeforeLoadingAddons()
endFunction

function LoadAddon(string fileName)
endFunction

function AfterLoadingAddons()
endFunction

function SavePreset(string fileName)
endFunction

bool function LoadPreset(string fileName)
{must return false if there is any missing content, otherwise true}
	return true
endFunction

function AfterGivingItems()
endFunction

function BeforeTeleportation()
endFunction

function AfterTeleportation()
endFunction

function ShowAddonLoadingError(string fileName, string elPath, string messageText)
	Debug.Messagebox(fileName + "\n" + elPath + "\n" + messageText)
endFunction

Form function GetJsonForm(string fileName, string elPath, string propertyName, bool isRequired)
	string fullPath = elPath + propertyName
	if JsonUtil.CanResolvePath(fileName, fullPath)
		Form theForm = JsonUtil.GetPathFormValue(fileName, fullPath)
		if theForm
			if theForm.GetType() == 0
				ShowAddonLoadingError(fileName, elPath, "GetType() returns 0 for " + propertyName + "(" + theForm + ") (possible causes: invalid load order of the plugin containing this record)")
			else
				return theForm
			endif
		elseif JsonUtil.IsPathForm(fileName, fullPath)
			ShowAddonLoadingError(fileName, elPath, propertyName + " can't be retrieved (possible causes: wrong FormID or plugin name, missing plugin, REFR record not being Persistent)")
		else
			ShowAddonLoadingError(fileName, elPath, propertyName + " is of wrong JSON data type, must be form")
		endif
	elseif isRequired
		ShowAddonLoadingError(fileName, elPath, propertyName + " is not set")
	endif
	return None
endFunction

string function GetJsonString(string fileName, string elPath, string propertyName, bool isRequired)
	string fullPath = elPath + propertyName
	if JsonUtil.CanResolvePath(fileName, fullPath)
		string theString = JsonUtil.GetPathStringValue(fileName, fullPath)
		if theString
			return theString
		elseif JsonUtil.IsPathString(fileName, fullPath)
			ShowAddonLoadingError(fileName, elPath, propertyName + " is empty string")
		else
			ShowAddonLoadingError(fileName, elPath, propertyName + " is of wrong JSON data type, must be string")
		endif
	elseif isRequired
		ShowAddonLoadingError(fileName, elPath, propertyName + " is not set")
	endif
	return ""
endFunction

int function GetJsonInt(string fileName, string elPath, string propertyName, bool isRequired)
	string fullPath = elPath + propertyName
	if JsonUtil.CanResolvePath(fileName, fullPath)
		if JsonUtil.IsPathNumber(fileName, fullPath)
			return JsonUtil.GetPathIntValue(fileName, fullPath)
		else
			ShowAddonLoadingError(fileName, elPath, propertyName + " is of wrong JSON data type, must be integer")
		endif
	elseif isRequired
		ShowAddonLoadingError(fileName, elPath, propertyName + " is not set")
	endif
	return MISSING_INT
endFunction

Form[] function GetJsonFormArray(string fileName, string elPath, string propertyName, bool isRequired, int requiredNumberOfElements = 0, bool allowEmpty = false, Form elementIfEmpty = None)
	string fullPath = elPath + propertyName
	if JsonUtil.CanResolvePath(fileName, fullPath)
		form[] theFormArray = JsonUtil.PathFormElements(fileName, fullPath)
		if theFormArray.Length
			if requiredNumberOfElements > 0 && theFormArray.Length != requiredNumberOfElements
				ShowAddonLoadingError(fileName, elPath, propertyName + " must contain " + requiredNumberOfElements + " elements")
			else
				return theFormArray
			endif
		elseif JsonUtil.PathCount(fileName, fullPath) == 0
			if allowEmpty
				Form[] result = new Form[1]
				result[0] = elementIfEmpty
				return result
			else
				ShowAddonLoadingError(fileName, elPath, propertyName + " can't be empty")
			endif
		else
			ShowAddonLoadingError(fileName, elPath, propertyName + " is of wrong JSON data type, must be array of forms")
		endif
	elseif isRequired
		ShowAddonLoadingError(fileName, elPath, propertyName + " is not set")
	endif
	Form[] result
	return result
endFunction

string[] function GetJsonStringArray(string fileName, string elPath, string propertyName, bool isRequired, int requiredNumberOfElements = 0, bool checkForInvalidValues = false, string[] validValues = None, bool allowEmpty = false, string elementIfEmpty = "")
	string fullPath = elPath + propertyName
	if JsonUtil.CanResolvePath(fileName, fullPath)
		string[] theStringArray = JsonUtil.PathStringElements(fileName, fullPath)
		if theStringArray.Length
			if requiredNumberOfElements > 0 && theStringArray.Length != requiredNumberOfElements
				ShowAddonLoadingError(fileName, elPath, propertyName + " must contain " + requiredNumberOfElements + " elements")
			else
				if checkForInvalidValues
					int i = theStringArray.Length
					while i > 0
						i -= 1
						if validValues.Find(theStringArray[i]) < 0
							ShowAddonLoadingError(fileName, elPath, "Unknown " + propertyName + " value: \"" + theStringArray[i] + "\"")
						endif
					endwhile
				endif
				return theStringArray
			endif
		elseif JsonUtil.PathCount(fileName, fullPath) == 0
			if allowEmpty
				string[] result = new string[1]
				result[0] = elementIfEmpty
				return result
			else
				ShowAddonLoadingError(fileName, elPath, propertyName + " can't be empty")
			endif
		else
			ShowAddonLoadingError(fileName, elPath, propertyName + " is of wrong JSON data type, must be array of strings")
		endif
	elseif isRequired
		ShowAddonLoadingError(fileName, elPath, propertyName + " is not set")
	endif
	string[] result
	return result
endFunction

int[] function GetJsonIntArray(string fileName, string elPath, string propertyName, bool isRequired, int requiredNumberOfElements = 0, bool allowEmpty = false, int elementIfEmpty = -1)
	string fullPath = elPath + propertyName
	if JsonUtil.CanResolvePath(fileName, fullPath)
		int[] theIntArray = JsonUtil.PathIntElements(fileName, fullPath)
		if theIntArray.Length
			if requiredNumberOfElements > 0 && theIntArray.Length != requiredNumberOfElements
				ShowAddonLoadingError(fileName, elPath, propertyName + " must contain " + requiredNumberOfElements + " elements")
			else
				return theIntArray
			endif
		elseif JsonUtil.PathCount(fileName, fullPath) == 0
			if allowEmpty
				int[] result = new int[1]
				result[0] = elementIfEmpty
				return result
			else
				ShowAddonLoadingError(fileName, elPath, propertyName + " can't be empty")
			endif
		else
			ShowAddonLoadingError(fileName, elPath, propertyName + " is of wrong JSON data type, must be array of integers")
		endif
	elseif isRequired
		ShowAddonLoadingError(fileName, elPath, propertyName + " is not set")
	endif
	int[] result
	return result
endFunction

function ReportUnknownJsonProperties(string fileName, string elPath, string[] validPropertyNames)
	string[] pathMembers = JsonUtil.PathMembers(fileName, elPath)
	int i = pathMembers.Length
	while i > 0
		i -= 1
		if validPropertyNames.Find(pathMembers[i]) < 0 && pathMembers[i] != "__comment"
			ShowAddonLoadingError(fileName, elPath, "Unknown property \"" + pathMembers[i] + "\"")
		endif
	endwhile
endFunction
