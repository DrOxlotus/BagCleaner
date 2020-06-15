local addon, addonTbl = ...;

local L = setmetatable({}, { __index = function(t, k)
	local text = tostring(k);
	rawset(t, k, text);
	return text;
end });

local LOCALE = GetLocale();

if LOCALE == "deDE" then -- German
	addonTbl.L = L;
	
	-- COMMANDS
	L["CMD_DISCORD"]							= "zwietracht";
	L["SLASH_CMD_1"] 							= "/bc";
	L["SLASH_CMD_2"] 							= "/beutelreiniger";
	
	-- ERROR MESSAGES
	
	-- GENERAL
	L["ADDON_NAME"] 							= "|cff00ccff" .. addon .. "|r: ";
	L["ADDON_NAME_SETTINGS"] 					= "|cff00ccff" .. addon .. "|r";
	
	-- GLOBAL STRINGS
	
	-- INFORMATIONAL MESSAGES
	
	-- MODE NAMES
	L["DEBUG_MODE"] 							= "Debug";
	L["QUIET_MODE"] 							= "Ruhig";
	
	-- MODE DESCRIPTIONS
	L["DEBUG_MODE_DESC"] 						= "Beinhaltet Verkaufsgewinne und die Anzahl der zerstörten Gegenstände.\n";
	L["QUIET_MODE_DESC"] 						= "Keine Ausgabe!\n";
	
	-- OBJECT TYPES
	
	-- OTHER
return end;