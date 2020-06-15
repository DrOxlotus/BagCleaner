-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

addonTbl.LoadSettings = function(doNotOpen)
	if doNotOpen then
		BagCleanerSettingsDB = {mode = addonTbl.GetOptions("mode")};
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