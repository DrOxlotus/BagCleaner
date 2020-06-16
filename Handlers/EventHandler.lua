-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

local events = {
	"CHAT_MSG_LOOT",
	"MERCHANT_SHOW",
	"PLAYER_LOGIN",
};

addonTbl.events = events;