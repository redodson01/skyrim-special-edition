Scriptname SimpleBowCraftInitScript extends Quest

Actor Property pPlayerRef Auto 
Perk Property WoodSmithingBow Auto ;22
Perk Property DwarvenSmithingBow Auto ;30
Perk Property ElvenSmithingBow Auto ;32
Perk Property OrcishSmithingBow Auto ;25
Perk Property GlassSmithingBow Auto ;50
Perk Property EbonySmithingBow Auto ;70
Perk Property DaedricSmithingBow Auto ;90
Perk Property DragonboneSmithingBow Auto ;95

Event OnInit()
    
    If (pPlayerRef.GetActorValue("Marksman") >= 22) && (!pPlayerRef.HasPerk(WoodSmithingBow))
        pPlayerRef.AddPerk(WoodSmithingBow)
        ;Debug.Notification("Wood Smithing Bow Perk Added")
    Endif
    
    If (pPlayerRef.GetActorValue("Marksman") >= 30) && (!pPlayerRef.HasPerk(DwarvenSmithingBow))
        pPlayerRef.AddPerk(DwarvenSmithingBow)
    Endif
        
    If (pPlayerRef.GetActorValue("Marksman") >= 35) && (!pPlayerRef.HasPerk(ElvenSmithingBow))
        pPlayerRef.AddPerk(ElvenSmithingBow)
    Endif
        
    If (pPlayerRef.GetActorValue("Marksman") >= 25) && (!pPlayerRef.HasPerk(OrcishSmithingBow))
        
        pPlayerRef.AddPerk(OrcishSmithingBow)
    Endif
        
    If (pPlayerRef.GetActorValue("Marksman") >= 50) && (!pPlayerRef.HasPerk(GlassSmithingBow))
        pPlayerRef.AddPerk(GlassSmithingBow)
    Endif
        
    If (pPlayerRef.GetActorValue("Marksman") >= 70) && (!pPlayerRef.HasPerk(EbonySmithingBow))
        pPlayerRef.AddPerk(EbonySmithingBow)
    Endif
        
    If (pPlayerRef.GetActorValue("Marksman") >= 90) && (!pPlayerRef.HasPerk(DaedricSmithingBow))
        pPlayerRef.AddPerk(DaedricSmithingBow)
    Endif
    
    If (pPlayerRef.GetActorValue("Marksman") >= 95) && (!pPlayerRef.HasPerk(DragonboneSmithingBow))
            pPlayerRef.AddPerk(DragonboneSmithingBow)
    Endif 
    
EndEvent