Scriptname SeasonsFrameworkMCM extends SKI_ConfigBase

import JsonUtil

SeasonsFrameworkMain Property SFMain Auto
Event OnConfigInit()
  Pages()
EndEvent
Event OnGameReload()
parent.OnGameReload()
	Pages()
EndEvent



Event OnPageReset(string page)

	If (page == Pages[0]) || (page == "")
    SetCursorFillMode(TOP_TO_BOTTOM)
    SetCursorPosition(0)
    AddHeaderOption("Seasonal Weathers Framework")
    DefaultValues_T = AddTextOption("Restore everything to default", "")
    SetCursorPosition(1)
    AddHeaderOption("PapyrusUtil")
    Load_Profile_T = AddTextOption("Load from external file", "")
		Save_Profile_T = AddTextOption("Save to external file", "")

	ElseIf (page == Pages[1])
    SetCursorFillMode(TOP_TO_BOTTOM)
    SetCursorPosition(0)
    bool_EnableSeasonalImagespaces_B = AddToggleOption("Enable Seasonal Imagespaces", SFMain.bool_EnableSeasonalImagespaces)
    AddHeaderOption("Spring Imagespaces")
    float_Season_Spring_Intensity_S = AddSliderOption("Spring Intensity", SFMain.float_Season_Spring_Intensity, "{1}")
    float_Season_Spring_Saturation_S = AddSliderOption("Spring Saturation", SFMain.float_Season_Spring_Saturation, "{1}")
    float_Season_Spring_Temperature_S = AddSliderOption("Spring Temperature", SFMain.float_Season_Spring_Temperature, "{1}")
    AddHeaderOption("Summer Imagespaces")
    float_Season_Summer_Intensity_S = AddSliderOption("Summer Intensity", SFMain.float_Season_Summer_Intensity, "{1}")
    float_Season_Summer_Saturation_S = AddSliderOption("Summer Saturation", SFMain.float_Season_Summer_Saturation, "{1}")
    float_Season_Summer_Temperature_S = AddSliderOption("Summer Temperature", SFMain.float_Season_Summer_Temperature, "{1}")
    SetCursorPosition(1)
    AddEmptyOption()
    AddHeaderOption("Autumn Imagespaces")
    float_Season_Autumn_Intensity_S = AddSliderOption("Autumn Intensity", SFMain.float_Season_Autumn_Intensity, "{1}")
    float_Season_Autumn_Saturation_S = AddSliderOption("Autumn Saturation", SFMain.float_Season_Autumn_Saturation, "{1}")
    float_Season_Autumn_Temperature_S = AddSliderOption("Autumn Temperature", SFMain.float_Season_Autumn_Temperature, "{1}")
    AddHeaderOption("Winter Imagespaces")
    float_Season_Winter_Intensity_S = AddSliderOption("Winter Intensity", SFMain.float_Season_Winter_Intensity, "{1}")
    float_Season_Winter_Saturation_S = AddSliderOption("Winter Saturation", SFMain.float_Season_Winter_Saturation, "{1}")
    float_Season_Winter_Temperature_S = AddSliderOption("Winter Temperature", SFMain.float_Season_Winter_Temperature, "{1}")

	
	
	
	ElseIf (page == Pages[2])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- JANUARY -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Morning Star Chances")
    int_Season_Pleasant_January_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_January, "{0}")
    int_Season_PleasantA_January_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_January, "{0}")
    int_Season_Overcast_January_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_January, "{0}")
    int_Season_Rain_January_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_January, "{0}")
    int_Season_Rain_Storm_January_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_January, "{0}")
    int_Season_Snow_January_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_January, "{0}")
    int_Season_Snow_Storm_January_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_January, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Morning Star Snow Regions Chances")
    int_SN_Season_Pleasant_January_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_January, "{0}")
    int_SN_Season_PleasantA_January_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_January, "{0}")
    int_SN_Season_Overcast_January_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_January, "{0}")
    int_SN_Season_Rain_January_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_January, "{0}")
    int_SN_Season_Rain_Storm_January_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_January, "{0}")
    int_SN_Season_Snow_January_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_January, "{0}")
    int_SN_Season_Snow_Storm_January_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_January, "{0}")

	ElseIf (page == Pages[3])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- FEBRUARY -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Sun's Dawn Chances")
    int_Season_Pleasant_February_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_February, "{0}")
    int_Season_PleasantA_February_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_February, "{0}")
    int_Season_Overcast_February_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_February, "{0}")
    int_Season_Rain_February_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_February, "{0}")
    int_Season_Rain_Storm_February_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_February, "{0}")
    int_Season_Snow_February_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_February, "{0}")
    int_Season_Snow_Storm_February_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_February, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Sun's Dawn Snow Regions Chances")
    int_SN_Season_Pleasant_February_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_February, "{0}")
    int_SN_Season_PleasantA_February_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_February, "{0}")
    int_SN_Season_Overcast_February_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_February, "{0}")
    int_SN_Season_Rain_February_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_February, "{0}")
    int_SN_Season_Rain_Storm_February_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_February, "{0}")
    int_SN_Season_Snow_February_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_February, "{0}")
    int_SN_Season_Snow_Storm_February_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_February, "{0}")

	ElseIf (page == Pages[4])
    SetCursorFillMode(TOP_TO_BOTTOM)
   
    ;------- MARCH -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("First Seed Chances")
    int_Season_Pleasant_March_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_March, "{0}")
    int_Season_PleasantA_March_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_March, "{0}")
    int_Season_Overcast_March_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_March, "{0}")
    int_Season_Rain_March_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_March, "{0}")
    int_Season_Rain_Storm_March_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_March, "{0}")
    int_Season_Snow_March_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_March, "{0}")
    int_Season_Snow_Storm_March_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_March, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("First Seed Snow Regions Chances")
    int_SN_Season_Pleasant_March_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_March, "{0}")
    int_SN_Season_PleasantA_March_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_March, "{0}")
    int_SN_Season_Overcast_March_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_March, "{0}")
    int_SN_Season_Rain_March_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_March, "{0}")
    int_SN_Season_Rain_Storm_March_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_March, "{0}")
    int_SN_Season_Snow_March_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_March, "{0}")
    int_SN_Season_Snow_Storm_March_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_March, "{0}")

	ElseIf (page == Pages[5])
    SetCursorFillMode(TOP_TO_BOTTOM)
    
    ;------- APRIL -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Rain's Hand Chances")
    int_Season_Pleasant_April_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_April, "{0}")
    int_Season_PleasantA_April_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_April, "{0}")
    int_Season_Overcast_April_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_April, "{0}")
    int_Season_Rain_April_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_April, "{0}")
    int_Season_Rain_Storm_April_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_April, "{0}")
    int_Season_Snow_April_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_April, "{0}")
    int_Season_Snow_Storm_April_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_April, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Rain's Hand Snow Regions Chances")
    int_SN_Season_Pleasant_April_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_April, "{0}")
    int_SN_Season_PleasantA_April_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_April, "{0}")
    int_SN_Season_Overcast_April_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_April, "{0}")
    int_SN_Season_Rain_April_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_April, "{0}")
    int_SN_Season_Rain_Storm_April_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_April, "{0}")
    int_SN_Season_Snow_April_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_April, "{0}")
    int_SN_Season_Snow_Storm_April_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_April, "{0}")

	ElseIf (page == Pages[6])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- MAY -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Second Seed Chances")
    int_Season_Pleasant_May_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_May, "{0}")
    int_Season_PleasantA_May_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_May, "{0}")
    int_Season_Overcast_May_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_May, "{0}")
    int_Season_Rain_May_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_May, "{0}")
    int_Season_Rain_Storm_May_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_May, "{0}")
    int_Season_Snow_May_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_May, "{0}")
    int_Season_Snow_Storm_May_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_May, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Second Seed Snow Regions Chances")
    int_SN_Season_Pleasant_May_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_May, "{0}")
    int_SN_Season_PleasantA_May_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_May, "{0}")
    int_SN_Season_Overcast_May_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_May, "{0}")
    int_SN_Season_Rain_May_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_May, "{0}")
    int_SN_Season_Rain_Storm_May_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_May, "{0}")
    int_SN_Season_Snow_May_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_May, "{0}")
    int_SN_Season_Snow_Storm_May_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_May, "{0}")

	ElseIf (page == Pages[7])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- JUNE -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Mid Year Chances")
    int_Season_Pleasant_June_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_June, "{0}")
    int_Season_PleasantA_June_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_June, "{0}")
    int_Season_Overcast_June_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_June, "{0}")
    int_Season_Rain_June_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_June, "{0}")
    int_Season_Rain_Storm_June_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_June, "{0}")
    int_Season_Snow_June_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_June, "{0}")
    int_Season_Snow_Storm_June_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_June, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Mid Year Snow Regions Chances")
    int_SN_Season_Pleasant_June_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_June, "{0}")
    int_SN_Season_PleasantA_June_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_June, "{0}")
    int_SN_Season_Overcast_June_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_June, "{0}")
    int_SN_Season_Rain_June_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_June, "{0}")
    int_SN_Season_Rain_Storm_June_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_June, "{0}")
    int_SN_Season_Snow_June_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_June, "{0}")
    int_SN_Season_Snow_Storm_June_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_June, "{0}")

	ElseIf (page == Pages[8])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- JULY -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Sun's Height Chances")
    int_Season_Pleasant_July_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_July, "{0}")
    int_Season_PleasantA_July_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_July, "{0}")
    int_Season_Overcast_July_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_July, "{0}")
    int_Season_Rain_July_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_July, "{0}")
    int_Season_Rain_Storm_July_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_July, "{0}")
    int_Season_Snow_July_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_July, "{0}")
    int_Season_Snow_Storm_July_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_July, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Sun's Height Snow Regions Chances")
    int_SN_Season_Pleasant_July_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_July, "{0}")
    int_SN_Season_PleasantA_July_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_July, "{0}")
    int_SN_Season_Overcast_July_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_July, "{0}")
    int_SN_Season_Rain_July_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_July, "{0}")
    int_SN_Season_Rain_Storm_July_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_July, "{0}")
    int_SN_Season_Snow_July_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_July, "{0}")
    int_SN_Season_Snow_Storm_July_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_July, "{0}")

	ElseIf (page == Pages[9])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- AUGUST -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Last Seed Chances")
    int_Season_Pleasant_August_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_August, "{0}")
    int_Season_PleasantA_August_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_August, "{0}")
    int_Season_Overcast_August_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_August, "{0}")
    int_Season_Rain_August_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_August, "{0}")
    int_Season_Rain_Storm_August_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_August, "{0}")
    int_Season_Snow_August_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_August, "{0}")
    int_Season_Snow_Storm_August_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_August, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Last Seed Snow Regions Chances")
    int_SN_Season_Pleasant_August_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_August, "{0}")
    int_SN_Season_PleasantA_August_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_August, "{0}")
    int_SN_Season_Overcast_August_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_August, "{0}")
    int_SN_Season_Rain_August_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_August, "{0}")
    int_SN_Season_Rain_Storm_August_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_August, "{0}")
    int_SN_Season_Snow_August_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_August, "{0}")
    int_SN_Season_Snow_Storm_August_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_August, "{0}")

	ElseIf (page == Pages[10])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- SEPTEMBER -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Hearthfire Chances")
    int_Season_Pleasant_September_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_September, "{0}")
    int_Season_PleasantA_September_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_September, "{0}")
    int_Season_Overcast_September_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_September, "{0}")
    int_Season_Rain_September_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_September, "{0}")
    int_Season_Rain_Storm_September_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_September, "{0}")
    int_Season_Snow_September_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_September, "{0}")
    int_Season_Snow_Storm_September_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_September, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Hearthfire Snow Regions Chances")
    int_SN_Season_Pleasant_September_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_September, "{0}")
    int_SN_Season_PleasantA_September_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_September, "{0}")
    int_SN_Season_Overcast_September_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_September, "{0}")
    int_SN_Season_Rain_September_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_September, "{0}")
    int_SN_Season_Rain_Storm_September_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_September, "{0}")
    int_SN_Season_Snow_September_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_September, "{0}")
    int_SN_Season_Snow_Storm_September_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_September, "{0}")

	ElseIf (page == Pages[11])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- OCTOBER -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Frost Fall Chances")
    int_Season_Pleasant_October_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_October, "{0}")
    int_Season_PleasantA_October_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_October, "{0}")
    int_Season_Overcast_October_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_October, "{0}")
    int_Season_Rain_October_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_October, "{0}")
    int_Season_Rain_Storm_October_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_October, "{0}")
    int_Season_Snow_October_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_October, "{0}")
    int_Season_Snow_Storm_October_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_October, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Frost Fall Snow Regions Chances")
    int_SN_Season_Pleasant_October_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_October, "{0}")
    int_SN_Season_PleasantA_October_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_October, "{0}")
    int_SN_Season_Overcast_October_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_October, "{0}")
    int_SN_Season_Rain_October_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_October, "{0}")
    int_SN_Season_Rain_Storm_October_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_October, "{0}")
    int_SN_Season_Snow_October_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_October, "{0}")
    int_SN_Season_Snow_Storm_October_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_October, "{0}")

	ElseIf (page == Pages[12])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- NOVEMBER -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Sun's Dusk Chances")
    int_Season_Pleasant_November_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_November, "{0}")
    int_Season_PleasantA_November_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_November, "{0}")
    int_Season_Overcast_November_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_November, "{0}")
    int_Season_Rain_November_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_November, "{0}")
    int_Season_Rain_Storm_November_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_November, "{0}")
    int_Season_Snow_November_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_November, "{0}")
    int_Season_Snow_Storm_November_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_November, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Sun's Dusk Snow Regions Chances")
    int_SN_Season_Pleasant_November_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_November, "{0}")
    int_SN_Season_PleasantA_November_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_November, "{0}")
    int_SN_Season_Overcast_November_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_November, "{0}")
    int_SN_Season_Rain_November_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_November, "{0}")
    int_SN_Season_Rain_Storm_November_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_November, "{0}")
    int_SN_Season_Snow_November_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_November, "{0}")
    int_SN_Season_Snow_Storm_November_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_November, "{0}")

	ElseIf (page == Pages[13])
    SetCursorFillMode(TOP_TO_BOTTOM)

    ;------- DECEMBER -----------
    SetCursorPosition(0) ; LEFT SIDE
    AddHeaderOption("Evening Star Chances")
    int_Season_Pleasant_December_S = AddSliderOption("Pleasant Chance", SFMain.int_Season_Pleasant_December, "{0}")
    int_Season_PleasantA_December_S = AddSliderOption("Pleasant Aurora Chance", SFMain.int_Season_PleasantA_December, "{0}")
    int_Season_Overcast_December_S = AddSliderOption("Overcast Chance", SFMain.int_Season_Overcast_December, "{0}")
    int_Season_Rain_December_S = AddSliderOption("Rain Chance", SFMain.int_Season_Rain_December, "{0}")
    int_Season_Rain_Storm_December_S = AddSliderOption("Rain Storm Chance", SFMain.int_Season_Rain_Storm_December, "{0}")
    int_Season_Snow_December_S = AddSliderOption("Snow Chance", SFMain.int_Season_Snow_December, "{0}")
    int_Season_Snow_Storm_December_S = AddSliderOption("Snow Storm Chance", SFMain.int_Season_Snow_Storm_December, "{0}")
    
    SetCursorPosition(1) ; RIGHT SIDE
    AddHeaderOption("Evening Star Snow Regions Chances")
    int_SN_Season_Pleasant_December_S = AddSliderOption("Snow Regions Pleasant Chance", SFMain.int_SN_Season_Pleasant_December, "{0}")
    int_SN_Season_PleasantA_December_S = AddSliderOption("Snow Regions Pleasant Aurora Chance", SFMain.int_SN_Season_PleasantA_December, "{0}")
    int_SN_Season_Overcast_December_S = AddSliderOption("Snow Regions Overcast Chance", SFMain.int_SN_Season_Overcast_December, "{0}")
    int_SN_Season_Rain_December_S = AddSliderOption("Snow Regions Rain Chance", SFMain.int_SN_Season_Rain_December, "{0}")
    int_SN_Season_Rain_Storm_December_S = AddSliderOption("Snow Regions Rain Storm Chance", SFMain.int_SN_Season_Rain_Storm_December, "{0}")
    int_SN_Season_Snow_December_S = AddSliderOption("Snow Regions Snow Chance", SFMain.int_SN_Season_Snow_December, "{0}")
    int_SN_Season_Snow_Storm_December_S = AddSliderOption("Snow Regions Snow Storm Chance", SFMain.int_SN_Season_Snow_Storm_December, "{0}")

	EndIf
EndEvent

Event OnOptionSliderAccept(int option, float value)

	If (option == float_Season_Spring_Intensity_S)
		SFMain.float_Season_Spring_Intensity = value
		SetSliderOptionValue(float_Season_Spring_Intensity_S, SFMain.float_Season_Spring_Intensity, "{1}")
  ElseIf (option == float_Season_Spring_Saturation_S)
		SFMain.float_Season_Spring_Saturation = value
		SetSliderOptionValue(float_Season_Spring_Saturation_S, SFMain.float_Season_Spring_Saturation, "{1}")
  ElseIf (option == float_Season_Spring_Temperature_S)
		SFMain.float_Season_Spring_Temperature = value
		SetSliderOptionValue(float_Season_Spring_Temperature_S, SFMain.float_Season_Spring_Temperature, "{1}")
  EndIf
  
	If (option == float_Season_Summer_Intensity_S)
		SFMain.float_Season_Summer_Intensity = value
		SetSliderOptionValue(float_Season_Summer_Intensity_S, SFMain.float_Season_Summer_Intensity, "{1}")
  ElseIf (option == float_Season_Summer_Saturation_S)
		SFMain.float_Season_Summer_Saturation = value
		SetSliderOptionValue(float_Season_Summer_Saturation_S, SFMain.float_Season_Summer_Saturation, "{1}")
  ElseIf (option == float_Season_Summer_Temperature_S)
		SFMain.float_Season_Summer_Temperature = value
		SetSliderOptionValue(float_Season_Summer_Temperature_S, SFMain.float_Season_Summer_Temperature, "{1}")
  EndIf
  
	If (option == float_Season_Autumn_Intensity_S)
		SFMain.float_Season_Autumn_Intensity = value
		SetSliderOptionValue(float_Season_Autumn_Intensity_S, SFMain.float_Season_Autumn_Intensity, "{1}")
  ElseIf (option == float_Season_Autumn_Saturation_S)
		SFMain.float_Season_Autumn_Saturation = value
		SetSliderOptionValue(float_Season_Autumn_Saturation_S, SFMain.float_Season_Autumn_Saturation, "{1}")
  ElseIf (option == float_Season_Autumn_Temperature_S)
		SFMain.float_Season_Autumn_Temperature = value
		SetSliderOptionValue(float_Season_Autumn_Temperature_S, SFMain.float_Season_Autumn_Temperature, "{1}")
  EndIf
  
	If (option == float_Season_Winter_Intensity_S)
		SFMain.float_Season_Winter_Intensity = value
		SetSliderOptionValue(float_Season_Winter_Intensity_S, SFMain.float_Season_Winter_Intensity, "{1}")
  ElseIf (option == float_Season_Winter_Saturation_S)
		SFMain.float_Season_Winter_Saturation = value
		SetSliderOptionValue(float_Season_Winter_Saturation_S, SFMain.float_Season_Winter_Saturation, "{1}")
  ElseIf (option == float_Season_Winter_Temperature_S)
		SFMain.float_Season_Winter_Temperature = value
		SetSliderOptionValue(float_Season_Winter_Temperature_S, SFMain.float_Season_Winter_Temperature, "{1}")
  EndIf

;---January
	If (option == int_Season_Pleasant_January_S)
		SFMain.int_Season_Pleasant_January = value as int
		SetSliderOptionValue(int_Season_Pleasant_January_S, SFMain.int_Season_Pleasant_January, "{0}")
		
	ElseIf (option == int_Season_PleasantA_January_S)
		SFMain.int_Season_PleasantA_January = value as int
		SetSliderOptionValue(int_Season_PleasantA_January_S, SFMain.int_Season_PleasantA_January, "{0}")

	ElseIf (option == int_Season_Overcast_January_S)
		SFMain.int_Season_Overcast_January = value as int
		SetSliderOptionValue(int_Season_Overcast_January_S, SFMain.int_Season_Overcast_January, "{0}")
  
	ElseIf (option == int_Season_Rain_January_S)
		SFMain.int_Season_Rain_January = value as int
		SetSliderOptionValue(int_Season_Rain_January_S, SFMain.int_Season_Rain_January, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_January_S)
		SFMain.int_Season_Rain_Storm_January = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_January_S, SFMain.int_Season_Rain_Storm_January, "{0}")

	ElseIf (option == int_Season_Snow_January_S)
		SFMain.int_Season_Snow_January = value as int
		SetSliderOptionValue(int_Season_Snow_January_S, SFMain.int_Season_Snow_January, "{0}")

	ElseIf (option == int_Season_Snow_Storm_January_S)
		SFMain.int_Season_Snow_Storm_January = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_January_S, SFMain.int_Season_Snow_Storm_January, "{0}")
  EndIf

;---January SN_
	If (option == int_SN_Season_Pleasant_January_S)
		SFMain.int_SN_Season_Pleasant_January = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_January_S, SFMain.int_SN_Season_Pleasant_January, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_January_S)
		SFMain.int_SN_Season_PleasantA_January = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_January_S, SFMain.int_SN_Season_PleasantA_January, "{0}")

	ElseIf (option == int_SN_Season_Overcast_January_S)
		SFMain.int_SN_Season_Overcast_January = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_January_S, SFMain.int_SN_Season_Overcast_January, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_January_S)
		SFMain.int_SN_Season_Rain_January = value as int
		SetSliderOptionValue(int_SN_Season_Rain_January_S, SFMain.int_SN_Season_Rain_January, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_January_S)
		SFMain.int_SN_Season_Rain_Storm_January = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_January_S, SFMain.int_SN_Season_Rain_Storm_January, "{0}")

	ElseIf (option == int_SN_Season_Snow_January_S)
		SFMain.int_SN_Season_Snow_January = value as int
		SetSliderOptionValue(int_SN_Season_Snow_January_S, SFMain.int_SN_Season_Snow_January, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_January_S)
		SFMain.int_SN_Season_Snow_Storm_January = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_January_S, SFMain.int_SN_Season_Snow_Storm_January, "{0}")
  EndIf


;---February
	If (option == int_Season_Pleasant_February_S)
		SFMain.int_Season_Pleasant_February = value as int
		SetSliderOptionValue(int_Season_Pleasant_February_S, SFMain.int_Season_Pleasant_February, "{0}")
		
	ElseIf (option == int_Season_PleasantA_February_S)
		SFMain.int_Season_PleasantA_February = value as int
		SetSliderOptionValue(int_Season_PleasantA_February_S, SFMain.int_Season_PleasantA_February, "{0}")

	ElseIf (option == int_Season_Overcast_February_S)
		SFMain.int_Season_Overcast_February = value as int
		SetSliderOptionValue(int_Season_Overcast_February_S, SFMain.int_Season_Overcast_February, "{0}")
  
	ElseIf (option == int_Season_Rain_February_S)
		SFMain.int_Season_Rain_February = value as int
		SetSliderOptionValue(int_Season_Rain_February_S, SFMain.int_Season_Rain_February, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_February_S)
		SFMain.int_Season_Rain_Storm_February = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_February_S, SFMain.int_Season_Rain_Storm_February, "{0}")

	ElseIf (option == int_Season_Snow_February_S)
		SFMain.int_Season_Snow_February = value as int
		SetSliderOptionValue(int_Season_Snow_February_S, SFMain.int_Season_Snow_February, "{0}")

	ElseIf (option == int_Season_Snow_Storm_February_S)
		SFMain.int_Season_Snow_Storm_February = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_February_S, SFMain.int_Season_Snow_Storm_February, "{0}")
  EndIf

;---February SN_
	If (option == int_SN_Season_Pleasant_February_S)
		SFMain.int_SN_Season_Pleasant_February = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_February_S, SFMain.int_SN_Season_Pleasant_February, "{0}")
		
  ElseIf (option == int_SN_Season_PleasantA_February_S)
		SFMain.int_SN_Season_PleasantA_February = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_February_S, SFMain.int_SN_Season_PleasantA_February, "{0}")
		
	ElseIf (option == int_SN_Season_Overcast_February_S)
		SFMain.int_SN_Season_Overcast_February = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_February_S, SFMain.int_SN_Season_Overcast_February, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_February_S)
		SFMain.int_SN_Season_Rain_February = value as int
		SetSliderOptionValue(int_SN_Season_Rain_February_S, SFMain.int_SN_Season_Rain_February, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_February_S)
		SFMain.int_SN_Season_Rain_Storm_February = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_February_S, SFMain.int_SN_Season_Rain_Storm_February, "{0}")

	ElseIf (option == int_SN_Season_Snow_February_S)
		SFMain.int_SN_Season_Snow_February = value as int
		SetSliderOptionValue(int_SN_Season_Snow_February_S, SFMain.int_SN_Season_Snow_February, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_February_S)
		SFMain.int_SN_Season_Snow_Storm_February = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_February_S, SFMain.int_SN_Season_Snow_Storm_February, "{0}")
  EndIf


;---March
	If (option == int_Season_Pleasant_March_S)
		SFMain.int_Season_Pleasant_March = value as int
		SetSliderOptionValue(int_Season_Pleasant_March_S, SFMain.int_Season_Pleasant_March, "{0}")
		
  ElseIf (option == int_Season_PleasantA_March_S)
		SFMain.int_Season_PleasantA_March = value as int
		SetSliderOptionValue(int_Season_PleasantA_March_S, SFMain.int_Season_PleasantA_March, "{0}")
		
	ElseIf (option == int_Season_Overcast_March_S)
		SFMain.int_Season_Overcast_March = value as int
		SetSliderOptionValue(int_Season_Overcast_March_S, SFMain.int_Season_Overcast_March, "{0}")
  
	ElseIf (option == int_Season_Rain_March_S)
		SFMain.int_Season_Rain_March = value as int
		SetSliderOptionValue(int_Season_Rain_March_S, SFMain.int_Season_Rain_March, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_March_S)
		SFMain.int_Season_Rain_Storm_March = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_March_S, SFMain.int_Season_Rain_Storm_March, "{0}")

	ElseIf (option == int_Season_Snow_March_S)
		SFMain.int_Season_Snow_March = value as int
		SetSliderOptionValue(int_Season_Snow_March_S, SFMain.int_Season_Snow_March, "{0}")

	ElseIf (option == int_Season_Snow_Storm_March_S)
		SFMain.int_Season_Snow_Storm_March = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_March_S, SFMain.int_Season_Snow_Storm_March, "{0}")
  EndIf

;---March SN_
	If (option == int_SN_Season_Pleasant_March_S)
		SFMain.int_SN_Season_Pleasant_March = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_March_S, SFMain.int_SN_Season_Pleasant_March, "{0}")
		
  ElseIf (option == int_SN_Season_PleasantA_March_S)
		SFMain.int_SN_Season_PleasantA_March = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_March_S, SFMain.int_SN_Season_PleasantA_March, "{0}")
		
	ElseIf (option == int_SN_Season_Overcast_March_S)
		SFMain.int_SN_Season_Overcast_March = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_March_S, SFMain.int_SN_Season_Overcast_March, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_March_S)
		SFMain.int_SN_Season_Rain_March = value as int
		SetSliderOptionValue(int_SN_Season_Rain_March_S, SFMain.int_SN_Season_Rain_March, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_March_S)
		SFMain.int_SN_Season_Rain_Storm_March = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_March_S, SFMain.int_SN_Season_Rain_Storm_March, "{0}")

	ElseIf (option == int_SN_Season_Snow_March_S)
		SFMain.int_SN_Season_Snow_March = value as int
		SetSliderOptionValue(int_SN_Season_Snow_March_S, SFMain.int_SN_Season_Snow_March, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_March_S)
		SFMain.int_SN_Season_Snow_Storm_March = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_March_S, SFMain.int_SN_Season_Snow_Storm_March, "{0}")
  EndIf


;---April
	If (option == int_Season_Pleasant_April_S)
		SFMain.int_Season_Pleasant_April = value as int
		SetSliderOptionValue(int_Season_Pleasant_April_S, SFMain.int_Season_Pleasant_April, "{0}")
		
  ElseIf (option == int_Season_PleasantA_April_S)
		SFMain.int_Season_PleasantA_April = value as int
		SetSliderOptionValue(int_Season_PleasantA_April_S, SFMain.int_Season_PleasantA_April, "{0}")
		
	ElseIf (option == int_Season_Overcast_April_S)
		SFMain.int_Season_Overcast_April = value as int
		SetSliderOptionValue(int_Season_Overcast_April_S, SFMain.int_Season_Overcast_April, "{0}")
  
	ElseIf (option == int_Season_Rain_April_S)
		SFMain.int_Season_Rain_April = value as int
		SetSliderOptionValue(int_Season_Rain_April_S, SFMain.int_Season_Rain_April, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_April_S)
		SFMain.int_Season_Rain_Storm_April = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_April_S, SFMain.int_Season_Rain_Storm_April, "{0}")

	ElseIf (option == int_Season_Snow_April_S)
		SFMain.int_Season_Snow_April = value as int
		SetSliderOptionValue(int_Season_Snow_April_S, SFMain.int_Season_Snow_April, "{0}")

	ElseIf (option == int_Season_Snow_Storm_April_S)
		SFMain.int_Season_Snow_Storm_April = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_April_S, SFMain.int_Season_Snow_Storm_April, "{0}")
  EndIf

;---April SN_
	If (option == int_SN_Season_Pleasant_April_S)
		SFMain.int_SN_Season_Pleasant_April = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_April_S, SFMain.int_SN_Season_Pleasant_April, "{0}")
		
  ElseIf (option == int_SN_Season_PleasantA_April_S)
		SFMain.int_SN_Season_PleasantA_April = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_April_S, SFMain.int_SN_Season_PleasantA_April, "{0}")
		
	ElseIf (option == int_SN_Season_Overcast_April_S)
		SFMain.int_SN_Season_Overcast_April = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_April_S, SFMain.int_SN_Season_Overcast_April, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_April_S)
		SFMain.int_SN_Season_Rain_April = value as int
		SetSliderOptionValue(int_SN_Season_Rain_April_S, SFMain.int_SN_Season_Rain_April, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_April_S)
		SFMain.int_SN_Season_Rain_Storm_April = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_April_S, SFMain.int_SN_Season_Rain_Storm_April, "{0}")

	ElseIf (option == int_SN_Season_Snow_April_S)
		SFMain.int_SN_Season_Snow_April = value as int
		SetSliderOptionValue(int_SN_Season_Snow_April_S, SFMain.int_SN_Season_Snow_April, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_April_S)
		SFMain.int_SN_Season_Snow_Storm_April = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_April_S, SFMain.int_SN_Season_Snow_Storm_April, "{0}")
  EndIf


;---May
	If (option == int_Season_Pleasant_May_S)
		SFMain.int_Season_Pleasant_May = value as int
		SetSliderOptionValue(int_Season_Pleasant_May_S, SFMain.int_Season_Pleasant_May, "{0}")
		
  ElseIf (option == int_Season_PleasantA_May_S)
		SFMain.int_Season_PleasantA_May = value as int
		SetSliderOptionValue(int_Season_PleasantA_May_S, SFMain.int_Season_PleasantA_May, "{0}")
		
	ElseIf (option == int_Season_Overcast_May_S)
		SFMain.int_Season_Overcast_May = value as int
		SetSliderOptionValue(int_Season_Overcast_May_S, SFMain.int_Season_Overcast_May, "{0}")
  
	ElseIf (option == int_Season_Rain_May_S)
		SFMain.int_Season_Rain_May = value as int
		SetSliderOptionValue(int_Season_Rain_May_S, SFMain.int_Season_Rain_May, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_May_S)
		SFMain.int_Season_Rain_Storm_May = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_May_S, SFMain.int_Season_Rain_Storm_May, "{0}")

	ElseIf (option == int_Season_Snow_May_S)
		SFMain.int_Season_Snow_May = value as int
		SetSliderOptionValue(int_Season_Snow_May_S, SFMain.int_Season_Snow_May, "{0}")

	ElseIf (option == int_Season_Snow_Storm_May_S)
		SFMain.int_Season_Snow_Storm_May = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_May_S, SFMain.int_Season_Snow_Storm_May, "{0}")
  EndIf

;---May SN_
	If (option == int_SN_Season_Pleasant_May_S)
		SFMain.int_SN_Season_Pleasant_May = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_May_S, SFMain.int_SN_Season_Pleasant_May, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_May_S)
		SFMain.int_SN_Season_PleasantA_May = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_May_S, SFMain.int_SN_Season_PleasantA_May, "{0}")

	ElseIf (option == int_SN_Season_Overcast_May_S)
		SFMain.int_SN_Season_Overcast_May = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_May_S, SFMain.int_SN_Season_Overcast_May, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_May_S)
		SFMain.int_SN_Season_Rain_May = value as int
		SetSliderOptionValue(int_SN_Season_Rain_May_S, SFMain.int_SN_Season_Rain_May, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_May_S)
		SFMain.int_SN_Season_Rain_Storm_May = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_May_S, SFMain.int_SN_Season_Rain_Storm_May, "{0}")

	ElseIf (option == int_SN_Season_Snow_May_S)
		SFMain.int_SN_Season_Snow_May = value as int
		SetSliderOptionValue(int_SN_Season_Snow_May_S, SFMain.int_SN_Season_Snow_May, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_May_S)
		SFMain.int_SN_Season_Snow_Storm_May = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_May_S, SFMain.int_SN_Season_Snow_Storm_May, "{0}")
  EndIf


;---June
	If (option == int_Season_Pleasant_June_S)
		SFMain.int_Season_Pleasant_June = value as int
		SetSliderOptionValue(int_Season_Pleasant_June_S, SFMain.int_Season_Pleasant_June, "{0}")
		
	ElseIf (option == int_Season_PleasantA_June_S)
		SFMain.int_Season_PleasantA_June = value as int
		SetSliderOptionValue(int_Season_PleasantA_June_S, SFMain.int_Season_PleasantA_June, "{0}")

	ElseIf (option == int_Season_Overcast_June_S)
		SFMain.int_Season_Overcast_June = value as int
		SetSliderOptionValue(int_Season_Overcast_June_S, SFMain.int_Season_Overcast_June, "{0}")
  
	ElseIf (option == int_Season_Rain_June_S)
		SFMain.int_Season_Rain_June = value as int
		SetSliderOptionValue(int_Season_Rain_June_S, SFMain.int_Season_Rain_June, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_June_S)
		SFMain.int_Season_Rain_Storm_June = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_June_S, SFMain.int_Season_Rain_Storm_June, "{0}")

	ElseIf (option == int_Season_Snow_June_S)
		SFMain.int_Season_Snow_June = value as int
		SetSliderOptionValue(int_Season_Snow_June_S, SFMain.int_Season_Snow_June, "{0}")

	ElseIf (option == int_Season_Snow_Storm_June_S)
		SFMain.int_Season_Snow_Storm_June = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_June_S, SFMain.int_Season_Snow_Storm_June, "{0}")
  EndIf

;---June SN_
	If (option == int_SN_Season_Pleasant_June_S)
		SFMain.int_SN_Season_Pleasant_June = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_June_S, SFMain.int_SN_Season_Pleasant_June, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_June_S)
		SFMain.int_SN_Season_PleasantA_June = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_June_S, SFMain.int_SN_Season_PleasantA_June, "{0}")

	ElseIf (option == int_SN_Season_Overcast_June_S)
		SFMain.int_SN_Season_Overcast_June = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_June_S, SFMain.int_SN_Season_Overcast_June, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_June_S)
		SFMain.int_SN_Season_Rain_June = value as int
		SetSliderOptionValue(int_SN_Season_Rain_June_S, SFMain.int_SN_Season_Rain_June, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_June_S)
		SFMain.int_SN_Season_Rain_Storm_June = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_June_S, SFMain.int_SN_Season_Rain_Storm_June, "{0}")

	ElseIf (option == int_SN_Season_Snow_June_S)
		SFMain.int_SN_Season_Snow_June = value as int
		SetSliderOptionValue(int_SN_Season_Snow_June_S, SFMain.int_SN_Season_Snow_June, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_June_S)
		SFMain.int_SN_Season_Snow_Storm_June = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_June_S, SFMain.int_SN_Season_Snow_Storm_June, "{0}")
  EndIf


;---July
	If (option == int_Season_Pleasant_July_S)
		SFMain.int_Season_Pleasant_July = value as int
		SetSliderOptionValue(int_Season_Pleasant_July_S, SFMain.int_Season_Pleasant_July, "{0}")
		
	ElseIf (option == int_Season_PleasantA_July_S)
		SFMain.int_Season_PleasantA_July = value as int
		SetSliderOptionValue(int_Season_PleasantA_July_S, SFMain.int_Season_PleasantA_July, "{0}")

	ElseIf (option == int_Season_Overcast_July_S)
		SFMain.int_Season_Overcast_July = value as int
		SetSliderOptionValue(int_Season_Overcast_July_S, SFMain.int_Season_Overcast_July, "{0}")
  
	ElseIf (option == int_Season_Rain_July_S)
		SFMain.int_Season_Rain_July = value as int
		SetSliderOptionValue(int_Season_Rain_July_S, SFMain.int_Season_Rain_July, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_July_S)
		SFMain.int_Season_Rain_Storm_July = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_July_S, SFMain.int_Season_Rain_Storm_July, "{0}")

	ElseIf (option == int_Season_Snow_July_S)
		SFMain.int_Season_Snow_July = value as int
		SetSliderOptionValue(int_Season_Snow_July_S, SFMain.int_Season_Snow_July, "{0}")

	ElseIf (option == int_Season_Snow_Storm_July_S)
		SFMain.int_Season_Snow_Storm_July = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_July_S, SFMain.int_Season_Snow_Storm_July, "{0}")
  EndIf

;---July SN_
	If (option == int_SN_Season_Pleasant_July_S)
		SFMain.int_SN_Season_Pleasant_July = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_July_S, SFMain.int_SN_Season_Pleasant_July, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_July_S)
		SFMain.int_SN_Season_PleasantA_July = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_July_S, SFMain.int_SN_Season_PleasantA_July, "{0}")

	ElseIf (option == int_SN_Season_Overcast_July_S)
		SFMain.int_SN_Season_Overcast_July = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_July_S, SFMain.int_SN_Season_Overcast_July, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_July_S)
		SFMain.int_SN_Season_Rain_July = value as int
		SetSliderOptionValue(int_SN_Season_Rain_July_S, SFMain.int_SN_Season_Rain_July, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_July_S)
		SFMain.int_SN_Season_Rain_Storm_July = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_July_S, SFMain.int_SN_Season_Rain_Storm_July, "{0}")

	ElseIf (option == int_SN_Season_Snow_July_S)
		SFMain.int_SN_Season_Snow_July = value as int
		SetSliderOptionValue(int_SN_Season_Snow_July_S, SFMain.int_SN_Season_Snow_July, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_July_S)
		SFMain.int_SN_Season_Snow_Storm_July = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_July_S, SFMain.int_SN_Season_Snow_Storm_July, "{0}")
  EndIf


;---August
	If (option == int_Season_Pleasant_August_S)
		SFMain.int_Season_Pleasant_August = value as int
		SetSliderOptionValue(int_Season_Pleasant_August_S, SFMain.int_Season_Pleasant_August, "{0}")
		
	ElseIf (option == int_Season_PleasantA_August_S)
		SFMain.int_Season_PleasantA_August = value as int
		SetSliderOptionValue(int_Season_PleasantA_August_S, SFMain.int_Season_PleasantA_August, "{0}")

	ElseIf (option == int_Season_Overcast_August_S)
		SFMain.int_Season_Overcast_August = value as int
		SetSliderOptionValue(int_Season_Overcast_August_S, SFMain.int_Season_Overcast_August, "{0}")
  
	ElseIf (option == int_Season_Rain_August_S)
		SFMain.int_Season_Rain_August = value as int
		SetSliderOptionValue(int_Season_Rain_August_S, SFMain.int_Season_Rain_August, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_August_S)
		SFMain.int_Season_Rain_Storm_August = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_August_S, SFMain.int_Season_Rain_Storm_August, "{0}")

	ElseIf (option == int_Season_Snow_August_S)
		SFMain.int_Season_Snow_August = value as int
		SetSliderOptionValue(int_Season_Snow_August_S, SFMain.int_Season_Snow_August, "{0}")

	ElseIf (option == int_Season_Snow_Storm_August_S)
		SFMain.int_Season_Snow_Storm_August = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_August_S, SFMain.int_Season_Snow_Storm_August, "{0}")
  EndIf

;---August SN_
	If (option == int_SN_Season_Pleasant_August_S)
		SFMain.int_SN_Season_Pleasant_August = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_August_S, SFMain.int_SN_Season_Pleasant_August, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_August_S)
		SFMain.int_SN_Season_PleasantA_August = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_August_S, SFMain.int_SN_Season_PleasantA_August, "{0}")

	ElseIf (option == int_SN_Season_Overcast_August_S)
		SFMain.int_SN_Season_Overcast_August = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_August_S, SFMain.int_SN_Season_Overcast_August, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_August_S)
		SFMain.int_SN_Season_Rain_August = value as int
		SetSliderOptionValue(int_SN_Season_Rain_August_S, SFMain.int_SN_Season_Rain_August, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_August_S)
		SFMain.int_SN_Season_Rain_Storm_August = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_August_S, SFMain.int_SN_Season_Rain_Storm_August, "{0}")

	ElseIf (option == int_SN_Season_Snow_August_S)
		SFMain.int_SN_Season_Snow_August = value as int
		SetSliderOptionValue(int_SN_Season_Snow_August_S, SFMain.int_SN_Season_Snow_August, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_August_S)
		SFMain.int_SN_Season_Snow_Storm_August = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_August_S, SFMain.int_SN_Season_Snow_Storm_August, "{0}")
  EndIf


;---September
	If (option == int_Season_Pleasant_September_S)
		SFMain.int_Season_Pleasant_September = value as int
		SetSliderOptionValue(int_Season_Pleasant_September_S, SFMain.int_Season_Pleasant_September, "{0}")
		
	ElseIf (option == int_Season_PleasantA_September_S)
		SFMain.int_Season_PleasantA_September = value as int
		SetSliderOptionValue(int_Season_PleasantA_September_S, SFMain.int_Season_PleasantA_September, "{0}")

	ElseIf (option == int_Season_Overcast_September_S)
		SFMain.int_Season_Overcast_September = value as int
		SetSliderOptionValue(int_Season_Overcast_September_S, SFMain.int_Season_Overcast_September, "{0}")
  
	ElseIf (option == int_Season_Rain_September_S)
		SFMain.int_Season_Rain_September = value as int
		SetSliderOptionValue(int_Season_Rain_September_S, SFMain.int_Season_Rain_September, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_September_S)
		SFMain.int_Season_Rain_Storm_September = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_September_S, SFMain.int_Season_Rain_Storm_September, "{0}")

	ElseIf (option == int_Season_Snow_September_S)
		SFMain.int_Season_Snow_September = value as int
		SetSliderOptionValue(int_Season_Snow_September_S, SFMain.int_Season_Snow_September, "{0}")

	ElseIf (option == int_Season_Snow_Storm_September_S)
		SFMain.int_Season_Snow_Storm_September = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_September_S, SFMain.int_Season_Snow_Storm_September, "{0}")
  EndIf

;---September SN_
	If (option == int_SN_Season_Pleasant_September_S)
		SFMain.int_SN_Season_Pleasant_September = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_September_S, SFMain.int_SN_Season_Pleasant_September, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_September_S)
		SFMain.int_SN_Season_PleasantA_September = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_September_S, SFMain.int_SN_Season_PleasantA_September, "{0}")

	ElseIf (option == int_SN_Season_Overcast_September_S)
		SFMain.int_SN_Season_Overcast_September = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_September_S, SFMain.int_SN_Season_Overcast_September, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_September_S)
		SFMain.int_SN_Season_Rain_September = value as int
		SetSliderOptionValue(int_SN_Season_Rain_September_S, SFMain.int_SN_Season_Rain_September, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_September_S)
		SFMain.int_SN_Season_Rain_Storm_September = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_September_S, SFMain.int_SN_Season_Rain_Storm_September, "{0}")

	ElseIf (option == int_SN_Season_Snow_September_S)
		SFMain.int_SN_Season_Snow_September = value as int
		SetSliderOptionValue(int_SN_Season_Snow_September_S, SFMain.int_SN_Season_Snow_September, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_September_S)
		SFMain.int_SN_Season_Snow_Storm_September = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_September_S, SFMain.int_SN_Season_Snow_Storm_September, "{0}")
  EndIf


;---October
	If (option == int_Season_Pleasant_October_S)
		SFMain.int_Season_Pleasant_October = value as int
		SetSliderOptionValue(int_Season_Pleasant_October_S, SFMain.int_Season_Pleasant_October, "{0}")
		
	ElseIf (option == int_Season_PleasantA_October_S)
		SFMain.int_Season_PleasantA_October = value as int
		SetSliderOptionValue(int_Season_PleasantA_October_S, SFMain.int_Season_PleasantA_October, "{0}")

	ElseIf (option == int_Season_Overcast_October_S)
		SFMain.int_Season_Overcast_October = value as int
		SetSliderOptionValue(int_Season_Overcast_October_S, SFMain.int_Season_Overcast_October, "{0}")
  
	ElseIf (option == int_Season_Rain_October_S)
		SFMain.int_Season_Rain_October = value as int
		SetSliderOptionValue(int_Season_Rain_October_S, SFMain.int_Season_Rain_October, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_October_S)
		SFMain.int_Season_Rain_Storm_October = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_October_S, SFMain.int_Season_Rain_Storm_October, "{0}")

	ElseIf (option == int_Season_Snow_October_S)
		SFMain.int_Season_Snow_October = value as int
		SetSliderOptionValue(int_Season_Snow_October_S, SFMain.int_Season_Snow_October, "{0}")

	ElseIf (option == int_Season_Snow_Storm_October_S)
		SFMain.int_Season_Snow_Storm_October = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_October_S, SFMain.int_Season_Snow_Storm_October, "{0}")
  EndIf

;---October SN_
	If (option == int_SN_Season_Pleasant_October_S)
		SFMain.int_SN_Season_Pleasant_October = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_October_S, SFMain.int_SN_Season_Pleasant_October, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_October_S)
		SFMain.int_SN_Season_PleasantA_October = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_October_S, SFMain.int_SN_Season_PleasantA_October, "{0}")

	ElseIf (option == int_SN_Season_Overcast_October_S)
		SFMain.int_SN_Season_Overcast_October = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_October_S, SFMain.int_SN_Season_Overcast_October, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_October_S)
		SFMain.int_SN_Season_Rain_October = value as int
		SetSliderOptionValue(int_SN_Season_Rain_October_S, SFMain.int_SN_Season_Rain_October, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_October_S)
		SFMain.int_SN_Season_Rain_Storm_October = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_October_S, SFMain.int_SN_Season_Rain_Storm_October, "{0}")

	ElseIf (option == int_SN_Season_Snow_October_S)
		SFMain.int_SN_Season_Snow_October = value as int
		SetSliderOptionValue(int_SN_Season_Snow_October_S, SFMain.int_SN_Season_Snow_October, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_October_S)
		SFMain.int_SN_Season_Snow_Storm_October = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_October_S, SFMain.int_SN_Season_Snow_Storm_October, "{0}")
  EndIf


;---November
	If (option == int_Season_Pleasant_November_S)
		SFMain.int_Season_Pleasant_November = value as int
		SetSliderOptionValue(int_Season_Pleasant_November_S, SFMain.int_Season_Pleasant_November, "{0}")
		
	ElseIf (option == int_Season_PleasantA_November_S)
		SFMain.int_Season_PleasantA_November = value as int
		SetSliderOptionValue(int_Season_PleasantA_November_S, SFMain.int_Season_PleasantA_November, "{0}")

	ElseIf (option == int_Season_Overcast_November_S)
		SFMain.int_Season_Overcast_November = value as int
		SetSliderOptionValue(int_Season_Overcast_November_S, SFMain.int_Season_Overcast_November, "{0}")
  
	ElseIf (option == int_Season_Rain_November_S)
		SFMain.int_Season_Rain_November = value as int
		SetSliderOptionValue(int_Season_Rain_November_S, SFMain.int_Season_Rain_November, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_November_S)
		SFMain.int_Season_Rain_Storm_November = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_November_S, SFMain.int_Season_Rain_Storm_November, "{0}")

	ElseIf (option == int_Season_Snow_November_S)
		SFMain.int_Season_Snow_November = value as int
		SetSliderOptionValue(int_Season_Snow_November_S, SFMain.int_Season_Snow_November, "{0}")

	ElseIf (option == int_Season_Snow_Storm_November_S)
		SFMain.int_Season_Snow_Storm_November = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_November_S, SFMain.int_Season_Snow_Storm_November, "{0}")
  EndIf

;---November SN_
	If (option == int_SN_Season_Pleasant_November_S)
		SFMain.int_SN_Season_Pleasant_November = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_November_S, SFMain.int_SN_Season_Pleasant_November, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_November_S)
		SFMain.int_SN_Season_PleasantA_November = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_November_S, SFMain.int_SN_Season_PleasantA_November, "{0}")

	ElseIf (option == int_SN_Season_Overcast_November_S)
		SFMain.int_SN_Season_Overcast_November = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_November_S, SFMain.int_SN_Season_Overcast_November, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_November_S)
		SFMain.int_SN_Season_Rain_November = value as int
		SetSliderOptionValue(int_SN_Season_Rain_November_S, SFMain.int_SN_Season_Rain_November, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_November_S)
		SFMain.int_SN_Season_Rain_Storm_November = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_November_S, SFMain.int_SN_Season_Rain_Storm_November, "{0}")

	ElseIf (option == int_SN_Season_Snow_November_S)
		SFMain.int_SN_Season_Snow_November = value as int
		SetSliderOptionValue(int_SN_Season_Snow_November_S, SFMain.int_SN_Season_Snow_November, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_November_S)
		SFMain.int_SN_Season_Snow_Storm_November = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_November_S, SFMain.int_SN_Season_Snow_Storm_November, "{0}")
  EndIf


;---December
	If (option == int_Season_Pleasant_December_S)
		SFMain.int_Season_Pleasant_December = value as int
		SetSliderOptionValue(int_Season_Pleasant_December_S, SFMain.int_Season_Pleasant_December, "{0}")
		
	ElseIf (option == int_Season_PleasantA_December_S)
		SFMain.int_Season_PleasantA_December = value as int
		SetSliderOptionValue(int_Season_PleasantA_December_S, SFMain.int_Season_PleasantA_December, "{0}")

	ElseIf (option == int_Season_Overcast_December_S)
		SFMain.int_Season_Overcast_December = value as int
		SetSliderOptionValue(int_Season_Overcast_December_S, SFMain.int_Season_Overcast_December, "{0}")
  
	ElseIf (option == int_Season_Rain_December_S)
		SFMain.int_Season_Rain_December = value as int
		SetSliderOptionValue(int_Season_Rain_December_S, SFMain.int_Season_Rain_December, "{0}")
  
	ElseIf (option == int_Season_Rain_Storm_December_S)
		SFMain.int_Season_Rain_Storm_December = value as int
		SetSliderOptionValue(int_Season_Rain_Storm_December_S, SFMain.int_Season_Rain_Storm_December, "{0}")

	ElseIf (option == int_Season_Snow_December_S)
		SFMain.int_Season_Snow_December = value as int
		SetSliderOptionValue(int_Season_Snow_December_S, SFMain.int_Season_Snow_December, "{0}")

	ElseIf (option == int_Season_Snow_Storm_December_S)
		SFMain.int_Season_Snow_Storm_December = value as int
		SetSliderOptionValue(int_Season_Snow_Storm_December_S, SFMain.int_Season_Snow_Storm_December, "{0}")
  EndIf

;---December SN_
	If (option == int_SN_Season_Pleasant_December_S)
		SFMain.int_SN_Season_Pleasant_December = value as int
		SetSliderOptionValue(int_SN_Season_Pleasant_December_S, SFMain.int_SN_Season_Pleasant_December, "{0}")
		
	ElseIf (option == int_SN_Season_PleasantA_December_S)
		SFMain.int_SN_Season_PleasantA_December = value as int
		SetSliderOptionValue(int_SN_Season_PleasantA_December_S, SFMain.int_SN_Season_PleasantA_December, "{0}")

	ElseIf (option == int_SN_Season_Overcast_December_S)
		SFMain.int_SN_Season_Overcast_December = value as int
		SetSliderOptionValue(int_SN_Season_Overcast_December_S, SFMain.int_SN_Season_Overcast_December, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_December_S)
		SFMain.int_SN_Season_Rain_December = value as int
		SetSliderOptionValue(int_SN_Season_Rain_December_S, SFMain.int_SN_Season_Rain_December, "{0}")
  
	ElseIf (option == int_SN_Season_Rain_Storm_December_S)
		SFMain.int_SN_Season_Rain_Storm_December = value as int
		SetSliderOptionValue(int_SN_Season_Rain_Storm_December_S, SFMain.int_SN_Season_Rain_Storm_December, "{0}")

	ElseIf (option == int_SN_Season_Snow_December_S)
		SFMain.int_SN_Season_Snow_December = value as int
		SetSliderOptionValue(int_SN_Season_Snow_December_S, SFMain.int_SN_Season_Snow_December, "{0}")

	ElseIf (option == int_SN_Season_Snow_Storm_December_S)
		SFMain.int_SN_Season_Snow_Storm_December = value as int
		SetSliderOptionValue(int_SN_Season_Snow_Storm_December_S, SFMain.int_SN_Season_Snow_Storm_December, "{0}")
  EndIf

  SFMain.Season(True)
EndEvent




;-----------------------------------------------------------------

Event OnOptionSliderOpen(int option)

	;If (option == int_Season_Pleasant_January_S)
		;SetSliderDialogStartValue(SFMain.int_Season_Pleasant_January)
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
  ;EndIf
  
  
  If (option == float_Season_Spring_Intensity_S) || (option == float_Season_Summer_Intensity_S) || (option == float_Season_Autumn_Intensity_S) || (option == float_Season_Winter_Intensity_S)
    SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.1)
  EndIf
  
  If (option == float_Season_Spring_Saturation_S) || (option == float_Season_Summer_Saturation_S) || (option == float_Season_Autumn_Saturation_S) || (option == float_Season_Winter_Saturation_S) || (option == float_Season_Spring_Temperature_S) || (option == float_Season_Summer_Temperature_S) || (option == float_Season_Autumn_Temperature_S) || (option == float_Season_Winter_Temperature_S)
    SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.1)
  EndIf

EndEvent
;-----------------------------------------------------------------

Event OnOptionSelect(int option)

  If (option == DefaultValues_T)
    SFMain.DefaultValues()
    SFMain.Season(True)
    Debug.MessageBox("Default settings loaded.")
  EndIf
  
	If (option == Save_Profile_T)
		LoadSave(False)
	ElseIf (option == Load_Profile_T)
		LoadSave(True)
	EndIf

  If (option == bool_EnableSeasonalImagespaces_B)
    SFMain.bool_EnableSeasonalImagespaces = !SFMain.bool_EnableSeasonalImagespaces
    SetToggleOptionValue(bool_EnableSeasonalImagespaces_B, SFMain.bool_EnableSeasonalImagespaces)
    SFMain.Season(True)
   EndIf

EndEvent





Function Pages()
	Pages = new string[14]
	Pages[0] = "Load & Save Settings"
	Pages[1] = "Seasonal Imagespaces"
	Pages[2] = "Morning Star" ;"January Chances"
	Pages[3] = "Sun's Dawn" ;"February Chances"
	Pages[4] = "First Seed" ;"March Chances"
	Pages[5] = "Rain's Hand" ;"April Chances"
	Pages[6] = "Second Seed" ;"May Chances"
	Pages[7] = "Mid Year" ;"June Chances"
	Pages[8] = "Sun's Height" ;"July Chances"
	Pages[9] = "Last Seed" ;"August Chances"
	Pages[10] = "Hearthfire" ;"September Chances"
	Pages[11] = "Frost Fall" ;"October Chances"
	Pages[12] = "Sun's Dusk" ;"November Chances"
	Pages[13] = "Evening Star" ;"December Chances"

EndFunction



;------------------ variables

int DefaultValues_T
int Load_Profile_T
int Save_Profile_T

int bool_EnableSeasonalImagespaces_B

int float_Season_Spring_Intensity_S
int float_Season_Spring_Saturation_S
int float_Season_Spring_Temperature_S

int float_Season_Summer_Intensity_S
int float_Season_Summer_Saturation_S
int float_Season_Summer_Temperature_S

int float_Season_Autumn_Intensity_S
int float_Season_Autumn_Saturation_S
int float_Season_Autumn_Temperature_S

int float_Season_Winter_Intensity_S
int float_Season_Winter_Saturation_S
int float_Season_Winter_Temperature_S


;------------ JANUARY ------------------
int int_Season_Pleasant_January_S
int int_Season_PleasantA_January_S
int int_Season_Overcast_January_S
int int_Season_Rain_January_S
int int_Season_Rain_Storm_January_S
int int_Season_Snow_January_S
int int_Season_Snow_Storm_January_S
int int_SN_Season_Pleasant_January_S
int int_SN_Season_PleasantA_January_S
int int_SN_Season_Overcast_January_S
int int_SN_Season_Rain_January_S
int int_SN_Season_Rain_Storm_January_S
int int_SN_Season_Snow_January_S
int int_SN_Season_Snow_Storm_January_S

;------------ FEBRUARY ------------------
int int_Season_Pleasant_February_S
int int_Season_PleasantA_February_S
int int_Season_Overcast_February_S
int int_Season_Rain_February_S
int int_Season_Rain_Storm_February_S
int int_Season_Snow_February_S
int int_Season_Snow_Storm_February_S
int int_SN_Season_Pleasant_February_S
int int_SN_Season_PleasantA_February_S
int int_SN_Season_Overcast_February_S
int int_SN_Season_Rain_February_S
int int_SN_Season_Rain_Storm_February_S
int int_SN_Season_Snow_February_S
int int_SN_Season_Snow_Storm_February_S

;------------ MARCH ------------------
int int_Season_Pleasant_March_S
int int_Season_PleasantA_March_S
int int_Season_Overcast_March_S
int int_Season_Rain_March_S
int int_Season_Rain_Storm_March_S
int int_Season_Snow_March_S
int int_Season_Snow_Storm_March_S
int int_SN_Season_Pleasant_March_S
int int_SN_Season_PleasantA_March_S
int int_SN_Season_Overcast_March_S
int int_SN_Season_Rain_March_S
int int_SN_Season_Rain_Storm_March_S
int int_SN_Season_Snow_March_S
int int_SN_Season_Snow_Storm_March_S

;------------ APRIL ------------------
int int_Season_Pleasant_April_S
int int_Season_PleasantA_April_S
int int_Season_Overcast_April_S
int int_Season_Rain_April_S
int int_Season_Rain_Storm_April_S
int int_Season_Snow_April_S
int int_Season_Snow_Storm_April_S
int int_SN_Season_Pleasant_April_S
int int_SN_Season_PleasantA_April_S
int int_SN_Season_Overcast_April_S
int int_SN_Season_Rain_April_S
int int_SN_Season_Rain_Storm_April_S
int int_SN_Season_Snow_April_S
int int_SN_Season_Snow_Storm_April_S

;------------ MAY ------------------
int int_Season_Pleasant_May_S
int int_Season_PleasantA_May_S
int int_Season_Overcast_May_S
int int_Season_Rain_May_S
int int_Season_Rain_Storm_May_S
int int_Season_Snow_May_S
int int_Season_Snow_Storm_May_S
int int_SN_Season_Pleasant_May_S
int int_SN_Season_PleasantA_May_S
int int_SN_Season_Overcast_May_S
int int_SN_Season_Rain_May_S
int int_SN_Season_Rain_Storm_May_S
int int_SN_Season_Snow_May_S
int int_SN_Season_Snow_Storm_May_S

;------------ JUNE ------------------
int int_Season_Pleasant_June_S
int int_Season_PleasantA_June_S
int int_Season_Overcast_June_S
int int_Season_Rain_June_S
int int_Season_Rain_Storm_June_S
int int_Season_Snow_June_S
int int_Season_Snow_Storm_June_S
int int_SN_Season_Pleasant_June_S
int int_SN_Season_PleasantA_June_S
int int_SN_Season_Overcast_June_S
int int_SN_Season_Rain_June_S
int int_SN_Season_Rain_Storm_June_S
int int_SN_Season_Snow_June_S
int int_SN_Season_Snow_Storm_June_S

;------------ JULY ------------------
int int_Season_Pleasant_July_S
int int_Season_PleasantA_July_S
int int_Season_Overcast_July_S
int int_Season_Rain_July_S
int int_Season_Rain_Storm_July_S
int int_Season_Snow_July_S
int int_Season_Snow_Storm_July_S
int int_SN_Season_Pleasant_July_S
int int_SN_Season_PleasantA_July_S
int int_SN_Season_Overcast_July_S
int int_SN_Season_Rain_July_S
int int_SN_Season_Rain_Storm_July_S
int int_SN_Season_Snow_July_S
int int_SN_Season_Snow_Storm_July_S

;------------ AUGUST ------------------
int int_Season_Pleasant_August_S
int int_Season_PleasantA_August_S
int int_Season_Overcast_August_S
int int_Season_Rain_August_S
int int_Season_Rain_Storm_August_S
int int_Season_Snow_August_S
int int_Season_Snow_Storm_August_S
int int_SN_Season_Pleasant_August_S
int int_SN_Season_PleasantA_August_S
int int_SN_Season_Overcast_August_S
int int_SN_Season_Rain_August_S
int int_SN_Season_Rain_Storm_August_S
int int_SN_Season_Snow_August_S
int int_SN_Season_Snow_Storm_August_S

;------------ SEPTEMBER ------------------
int int_Season_Pleasant_September_S
int int_Season_PleasantA_September_S
int int_Season_Overcast_September_S
int int_Season_Rain_September_S
int int_Season_Rain_Storm_September_S
int int_Season_Snow_September_S
int int_Season_Snow_Storm_September_S
int int_SN_Season_Pleasant_September_S
int int_SN_Season_PleasantA_September_S
int int_SN_Season_Overcast_September_S
int int_SN_Season_Rain_September_S
int int_SN_Season_Rain_Storm_September_S
int int_SN_Season_Snow_September_S
int int_SN_Season_Snow_Storm_September_S

;------------ OCTOBER ------------------
int int_Season_Pleasant_October_S
int int_Season_PleasantA_October_S
int int_Season_Overcast_October_S
int int_Season_Rain_October_S
int int_Season_Rain_Storm_October_S
int int_Season_Snow_October_S
int int_Season_Snow_Storm_October_S
int int_SN_Season_Pleasant_October_S
int int_SN_Season_PleasantA_October_S
int int_SN_Season_Overcast_October_S
int int_SN_Season_Rain_October_S
int int_SN_Season_Rain_Storm_October_S
int int_SN_Season_Snow_October_S
int int_SN_Season_Snow_Storm_October_S

;------------ NOVEMBER ------------------
int int_Season_Pleasant_November_S
int int_Season_PleasantA_November_S
int int_Season_Overcast_November_S
int int_Season_Rain_November_S
int int_Season_Rain_Storm_November_S
int int_Season_Snow_November_S
int int_Season_Snow_Storm_November_S
int int_SN_Season_Pleasant_November_S
int int_SN_Season_PleasantA_November_S
int int_SN_Season_Overcast_November_S
int int_SN_Season_Rain_November_S
int int_SN_Season_Rain_Storm_November_S
int int_SN_Season_Snow_November_S
int int_SN_Season_Snow_Storm_November_S

;------------ DECEMBER ------------------
int int_Season_Pleasant_December_S
int int_Season_PleasantA_December_S
int int_Season_Overcast_December_S
int int_Season_Rain_December_S
int int_Season_Rain_Storm_December_S
int int_Season_Snow_December_S
int int_Season_Snow_Storm_December_S
int int_SN_Season_Pleasant_December_S
int int_SN_Season_PleasantA_December_S
int int_SN_Season_Overcast_December_S
int int_SN_Season_Rain_December_S
int int_SN_Season_Rain_Storm_December_S
int int_SN_Season_Snow_December_S
int int_SN_Season_Snow_Storm_December_S
















Function LoadSave(bool Load = True)
If PapyrusUtil.GetVersion() > 1

	If Load == True
		If JsonExists("../Seasonal Weathers Framework/settings.json")

			SFMain.bool_EnableSeasonalImagespaces = GetINTValue("../Seasonal Weathers Framework/settings.json", "bool_EnableSeasonalImagespaces")
			
			SFMain.float_Season_Spring_Intensity = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Spring_Intensity")
			SFMain.float_Season_Spring_Saturation = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Spring_Saturation")
			SFMain.float_Season_Spring_Temperature = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Spring_Temperature")
 
			SFMain.float_Season_Summer_Intensity = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Summer_Intensity")
			SFMain.float_Season_Summer_Saturation = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Summer_Saturation")
			SFMain.float_Season_Summer_Temperature = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Summer_Temperature")

			SFMain.float_Season_Autumn_Intensity = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Autumn_Intensity")
			SFMain.float_Season_Autumn_Saturation = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Autumn_Saturation")
			SFMain.float_Season_Autumn_Temperature = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Autumn_Temperature")

			SFMain.float_Season_Winter_Intensity = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Winter_Intensity")
			SFMain.float_Season_Winter_Saturation = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Winter_Saturation")
			SFMain.float_Season_Winter_Temperature = GetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Winter_Temperature")
		

      ;------------ January ------------------
			SFMain.int_Season_Pleasant_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_January")
			SFMain.int_Season_PleasantA_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_January")
			SFMain.int_Season_Overcast_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_January")
			SFMain.int_Season_Rain_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_January")
			SFMain.int_Season_Rain_Storm_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_January")
			SFMain.int_Season_Snow_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_January")
			SFMain.int_Season_Snow_Storm_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_January")
			SFMain.int_SN_Season_Pleasant_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_January")
			SFMain.int_SN_Season_PleasantA_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_January")
			SFMain.int_SN_Season_Overcast_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_January")
			SFMain.int_SN_Season_Rain_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_January")
			SFMain.int_SN_Season_Rain_Storm_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_January")
			SFMain.int_SN_Season_Snow_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_January")
			SFMain.int_SN_Season_Snow_Storm_January = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_January")

      ;------------ February ------------------
			SFMain.int_Season_Pleasant_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_February")
			SFMain.int_Season_PleasantA_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_February")
			SFMain.int_Season_Overcast_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_February")
			SFMain.int_Season_Rain_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_February")
			SFMain.int_Season_Rain_Storm_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_February")
			SFMain.int_Season_Snow_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_February")
			SFMain.int_Season_Snow_Storm_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_February")
			SFMain.int_SN_Season_Pleasant_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_February")
			SFMain.int_SN_Season_PleasantA_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_February")
			SFMain.int_SN_Season_Overcast_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_February")
			SFMain.int_SN_Season_Rain_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_February")
			SFMain.int_SN_Season_Rain_Storm_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_February")
			SFMain.int_SN_Season_Snow_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_February")
			SFMain.int_SN_Season_Snow_Storm_February = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_February")
			
      ;------------ March ------------------
			SFMain.int_Season_Pleasant_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_March")
			SFMain.int_Season_PleasantA_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_March")
			SFMain.int_Season_Overcast_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_March")
			SFMain.int_Season_Rain_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_March")
			SFMain.int_Season_Rain_Storm_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_March")
			SFMain.int_Season_Snow_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_March")
			SFMain.int_Season_Snow_Storm_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_March")
			SFMain.int_SN_Season_Pleasant_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_March")
			SFMain.int_SN_Season_PleasantA_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_March")
			SFMain.int_SN_Season_Overcast_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_March")
			SFMain.int_SN_Season_Rain_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_March")
			SFMain.int_SN_Season_Rain_Storm_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_March")
			SFMain.int_SN_Season_Snow_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_March")
			SFMain.int_SN_Season_Snow_Storm_March = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_March")
			
      ;------------ April ------------------
			SFMain.int_Season_Pleasant_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_April")
			SFMain.int_Season_PleasantA_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_April")
			SFMain.int_Season_Overcast_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_April")
			SFMain.int_Season_Rain_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_April")
			SFMain.int_Season_Rain_Storm_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_April")
			SFMain.int_Season_Snow_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_April")
			SFMain.int_Season_Snow_Storm_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_April")
			SFMain.int_SN_Season_Pleasant_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_April")
			SFMain.int_SN_Season_PleasantA_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_April")
			SFMain.int_SN_Season_Overcast_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_April")
			SFMain.int_SN_Season_Rain_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_April")
			SFMain.int_SN_Season_Rain_Storm_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_April")
			SFMain.int_SN_Season_Snow_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_April")
			SFMain.int_SN_Season_Snow_Storm_April = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_April")

      ;------------ May ------------------
			SFMain.int_Season_Pleasant_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_May")
			SFMain.int_Season_PleasantA_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_May")
			SFMain.int_Season_Overcast_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_May")
			SFMain.int_Season_Rain_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_May")
			SFMain.int_Season_Rain_Storm_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_May")
			SFMain.int_Season_Snow_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_May")
			SFMain.int_Season_Snow_Storm_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_May")
			SFMain.int_SN_Season_Pleasant_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_May")
			SFMain.int_SN_Season_PleasantA_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_May")
			SFMain.int_SN_Season_Overcast_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_May")
			SFMain.int_SN_Season_Rain_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_May")
			SFMain.int_SN_Season_Rain_Storm_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_May")
			SFMain.int_SN_Season_Snow_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_May")
			SFMain.int_SN_Season_Snow_Storm_May = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_May")

      ;------------ June ------------------
			SFMain.int_Season_Pleasant_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_June")
			SFMain.int_Season_PleasantA_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_June")
			SFMain.int_Season_Overcast_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_June")
			SFMain.int_Season_Rain_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_June")
			SFMain.int_Season_Rain_Storm_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_June")
			SFMain.int_Season_Snow_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_June")
			SFMain.int_Season_Snow_Storm_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_June")
			SFMain.int_SN_Season_Pleasant_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_June")
			SFMain.int_SN_Season_PleasantA_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_June")
			SFMain.int_SN_Season_Overcast_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_June")
			SFMain.int_SN_Season_Rain_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_June")
			SFMain.int_SN_Season_Rain_Storm_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_June")
			SFMain.int_SN_Season_Snow_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_June")
			SFMain.int_SN_Season_Snow_Storm_June = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_June")

      ;------------ July ------------------
			SFMain.int_Season_Pleasant_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_July")
			SFMain.int_Season_PleasantA_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_July")
			SFMain.int_Season_Overcast_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_July")
			SFMain.int_Season_Rain_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_July")
			SFMain.int_Season_Rain_Storm_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_July")
			SFMain.int_Season_Snow_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_July")
			SFMain.int_Season_Snow_Storm_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_July")
			SFMain.int_SN_Season_Pleasant_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_July")
			SFMain.int_SN_Season_PleasantA_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_July")
			SFMain.int_SN_Season_Overcast_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_July")
			SFMain.int_SN_Season_Rain_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_July")
			SFMain.int_SN_Season_Rain_Storm_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_July")
			SFMain.int_SN_Season_Snow_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_July")
			SFMain.int_SN_Season_Snow_Storm_July = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_July")

      ;------------ August ------------------
			SFMain.int_Season_Pleasant_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_August")
			SFMain.int_Season_PleasantA_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_August")
			SFMain.int_Season_Overcast_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_August")
			SFMain.int_Season_Rain_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_August")
			SFMain.int_Season_Rain_Storm_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_August")
			SFMain.int_Season_Snow_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_August")
			SFMain.int_Season_Snow_Storm_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_August")
			SFMain.int_SN_Season_Pleasant_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_August")
			SFMain.int_SN_Season_PleasantA_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_August")
			SFMain.int_SN_Season_Overcast_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_August")
			SFMain.int_SN_Season_Rain_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_August")
			SFMain.int_SN_Season_Rain_Storm_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_August")
			SFMain.int_SN_Season_Snow_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_August")
			SFMain.int_SN_Season_Snow_Storm_August = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_August")

      ;------------ September ------------------
			SFMain.int_Season_Pleasant_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_September")
			SFMain.int_Season_PleasantA_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_September")
			SFMain.int_Season_Overcast_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_September")
			SFMain.int_Season_Rain_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_September")
			SFMain.int_Season_Rain_Storm_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_September")
			SFMain.int_Season_Snow_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_September")
			SFMain.int_Season_Snow_Storm_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_September")
			SFMain.int_SN_Season_Pleasant_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_September")
			SFMain.int_SN_Season_PleasantA_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_September")
			SFMain.int_SN_Season_Overcast_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_September")
			SFMain.int_SN_Season_Rain_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_September")
			SFMain.int_SN_Season_Rain_Storm_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_September")
			SFMain.int_SN_Season_Snow_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_September")
			SFMain.int_SN_Season_Snow_Storm_September = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_September")

      ;------------ October ------------------
			SFMain.int_Season_Pleasant_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_October")
			SFMain.int_Season_PleasantA_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_October")
			SFMain.int_Season_Overcast_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_October")
			SFMain.int_Season_Rain_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_October")
			SFMain.int_Season_Rain_Storm_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_October")
			SFMain.int_Season_Snow_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_October")
			SFMain.int_Season_Snow_Storm_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_October")
			SFMain.int_SN_Season_Pleasant_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_October")
			SFMain.int_SN_Season_PleasantA_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_October")
			SFMain.int_SN_Season_Overcast_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_October")
			SFMain.int_SN_Season_Rain_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_October")
			SFMain.int_SN_Season_Rain_Storm_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_October")
			SFMain.int_SN_Season_Snow_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_October")
			SFMain.int_SN_Season_Snow_Storm_October = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_October")

      ;------------ November ------------------
			SFMain.int_Season_Pleasant_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_November")
			SFMain.int_Season_PleasantA_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_November")
			SFMain.int_Season_Overcast_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_November")
			SFMain.int_Season_Rain_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_November")
			SFMain.int_Season_Rain_Storm_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_November")
			SFMain.int_Season_Snow_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_November")
			SFMain.int_Season_Snow_Storm_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_November")
			SFMain.int_SN_Season_Pleasant_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_November")
			SFMain.int_SN_Season_PleasantA_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_November")
			SFMain.int_SN_Season_Overcast_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_November")
			SFMain.int_SN_Season_Rain_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_November")
			SFMain.int_SN_Season_Rain_Storm_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_November")
			SFMain.int_SN_Season_Snow_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_November")
			SFMain.int_SN_Season_Snow_Storm_November = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_November")

      ;------------ December ------------------
			SFMain.int_Season_Pleasant_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_December")
			SFMain.int_Season_PleasantA_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_December")
			SFMain.int_Season_Overcast_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_December")
			SFMain.int_Season_Rain_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_December")
			SFMain.int_Season_Rain_Storm_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_December")
			SFMain.int_Season_Snow_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_December")
			SFMain.int_Season_Snow_Storm_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_December")
			SFMain.int_SN_Season_Pleasant_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_December")
			SFMain.int_SN_Season_PleasantA_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_December")
			SFMain.int_SN_Season_Overcast_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_December")
			SFMain.int_SN_Season_Rain_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_December")
			SFMain.int_SN_Season_Rain_Storm_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_December")
			SFMain.int_SN_Season_Snow_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_December")
			SFMain.int_SN_Season_Snow_Storm_December = GetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_December")

			SFMain.Season(True)
			Debug.MessageBox("Settings loaded from external file.")
		Else
			Debug.MessageBox("External settings file doesn't exist.")
		EndIf

	Else
	
    SetINTValue("../Seasonal Weathers Framework/settings.json", "bool_EnableSeasonalImagespaces", SFMain.bool_EnableSeasonalImagespaces as int)

    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Spring_Intensity", SFMain.float_Season_Spring_Intensity)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Spring_Saturation", SFMain.float_Season_Spring_Saturation)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Spring_Temperature", SFMain.float_Season_Spring_Temperature)
    
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Summer_Intensity", SFMain.float_Season_Summer_Intensity)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Summer_Saturation", SFMain.float_Season_Summer_Saturation)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Summer_Temperature", SFMain.float_Season_Summer_Temperature)
    
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Autumn_Intensity", SFMain.float_Season_Autumn_Intensity)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Autumn_Saturation", SFMain.float_Season_Autumn_Saturation)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Autumn_Temperature", SFMain.float_Season_Autumn_Temperature)
    
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Winter_Intensity", SFMain.float_Season_Winter_Intensity)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Winter_Saturation", SFMain.float_Season_Winter_Saturation)
    SetFloatValue("../Seasonal Weathers Framework/settings.json", "float_Season_Winter_Temperature", SFMain.float_Season_Winter_Temperature)


    ;------------ January ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_January", SFMain.int_Season_Pleasant_January)
	  SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_January", SFMain.int_Season_PleasantA_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_January", SFMain.int_Season_Overcast_January) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_January", SFMain.int_Season_Rain_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_January", SFMain.int_Season_Rain_Storm_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_January", SFMain.int_Season_Snow_January as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_January", SFMain.int_Season_Snow_Storm_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_January", SFMain.int_SN_Season_Pleasant_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_January", SFMain.int_SN_Season_PleasantA_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_January", SFMain.int_SN_Season_Overcast_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_January", SFMain.int_SN_Season_Rain_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_January", SFMain.int_SN_Season_Rain_Storm_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_January", SFMain.int_SN_Season_Snow_January)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_January", SFMain.int_SN_Season_Snow_Storm_January)

    ;------------ February ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_February", SFMain.int_Season_Pleasant_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_February", SFMain.int_Season_PleasantA_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_February", SFMain.int_Season_Overcast_February) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_February", SFMain.int_Season_Rain_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_February", SFMain.int_Season_Rain_Storm_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_February", SFMain.int_Season_Snow_February as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_February", SFMain.int_Season_Snow_Storm_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_February", SFMain.int_SN_Season_Pleasant_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_February", SFMain.int_SN_Season_PleasantA_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_February", SFMain.int_SN_Season_Overcast_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_February", SFMain.int_SN_Season_Rain_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_February", SFMain.int_SN_Season_Rain_Storm_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_February", SFMain.int_SN_Season_Snow_February)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_February", SFMain.int_SN_Season_Snow_Storm_February)

    ;------------ March ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_March", SFMain.int_Season_Pleasant_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_March", SFMain.int_Season_PleasantA_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_March", SFMain.int_Season_Overcast_March) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_March", SFMain.int_Season_Rain_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_March", SFMain.int_Season_Rain_Storm_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_March", SFMain.int_Season_Snow_March as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_March", SFMain.int_Season_Snow_Storm_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_March", SFMain.int_SN_Season_Pleasant_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_March", SFMain.int_SN_Season_PleasantA_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_March", SFMain.int_SN_Season_Overcast_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_March", SFMain.int_SN_Season_Rain_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_March", SFMain.int_SN_Season_Rain_Storm_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_March", SFMain.int_SN_Season_Snow_March)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_March", SFMain.int_SN_Season_Snow_Storm_March)

    ;------------ April ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_April", SFMain.int_Season_Pleasant_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_April", SFMain.int_Season_PleasantA_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_April", SFMain.int_Season_Overcast_April) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_April", SFMain.int_Season_Rain_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_April", SFMain.int_Season_Rain_Storm_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_April", SFMain.int_Season_Snow_April as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_April", SFMain.int_Season_Snow_Storm_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_April", SFMain.int_SN_Season_Pleasant_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_April", SFMain.int_SN_Season_PleasantA_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_April", SFMain.int_SN_Season_Overcast_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_April", SFMain.int_SN_Season_Rain_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_April", SFMain.int_SN_Season_Rain_Storm_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_April", SFMain.int_SN_Season_Snow_April)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_April", SFMain.int_SN_Season_Snow_Storm_April)

    ;------------ May ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_May", SFMain.int_Season_Pleasant_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_May", SFMain.int_Season_PleasantA_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_May", SFMain.int_Season_Overcast_May) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_May", SFMain.int_Season_Rain_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_May", SFMain.int_Season_Rain_Storm_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_May", SFMain.int_Season_Snow_May as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_May", SFMain.int_Season_Snow_Storm_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_May", SFMain.int_SN_Season_Pleasant_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_May", SFMain.int_SN_Season_PleasantA_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_May", SFMain.int_SN_Season_Overcast_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_May", SFMain.int_SN_Season_Rain_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_May", SFMain.int_SN_Season_Rain_Storm_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_May", SFMain.int_SN_Season_Snow_May)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_May", SFMain.int_SN_Season_Snow_Storm_May)

    ;------------ June ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_June", SFMain.int_Season_Pleasant_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_June", SFMain.int_Season_PleasantA_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_June", SFMain.int_Season_Overcast_June) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_June", SFMain.int_Season_Rain_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_June", SFMain.int_Season_Rain_Storm_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_June", SFMain.int_Season_Snow_June as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_June", SFMain.int_Season_Snow_Storm_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_June", SFMain.int_SN_Season_Pleasant_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_June", SFMain.int_SN_Season_PleasantA_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_June", SFMain.int_SN_Season_Overcast_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_June", SFMain.int_SN_Season_Rain_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_June", SFMain.int_SN_Season_Rain_Storm_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_June", SFMain.int_SN_Season_Snow_June)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_June", SFMain.int_SN_Season_Snow_Storm_June)

    ;------------ July ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_July", SFMain.int_Season_Pleasant_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_July", SFMain.int_Season_PleasantA_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_July", SFMain.int_Season_Overcast_July) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_July", SFMain.int_Season_Rain_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_July", SFMain.int_Season_Rain_Storm_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_July", SFMain.int_Season_Snow_July as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_July", SFMain.int_Season_Snow_Storm_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_July", SFMain.int_SN_Season_Pleasant_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_July", SFMain.int_SN_Season_PleasantA_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_July", SFMain.int_SN_Season_Overcast_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_July", SFMain.int_SN_Season_Rain_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_July", SFMain.int_SN_Season_Rain_Storm_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_July", SFMain.int_SN_Season_Snow_July)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_July", SFMain.int_SN_Season_Snow_Storm_July)

    ;------------ August ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_August", SFMain.int_Season_Pleasant_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_August", SFMain.int_Season_PleasantA_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_August", SFMain.int_Season_Overcast_August) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_August", SFMain.int_Season_Rain_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_August", SFMain.int_Season_Rain_Storm_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_August", SFMain.int_Season_Snow_August as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_August", SFMain.int_Season_Snow_Storm_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_August", SFMain.int_SN_Season_Pleasant_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_August", SFMain.int_SN_Season_PleasantA_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_August", SFMain.int_SN_Season_Overcast_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_August", SFMain.int_SN_Season_Rain_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_August", SFMain.int_SN_Season_Rain_Storm_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_August", SFMain.int_SN_Season_Snow_August)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_August", SFMain.int_SN_Season_Snow_Storm_August)

    ;------------ September ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_September", SFMain.int_Season_Pleasant_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_September", SFMain.int_Season_PleasantA_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_September", SFMain.int_Season_Overcast_September) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_September", SFMain.int_Season_Rain_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_September", SFMain.int_Season_Rain_Storm_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_September", SFMain.int_Season_Snow_September as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_September", SFMain.int_Season_Snow_Storm_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_September", SFMain.int_SN_Season_Pleasant_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_September", SFMain.int_SN_Season_PleasantA_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_September", SFMain.int_SN_Season_Overcast_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_September", SFMain.int_SN_Season_Rain_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_September", SFMain.int_SN_Season_Rain_Storm_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_September", SFMain.int_SN_Season_Snow_September)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_September", SFMain.int_SN_Season_Snow_Storm_September)

    ;------------ October ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_October", SFMain.int_Season_Pleasant_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_October", SFMain.int_Season_PleasantA_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_October", SFMain.int_Season_Overcast_October) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_October", SFMain.int_Season_Rain_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_October", SFMain.int_Season_Rain_Storm_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_October", SFMain.int_Season_Snow_October as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_October", SFMain.int_Season_Snow_Storm_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_October", SFMain.int_SN_Season_Pleasant_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_October", SFMain.int_SN_Season_PleasantA_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_October", SFMain.int_SN_Season_Overcast_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_October", SFMain.int_SN_Season_Rain_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_October", SFMain.int_SN_Season_Rain_Storm_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_October", SFMain.int_SN_Season_Snow_October)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_October", SFMain.int_SN_Season_Snow_Storm_October)

    ;------------ November ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_November", SFMain.int_Season_Pleasant_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_November", SFMain.int_Season_PleasantA_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_November", SFMain.int_Season_Overcast_November) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_November", SFMain.int_Season_Rain_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_November", SFMain.int_Season_Rain_Storm_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_November", SFMain.int_Season_Snow_November as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_November", SFMain.int_Season_Snow_Storm_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_November", SFMain.int_SN_Season_Pleasant_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_November", SFMain.int_SN_Season_PleasantA_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_November", SFMain.int_SN_Season_Overcast_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_November", SFMain.int_SN_Season_Rain_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_November", SFMain.int_SN_Season_Rain_Storm_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_November", SFMain.int_SN_Season_Snow_November)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_November", SFMain.int_SN_Season_Snow_Storm_November)

    ;------------ December ------------------
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Pleasant_December", SFMain.int_Season_Pleasant_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_PleasantA_December", SFMain.int_Season_PleasantA_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Overcast_December", SFMain.int_Season_Overcast_December) 
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_December", SFMain.int_Season_Rain_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Rain_Storm_December", SFMain.int_Season_Rain_Storm_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_December", SFMain.int_Season_Snow_December as int)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_Season_Snow_Storm_December", SFMain.int_Season_Snow_Storm_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Pleasant_December", SFMain.int_SN_Season_Pleasant_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_PleasantA_December", SFMain.int_SN_Season_PleasantA_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Overcast_December", SFMain.int_SN_Season_Overcast_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_December", SFMain.int_SN_Season_Rain_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Rain_Storm_December", SFMain.int_SN_Season_Rain_Storm_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_December", SFMain.int_SN_Season_Snow_December)
		SetINTValue("../Seasonal Weathers Framework/settings.json", "int_SN_Season_Snow_Storm_December", SFMain.int_SN_Season_Snow_Storm_December)

		Save("../Seasonal Weathers Framework/settings.json")
		Debug.MessageBox("Settings saved to external file.")
	EndIf
	
Else
	Debug.MessageBox("PapyrusUtil needs to be installed.")
EndIf
EndFunction