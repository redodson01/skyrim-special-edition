Scriptname CallNPC extends ActiveMagicEffect  

Quest Property CallThoseNPCs Auto
ObjectReference Property ActivatorRef Auto
Actor Property PlayerRef Auto
idle property idlelookfar auto
ReferenceAlias Property ChosenNPC Auto
ReferenceAlias Property NearbyGuard Auto

Spell Property TauntingMatters_PlayerSpell Auto

Function OnEffectStart(Actor akTarget, Actor akCaster)


If PlayerRef.IsInCombat() || Game.GetCameraState() == 0 || PlayerRef.IsWeaponDrawn() && Game.GetModByName("SkyrimVR.esm") != 0xFF
;nothing
else
PlayerRef.PlayIdle(idlelookfar)
endif

CallThoseNPCs.Stop() 
Utility.Wait(0.05) 
CallThoseNPCs.Start()

If NearbyGuard.getref() == none && PlayerRef.IsInCombat()
TauntingMatters_PlayerSpell.Cast(PlayerRef, PlayerRef)

else
ActivatorRef.Enable()
Float TargetAngleZ = PlayerRef.GetAngleZ()
Float TargetPosX = PlayerRef.GetPositionX()
Float TargetPosY = PlayerRef.GetPositionY()
Float TargetPosZ = PlayerRef.GetPositionZ()
Float EndLocX = 100.0 * math.Sin(TargetAngleZ)
Float EndLocY = 100.0 * math.Cos(TargetAngleZ)
ActivatorRef.MoveTo(PlayerRef,EndLocX,EndLocY,30.0,false)
Utility.Wait(0.1) 
ActivatorRef.Activate(PlayerRef, True)
ActivatorRef.Disable()
endif
endfunction