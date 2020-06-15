-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

SLASH_BagCleaner1 = L["SLASH_CMD_1"];
SLASH_BagCleaner2 = L["SLASH_CMD_2"];
SlashCmdList["BagCleaner"] = function(cmd, editbox)
	local _, _, cmd, args = string.find(cmd, "%s?(%w+)%s?(.*)");

	if not cmd or cmd == "" then
		addonTbl.LoadSettings(false);
	elseif cmd == L["CMD_DISCORD"] then -- Gives the player the link to the Discord server.
		print(L["ADDON_NAME"] .. "https://discord.gg/9GFDsgy");
	end
end