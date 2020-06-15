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
	
	-- GENERAL
	L["ADDON_NAME"] 							= "|cff00ccff" .. addon .. "|r: ";
	L["ADDON_NAME_SETTINGS"] 					= "|cff00ccff" .. addon .. "|r";
	
	-- GLOBAL STRINGS
	
	-- INFORMATIONAL MESSAGES
	
	-- MODE NAMES
	L["DEBUG_MODE"] 							= "Отладка";
	L["QUIET_MODE"] 							= "Тихий";
	
	-- MODE DESCRIPTIONS
	L["DEBUG_MODE_DESC"] 						= "Включает в себя прибыль от продажи и количество уничтоженных предметов.\n";
	L["QUIET_MODE_DESC"] 						= "Выхода нет!\n";
	
	-- OBJECT TYPES
	
	-- OTHER
return end;