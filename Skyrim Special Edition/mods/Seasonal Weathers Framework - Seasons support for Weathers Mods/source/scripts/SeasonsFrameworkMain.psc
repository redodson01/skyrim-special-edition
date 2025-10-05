Scriptname SeasonsFrameworkMain extends ReferenceAlias  

Spell Property SeasonsFrameworkAbility Auto

GlobalVariable Property GameMonth Auto
GlobalVariable Property CurrentMonthCheck Auto


;---------------------------------------------------------Use these globals if you don't have season specific weathers
GlobalVariable Property Season_Common_Pleasant Auto
GlobalVariable Property Season_Common_PleasantA Auto
GlobalVariable Property Season_Common_Overcast Auto
GlobalVariable Property Season_Common_Rain Auto
GlobalVariable Property Season_Common_Rain_Storm Auto
GlobalVariable Property Season_Common_Snow Auto
GlobalVariable Property Season_Common_Snow_Storm Auto

GlobalVariable Property SN_Season_Common_Pleasant Auto
GlobalVariable Property SN_Season_Common_PleasantA Auto
GlobalVariable Property SN_Season_Common_Overcast Auto
GlobalVariable Property SN_Season_Common_Rain Auto
GlobalVariable Property SN_Season_Common_Rain_Storm Auto
GlobalVariable Property SN_Season_Common_Snow Auto
GlobalVariable Property SN_Season_Common_Snow_Storm Auto
;---------------------------------------------------------Use these globals if you want specific weathers to appear only during specific seasons
GlobalVariable Property Season_Spring_Pleasant Auto
GlobalVariable Property Season_Spring_PleasantA Auto
GlobalVariable Property Season_Spring_Overcast Auto
GlobalVariable Property Season_Spring_Rain Auto
GlobalVariable Property Season_Spring_Rain_Storm Auto
GlobalVariable Property Season_Spring_Snow Auto
GlobalVariable Property Season_Spring_Snow_Storm Auto

GlobalVariable Property SN_Season_Spring_Pleasant Auto
GlobalVariable Property SN_Season_Spring_PleasantA Auto
GlobalVariable Property SN_Season_Spring_Overcast Auto
GlobalVariable Property SN_Season_Spring_Rain Auto
GlobalVariable Property SN_Season_Spring_Rain_Storm Auto
GlobalVariable Property SN_Season_Spring_Snow Auto
GlobalVariable Property SN_Season_Spring_Snow_Storm Auto


GlobalVariable Property Season_Summer_Pleasant Auto
GlobalVariable Property Season_Summer_PleasantA Auto
GlobalVariable Property Season_Summer_Overcast Auto
GlobalVariable Property Season_Summer_Rain Auto
GlobalVariable Property Season_Summer_Rain_Storm Auto
GlobalVariable Property Season_Summer_Snow Auto
GlobalVariable Property Season_Summer_Snow_Storm Auto

GlobalVariable Property SN_Season_Summer_Pleasant Auto
GlobalVariable Property SN_Season_Summer_PleasantA Auto
GlobalVariable Property SN_Season_Summer_Overcast Auto
GlobalVariable Property SN_Season_Summer_Rain Auto
GlobalVariable Property SN_Season_Summer_Rain_Storm Auto
GlobalVariable Property SN_Season_Summer_Snow Auto
GlobalVariable Property SN_Season_Summer_Snow_Storm Auto


GlobalVariable Property Season_Autumn_Pleasant Auto
GlobalVariable Property Season_Autumn_PleasantA Auto
GlobalVariable Property Season_Autumn_Overcast Auto
GlobalVariable Property Season_Autumn_Rain Auto
GlobalVariable Property Season_Autumn_Rain_Storm Auto
GlobalVariable Property Season_Autumn_Snow Auto
GlobalVariable Property Season_Autumn_Snow_Storm Auto

GlobalVariable Property SN_Season_Autumn_Pleasant Auto
GlobalVariable Property SN_Season_Autumn_PleasantA Auto
GlobalVariable Property SN_Season_Autumn_Overcast Auto
GlobalVariable Property SN_Season_Autumn_Rain Auto
GlobalVariable Property SN_Season_Autumn_Rain_Storm Auto
GlobalVariable Property SN_Season_Autumn_Snow Auto
GlobalVariable Property SN_Season_Autumn_Snow_Storm Auto


GlobalVariable Property Season_Winter_Pleasant Auto
GlobalVariable Property Season_Winter_PleasantA Auto
GlobalVariable Property Season_Winter_Overcast Auto
GlobalVariable Property Season_Winter_Rain Auto
GlobalVariable Property Season_Winter_Rain_Storm Auto
GlobalVariable Property Season_Winter_Snow Auto
GlobalVariable Property Season_Winter_Snow_Storm Auto

GlobalVariable Property SN_Season_Winter_Pleasant Auto
GlobalVariable Property SN_Season_Winter_PleasantA Auto
GlobalVariable Property SN_Season_Winter_Overcast Auto
GlobalVariable Property SN_Season_Winter_Rain Auto
GlobalVariable Property SN_Season_Winter_Rain_Storm Auto
GlobalVariable Property SN_Season_Winter_Snow Auto
GlobalVariable Property SN_Season_Winter_Snow_Storm Auto


bool property bool_EnableSeasonalImagespaces auto

float property float_Season_Spring_Intensity auto
float property float_Season_Spring_Saturation auto
float property float_Season_Spring_Temperature auto

float property float_Season_Summer_Intensity auto
float property float_Season_Summer_Saturation auto
float property float_Season_Summer_Temperature auto

float property float_Season_Autumn_Intensity auto
float property float_Season_Autumn_Saturation auto
float property float_Season_Autumn_Temperature auto

float property float_Season_Winter_Intensity auto
float property float_Season_Winter_Saturation auto
float property float_Season_Winter_Temperature auto

ImagespaceModifier Property SeasonIMODSaturationMore Auto
ImagespaceModifier Property SeasonIMODSaturationLess Auto
ImagespaceModifier Property SeasonIMODTemperatureWarmer Auto
ImagespaceModifier Property SeasonIMODTemperatureColder Auto





;------------ JANUARY ------------------
int property int_Season_Pleasant_January auto
int property int_Season_PleasantA_January auto
int property int_Season_Overcast_January auto
int property int_Season_Rain_January auto
int property int_Season_Rain_Storm_January auto
int property int_Season_Snow_January auto
int property int_Season_Snow_Storm_January auto
int property int_SN_Season_Pleasant_January auto
int property int_SN_Season_PleasantA_January auto
int property int_SN_Season_Overcast_January auto
int property int_SN_Season_Rain_January auto
int property int_SN_Season_Rain_Storm_January auto
int property int_SN_Season_Snow_January auto
int property int_SN_Season_Snow_Storm_January auto

;------------ FEBRUARY ------------------
int property int_Season_Pleasant_February auto
int property int_Season_PleasantA_February auto
int property int_Season_Overcast_February auto
int property int_Season_Rain_February auto
int property int_Season_Rain_Storm_February auto
int property int_Season_Snow_February auto
int property int_Season_Snow_Storm_February auto
int property int_SN_Season_Pleasant_February auto
int property int_SN_Season_PleasantA_February auto
int property int_SN_Season_Overcast_February auto
int property int_SN_Season_Rain_February auto
int property int_SN_Season_Rain_Storm_February auto
int property int_SN_Season_Snow_February auto
int property int_SN_Season_Snow_Storm_February auto

;------------ MARCH ------------------
int property int_Season_Pleasant_March auto
int property int_Season_PleasantA_March auto
int property int_Season_Overcast_March auto
int property int_Season_Rain_March auto
int property int_Season_Rain_Storm_March auto
int property int_Season_Snow_March auto
int property int_Season_Snow_Storm_March auto
int property int_SN_Season_Pleasant_March auto
int property int_SN_Season_PleasantA_March auto
int property int_SN_Season_Overcast_March auto
int property int_SN_Season_Rain_March auto
int property int_SN_Season_Rain_Storm_March auto
int property int_SN_Season_Snow_March auto
int property int_SN_Season_Snow_Storm_March auto

;------------ APRIL ------------------
int property int_Season_Pleasant_April auto
int property int_Season_PleasantA_April auto
int property int_Season_Overcast_April auto
int property int_Season_Rain_April auto
int property int_Season_Rain_Storm_April auto
int property int_Season_Snow_April auto
int property int_Season_Snow_Storm_April auto
int property int_SN_Season_Pleasant_April auto
int property int_SN_Season_PleasantA_April auto
int property int_SN_Season_Overcast_April auto
int property int_SN_Season_Rain_April auto
int property int_SN_Season_Rain_Storm_April auto
int property int_SN_Season_Snow_April auto
int property int_SN_Season_Snow_Storm_April auto

;------------ MAY ------------------
int property int_Season_Pleasant_May auto
int property int_Season_PleasantA_May auto
int property int_Season_Overcast_May auto
int property int_Season_Rain_May auto
int property int_Season_Rain_Storm_May auto
int property int_Season_Snow_May auto
int property int_Season_Snow_Storm_May auto
int property int_SN_Season_Pleasant_May auto
int property int_SN_Season_PleasantA_May auto
int property int_SN_Season_Overcast_May auto
int property int_SN_Season_Rain_May auto
int property int_SN_Season_Rain_Storm_May auto
int property int_SN_Season_Snow_May auto
int property int_SN_Season_Snow_Storm_May auto

;------------ JUNE ------------------
int property int_Season_Pleasant_June auto
int property int_Season_PleasantA_June auto
int property int_Season_Overcast_June auto
int property int_Season_Rain_June auto
int property int_Season_Rain_Storm_June auto
int property int_Season_Snow_June auto
int property int_Season_Snow_Storm_June auto
int property int_SN_Season_Pleasant_June auto
int property int_SN_Season_PleasantA_June auto
int property int_SN_Season_Overcast_June auto
int property int_SN_Season_Rain_June auto
int property int_SN_Season_Rain_Storm_June auto
int property int_SN_Season_Snow_June auto
int property int_SN_Season_Snow_Storm_June auto

;------------ JULY ------------------
int property int_Season_Pleasant_July auto
int property int_Season_PleasantA_July auto
int property int_Season_Overcast_July auto
int property int_Season_Rain_July auto
int property int_Season_Rain_Storm_July auto
int property int_Season_Snow_July auto
int property int_Season_Snow_Storm_July auto
int property int_SN_Season_Pleasant_July auto
int property int_SN_Season_PleasantA_July auto
int property int_SN_Season_Overcast_July auto
int property int_SN_Season_Rain_July auto
int property int_SN_Season_Rain_Storm_July auto
int property int_SN_Season_Snow_July auto
int property int_SN_Season_Snow_Storm_July auto

;------------ AUGUST ------------------
int property int_Season_Pleasant_August auto
int property int_Season_PleasantA_August auto
int property int_Season_Overcast_August auto
int property int_Season_Rain_August auto
int property int_Season_Rain_Storm_August auto
int property int_Season_Snow_August auto
int property int_Season_Snow_Storm_August auto
int property int_SN_Season_Pleasant_August auto
int property int_SN_Season_PleasantA_August auto
int property int_SN_Season_Overcast_August auto
int property int_SN_Season_Rain_August auto
int property int_SN_Season_Rain_Storm_August auto
int property int_SN_Season_Snow_August auto
int property int_SN_Season_Snow_Storm_August auto

;------------ SEPTEMBER ------------------
int property int_Season_Pleasant_September auto
int property int_Season_PleasantA_September auto
int property int_Season_Overcast_September auto
int property int_Season_Rain_September auto
int property int_Season_Rain_Storm_September auto
int property int_Season_Snow_September auto
int property int_Season_Snow_Storm_September auto
int property int_SN_Season_Pleasant_September auto
int property int_SN_Season_PleasantA_September auto
int property int_SN_Season_Overcast_September auto
int property int_SN_Season_Rain_September auto
int property int_SN_Season_Rain_Storm_September auto
int property int_SN_Season_Snow_September auto
int property int_SN_Season_Snow_Storm_September auto

;------------ OCTOBER ------------------
int property int_Season_Pleasant_October auto
int property int_Season_PleasantA_October auto
int property int_Season_Overcast_October auto
int property int_Season_Rain_October auto
int property int_Season_Rain_Storm_October auto
int property int_Season_Snow_October auto
int property int_Season_Snow_Storm_October auto
int property int_SN_Season_Pleasant_October auto
int property int_SN_Season_PleasantA_October auto
int property int_SN_Season_Overcast_October auto
int property int_SN_Season_Rain_October auto
int property int_SN_Season_Rain_Storm_October auto
int property int_SN_Season_Snow_October auto
int property int_SN_Season_Snow_Storm_October auto

;------------ NOVEMBER ------------------
int property int_Season_Pleasant_November auto
int property int_Season_PleasantA_November auto
int property int_Season_Overcast_November auto
int property int_Season_Rain_November auto
int property int_Season_Rain_Storm_November auto
int property int_Season_Snow_November auto
int property int_Season_Snow_Storm_November auto
int property int_SN_Season_Pleasant_November auto
int property int_SN_Season_PleasantA_November auto
int property int_SN_Season_Overcast_November auto
int property int_SN_Season_Rain_November auto
int property int_SN_Season_Rain_Storm_November auto
int property int_SN_Season_Snow_November auto
int property int_SN_Season_Snow_Storm_November auto

;------------ DECEMBER ------------------
int property int_Season_Pleasant_December auto
int property int_Season_PleasantA_December auto
int property int_Season_Overcast_December auto
int property int_Season_Rain_December auto
int property int_Season_Rain_Storm_December auto
int property int_Season_Snow_December auto
int property int_Season_Snow_Storm_December auto
int property int_SN_Season_Pleasant_December auto
int property int_SN_Season_PleasantA_December auto
int property int_SN_Season_Overcast_December auto
int property int_SN_Season_Rain_December auto
int property int_SN_Season_Rain_Storm_December auto
int property int_SN_Season_Snow_December auto
int property int_SN_Season_Snow_Storm_December auto


int Month = 99
;GameMonths - Although the December is number 11, it's actually 12th in list because the counting in Global starts from 0, not 1.
;0 - Jan - Morning Star
;1 - Feb - Sun's Dawn
;2 - Mar - First Seed
;3 - Apr - Rain's Hand
;4 - May - Second Seed
;5 - Jun - Midyear
;6 - Jul - Sun's Height
;7 - Aug - Last Seed
;8 - Sep - Hearthfire
;9 - Oct - Frostfall
;10 - Nov - Sun's Dusk
;11 - Dec - Evening Star


Event OnInit()
	RegisterForSleep()
	DefaultValues()
	Season()
EndEvent
Event OnPlayerLoadGame()
	Season()
EndEvent
Event OnSleepStop(bool abInterrupted)
	Season()
EndEvent


Function Season(bool Override = False)
	if Month != GameMonth.GetValue() as int || Override == True
			Month = GameMonth.GetValue() as int
			CurrentMonthCheck.SetValue(Month)

			if Month == 0 ;January
        ApplyImageSpace(float_Season_Winter_Intensity, float_Season_Winter_Saturation, float_Season_Winter_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_January)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_January)
        Season_Common_Overcast.SetValue(int_Season_Overcast_January)
        Season_Common_Rain.SetValue(int_Season_Rain_January)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_January)
        Season_Common_Snow.SetValue(int_Season_Snow_January)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_January)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_January)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_January)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_January)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_January)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_January)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_January)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_January)

				Season_Winter_Pleasant.SetValue(int_Season_Pleasant_January)
				Season_Winter_PleasantA.SetValue(int_Season_PleasantA_January)
				Season_Winter_Overcast.SetValue(int_Season_Overcast_January)
				Season_Winter_Rain.SetValue(int_Season_Rain_January)
				Season_Winter_Rain_Storm.SetValue(int_Season_Rain_Storm_January)
				Season_Winter_Snow.SetValue(int_Season_Snow_January)
				Season_Winter_Snow_Storm.SetValue(int_Season_Snow_Storm_January)
				SN_Season_Winter_Pleasant.SetValue(int_SN_Season_Pleasant_January)
				SN_Season_Winter_PleasantA.SetValue(int_SN_Season_PleasantA_January)
				SN_Season_Winter_Overcast.SetValue(int_SN_Season_Overcast_January)
				SN_Season_Winter_Rain.SetValue(int_SN_Season_Rain_January)
				SN_Season_Winter_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_January)
				SN_Season_Winter_Snow.SetValue(int_SN_Season_Snow_January)
				SN_Season_Winter_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_January)

        Spring_Zero()
        Summer_Zero()
        Autumn_Zero()
				Return

			elseif Month == 1 ;February
        ApplyImageSpace(float_Season_Winter_Intensity * 0.5, float_Season_Winter_Saturation, float_Season_Winter_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_February)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_February)
        Season_Common_Overcast.SetValue(int_Season_Overcast_February)
        Season_Common_Rain.SetValue(int_Season_Rain_February)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_February)
        Season_Common_Snow.SetValue(int_Season_Snow_February)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_February)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_February)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_February)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_February)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_February)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_February)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_February)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_February)


				Season_Winter_Pleasant.SetValue(int_Season_Pleasant_February)
				Season_Winter_PleasantA.SetValue(int_Season_PleasantA_February)
				Season_Winter_Overcast.SetValue(int_Season_Overcast_February)
				Season_Winter_Rain.SetValue(int_Season_Rain_February)
				Season_Winter_Rain_Storm.SetValue(int_Season_Rain_Storm_February)
				Season_Winter_Snow.SetValue(int_Season_Snow_February)
				Season_Winter_Snow_Storm.SetValue(int_Season_Snow_Storm_February)
				SN_Season_Winter_Pleasant.SetValue(int_SN_Season_Pleasant_February)
				SN_Season_Winter_PleasantA.SetValue(int_SN_Season_PleasantA_February)
				SN_Season_Winter_Overcast.SetValue(int_SN_Season_Overcast_February)
				SN_Season_Winter_Rain.SetValue(int_SN_Season_Rain_February)
				SN_Season_Winter_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_February)
				SN_Season_Winter_Snow.SetValue(int_SN_Season_Snow_February)
				SN_Season_Winter_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_February)

			  Spring_Zero()
        Summer_Zero()
        Autumn_Zero()
				Return

			elseif Month == 2 ;March
        ApplyImageSpace(float_Season_Spring_Intensity * 0.5, float_Season_Spring_Saturation, float_Season_Spring_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_March)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_March)
        Season_Common_Overcast.SetValue(int_Season_Overcast_March)
        Season_Common_Rain.SetValue(int_Season_Rain_March)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_March)
        Season_Common_Snow.SetValue(int_Season_Snow_March)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_March)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_March)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_March)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_March)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_March)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_March)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_March)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_March)
			
			
				Season_Spring_Pleasant.SetValue(int_Season_Pleasant_March)
				Season_Spring_PleasantA.SetValue(int_Season_PleasantA_March)
				Season_Spring_Overcast.SetValue(int_Season_Overcast_March)
				Season_Spring_Rain.SetValue(int_Season_Rain_March)
				Season_Spring_Rain_Storm.SetValue(int_Season_Rain_Storm_March)
				Season_Spring_Snow.SetValue(int_Season_Snow_March)
				Season_Spring_Snow_Storm.SetValue(int_Season_Snow_Storm_March)
				SN_Season_Spring_Pleasant.SetValue(int_SN_Season_Pleasant_March)
				SN_Season_Spring_PleasantA.SetValue(int_SN_Season_PleasantA_March)
				SN_Season_Spring_Overcast.SetValue(int_SN_Season_Overcast_March)
				SN_Season_Spring_Rain.SetValue(int_SN_Season_Rain_March)
				SN_Season_Spring_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_March)
				SN_Season_Spring_Snow.SetValue(int_SN_Season_Snow_March)
				SN_Season_Spring_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_March)

        Summer_Zero()
        Autumn_Zero()
        Winter_Zero()
				Return

			elseif Month == 3 ;April
        ApplyImageSpace(float_Season_Spring_Intensity, float_Season_Spring_Saturation, float_Season_Spring_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_April)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_April)
        Season_Common_Overcast.SetValue(int_Season_Overcast_April)
        Season_Common_Rain.SetValue(int_Season_Rain_April)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_April)
        Season_Common_Snow.SetValue(int_Season_Snow_April)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_April)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_April)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_April)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_April)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_April)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_April)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_April)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_April)


				Season_Spring_Pleasant.SetValue(int_Season_Pleasant_April)
				Season_Spring_PleasantA.SetValue(int_Season_PleasantA_April)
				Season_Spring_Overcast.SetValue(int_Season_Overcast_April)
				Season_Spring_Rain.SetValue(int_Season_Rain_April)
				Season_Spring_Rain_Storm.SetValue(int_Season_Rain_Storm_April)
				Season_Spring_Snow.SetValue(int_Season_Snow_April)
				Season_Spring_Snow_Storm.SetValue(int_Season_Snow_Storm_April)
				SN_Season_Spring_Pleasant.SetValue(int_SN_Season_Pleasant_April)
				SN_Season_Spring_PleasantA.SetValue(int_SN_Season_PleasantA_April)
				SN_Season_Spring_Overcast.SetValue(int_SN_Season_Overcast_April)
				SN_Season_Spring_Rain.SetValue(int_SN_Season_Rain_April)
				SN_Season_Spring_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_April)
				SN_Season_Spring_Snow.SetValue(int_SN_Season_Snow_April)
				SN_Season_Spring_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_April)

        Summer_Zero()
        Autumn_Zero()
        Winter_Zero()
				Return

			elseif Month == 4 ;May
        ApplyImageSpace(float_Season_Spring_Intensity * 0.5, float_Season_Spring_Saturation, float_Season_Spring_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_May)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_May)
        Season_Common_Overcast.SetValue(int_Season_Overcast_May)
        Season_Common_Rain.SetValue(int_Season_Rain_May)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_May)
        Season_Common_Snow.SetValue(int_Season_Snow_May)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_May)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_May)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_May)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_May)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_May)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_May)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_May)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_May)
        
        
				Season_Spring_Pleasant.SetValue(int_Season_Pleasant_May)
				Season_Spring_PleasantA.SetValue(int_Season_PleasantA_May)
				Season_Spring_Overcast.SetValue(int_Season_Overcast_May)
				Season_Spring_Rain.SetValue(int_Season_Rain_May)
				Season_Spring_Rain_Storm.SetValue(int_Season_Rain_Storm_May)
				Season_Spring_Snow.SetValue(int_Season_Snow_May)
				Season_Spring_Snow_Storm.SetValue(int_Season_Snow_Storm_May)
				SN_Season_Spring_Pleasant.SetValue(int_SN_Season_Pleasant_May)
				SN_Season_Spring_PleasantA.SetValue(int_SN_Season_PleasantA_May)
				SN_Season_Spring_Overcast.SetValue(int_SN_Season_Overcast_May)
				SN_Season_Spring_Rain.SetValue(int_SN_Season_Rain_May)
				SN_Season_Spring_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_May)
				SN_Season_Spring_Snow.SetValue(int_SN_Season_Snow_May)
				SN_Season_Spring_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_May)

        Summer_Zero()
        Autumn_Zero()
        Winter_Zero()
				Return

			elseif Month == 5 ;June
        ApplyImageSpace(float_Season_Summer_Intensity * 0.5, float_Season_Summer_Saturation, float_Season_Summer_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_June)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_June)
        Season_Common_Overcast.SetValue(int_Season_Overcast_June)
        Season_Common_Rain.SetValue(int_Season_Rain_June)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_June)
        Season_Common_Snow.SetValue(int_Season_Snow_June)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_June)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_June)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_June)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_June)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_June)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_June)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_June)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_June)
			
			
				Season_Summer_Pleasant.SetValue(int_Season_Pleasant_June)
				Season_Summer_PleasantA.SetValue(int_Season_PleasantA_June)
				Season_Summer_Overcast.SetValue(int_Season_Overcast_June)
				Season_Summer_Rain.SetValue(int_Season_Rain_June)
				Season_Summer_Rain_Storm.SetValue(int_Season_Rain_Storm_June)
				Season_Summer_Snow.SetValue(int_Season_Snow_June)
				Season_Summer_Snow_Storm.SetValue(int_Season_Snow_Storm_June)
				SN_Season_Summer_Pleasant.SetValue(int_SN_Season_Pleasant_June)
				SN_Season_Summer_PleasantA.SetValue(int_SN_Season_PleasantA_June)
				SN_Season_Summer_Overcast.SetValue(int_SN_Season_Overcast_June)
				SN_Season_Summer_Rain.SetValue(int_SN_Season_Rain_June)
				SN_Season_Summer_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_June)
				SN_Season_Summer_Snow.SetValue(int_SN_Season_Snow_June)
				SN_Season_Summer_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_June)

        Spring_Zero()
        Autumn_Zero()
        Winter_Zero()
				Return

			elseif Month == 6 ;July
        ApplyImageSpace(float_Season_Summer_Intensity, float_Season_Summer_Saturation, float_Season_Summer_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_July)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_July)
        Season_Common_Overcast.SetValue(int_Season_Overcast_July)
        Season_Common_Rain.SetValue(int_Season_Rain_July)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_July)
        Season_Common_Snow.SetValue(int_Season_Snow_July)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_July)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_July)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_July)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_July)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_July)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_July)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_July)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_July)


				Season_Summer_Pleasant.SetValue(int_Season_Pleasant_July)
				Season_Summer_PleasantA.SetValue(int_Season_PleasantA_July)
				Season_Summer_Overcast.SetValue(int_Season_Overcast_July)
				Season_Summer_Rain.SetValue(int_Season_Rain_July)
				Season_Summer_Rain_Storm.SetValue(int_Season_Rain_Storm_July)
				Season_Summer_Snow.SetValue(int_Season_Snow_July)
				Season_Summer_Snow_Storm.SetValue(int_Season_Snow_Storm_July)
				SN_Season_Summer_Pleasant.SetValue(int_SN_Season_Pleasant_July)
				SN_Season_Summer_PleasantA.SetValue(int_SN_Season_PleasantA_July)
				SN_Season_Summer_Overcast.SetValue(int_SN_Season_Overcast_July)
				SN_Season_Summer_Rain.SetValue(int_SN_Season_Rain_July)
				SN_Season_Summer_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_July)
				SN_Season_Summer_Snow.SetValue(int_SN_Season_Snow_July)
				SN_Season_Summer_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_July)

        Spring_Zero()
        Autumn_Zero()
        Winter_Zero()
				Return

			elseif Month == 7 ;August
        ApplyImageSpace(float_Season_Summer_Intensity * 0.5, float_Season_Summer_Saturation, float_Season_Summer_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_August)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_August)
        Season_Common_Overcast.SetValue(int_Season_Overcast_August)
        Season_Common_Rain.SetValue(int_Season_Rain_August)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_August)
        Season_Common_Snow.SetValue(int_Season_Snow_August)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_August)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_August)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_August)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_August)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_August)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_August)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_August)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_August)


				Season_Summer_Pleasant.SetValue(int_Season_Pleasant_August)
				Season_Summer_PleasantA.SetValue(int_Season_PleasantA_August)
				Season_Summer_Overcast.SetValue(int_Season_Overcast_August)
				Season_Summer_Rain.SetValue(int_Season_Rain_August)
				Season_Summer_Rain_Storm.SetValue(int_Season_Rain_Storm_August)
				Season_Summer_Snow.SetValue(int_Season_Snow_August)
				Season_Summer_Snow_Storm.SetValue(int_Season_Snow_Storm_August)
				SN_Season_Summer_Pleasant.SetValue(int_SN_Season_Pleasant_August)
				SN_Season_Summer_PleasantA.SetValue(int_SN_Season_PleasantA_August)
				SN_Season_Summer_Overcast.SetValue(int_SN_Season_Overcast_August)
				SN_Season_Summer_Rain.SetValue(int_SN_Season_Rain_August)
				SN_Season_Summer_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_August)
				SN_Season_Summer_Snow.SetValue(int_SN_Season_Snow_August)
				SN_Season_Summer_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_August)

        Spring_Zero()
        Autumn_Zero()
        Winter_Zero()
				Return

			elseif Month == 8 ;September
        ApplyImageSpace(float_Season_Autumn_Intensity * 0.5, float_Season_Autumn_Saturation, float_Season_Autumn_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_September)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_September)
        Season_Common_Overcast.SetValue(int_Season_Overcast_September)
        Season_Common_Rain.SetValue(int_Season_Rain_September)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_September)
        Season_Common_Snow.SetValue(int_Season_Snow_September)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_September)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_September)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_September)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_September)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_September)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_September)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_September)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_September)


				Season_Autumn_Pleasant.SetValue(int_Season_Pleasant_September)
				Season_Autumn_PleasantA.SetValue(int_Season_PleasantA_September)
				Season_Autumn_Overcast.SetValue(int_Season_Overcast_September)
				Season_Autumn_Rain.SetValue(int_Season_Rain_September)
				Season_Autumn_Rain_Storm.SetValue(int_Season_Rain_Storm_September)
				Season_Autumn_Snow.SetValue(int_Season_Snow_September)
				Season_Autumn_Snow_Storm.SetValue(int_Season_Snow_Storm_September)
				SN_Season_Autumn_Pleasant.SetValue(int_SN_Season_Pleasant_September)
				SN_Season_Autumn_PleasantA.SetValue(int_SN_Season_PleasantA_September)
				SN_Season_Autumn_Overcast.SetValue(int_SN_Season_Overcast_September)
				SN_Season_Autumn_Rain.SetValue(int_SN_Season_Rain_September)
				SN_Season_Autumn_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_September)
				SN_Season_Autumn_Snow.SetValue(int_SN_Season_Snow_September)
				SN_Season_Autumn_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_September)

        Spring_Zero()
        Summer_Zero()
        Winter_Zero()
				Return

			elseif Month == 9 ;October
        ApplyImageSpace(float_Season_Autumn_Intensity, float_Season_Autumn_Saturation, float_Season_Autumn_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_October)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_October)
        Season_Common_Overcast.SetValue(int_Season_Overcast_October)
        Season_Common_Rain.SetValue(int_Season_Rain_October)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_October)
        Season_Common_Snow.SetValue(int_Season_Snow_October)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_October)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_October)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_October)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_October)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_October)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_October)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_October)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_October)
        
        
				Season_Autumn_Pleasant.SetValue(int_Season_Pleasant_October)
				Season_Autumn_PleasantA.SetValue(int_Season_PleasantA_October)
				Season_Autumn_Overcast.SetValue(int_Season_Overcast_October)
				Season_Autumn_Rain.SetValue(int_Season_Rain_October)
				Season_Autumn_Rain_Storm.SetValue(int_Season_Rain_Storm_October)
				Season_Autumn_Snow.SetValue(int_Season_Snow_October)
				Season_Autumn_Snow_Storm.SetValue(int_Season_Snow_Storm_October)
				SN_Season_Autumn_Pleasant.SetValue(int_SN_Season_Pleasant_October)
				SN_Season_Autumn_PleasantA.SetValue(int_SN_Season_PleasantA_October)
				SN_Season_Autumn_Overcast.SetValue(int_SN_Season_Overcast_October)
				SN_Season_Autumn_Rain.SetValue(int_SN_Season_Rain_October)
				SN_Season_Autumn_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_October)
				SN_Season_Autumn_Snow.SetValue(int_SN_Season_Snow_October)
				SN_Season_Autumn_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_October)

        Spring_Zero()
        Summer_Zero()
        Winter_Zero()
				Return

			elseif Month == 10 ;November
        ApplyImageSpace(float_Season_Autumn_Intensity * 0.5, float_Season_Autumn_Saturation, float_Season_Autumn_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_November)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_November)
        Season_Common_Overcast.SetValue(int_Season_Overcast_November)
        Season_Common_Rain.SetValue(int_Season_Rain_November)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_November)
        Season_Common_Snow.SetValue(int_Season_Snow_November)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_November)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_November)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_November)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_November)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_November)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_November)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_November)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_November)
			
			
				Season_Autumn_Pleasant.SetValue(int_Season_Pleasant_November)
				Season_Autumn_PleasantA.SetValue(int_Season_PleasantA_November)
				Season_Autumn_Overcast.SetValue(int_Season_Overcast_November)
				Season_Autumn_Rain.SetValue(int_Season_Rain_November)
				Season_Autumn_Rain_Storm.SetValue(int_Season_Rain_Storm_November)
				Season_Autumn_Snow.SetValue(int_Season_Snow_November)
				Season_Autumn_Snow_Storm.SetValue(int_Season_Snow_Storm_November)
				SN_Season_Autumn_Pleasant.SetValue(int_SN_Season_Pleasant_November)
				SN_Season_Autumn_PleasantA.SetValue(int_SN_Season_PleasantA_November)
				SN_Season_Autumn_Overcast.SetValue(int_SN_Season_Overcast_November)
				SN_Season_Autumn_Rain.SetValue(int_SN_Season_Rain_November)
				SN_Season_Autumn_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_November)
				SN_Season_Autumn_Snow.SetValue(int_SN_Season_Snow_November)
				SN_Season_Autumn_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_November)

        Spring_Zero()
        Summer_Zero()
        Winter_Zero()
				Return

			elseif Month == 11 ;December
        ApplyImageSpace(float_Season_Winter_Intensity * 0.5, float_Season_Winter_Saturation, float_Season_Winter_Temperature)

        Season_Common_Pleasant.SetValue(int_Season_Pleasant_December)
        Season_Common_PleasantA.SetValue(int_Season_PleasantA_December)
        Season_Common_Overcast.SetValue(int_Season_Overcast_December)
        Season_Common_Rain.SetValue(int_Season_Rain_December)
        Season_Common_Rain_Storm.SetValue(int_Season_Rain_Storm_December)
        Season_Common_Snow.SetValue(int_Season_Snow_December)
        Season_Common_Snow_Storm.SetValue(int_Season_Snow_Storm_December)
        SN_Season_Common_Pleasant.SetValue(int_SN_Season_Pleasant_December)
        SN_Season_Common_PleasantA.SetValue(int_SN_Season_PleasantA_December)
        SN_Season_Common_Overcast.SetValue(int_SN_Season_Overcast_December)
        SN_Season_Common_Rain.SetValue(int_SN_Season_Rain_December)
        SN_Season_Common_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_December)
        SN_Season_Common_Snow.SetValue(int_SN_Season_Snow_December)
        SN_Season_Common_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_December)


				Season_Winter_Pleasant.SetValue(int_Season_Pleasant_December)
				Season_Winter_PleasantA.SetValue(int_Season_PleasantA_December)
				Season_Winter_Overcast.SetValue(int_Season_Overcast_December)
				Season_Winter_Rain.SetValue(int_Season_Rain_December)
				Season_Winter_Rain_Storm.SetValue(int_Season_Rain_Storm_December)
				Season_Winter_Snow.SetValue(int_Season_Snow_December)
				Season_Winter_Snow_Storm.SetValue(int_Season_Snow_Storm_December)
				SN_Season_Winter_Pleasant.SetValue(int_SN_Season_Pleasant_December)
				SN_Season_Winter_PleasantA.SetValue(int_SN_Season_PleasantA_December)
				SN_Season_Winter_Overcast.SetValue(int_SN_Season_Overcast_December)
				SN_Season_Winter_Rain.SetValue(int_SN_Season_Rain_December)
				SN_Season_Winter_Rain_Storm.SetValue(int_SN_Season_Rain_Storm_December)
				SN_Season_Winter_Snow.SetValue(int_SN_Season_Snow_December)
				SN_Season_Winter_Snow_Storm.SetValue(int_SN_Season_Snow_Storm_December)

        Spring_Zero()
        Summer_Zero()
        Autumn_Zero()
				Return

			endif
	endif
EndFunction






Function Spring_Zero()
				Season_Spring_Pleasant.SetValue(0)
				Season_Spring_PleasantA.SetValue(0)
				Season_Spring_Overcast.SetValue(0)
				Season_Spring_Rain.SetValue(0)
				Season_Spring_Rain_Storm.SetValue(0)
				Season_Spring_Snow.SetValue(0)
				Season_Spring_Snow_Storm.SetValue(0)
				SN_Season_Spring_Pleasant.SetValue(0)
				SN_Season_Spring_PleasantA.SetValue(0)
				SN_Season_Spring_Overcast.SetValue(0)
				SN_Season_Spring_Rain.SetValue(0)
				SN_Season_Spring_Rain_Storm.SetValue(0)
				SN_Season_Spring_Snow.SetValue(0)
				SN_Season_Spring_Snow_Storm.SetValue(0)
EndFunction

Function Summer_Zero()
				Season_Summer_Pleasant.SetValue(0)
				Season_Summer_PleasantA.SetValue(0)
				Season_Summer_Overcast.SetValue(0)
				Season_Summer_Rain.SetValue(0)
				Season_Summer_Rain_Storm.SetValue(0)
				Season_Summer_Snow.SetValue(0)
				Season_Summer_Snow_Storm.SetValue(0)
				SN_Season_Summer_Pleasant.SetValue(0)
				SN_Season_Summer_PleasantA.SetValue(0)
				SN_Season_Summer_Overcast.SetValue(0)
				SN_Season_Summer_Rain.SetValue(0)
				SN_Season_Summer_Rain_Storm.SetValue(0)
				SN_Season_Summer_Snow.SetValue(0)
				SN_Season_Summer_Snow_Storm.SetValue(0)
EndFunction

Function Autumn_Zero()
				Season_Autumn_Pleasant.SetValue(0)
				Season_Autumn_PleasantA.SetValue(0)
				Season_Autumn_Overcast.SetValue(0)
				Season_Autumn_Rain.SetValue(0)
				Season_Autumn_Rain_Storm.SetValue(0)
				Season_Autumn_Snow.SetValue(0)
				Season_Autumn_Snow_Storm.SetValue(0)
				SN_Season_Autumn_Pleasant.SetValue(0)
				SN_Season_Autumn_PleasantA.SetValue(0)
				SN_Season_Autumn_Overcast.SetValue(0)
				SN_Season_Autumn_Rain.SetValue(0)
				SN_Season_Autumn_Rain_Storm.SetValue(0)
				SN_Season_Autumn_Snow.SetValue(0)
				SN_Season_Autumn_Snow_Storm.SetValue(0)
EndFunction

Function Winter_Zero()
				Season_Winter_Pleasant.SetValue(0)
				Season_Winter_PleasantA.SetValue(0)
				Season_Winter_Overcast.SetValue(0)
				Season_Winter_Rain.SetValue(0)
				Season_Winter_Rain_Storm.SetValue(0)
				Season_Winter_Snow.SetValue(0)
				Season_Winter_Snow_Storm.SetValue(0)
				SN_Season_Winter_Pleasant.SetValue(0)
				SN_Season_Winter_PleasantA.SetValue(0)
				SN_Season_Winter_Overcast.SetValue(0)
				SN_Season_Winter_Rain.SetValue(0)
				SN_Season_Winter_Rain_Storm.SetValue(0)
				SN_Season_Winter_Snow.SetValue(0)
				SN_Season_Winter_Snow_Storm.SetValue(0)
EndFunction










Function DefaultValues()
  bool_EnableSeasonalImagespaces = 0

  float_Season_Spring_Intensity = 0.5
  float_Season_Spring_Saturation = 0.0
  float_Season_Spring_Temperature = 0.0
  float_Season_Summer_Intensity = 0.5
  float_Season_Summer_Saturation = 0.5
  float_Season_Summer_Temperature = 0.1
  float_Season_Autumn_Intensity = 0.5
  float_Season_Autumn_Saturation = -0.4
  float_Season_Autumn_Temperature = 0.0
  float_Season_Winter_Intensity = 0.5
  float_Season_Winter_Saturation = 0.3
  float_Season_Winter_Temperature = -0.5

  ;------------ JANUARY ------------------
  int_Season_Pleasant_January = 35
  int_Season_PleasantA_January = 22
  int_Season_Overcast_January = 65
  int_Season_Rain_January = 5
  int_Season_Rain_Storm_January = 0
  int_Season_Snow_January = 80
  int_Season_Snow_Storm_January = 50
  
  int_SN_Season_Pleasant_January = 35
  int_SN_Season_PleasantA_January = 22
  int_SN_Season_Overcast_January = 65
  int_SN_Season_Rain_January = 0
  int_SN_Season_Rain_Storm_January = 0
  int_SN_Season_Snow_January = 80
  int_SN_Season_Snow_Storm_January = 50
  
  
  ;------------ February ------------------
  int_Season_Pleasant_February = 45
  int_Season_PleasantA_February = 22
  int_Season_Overcast_February = 65
  int_Season_Rain_February = 0
  int_Season_Rain_Storm_February = 0
  int_Season_Snow_February = 80
  int_Season_Snow_Storm_February = 50
  
  int_SN_Season_Pleasant_February = 45
  int_SN_Season_PleasantA_February = 22
  int_SN_Season_Overcast_February = 65
  int_SN_Season_Rain_February = 0
  int_SN_Season_Rain_Storm_February = 0
  int_SN_Season_Snow_February = 80
  int_SN_Season_Snow_Storm_February = 50
  
  ;------------ March ------------------
  int_Season_Pleasant_March = 50
  int_Season_PleasantA_March = 25
  int_Season_Overcast_March = 40
  int_Season_Rain_March = 10
  int_Season_Rain_Storm_March = 0
  int_Season_Snow_March = 50
  int_Season_Snow_Storm_March = 10
  
  int_SN_Season_Pleasant_March = 50
  int_SN_Season_PleasantA_March = 22
  int_SN_Season_Overcast_March = 40
  int_SN_Season_Rain_March = 0
  int_SN_Season_Rain_Storm_March = 0
  int_SN_Season_Snow_March = 50
  int_SN_Season_Snow_Storm_March = 45

  ;------------ April ------------------
  int_Season_Pleasant_April = 55
  int_Season_PleasantA_April = 27
  int_Season_Overcast_April = 35
  int_Season_Rain_April = 40
  int_Season_Rain_Storm_April = 0
  int_Season_Snow_April = 25
  int_Season_Snow_Storm_April = 0
  
  int_SN_Season_Pleasant_April = 50
  int_SN_Season_PleasantA_April = 25
  int_SN_Season_Overcast_April = 35
  int_SN_Season_Rain_April = 5
  int_SN_Season_Rain_Storm_April = 0
  int_SN_Season_Snow_April = 40
  int_SN_Season_Snow_Storm_April = 35

  ;------------ May ------------------
  int_Season_Pleasant_May = 65
  int_Season_PleasantA_May = 32
  int_Season_Overcast_May = 25
  int_Season_Rain_May = 15
  int_Season_Rain_Storm_May = 5
  int_Season_Snow_May = 10
  int_Season_Snow_Storm_May = 0
  
  int_SN_Season_Pleasant_May = 65
  int_SN_Season_PleasantA_May = 32
  int_SN_Season_Overcast_May = 30
  int_SN_Season_Rain_May = 0
  int_SN_Season_Rain_Storm_May = 0
  int_SN_Season_Snow_May = 30
  int_SN_Season_Snow_Storm_May = 25

  ;------------ June ------------------
  int_Season_Pleasant_June = 70
  int_Season_PleasantA_June = 37
  int_Season_Overcast_June = 15
  int_Season_Rain_June = 20
  int_Season_Rain_Storm_June = 20
  int_Season_Snow_June = 0
  int_Season_Snow_Storm_June = 0
  
  int_SN_Season_Pleasant_June = 70
  int_SN_Season_PleasantA_June = 32
  int_SN_Season_Overcast_June = 30
  int_SN_Season_Rain_June = 5
  int_SN_Season_Rain_Storm_June = 0
  int_SN_Season_Snow_June = 25
  int_SN_Season_Snow_Storm_June = 20

  ;------------ July ------------------
  int_Season_Pleasant_July = 75
  int_Season_PleasantA_July = 37
  int_Season_Overcast_July = 25
  int_Season_Rain_July = 25
  int_Season_Rain_Storm_July = 20
  int_Season_Snow_July = 0
  int_Season_Snow_Storm_July = 0
  
  int_SN_Season_Pleasant_July = 65
  int_SN_Season_PleasantA_July = 32
  int_SN_Season_Overcast_July = 30
  int_SN_Season_Rain_July = 5
  int_SN_Season_Rain_Storm_July = 0
  int_SN_Season_Snow_July = 20
  int_SN_Season_Snow_Storm_July = 20

  ;------------ August ------------------
  int_Season_Pleasant_August = 70
  int_Season_PleasantA_August = 32
  int_Season_Overcast_August = 25
  int_Season_Rain_August = 15
  int_Season_Rain_Storm_August = 15
  int_Season_Snow_August = 0
  int_Season_Snow_Storm_August = 0
  
  int_SN_Season_Pleasant_August = 65
  int_SN_Season_PleasantA_August = 30
  int_SN_Season_Overcast_August = 10
  int_SN_Season_Rain_August = 0
  int_SN_Season_Rain_Storm_August = 0
  int_SN_Season_Snow_August = 25
  int_SN_Season_Snow_Storm_August = 25

  ;------------ September ------------------
  int_Season_Pleasant_September = 60
  int_Season_PleasantA_September = 30
  int_Season_Overcast_September = 65
  int_Season_Rain_September = 20
  int_Season_Rain_Storm_September = 5
  int_Season_Snow_September = 0
  int_Season_Snow_Storm_September = 0
  
  int_SN_Season_Pleasant_September = 60
  int_SN_Season_PleasantA_September = 30
  int_SN_Season_Overcast_September = 65
  int_SN_Season_Rain_September = 5
  int_SN_Season_Rain_Storm_September = 0
  int_SN_Season_Snow_September = 30
  int_SN_Season_Snow_Storm_September = 25

  ;------------ October ------------------
  int_Season_Pleasant_October = 45
  int_Season_PleasantA_October = 22
  int_Season_Overcast_October = 75
  int_Season_Rain_October = 15
  int_Season_Rain_Storm_October = 0
  int_Season_Snow_October = 15
  int_Season_Snow_Storm_October = 5
  
  int_SN_Season_Pleasant_October = 45
  int_SN_Season_PleasantA_October = 22
  int_SN_Season_Overcast_October = 75
  int_SN_Season_Rain_October = 5
  int_SN_Season_Rain_Storm_October = 0
  int_SN_Season_Snow_October = 35
  int_SN_Season_Snow_Storm_October = 30

  ;------------ November ------------------
  int_Season_Pleasant_November = 35
  int_Season_PleasantA_November = 22
  int_Season_Overcast_November = 75
  int_Season_Rain_November = 15
  int_Season_Rain_Storm_November = 0
  int_Season_Snow_November = 60
  int_Season_Snow_Storm_November = 5
  
  int_SN_Season_Pleasant_November = 35
  int_SN_Season_PleasantA_November = 22
  int_SN_Season_Overcast_November = 75
  int_SN_Season_Rain_November = 5
  int_SN_Season_Rain_Storm_November = 0
  int_SN_Season_Snow_November = 60
  int_SN_Season_Snow_Storm_November = 40

  ;------------ December ------------------
  int_Season_Pleasant_December = 35
  int_Season_PleasantA_December = 22
  int_Season_Overcast_December = 65
  int_Season_Rain_December = 5
  int_Season_Rain_Storm_December = 0
  int_Season_Snow_December = 80
  int_Season_Snow_Storm_December = 50
  
  int_SN_Season_Pleasant_December = 35
  int_SN_Season_PleasantA_December = 20
  int_SN_Season_Overcast_December = 65
  int_SN_Season_Rain_December = 0
  int_SN_Season_Rain_Storm_December = 0
  int_SN_Season_Snow_December = 80
  int_SN_Season_Snow_Storm_December = 50

EndFunction









Function ApplyImagespace(float Intensity = 0.0, float Saturation = 0.0, float Temperature = 0.0)
  SeasonIMODSaturationMore.Remove()
  SeasonIMODSaturationLess.Remove()
  SeasonIMODTemperatureWarmer.Remove()
  SeasonIMODTemperatureColder.Remove()
  
  If bool_EnableSeasonalImagespaces == 1
    If Saturation > 0.0
      SeasonIMODSaturationMore.Apply(Intensity * Saturation)
    ElseIf Saturation < 0.0
      SeasonIMODSaturationLess.Apply(Intensity * -Saturation)
    EndIf

    If Temperature > 0.0
      SeasonIMODTemperatureWarmer.Apply(Intensity * Temperature)
    ElseIf Temperature < 0.0
      SeasonIMODTemperatureColder.Apply(Intensity * -Temperature)
    EndIf
  EndIf
EndFunction





