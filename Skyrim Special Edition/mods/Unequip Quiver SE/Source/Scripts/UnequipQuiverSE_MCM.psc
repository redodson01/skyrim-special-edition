Scriptname UnequipQuiverSE_MCM extends MCM_ConfigBase  

Function UpdateSettingInt(string id)

	UQ_Papyrus.OnSettingChangeInt(id, GetModSettingInt(id + ":Main"))

EndFunction

Function UpdateSettingBool(string id)

	UQ_Papyrus.OnSettingChangeBool(id, GetModSettingBool(id + ":Main"))

EndFunction

Function UpdateSettingFloat(string id)

	UQ_Papyrus.OnSettingChangeFloat(id, GetModSettingFloat(id + ":Main"))

EndFunction

Function UpdateSettingString(string id)

	UQ_Papyrus.OnSettingChangeString(id, GetModSettingString(id + ":Main"))

EndFunction

Event OnConfigClose()

	UpdateSettingBool("bEnablePC")
	UpdateSettingBool("bEnableNPC")
	
	UpdateSettingBool("bSpell")
	UpdateSettingBool("bWeapon")
	UpdateSettingBool("bShield")
	UpdateSettingBool("bBow")
	UpdateSettingBool("bCrossbow")
	
	UpdateSettingBool("bCheckWeaponByKeywords")
	
	UpdateSettingInt("iReEquipType")
	
	UpdateSettingBool("bEquipStronger")
	UpdateSettingBool("bEquipLargerAmount")

	UpdateSettingBool("bSavefile")
	
	UpdateSettingBool("bMultiBow")
	
	UpdateSettingBool("bBlackListAmmo")
	UpdateSettingBool("bBlackListRace")
	UpdateSettingBool("bBlackListCharacter")
	UpdateSettingBool("bRaceKeyword")
	
	UpdateSettingBool("bExtraData")
	UpdateSettingBool("bFavorites")
	UpdateSettingBool("bFixArrowSharing")

	UpdateSettingBool("bHideQuiverOnSheathe")
	UpdateSettingBool("bHideQuiverOnSheatheNPC")
	
	UpdateSettingBool("bHideQuiverOnDraw")
	UpdateSettingBool("bHideQuiverOnDrawNPC")
	
	UpdateSettingBool("bHideBoltOnSheathe")
	UpdateSettingBool("bHideBoltOnSheatheNPC")
	
	UpdateSettingBool("bHideBoltOnDraw")
	UpdateSettingBool("bHideBoltOnDrawNPC")

EndEvent

Event OnSettingChange(string a_ID)
	
EndEvent