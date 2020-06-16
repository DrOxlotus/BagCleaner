--[[
	NOTE: Synopses pertain to the code directly above them!
	© 2020 Oxlotus/Lightsky/Smallbuttons
]]

-- Namespace Variables
local addon, addonTbl = ...;
local totalSellPrice = 0;
local index;

-- Local Variables
local earlyBreak;
local eventFrame = CreateFrame("Frame");
local itemID;
local L = addonTbl.L;
local mouseFrame = CreateFrame("Frame", "MouseFrame", UIParent);
local numItemsDestroyed = 0;
local numItemsSold = 0;
local tempItemID = 0;

-- Event Registrations
for _, event in pairs(addonTbl.events) do
	eventFrame:RegisterEvent(event);
end

addonTbl.Contains = function(list, itemID)
	for i = 1, #list do
		if list[i] == itemID then
			index = i;
			return true;
		end
	end
	return false;
end

addonTbl.AddItemToList = function(list, itemID)
	if addonTbl.Contains(list, itemID) then
		table.remove(list, index);
	else
		list[#list + 1] = itemID;
	end
end

addonTbl.GetItemIDFromGameTooltip = function(tooltip)
	local _, itemLink = tooltip:GetItem();
	if itemLink then
		addonTbl.itemID = GetItemInfoInstant(itemLink);
	end
end

addonTbl.Split = function(itemIDs)
	for itemID in string.gmatch(itemIDs, '([^,]+)') do
		itemID = tonumber(itemID);
		addonTbl.AddItemToList(BagCleanerAccountItemDB, itemID);
	end
end
-- Synopsis: Takes a comma-delimited string of itemIDs from the player, splits it into individual strings, converts the individual strings into numbers, and then adds them to the account list.

local function UpdateItemTooltip(tooltip)
	local frame, text;
	local _, itemLink = tooltip:GetItem();
	if itemLink then
		local itemID = GetItemInfoInstant(itemLink);
		if itemID then
			if addonTbl.Contains(BagCleanerAccountItemDB, itemID) or addonTbl.Contains(BagCleanerCharacterItemDB, itemID) then
				tooltip:AddDoubleLine(L["ADDON_NAME"], "|TInterface\\Addons\\BagCleaner\\Assets\\sell:0|t |T", 0, 0, 0, 0, 0, 0);
				tooltip:Show();
			end
		end
	end
end
-- Icon by surang. https://www.flaticon.com/authors/surang

local function SellOrDestroyItemToVendor(bag, slot, itemLink, itemCount)
	local _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(itemLink);
	if itemSellPrice > 0 then -- The item has a sell price.
		totalSellPrice = totalSellPrice + (itemCount * itemSellPrice); -- Continously append item sell prices to the total profit.
		UseContainerItem(bag, slot); -- Sell the item to the merchant.
		numItemsSold = numItemsSold + 1;
	else -- No sell price
		PickupContainerItem(bag, slot);
		DeleteCursorItem();
		numItemsDestroyed = numItemsDestroyed + 1;
	end
end

local function SilentlyAutoDeleteBagItem(bag, slot)
	if GetContainerItemID(bag, slot) == itemID then
		PickupContainerItem(bag, slot);
		DeleteCursorItem();
	end
end
-- Synopsis: Used by the CHAT_MSG_LOOT event to automatically delete items when Auto Delete is enabled.

eventFrame:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_LOOT" then
		if addonTbl.autoDestroyItems then
			earlyBreak = false;
			local text, name = ...; name = string.match(name, "(.*)-");
			if name == UnitName("player") then
				text = string.match(text, L["LOOT_ITEM_PUSHED_SELF"] .. "(.*).");
				if text then
					itemID = GetItemInfoInstant(text);
					if addonTbl.Contains(BagCleanerAccountItemDB, itemID) or addonTbl.Contains(BagCleanerCharacterItemDB, itemID) then
						for i = 0, NUM_BAG_FRAMES do -- Using a constant that is equal to 4.
							local containerSlots = GetContainerNumSlots(i);
							for j = containerSlots, 1, -1 do
								C_Timer.After(0, function() C_Timer.After(0.3, function() SilentlyAutoDeleteBagItem(i, j) end); end);
							end
						end
					end
				end
			end
		end
	end
	-- Synopsis: If autoDestroyItems is enabled, then this event is used to auto destroy any item on the player's list as it hits their inventory.
	if event == "MERCHANT_SHOW" then -- Fires whenever the vendor (merchant) window is displayed.
		for i = 0, NUM_BAG_FRAMES do -- Using a constant that is equal to 4.
			local containerSlots = GetContainerNumSlots(i);
			for j = 1, containerSlots do
				if numItemsSold == 12 then break end;
				local _, itemCount, _, itemQuality, _, _, itemLink, _, _, itemID = GetContainerItemInfo(i, j); -- Retrieves the amount, item quality (rare, epic, etc), and item link of each item in every slot of each container.
				if itemQuality == 0 then -- The item is of Poor (grey) quality.
					SellOrDestroyItemToVendor(i, j, itemLink, itemCount);
				elseif addonTbl.Contains(BagCleanerAccountItemDB, itemID) or addonTbl.Contains(BagCleanerCharacterItemDB, itemID) then
					SellOrDestroyItemToVendor(i, j, itemLink, itemCount);
				end
			end
			if numItemsSold == 12 then break end;
		end
		if addonTbl.mode == L["DEBUG_MODE"] then
			if numItemsDestroyed > 0 then print(L["ADDON_NAME"] .. numItemsDestroyed) end; -- Print the number of items destroyed to the main chat window.
			if totalSellPrice > 0 then print(L["ADDON_NAME"] .. GetCoinTextureString(totalSellPrice, 12)); totalSellPrice = 0; end; -- Print the total profit to the main chat window and reset the total sell price.
			numItemsSold = 0; -- Reset the number of items sold to 0 so more items can be sold, but give the player a chance to buyback items.
		end
	end
	if event == "PLAYER_LOGIN" then
		if BagCleanerAccountItemDB == nil then BagCleanerAccountItemDB = {} end;
		if BagCleanerCharacterItemDB == nil then BagCleanerCharacterItemDB = {} end;
		if BagCleanerSettingsDB == nil then BagCleanerSettingsDB = {} end;
		-- Synopsis: If the savedvars tables are nil, set them to empty.
		
		addonTbl.LoadSettings(true);
		-- Synopsis: When the addon is loaded, we must know what settings are 'set' to. 'true' tells the addon NOT to open the settings frame.
	end
end);

GameTooltip:HookScript("OnTooltipSetItem", UpdateItemTooltip);
mouseFrame:SetScript("OnKeyDown", BagCleanerKeyPressHandler);
mouseFrame:SetPropagateKeyboardInput(true);