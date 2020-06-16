-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

local events = {
	"CHAT_MSG_LOOT",
	"MERCHANT_SHOW",
	"PLAYER_LOGIN",
	"UI_ERROR_MESSAGE",
};

addonTbl.events = events;