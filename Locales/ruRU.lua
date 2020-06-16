local addon, addonTbl = ...;

local L = setmetatable({}, { __index = function(t, k)
	local text = tostring(k);
	rawset(t, k, text);
	return text;
end });

local LOCALE = GetLocale();

if LOCALE == "ruRU" then -- Russian
	addonTbl.L = L;
	
	-- COMMANDS
	L["CMD_DISCORD"]							= "диссонанс";
	L["SLASH_CMD_1"] 							= "/кв.д.";
	L["SLASH_CMD_2"] 							= "/багклейнер";
	
	-- ERROR MESSAGES
	L["ERROR_MSG_NYI"]							= "Простите, но эта акция еще не осуществлена.";
	
	-- GENERAL
	L["ADDON_NAME"] 							= "|cff00ccff" .. addon .. "|r: ";
	L["ADDON_NAME_SETTINGS"] 					= "|cff00ccff" .. addon .. "|r";
	L["SETTINGS_AUTO_DELETE"]					= "Автоматическое удаление";
	
	-- GLOBAL STRINGS
	L["LOOT_ITEM_PUSHED_SELF"] 					= "Вы получаете предмет: ";
	
	-- INFORMATIONAL MESSAGES
	
	-- KEYBINDINGS
	L["BAGCLEANER"]								= "BagCleaner"; -- This is the header for the keybindings menu.
	L["BAGCLEANER_ADD_TO_ACCOUNT_LIST"]			= "Добавить в Cписок аккаунтов";
	L["BAGCLEANER_ADD_TO_CHARACTER_LIST"]		= "Добавить в Cписок персонажей";
	L["BAGCLEANER_OPEN_IMPORT"]					= "Открытый Nмпорт";
	L["BAGCLEANER_OPEN_SETTINGS"]				= "Открытые Настройки";
	
	-- MODE NAMES
	L["DEBUG_MODE"] 							= "Отладка";
	L["QUIET_MODE"] 							= "Тихий";
	
	-- MODE DESCRIPTIONS
	L["DEBUG_MODE_DESC"] 						= "Включает в себя прибыль от продажи и количество уничтоженных предметов.\n";
	L["QUIET_MODE_DESC"] 						= "Выхода нет!\n";
	
	-- OBJECT TYPES
	
	-- OTHER
return end;