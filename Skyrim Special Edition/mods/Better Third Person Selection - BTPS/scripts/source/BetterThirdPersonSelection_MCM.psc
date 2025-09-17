ScriptName BetterThirdPersonSelection_MCM Extends MCM_ConfigBase

int Property filterObjects = -1 Auto
int Property filterObjectDescriptions = -1 Auto

Event OnConfigOpen() native

Event OnConfigClose()

    JValue.cleanPool("BTPS_Filters")

    parent.OnConfigClose()

    WriteFilterStatesToFile()
    OnConfigClose_CLib()
endEvent

Event OnPageReset(string a_page)

    parent.OnPageReset(a_page)

    if a_page == "$BetterThirdPersonSelection_FilterPage"
        
        OnPageReset_CLib()
        BuildCustomFiltersPage()
    endif
endEvent

Event OnSelectST()

    parent.OnSelectST()

    string[] splitString = StringUtil.Split(GetState(), "___")
    string filterName = splitString[1]
    int filterObj = JMap.getObj(filterObjects, filterName)

    bool isEnabled = JMap.getInt(filterObj, "isEnabled") as bool
    JMap.setInt(filterObj, "isEnabled", (!isEnabled) as int)

    SetToggleOptionValueST(!isEnabled, false, GetState())
endEvent

Event OnHighlightST()

    string[] splitString = StringUtil.Split(GetState(), "___")
    string filterName = splitString[1]

    int filterDescObj = JMap.getObj(filterObjectDescriptions, filterName)
    string description = JMap.getStr(filterDescObj, "description", "-")

    SetInfoText(description)
endEvent

Function OnConfigClose_CLib()
endFunction

Function OnPageReset_CLib()
endFunction

Function BuildCustomFiltersPage()

    SetCursorFillMode(TOP_TO_BOTTOM)
    SetCursorPosition(0)

    AddHeaderOption("$BetterThirdPersonSelection_FilterSettings_HeaderText")
    AddTextOption("", "$BetterThirdPersonSelection_Filter_InfoText", 0)

    ;Debug.Notification("Build Filters Page: " + filterObjects + ", count: " + JMap.count(filterObjects))

    int i = JMap.count(filterObjects) - 1
    while(i >= 0)
        constructFilter(i)

        i -= 1
    endWhile
endFunction

Function constructFilter(int filterIdx)
    
    string currKey = JMap.getNthKey(filterObjects, filterIdx)
    int currFilter = JMap.getObj(filterObjects, currKey)
    bool isEnabled = JMap.getInt(currFilter, "isEnabled") as bool

    AddToggleOptionST("toggleOption___" + currKey, currKey, JValue.SolveInt(filterObjects, "." + currKey + ".isEnabled") as bool)
endFunction

Function ClearFilters()

    JValue.cleanPool("BTPS_Filters")

    filterObjects = JValue.addToPool(JMap.object(), "BTPS_Filters")
    filterObjectDescriptions = JValue.addToPool(JMap.object(), "BTPS_Filters")

    JValue.retain(filterObjects)
    JValue.retain(filterObjectDescriptions)
endFunction

Function AddFilter(string a_filter, string a_description, bool isEnabled)

    ;Debug.Notification("AddFilter: " + a_filter + " - " + a_description)

    int innerObj = JMap.object()
    JMap.setInt(innerObj, "isEnabled", isEnabled as int)

    JMap.setObj(filterObjects, a_filter, innerObj)

    int innerDescObj = JMap.object()
    JMap.setStr(innerDescObj, "description", a_description)

    JMap.setObj(filterObjectDescriptions, a_filter, innerDescObj)

endFunction

Function SetFilterState(string a_filter, bool isEnabled)

    int filterObj = JMap.getObj(filterObjects, a_filter)
    JMap.setInt(filterObj, "isEnabled", isEnabled as int)
endFunction

Function WriteFilterStatesToFile()
    
    JValue.writeToFile(filterObjects, "Data/MCM/Settings/FilterStates.json")
endFunction