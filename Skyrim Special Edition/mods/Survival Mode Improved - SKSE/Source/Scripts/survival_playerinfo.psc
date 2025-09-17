scriptName Survival_PlayerInfo extends Quest

;-- Properties --------------------------------------
message property Survival_OblivionAreaMessage auto
formlist property Survival_OblivionCells auto
formlist property Survival_OblivionAreas auto
formlist property Survival_TravelObjects auto
formlist property Survival_FastTravelDragonbornBlackBooks auto
formlist property Survival_OblivionLocations auto

referencealias property PlayerAlias auto

survival_needcold property cold auto
survival_conditionsscript property conditions auto
survival_needexhaustion property exhaustion auto
survival_needhunger property hunger auto

actor property PlayerRef auto
globalvariable property Survival_WasLastNearbyTravelRef auto
globalvariable property Survival_PlayerLastKnownDaysJailed auto

Quest property DA16 auto

;-- Variables ---------------------------------------
Bool wasInPlaneOfOblivion = false
Bool wasInDreamstride = false
;-- Functions ---------------------------------------
