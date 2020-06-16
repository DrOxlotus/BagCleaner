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
	L["ERROR_MSG_NYI"]							= "Tut mir leid, aber dieser Befehl wurde noch nicht umgesetzt.";
	L["ERROR_MSG_VENDOR_DOESNT_BUY"]			= "Ihr könnt diesem Händler keine Gegenstände verkaufen.";
	
	-- GENERAL
	L["ADDON_NAME"] 							= "|cff00ccff" .. addon .. "|r: ";
	L["ADDON_NAME_SETTINGS"] 					= "|cff00ccff" .. addon .. "|r";
	L["SETTINGS_AUTO_DELETE"]					= "Automatisches Löschen";
	
	-- GLOBAL STRINGS
	L["LOOT_ITEM_PUSHED_SELF"] 					= "Ihr bekommt einen Gegenstand: ";
	
	-- INFORMATIONAL MESSAGES
	
	-- KEYBINDINGS
	L["BAGCLEANER"]								= "BagCleaner"; -- This is the header for the keybindings menu.
	L["BAGCLEANER_ADD_TO_ACCOUNT_LIST"]			= "Zur Hauptliste hinzufügen";
	L["BAGCLEANER_ADD_TO_CHARACTER_LIST"]		= "Zur Zeichen Spezifischen Liste Hinzufügen";
	L["BAGCLEANER_OPEN_IMPORT"]					= "Import Öffnen";
	L["BAGCLEANER_OPEN_SETTINGS"]				= "Einstellungen Öffnen";
	
	-- MODE NAMES
	L["DEBUG_MODE"] 							= "Debug";
	L["QUIET_MODE"] 							= "Ruhig";
	
	-- MODE DESCRIPTIONS
	L["DEBUG_MODE_DESC"] 						= "Beinhaltet Verkaufsgewinne und die Anzahl der zerstörten Gegenstände.\n";
	L["QUIET_MODE_DESC"] 						= "Keine Ausgabe!\n";
	
	-- OBJECT TYPES
	
	-- OTHER
return end;