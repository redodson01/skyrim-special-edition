Scriptname DAK_AddonsCollectionQuestScript Extends ReferenceAlias

Actor Property PlayerRef Auto

Perk Property DAK_MerchantTradePerk Auto
Perk Property DAK_TrainerPerk Auto
Perk Property DAK_FollowerPerk Auto
Perk Property DAK_PlanterPerk Auto
;Perk Property DAK_HorseBuyPerk Auto
Perk Property DAK_HorseInventoryPerk Auto
Perk Property DAK_BooksPerk Auto
Perk Property DAK_ArmorPerk Auto
Perk Property DAK_WeaponPerk Auto
Perk Property DAK_FoodPerk Auto
Perk Property DAK_IngredientPerk Auto
Perk Property DAK_ScrollPerk Auto

; When you look at soil with anything planted.
GlobalVariable Property DAK_SomethingPlanted Auto
; When you are looking at soil with grown plant.
GlobalVariable Property DAK_ReadyToHarvest Auto
; When you do not have any seeds in inventory for auto plant feature.
GlobalVariable Property DAK_NoSeeds Auto
; If set to 1, will let see messages about quick planting when cursor is on soil.
GlobalVariable Property DAK_PlanterShowMessages Auto
; Range for auto harvest feature. Counted from player.
GlobalVariable Property DAK_HarvestRange Auto

; Planter Activator for comparision.
Activator Property BYOHPlanterSoil Auto
; Last planted seed.
Form Property LastSeed Auto
; Ref to last seed used for Seed Alias Text Replacement purpose in messages.
ObjectReference Property LastSeedRef Auto
; Marker used to spawn seed for Seed Alias Text Replacement purpose in messages.
ObjectReference Property TGFKhajiitEnabler Auto
; Message about last seed if you do NOT have any in inventory.
Message Property DAK_NoMoreSeeds Auto
; Message about last seed if you have any in inventory.
Message Property DAK_LastSeedInfo Auto

; Last reference to object under cursor. Used to find last seed in gift menu.
ObjectReference LastRef = None
; Seed given as gift to soil for planting.
Form SeedOpenGiftMenu = None

String Property PluginName = "Dynamic Activation Key - MCM" AutoReadOnly Hidden

Event OnInIt()
    SetAllPerksState()
    RegisterForMenu("GiftMenu")
    RegisterforCrosshairRef()
EndEvent
    
Event OnPlayerLoadGame()
    SetAllPerksState()
    RegisterForMenu("GiftMenu")
    RegisterforCrosshairRef()
EndEvent

Function SetPerkState(Perk p, String settings)
    If MCM.GetModSettingBool(PluginName, settings) && !PlayerRef.HasPerk(p)
    	PlayerRef.AddPerk(p)
    ElseIf !MCM.GetModSettingBool(PluginName, settings) && PlayerRef.HasPerk(p)
    	PlayerRef.RemovePerk(p)
    EndIf
    ; Debug.Trace(settings + " " + MCM.GetModSettingBool(PluginName, settings) + " " + p.GetName())
EndFunction

Function SetAllPerksState()   
    SetPerkState(DAK_MerchantTradePerk, "bTrade:Addons")
    SetPerkState(DAK_TrainerPerk, "bTrain:Addons")
    SetPerkState(DAK_FollowerPerk, "bFollower:Addons")
    SetPerkState(DAK_PlanterPerk, "bPlants:Addons")
    ;SetPerkState(DAK_HorseBuyPerk, "bBuyHorse:Addons")
    SetPerkState(DAK_HorseInventoryPerk, "bHorseInventory:Addons")
    SetPerkState(DAK_BooksPerk, "bBooks:Addons")
    SetPerkState(DAK_ArmorPerk, "bArmor:Addons")
    SetPerkState(DAK_WeaponPerk, "bWeapon:Addons")
    SetPerkState(DAK_FoodPerk, "bFood:Addons")
    SetPerkState(DAK_IngredientPerk, "bIngredient:Addons")
    SetPerkState(DAK_ScrollPerk, "bScroll:Addons")
EndFunction

Event OnMenuOpen(String MenuName)
    ; Debug.Notification("Menu " + MenuName + " open!")
    If LastRef
        SeedOpenGiftMenu = ((LastRef as BYOHPlanterSoilScript).PlanterContainer as BYOHPlanterContainerScript).plantedItem
        ; If SeedOpenGiftMenu
        ;     Debug.Notification("Seed is " + SeedOpenGiftMenu.GetName())
        ; Else
        ;     Debug.Notification("Seed is NONE.")
        ; EndIf
    EndIf
EndEvent


Event OnMenuClose(String MenuName)
    ; Debug.Notification("Menu " + MenuName + " closed!")
    If LastRef
        Form plantedItem = ((LastRef as BYOHPlanterSoilScript).PlanterContainer as BYOHPlanterContainerScript).plantedItem
        If plantedItem && SeedOpenGiftMenu != plantedItem
            LastSeed = plantedItem
            If LastSeedRef
                LastSeedRef.Delete()
            EndIf
            LastSeedRef = TGFKhajiitEnabler.PlaceAtMe(LastSeed)
            DAK_SomethingPlanted.SetValue(1.0)
            ; Debug.Notification("Changed seed to " + plantedItem.GetName())
            return
        EndIf
        ; If plantedItem
        ;     Debug.Notification("PlantedItem is " + plantedItem.GetName())
        ; Else
        ;     Debug.Notification("PlantedItem is NONE.")
        ; EndIf
        return
    EndIf
EndEvent

Event OnCrosshairRefChange(ObjectReference ref)
	If ref ;Used to determine if it's none or not.
        If ref.GetBaseObject() == BYOHPlanterSoil
            If LastSeed
                (self.GetOwningQuest().GetAliasByName("Seed") as ReferenceAlias).ForceRefTo(LastSeedRef)
                ; Debug.Notification("Last seed is " + LastSeed.GetName() + ".")
                If DAK_PlanterShowMessages.GetValue() > 0
                    If Game.GEtPlayer().GetItemCount(LastSeed) == 0
                        DAK_NoMoreSeeds.Show()
                    Else
                        DAK_LastSeedInfo.Show()
                    EndIf
                EndIf
                DAK_NoSeeds.SetValue((Game.GetPlayer().GetItemCount(LastSeed) == 0) as Int)
            EndIf
            ; Debug.Notification("It is BYOHPlanterSoil")
            LastRef = ref
            BYOHPlanterContainerScript cont = (LastRef as BYOHPlanterSoilScript).PlanterContainer as BYOHPlanterContainerScript
            If cont && cont.plantedFloraRef
                ; Debug.Notification("Flora is " + cont.plantedFloraRef.GetBaseObject().GetName())
                DAK_ReadyToHarvest.SetValue(1.0)
                return
            EndIf
            DAK_ReadyToHarvest.SetValue(0.0)
            return
        EndIf
	EndIf
    LastRef = None
    DAK_ReadyToHarvest.SetValue(0.0)
EndEvent

ObjectReference[] Function GetAllPlantsFromPlanters(Actor akActor)
    Cell kCell = akActor.GetParentCell()
    Int iIndex = kCell.GetNumRefs(24)
    Int i = 0
    ObjectReference[] objectReferencesList = new ObjectReference[100]
    while iIndex && i < 100
        iIndex -= 1
        BYOHPlanterSoilScript soil = kCell.GetNthRef(iIndex, 24) as BYOHPlanterSoilScript
        If soil
            BYOHPlanterContainerScript cont = soil.PlanterContainer as BYOHPlanterContainerScript
            If cont && cont.plantedFloraRef && akActor.GetDistance(cont.plantedFloraRef) <= DAK_HarvestRange.GetValue()
                objectReferencesList[i] = cont.plantedFloraRef
                i += 1
            EndIf
        EndIf
    Endwhile
    return objectReferencesList
EndFunction