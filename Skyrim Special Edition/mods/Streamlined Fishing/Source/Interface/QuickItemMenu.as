import Shared.GlobalFunc;
import gfx.io.GameDelegate;
import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;

class QuickItemMenu extends MovieClip
{
	var bPCControlsReady: Boolean = true;
	var iSenderID: Number = 0;
	var ItemList: MovieClip;
	var LeftPanel: MovieClip;
	var List_mc: MovieClip;

	function QuickItemMenu()
	{
		super();
		ItemList = List_mc;
	}

	function onLoad()
	{
		super.onLoad()

		GlobalFunc.SetLockFunction();
		_parent.Lock("BL");
		ItemList.InvalidateData()
		ItemList.addEventListener("listMovedUp", this, "onListMoveUp");
		ItemList.addEventListener("listMovedDown", this, "onListMoveDown");
		ItemList.addEventListener("itemPress", this, "onItemSelect");
		FocusHandler.instance.setFocus(ItemList, 0);
	}

	function InitExtensions(): Void
	{
		skse.SendModEvent("QuickItemMenu_LoadMenu");
	}

	function handleInput(details: InputDetails, pathToFocus: Array): Boolean
	{
		if (!pathToFocus[0].handleInput(details, pathToFocus.slice(1))) {
			if (Shared.GlobalFunc.IsKeyPressed(details) && details.navEquivalent == NavigationCode.TAB) {
				startFadeOut();
			}
		}
		return true;
	}

	function get selectedIndex(): Number
	{
		return ItemList.selectedEntry.index;
	}

	function get itemList(): MovieClip
	{
		return ItemList;
	}

	function setSelectedItem(aiIndex: Number): Void
	{
		for (var i: Number = 0; i < ItemList.entryList.length; i++) {
			if (ItemList.entryList[i].index == aiIndex) {
				ItemList.selectedIndex = i;
				ItemList.RestoreScrollPosition(i);
				ItemList.UpdateList();
				return;
			}
		}
	}

	function onListMoveUp(event: Object): Void
	{
		GameDelegate.call("PlaySound", ["UIMenuFocus"]);
		if (event.scrollChanged == true) {
			gotoAndPlay("moveUp");
		}
	}

	function onListMoveDown(event: Object): Void
	{
		GameDelegate.call("PlaySound", ["UIMenuFocus"]);
		if (event.scrollChanged == true) {
			gotoAndPlay("moveDown");
		}
	}

	function onItemSelect(event: Object): Void
	{
		var entry: Object = ItemList.entryList[event.index];
		skse.SendModEvent("QuickItemMenu_SelectItem", entry.modName, entry.formID, iSenderID);
		startFadeOut();
	}

	function startFadeOut(): Void
	{
		_parent.gotoAndPlay("startFadeOut");
	}

	function onFadeOutCompletion(): Void
	{
		skse.SendModEvent("QuickItemMenu_CloseMenu");
		skse.CloseMenu("CustomMenu");
	}

	function SetPlatform(aiPlatform: Number, abPS3Switch: Boolean): Void
	{
		ItemList.SetPlatform(aiPlatform, abPS3Switch);
		LeftPanel._x = aiPlatform == 0 ? -90 : -78.2;
		LeftPanel.gotoAndStop(aiPlatform == 0 ? "Mouse" : "Gamepad");
	}

	function PushEntry(asText: String, aiFormID: Number, asModName: String, aiEquipState: Number): Void
	{
		ItemList.entryList.push({text: asText, equipState: aiEquipState, formID: aiFormID, modName: asModName});
	}

	function SetSenderID(aiSenderID: Number): Void
	{
		iSenderID = aiSenderID;
	}

	function Ready(): Void
	{
		ItemList.InvalidateData();
		_parent.gotoAndPlay("startFadeIn");
	}

}
