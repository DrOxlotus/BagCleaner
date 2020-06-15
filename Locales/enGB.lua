local addon, addonTbl = ...;

local L = setmetatable({}, { __index = function(t, k)
	local text = tostring(k);
	rawset(t, k, text);
	return text;
end });

local LOCALE = GetLocale();

if LOCALE == "enGB" then -- EU English
	addonTbl.L = L;
	
	-- COMMANDS
	L["CMD_DISCORD"]							= "discord";
	L["SLASH_CMD_1"] 							= "/bc";
	L["SLASH_CMD_2"] 							= "/bagcleaner";
	
	-- ERROR MESSAGES
	
	-- GENERAL
	L["ADDON_NAME"] 							= "|cff00ccff" .. addon .. "|r: ";
	L["ADDON_NAME_SETTINGS"] 					= "|cff00ccff" .. addon .. "|r";
	
	-- GLOBAL STRINGS
	
	-- INFORMATIONAL MESSAGES
	
	-- MODE NAMES
	L["DEBUG_MODE"] 							= "Debug";
	L["QUIET_MODE"] 							= "Quiet";
	
	-- MODE DESCRIPTIONS
	L["DEBUG_MODE_DESC"] 						= "Includes sell profits and the number of items destroyed.\n";
	L["QUIET_MODE_DESC"] 						= "No output!\n";
	
	-- OBJECT TYPES
	
	-- OTHER
return end;