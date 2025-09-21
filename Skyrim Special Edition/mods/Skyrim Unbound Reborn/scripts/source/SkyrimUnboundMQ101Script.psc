Scriptname SkyrimUnboundMQ101Script extends Quest  

ObjectReference Property dunCGAmbientCreaturesMarker01REF  Auto
ObjectReference Property dunCGCiviliansOutsideREF  Auto
ReferenceAlias Property Alias_Alduin  Auto
ReferenceAlias Property Alias_CartHorse1  Auto
ReferenceAlias Property Alias_CivilianGunnar  Auto
ReferenceAlias Property Alias_CivilianTorolf  Auto
ReferenceAlias Property Alias_CivilianTorri  Auto
ReferenceAlias Property Alias_GeneralTullius  Auto
ReferenceAlias Property Alias_Hadvar  Auto
ReferenceAlias Property Alias_Headsman  Auto
ReferenceAlias Property Alias_HelgenArcher01  Auto
ReferenceAlias Property Alias_HelgenArcher02  Auto
ReferenceAlias Property Alias_ImperialSoldier01 Auto
ReferenceAlias Property Alias_ImperialSoldier02 Auto
ReferenceAlias Property Alias_ImperialSoldierFort01  Auto
ReferenceAlias Property Alias_Justiciar01  Auto
ReferenceAlias Property Alias_Justiciar02  Auto
ReferenceAlias Property Alias_Priest  Auto
ReferenceAlias Property Alias_Prisoner01  Auto
ReferenceAlias Property Alias_Ralof  Auto
ReferenceAlias Property Alias_StormcloakPrisoner01  Auto
ReferenceAlias Property Alias_StormcloakPrisoner02  Auto
ReferenceAlias Property Alias_StormcloakPrisoner03  Auto
ReferenceAlias Property Alias_StormcloakPrisoner04  Auto
ReferenceAlias Property Alias_Ulfric  Auto

ReferenceAlias Property Alias_Torturer  Auto
ReferenceAlias Property Alias_TortureRoomImperialSoldier1  Auto
ReferenceAlias Property Alias_TortureRoomImperialSoldier2  Auto
ReferenceAlias Property Alias_TortureRoomImperialSoldier3  Auto
ReferenceAlias Property Alias_TortureRoomStormcloak1  Auto
ReferenceAlias Property Alias_TortureRoomStormcloak2  Auto
ReferenceAlias Property Alias_TortureRoomStormcloak3  Auto

ObjectReference Property MQ101ElenwenHorse  Auto
ReferenceAlias Property Alias_CivilianIngrid  Auto
ReferenceAlias Property Alias_CivilianMatlara  Auto
ReferenceAlias Property Alias_CivilianVilod  Auto
ReferenceAlias Property Alias_ImperialArcherA01  Auto
ReferenceAlias Property Alias_ImperialArcherA02  Auto
ReferenceAlias Property Alias_ImperialArcherA03  Auto
ReferenceAlias Property Alias_ImperialSoldierHelgen01  Auto
ReferenceAlias Property Alias_ImperialSoldierHelgen02  Auto
ReferenceAlias Property Alias_StormcloakTowerA  Auto

ObjectReference Property dunCGOutsideClutterMarker  Auto
ObjectReference Property dunCGPostAClutterMarker  Auto
ObjectReference Property dunCGPostAMarker  Auto
ObjectReference Property dunCGPostBClutterMarker  Auto
ObjectReference Property dunCGPostBMarker  Auto
ObjectReference Property dunCGPostCMarker  Auto
ObjectReference Property dunCGPostDMarker  Auto
ObjectReference Property dunCGPostEClutterMarker  Auto
ObjectReference Property dunCGPostEMarker  Auto
ObjectReference Property dunCGPostMajorClutterMarker  Auto
ObjectReference Property dunCGPostMajorFXMarker  Auto
ObjectReference Property dunCGPostTriggerCleanupMarker  Auto
ObjectReference Property dunCGSmokeAMarker  Auto
ObjectReference Property dunCGSmokeBMarker  Auto
ObjectReference Property dunCGSmokeCMarker  Auto
ObjectReference Property dunCGSmokeDMarker  Auto
ObjectReference Property dunCGSmokeEMarker  Auto
ObjectReference Property dunCGTowerHole01REF  Auto
ObjectReference Property MQ101AlduinAttackEnableMarker1  Auto
ObjectReference Property MQ101EndGateTEMP  Auto

Outfit Property UlfricOutfit  Auto
Outfit Property RalofOutfit  Auto
Armor Property PrisonerCuffs  Auto
Armor Property ArmorGag  Auto

ObjectReference Property HadvarStart  Auto
ObjectReference Property RalofStart  Auto

function FixHelgen()
	
	Alias_Alduin.GetActorRef().Disable()
	Alias_CartHorse1.GetRef().DisableNoWait()
	Alias_CivilianGunnar.trytoDisable()
	Alias_CivilianTorolf.tryToDisable()
	Alias_CivilianTorri.tryToDisable()
	Alias_Headsman.GetActorRef().DisableNoWait()
	Alias_HelgenArcher01.GetActorRef().DisableNoWait()
	Alias_HelgenArcher02.GetActorRef().DisableNoWait()
	Alias_ImperialSoldier01.TryToDisable()
	Alias_ImperialSoldier02.TryToDisable()
	Alias_ImperialSoldierFort01.GetActorRef().DisableNoWait()
	Alias_ImperialSoldierFort01.TryToDisable()
	Alias_Justiciar01.trytoDisable()
	Alias_Justiciar02.trytoDisable()
	Alias_Priest.GetActorRef().DisableNoWait()
	Alias_Prisoner01.TryToDisable()
	Alias_StormcloakPrisoner01.TryToDisable()
	Alias_StormcloakPrisoner02.TryToDisable()
	Alias_StormcloakPrisoner03.TryToDisable()
	Alias_StormcloakPrisoner04.TryToDisable()
	dunCGAmbientCreaturesMarker01REF.disable()
	dunCGCiviliansOutsideREF.disable()
	
	Alias_Torturer.TrytoDisable()
	Alias_TortureRoomImperialSoldier1.TrytoDisable()
	Alias_TortureRoomImperialSoldier2.TrytoDisable()
	Alias_TortureRoomImperialSoldier3.TrytoDisable()
	Alias_TortureRoomStormcloak1.TrytoDisable()
	Alias_TortureRoomStormcloak2.TrytoDisable()
	Alias_TortureRoomStormcloak3.TrytoDisable()
	
	Alias_CivilianGunnar.tryToDisable()
	Alias_CivilianGunnar.tryToDisableNoWait()
	Alias_CivilianIngrid.tryToDisableNoWait()
	Alias_CivilianMatlara.tryToDisableNoWait()
	Alias_CivilianTorolf.tryToDisable()
	Alias_CivilianTorolf.tryToDisableNoWait()
	Alias_CivilianTorri.tryToDisable()
	Alias_CivilianTorri.tryToDisableNoWait()
	Alias_CivilianVilod.tryToDisableNoWait()
	Alias_ImperialArcherA01.tryToDisable()
	Alias_ImperialArcherA02.tryToDisable()
	Alias_ImperialArcherA03.tryToDisable()
	Alias_ImperialSoldier01.tryToDisableNoWait()
	Alias_ImperialSoldier02.tryToDisableNoWait()
	Alias_ImperialSoldierHelgen01.tryToDisableNoWait()
	Alias_ImperialSoldierHelgen02.tryToDisableNoWait()
	Alias_StormcloakPrisoner01.tryToDisable()
	Alias_StormcloakPrisoner01.tryToDisableNoWait()
	Alias_StormcloakPrisoner02.tryToDisable()
	Alias_StormcloakPrisoner03.tryToDisable()
	Alias_StormcloakPrisoner04.tryToDisable()
	Alias_StormcloakTowerA.tryToDisable()
	MQ101ElenwenHorse.disableNoWait()
	
	dunCGSmokeAMarker.disableNoWait()
	dunCGSmokeBMarker.disableNoWait()
	dunCGSmokeCMarker.disableNoWait()
	dunCGSmokeDMarker.disableNoWait()
	dunCGSmokeEMarker.disableNoWait()
	dunCGTowerHole01REF.disableNoWait()
	MQ101AlduinAttackEnableMarker1.enableNoWait()

	dunCGOutsideClutterMarker.enableNoWait()
	dunCGPostAClutterMarker.enableNoWait()
	dunCGPostAMarker.enableNoWait()
	dunCGPostBClutterMarker.enableNoWait()
	dunCGPostBMarker.enableNoWait()
	dunCGPostCMarker.enableNoWait()
	dunCGPostDMarker.enableNoWait()
	dunCGPostEClutterMarker.enableNoWait()
	dunCGPostEMarker.enableNoWait()
	dunCGPostMajorClutterMarker.enableNoWait()
	dunCGPostMajorFXMarker.enableNoWait()
	dunCGPostTriggerCleanupMarker.disableNoWait()
	
	MQ101EndGateTEMP.disable()
	
;	Alias_Ulfric.tryToDisable()
;	Alias_GeneralTullius.TryToDisable()
;	Alias_GeneralTullius.tryToDisableNoWait()

	Alias_Ulfric.GetActorRef().RemoveItem(PrisonerCuffs, 1)
	Alias_Ulfric.GetActorRef().RemoveItem(ArmorGag, 1)
	
	Alias_Ulfric.GetActorRef().MoveToMyEditorLocation()
	Alias_Ulfric.TryToEnable()
	Alias_GeneralTullius.GetActorRef().MoveToMyEditorLocation()
	Alias_GeneralTullius.TryToEnable()
	
	Alias_Ulfric.GetActorRef().SetOutFit(UlfricOutfit)
	
	Alias_Ralof.GetActorRef().SetOutfit(RalofOutfit)
	
	Alias_Hadvar.GetReference().moveto(HadvarStart)
	Alias_Ralof.GetReference().moveto(RalofStart)

	Alias_Hadvar.TryToDisable()
	Alias_Ralof.TryToDisable()

	SetStage(25)
	SetStage(26)
	SetStage(250)
	SetStage(1000)

endFunction 
