-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

-- Keybindings
BINDING_HEADER_BAGCLEANER = L["BAGCLEANER"];
BINDING_NAME_BAGCLEANER_ADD_TO_ACCOUNT_LIST = L["BAGCLEANER_ADD_TO_ACCOUNT_LIST"];
BINDING_NAME_BAGCLEANER_ADD_TO_CHARACTER_LIST = L["BAGCLEANER_ADD_TO_CHARACTER_LIST"];
BINDING_NAME_BAGCLEANER_OPEN_SETTINGS = L["BAGCLEANER_OPEN_SETTINGS"];

function BagCleanerKeyPressHandler(key)
	if key == GetBindingKey("BAGCLEANER_ADD_TO_ACCOUNT_LIST") then
		GameTooltip:HookScript("OnTooltipSetItem", addonTbl.GetItemIDFromGameTooltip);
		addonTbl.AddItemToList(BagCleanerAccountItemDB, addonTbl.itemID);
	elseif key == GetBindingKey("BAGCLEANER_ADD_TO_CHARACTER_LIST") then
		GameTooltip:HookScript("OnTooltipSetItem", addonTbl.GetItemIDFromGameTooltip);
		addonTbl.AddItemToList(BagCleanerCharacterItemDB, addonTbl.itemID);
	elseif key == GetBindingKey("BAGCLEANER_OPEN_SETTINGS") then
		addonTbl.LoadSettings(false);
	end
end