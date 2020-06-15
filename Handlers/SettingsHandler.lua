-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

local function GetSettingValue(setting)
	if BagCleanerSettingsDB[setting] == nil then
		if setting == "autoDestroyItems" then
			BagCleanerSettingsDB[setting] = false; addonTbl[setting] = false; return BagCleanerSettingsDB[setting];
		end
		if setting == "mode" then
			BagCleanerSettingsDB[setting] = L["DEBUG_MODE"]; addonTbl[setting] = false; return BagCleanerSettingsDB[setting];
		end
	else
		addonTbl[setting] = BagCleanerSettingsDB[setting]; return BagCleanerSettingsDB[setting];
	end
end
-- Synopsis: Pull in the value of the settings from the savedvar table, if unavailable, then set them to their defaults.
-- mode: Defaults to "Debug".
-- autoDestroyItems: Defaults to false.

addonTbl.LoadSettings = function(doNotOpen)
	if doNotOpen then
		BagCleanerSettingsDB = {mode = GetSettingValue("mode"), autoDestroyItems = GetSettingValue("autoDestroyItems")};
	else
		if addonTbl.isSettingsFrameShown then
			addonTbl.OnClose();
		else
			addonTbl.OnShow();
		end
	end
end
--[[
	Synopsis: Loads either the settings from the cache or loads the settings frame.
	Use Case(s):
		true: If 'doNotOpen' is true, then the addon made the call so it can load the settings from the cache.
		false: If 'doNotOpen' is false, then the player made the call so the settings menu should be shown (or closed if already open.)
]]