-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

-- Keybindings
BINDING_HEADER_BAGCLEANER = L["BAGCLEANER"];
BINDING_NAME_BAGCLEANER_ADD_TO_ACCOUNT_LIST = L["BAGCLEANER_ADD_TO_ACCOUNT_LIST"];
BINDING_NAME_BAGCLEANER_ADD_TO_CHARACTER_LIST = L["BAGCLEANER_ADD_TO_CHARACTER_LIST"];
BINDING_NAME_BAGCLEANER_OPEN_IMPORT = L["BAGCLEANER_OPEN_IMPORT"];
BINDING_NAME_BAGCLEANER_OPEN_SETTINGS = L["BAGCLEANER_OPEN_SETTINGS"];

function BagCleanerKeyPressHandler(key)
	if key == GetBindingKey("BAGCLEANER_OPEN_IMPORT") then
		-- do something
	elseif key == GetBindingKey("BAGCLEANER_OPEN_SETTINGS") then
		addonTbl.LoadSettings(false);
	elseif key == GetBindingKey("BAGCLEANER_ADD_TO_ACCOUNT_LIST") then
		GameTooltip:HookScript("OnTooltipSetItem", addonTbl.GetItemIDFromGameTooltip);
		addonTbl.AddItemToList(BagCleanerAccountItemDB, itemID);
	elseif key == GetBindingKey("BAGCLEANER_ADD_TO_CHARACTER_LIST") then
		GameTooltip:HookScript("OnTooltipSetItem", addonTbl.GetItemIDFromGameTooltip);
		addonTbl.AddItemToList(BagCleanerCharacterItemDB, itemID);
	end
end