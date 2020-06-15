-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

local function GetOptions(arg)
	if BagCleanerSettingsDB[arg] ~= nil then
		addonTbl[arg] = BagCleanerSettingsDB[arg];
		return addonTbl[arg];
	else
		if arg == "mode" then
			BagCleanerSettingsDB.arg = L["DEBUG_MODE"]; addonTbl.arg = BagCleanerSettingsDB.arg;
			return addonTbl.arg;
		end
		if arg == "autoDestroyItems" then
			BagCleanerSettingsDB.arg = false; addonTbl.arg = BagCleanerSettingsDB.arg;
			return addonTbl.arg;
		end
	end
end
-- Synopsis: Pull in the value of the settings from the savedvar table, if unavailable, then set them to their defaults.
-- mode: Defaults to "Debug".
-- autoDestroyItems: Defaults to false.

addonTbl.LoadSettings = function(doNotOpen)
	if doNotOpen then
		BagCleanerSettingsDB = {mode = GetOptions("mode")};
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