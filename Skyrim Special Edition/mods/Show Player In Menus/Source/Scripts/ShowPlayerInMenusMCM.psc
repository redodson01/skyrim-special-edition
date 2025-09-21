ScriptName ShowPlayerInMenusMCM Extends MCM_ConfigBase

Event OnSettingChange(string a_ID)
    if a_ID == "bRotateCamera:ModeSettings"
        SetModSettingBool("bRotatePlayer:ModeSettings", !GetModSettingBool(a_ID))
		self.RefreshMenu()
	elseif a_ID == "bRotatePlayer:ModeSettings"
        SetModSettingBool("bRotateCamera:ModeSettings", !GetModSettingBool(a_ID))
		self.RefreshMenu()
    endif
EndEvent