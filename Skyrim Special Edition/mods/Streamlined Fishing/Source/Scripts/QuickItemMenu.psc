Scriptname QuickItemMenu extends Quest

string Property MENU_NAME = "CustomMenu" AutoReadOnly
string Property OBJ_PATH = "_root.MenuHolder.Menu_mc." AutoReadOnly

int Property EQUIPPED_NONE = 0 AutoReadOnly
int Property EQUIPPED_WORN = 1 AutoReadOnly
int Property EQUIPPED_LEFT = 2 AutoReadOnly
int Property EQUIPPED_RIGHT = 3 AutoReadOnly
int Property EQUIPPED_BOTH = 4 AutoReadOnly

bool Property AutoSelectSingle = true Auto

Form[] entry = None
int[] entryState = None
int entryCount = 0

Form result = None

Event OnInit()
    entry = new Form[128]
    entryState = new int[128]
EndEvent

Function ResetMenu()
    int i = 0
    while i < entryCount
        entry[i] = None
        i += 1
    endwhile
    entryCount = 0

    AutoSelectSingle = true
EndFunction

int Function AddEntryItem(Form akEntry, int aiEquipState = 0)
    entry[entryCount] = akEntry
    entryState[entryCount] = aiEquipState
    entryCount += 1
    return entryCount - 1
EndFunction

Form Function Show()
    if entryCount <= 0
        result = None
        return None
    elseif entryCount == 1 && AutoSelectSingle
        result = entry[0]
        ResetMenu()
        return result
    endif

    if UI.IsMenuOpen(MENU_NAME)
        ; Menu is already open, fail
        return None
    endif

    RegisterForModEvent("QuickItemMenu_LoadMenu", "OnLoadMenu")
    RegisterForModEvent("QuickItemMenu_CloseMenu", "OnCloseMenu")
    RegisterForModEvent("QuickItemMenu_SelectItem", "OnSelectItem")

    UI.OpenCustomMenu("quickitemmenu")

    while UI.IsMenuOpen(MENU_NAME)
        Utility.Wait(0.1)
    endwhile

    return result
EndFunction

Event OnLoadMenu(string eventName, string strArg, float numArg, Form sender)
    int i = 0
    while i < entryCount
        int handle = UICallback.Create(MENU_NAME, OBJ_PATH + "PushEntry")
        if handle
            int formID = entry[i].GetFormID()
            int modID = Math.RightShift(formID, 24)
            int localID
            string modName

            if modID != 0xFE
                localID = Math.LogicalAnd(formID, 0xFFFFFF)
                modName = Game.GetModName(modID)
            else
                int lightModID = Math.RightShift(Math.LogicalAnd(formID, 0xFFF000), 12)
                localID = Math.LogicalAnd(formID, 0xFFF)
                modName = Game.GetLightModName(lightModID)
            endif

            UICallback.PushString(handle, entry[i].GetName())
            UICallback.PushInt(handle, localID)
            UICallback.PushString(handle, modName)
            UICallback.PushInt(handle, entryState[i])
            UICallback.Send(handle)
        endif

        i += 1
    endwhile

    UI.InvokeNumber(MENU_NAME, OBJ_PATH + "SetSenderID", self.GetFormID())
    UI.Invoke(MENU_NAME, OBJ_PATH + "Ready")
EndEvent

Event OnCloseMenu(string eventName, string strArg, float numArg, Form sender)
    UnregisterForModEvent("QuickItemMenu_LoadMenu")
    UnregisterForModEvent("QuickItemMenu_CloseMenu")
    UnregisterForModEvent("QuickItemMenu_SelectItem")
EndEvent

Event OnSelectItem(string eventName, string strArg, float numArg, Form sender)
    result = Game.GetFormFromFile(numArg as int, strArg)
EndEvent
