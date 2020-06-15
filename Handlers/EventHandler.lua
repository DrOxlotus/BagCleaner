-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

local events = {
	"BAG_UPDATE",
	"CHAT_MSG_LOOT",
	"ITEM_PUSH",
	"MERCHANT_SHOW",
	"PLAYER_LOGIN",
};

addonTbl.events = events;