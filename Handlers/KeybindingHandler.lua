-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

-- Keybindings
BINDING_HEADER_BAGCLEANER = "BAGCLEANER";
BINDING_NAME_BAGCLEANER_ADD_TO_ACCOUNT_LIST = "Add to Account List";
BINDING_NAME_BAGCLEANER_ADD_TO_CHARACTER_LIST = "Add to Character List";

function BagCleanerKeyPressHandler(key)
	if key == GetBindingKey("BAGCLEANER_OPEN_SETTINGS") then
		addonTbl.LoadSettings(false);
	elseif key == GetBindingKey("BAGCLEANER_OPEN_IMPORT") then
		-- do something
	elseif key == GetBindingKey("BAGCLEANER_ADD_TO_ACCOUNT_LIST") then
		GameTooltip:HookScript("OnTooltipSetItem", GetItemIDFromGameTooltip);
		AddItemToList(BagCleanerAccountItemDB, itemID);
	elseif key == GetBindingKey("BAGCLEANER_ADD_TO_CHARACTER_LIST") then
		GameTooltip:HookScript("OnTooltipSetItem", GetItemIDFromGameTooltip);
		AddItemToList(BagCleanerCharacterItemDB, itemID);
	end
end