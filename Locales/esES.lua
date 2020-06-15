local addon, addonTbl = ...;

local L = setmetatable({}, { __index = function(t, k)
	local text = tostring(k);
	rawset(t, k, text);
	return text;
end });

local LOCALE = GetLocale();

if LOCALE == "esES" or LOCALE == "esMX" then -- Spanish (Mexico/Spain)
	addonTbl.L = L;
	
	-- COMMANDS
	L["CMD_DISCORD"]							= "discordia";
	L["SLASH_CMD_1"] 							= "/bc";
	L["SLASH_CMD_2"] 							= "/limpiador de bolsas";
	
	-- ERROR MESSAGES
	
	-- GENERAL
	L["ADDON_NAME"] 							= "|cff00ccff" .. addon .. "|r: ";
	L["ADDON_NAME_SETTINGS"] 					= "|cff00ccff" .. addon .. "|r";
	
	-- GLOBAL STRINGS
	
	-- INFORMATIONAL MESSAGES
	
	-- KEYBINDINGS
	L["BAGCLEANER"]								= "BagCleaner"; -- This is the header for the keybindings menu.
	L["BAGCLEANER_ADD_TO_ACCOUNT_LIST"]			= "Add to Account List";
	L["BAGCLEANER_ADD_TO_CHARACTER_LIST"]		= "Add to Character List";
	L["BAGCLEANER_OPEN_IMPORT"]					= "Open Import";
	L["BAGCLEANER_OPEN_SETTINGS"]				= "Open Settings";
	
	-- MODE NAMES
	L["DEBUG_MODE"] 							= "Debug";
	L["QUIET_MODE"] 							= "Silencio";
	
	-- MODE DESCRIPTIONS
	L["DEBUG_MODE_DESC"] 						= "Incluye los beneficios de la venta y el número de artículos destruidos.\n";
	L["QUIET_MODE_DESC"] 						= "¡No hay salida!\n";
	
	-- OBJECT TYPES
	
	-- OTHER
return end;