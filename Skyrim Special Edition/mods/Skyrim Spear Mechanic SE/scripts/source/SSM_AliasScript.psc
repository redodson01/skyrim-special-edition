Scriptname SSM_AliasScript extends ReferenceAlias

;Player
Actor property PlayerRef Auto

;FormList
FormList Property SSM_ListWeapon_Spear Auto
FormList Property SSM_ListWeapon_Javelin Auto
FormList Property SSM_ListWeapon_Dummy Auto

FormList Property SSM_ListSpell_Javelin Auto

spell Property SSM_Test Auto

;Keyword
keyword Property WeapTypeSpear auto
keyword Property WeapTypeJavelin auto

;Bool
bool isJavelin_Equipped
bool isJavelin_Ammo

;Spell
spell SSM_JavelinSpell

;-- Event triggers once ----------------------------------------------------------------------------
Event OnInit()
	debug.Notification("Skyrim Spear Mechanic 3.0")
	
	RegisterForAnimationEvent(PlayerRef, "SoundPlay.NPCHumanCombatTorchBash")
	
	isJavelin_Equipped = false

	;Set_Debug()
endEvent

;-- Event triggers once per load game --------------------------------------------------------------
Event OnPlayerLoadGame()
	RegisterForAnimationEvent(PlayerRef, "SoundPlay.NPCHumanCombatTorchBash")
	
	isJavelin_Equipped = false

	;Set_Debug()
endEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;debug.Notification(asEventName)

	if asEventName == "SoundPlay.NPCHumanCombatTorchBash"
		;debug.Notification(asEventName)
		weapon WeaponR = PlayerRef.GetEquippedWeapon(false)
		
		if WeaponR.HasKeyword(WeapTypeSpear)
			;SSM_FireStorm.cast(PlayerRef)
		endif
		
		if WeaponR.HasKeyword(WeapTypeJavelin)
			;debug.Notification("Throw")
			int i = SSM_ListWeapon_Javelin.Find(WeaponR)
			if i > -1
				SSM_JavelinSpell = SSM_ListSpell_Javelin.GetAt(i) as spell
				SSM_JavelinSpell.cast(PlayerRef)
			endif
		endif
	endif

endEvent

;-- Debug ----------------------------------------------------------------------------------
Function Set_Debug()
	
	;Debug_Dummy(false)
	
	Debug_Spear(true)
	Debug_Javelin(true)
	
	Debug_Weapon(true)
	
	Debug_Perk(true)
	
	PlayerRef.additem(Game.GetForm(0x0000000F),9000)	;Gold
	PlayerRef.SetAV("Stamina", 900)
EndFunction

Function Debug_Dummy(bool isAdd)
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(0) as weapon, 10)	;Spear
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(1) as weapon, 10)	;Javelin
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(2) as weapon, 10)	;Pike
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(3) as weapon, 10)	;Halberd
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(4) as weapon, 10)	;Rapier
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(5) as weapon, 10)	;Quaterstaff
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(6) as weapon, 10)	;Claw
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(7) as weapon, 10)	;Whip
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(8) as weapon, 10)	;Katana
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(9) as weapon, 10)	;Scythe
	PlayerRef.removeitem(SSM_ListWeapon_Dummy.GetAt(10) as weapon, 10)	;Gun
	if isAdd
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(0) as weapon)	;Spear
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(1) as weapon)	;Javelin
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(2) as weapon)	;Pike
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(3) as weapon)	;Halberd 
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(4) as weapon)	;Rapier 
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(5) as weapon)	;Quaterstaff
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(6) as weapon)	;Claw
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(7) as weapon)	;Whip
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(8) as weapon)	;Katana
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(9) as weapon)	;Scythe
		PlayerRef.additem(SSM_ListWeapon_Dummy.GetAt(10) as weapon)	;Gun
	endif
EndFunction

Function Debug_Spear(bool isAdd)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(0) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(1) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(2) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(3) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(4) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(5) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(6) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(7) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(8) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(9) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Spear.GetAt(10) as weapon, 10)
	if isAdd
		PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(0) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(1) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(2) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(3) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(4) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(5) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(6) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(7) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(8) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(9) as weapon)
		PlayerRef.additem(SSM_ListWeapon_Spear.GetAt(10) as weapon)
	endif
EndFunction

Function Debug_Javelin(bool isAdd)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(0) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(1) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(2) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(3) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(4) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(5) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(6) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(7) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(8) as weapon, 10)
	PlayerRef.removeitem(SSM_ListWeapon_Javelin.GetAt(9) as weapon, 10)
	if isAdd
		PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(0) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(1) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(2) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(3) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(4) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(5) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(6) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(7) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(8) as weapon)
		;PlayerRef.additem(SSM_ListWeapon_Javelin.GetAt(9) as weapon)
	endif
EndFunction

Function Debug_Weapon( bool isAdd)
	PlayerRef.removeitem(Game.GetForm(0x00012EB6),10)	;IronShield
	PlayerRef.removeitem(Game.GetForm(0x00012EB7),10)	;IronSword
	PlayerRef.removeitem(Game.GetForm(0x0001359D),10)	;IronGreatsword
	PlayerRef.removeitem(Game.GetForm(0x00013790),10)	;IronWaraxe
	PlayerRef.removeitem(Game.GetForm(0x0001397E),10)	;IronDagger
	PlayerRef.removeitem(Game.GetForm(0x00013980),10)	;IronBattleaxe
	PlayerRef.removeitem(Game.GetForm(0x00013981),10)	;IronWarhammer
	PlayerRef.removeitem(Game.GetForm(0x00013982),10)	;IronMace
	if isAdd
		PlayerRef.additem(Game.GetForm(0x00012EB6),1)	;IronShield
		PlayerRef.additem(Game.GetForm(0x00012EB7),1)	;IronSword
		;PlayerRef.additem(Game.GetForm(0x0001359D),1)	;IronGreatsword
		;PlayerRef.additem(Game.GetForm(0x00013790),1)	;IronWaraxe
		;PlayerRef.additem(Game.GetForm(0x0001397E),1)	;IronDagger
		;PlayerRef.additem(Game.GetForm(0x00013980),1)	;IronBattleaxe
		;PlayerRef.additem(Game.GetForm(0x00013981),1)	;IronWarhammer
		;PlayerRef.additem(Game.GetForm(0x00013982),1)	;IronMace
		;PlayerRef.additem(Game.GetForm(0x0301B935),1)	;RieklingSpear
	endif
EndFunction

Function Debug_Perk(bool isAdd)
	if isAdd
		PlayerRef.AddPerk(Game.GetForm(0x00058F67) as perk)	;PowerBashPerk
		PlayerRef.AddPerk(Game.GetForm(0x000CB406) as perk) ;CriticalCharge
		PlayerRef.AddPerk(Game.GetForm(0x000CB407) as perk)	;GreatCriticalCharge
	endif
EndFunction