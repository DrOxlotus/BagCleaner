-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;
local isSettingsFrameShown;

local bcSettingsFrame = CreateFrame("Frame", "BagCleanerSettingsFrame", UIParent, "BasicFrameTemplateWithInset");

addonTbl.OnClose = function()
	bcSettingsFrame:Hide();
	isSettingsFrameShown = false;
	PlaySound(SOUNDKIT.IG_QUEST_LOG_CLOSE);
end
-- Synopsis: Hide the frame when the player closes it.

addonTbl.OnShow = function()
	if bcSettingsFrame then
		bcSettingsFrame:SetMovable(true);
		bcSettingsFrame:EnableMouse(true);
		bcSettingsFrame:RegisterForDrag("LeftButton");
		bcSettingsFrame:SetScript("OnDragStart", bcSettingsFrame.StartMoving);
		bcSettingsFrame:SetScript("OnDragStop", bcSettingsFrame.StopMovingOrSizing);
		bcSettingsFrame:SetSize(400, 200);
		bcSettingsFrame:ClearAllPoints();
		bcSettingsFrame:SetPoint("CENTER", WorldFrame, "CENTER");
	end
	-- Synopsis: Builds the frame itself and allows it to be draggable.
	
	if not bcSettingsFrame.title then
		bcSettingsFrame.title = bcSettingsFrame:CreateFontString(nil, "OVERLAY");
		bcSettingsFrame.title:SetFontObject("GameFontHighlight");
		bcSettingsFrame.title:SetPoint("CENTER", bcSettingsFrame.TitleBg, "CENTER", 5, 0);
		bcSettingsFrame.title:SetText(L["ADDON_NAME_SETTINGS"]);
	end
	-- Synopsis: Adds a title to the top of the frame, consisting of the addon's name.
	
	if not bcSettingsFrame.modeDropDown then
		bcSettingsFrame.modeDropDown = CreateFrame("Frame", "BagCleanerModeDropDown", bcSettingsFrame, "UIDropDownMenuTemplate");
		bcSettingsFrame.modeDropDown:SetPoint("CENTER", bcSettingsFrame, "CENTER", 0, -10);
		bcSettingsFrame.modeDropDown:SetSize(175, 30);
		bcSettingsFrame.modeDropDown.initialize = function(self, level)
			modeList = UIDropDownMenu_CreateInfo();

			modeList.text = L["DEBUG_MODE"];
			modeList.func = ModeDropDownMenu_OnClick;
			modeList.arg1 = L["DEBUG_MODE"];
			UIDropDownMenu_AddButton(modeList, level);

			modeList.text = L["QUIET_MODE"];
			modeList.func = ModeDropDownMenu_OnClick;
			modeList.arg1 = L["QUIET_MODE"];
			UIDropDownMenu_AddButton(modeList, level);
		end
	end
	-- Synopsis: These are the mode menu options.

	if BagCleanerSettingsDB.mode then
		UIDropDownMenu_SetText(bcSettingsFrame.modeDropDown, BagCleanerSettingsDB.mode);
	end
	-- Synopsis: Sets the value of the mode dropdown to whatever the settings cache holds for that value.
	
	bcSettingsFrame.modeDropDown:SetScript("OnEnter", function(self)
		GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
		GameTooltip:SetText("|cffffffff" .. L["DEBUG_MODE"] .. "|r: " .. L["DEBUG_MODE_DESC"] .. 
		"|cffffffff" .. L["QUIET_MODE"] .. "|r: " .. L["QUIET_MODE_DESC"]);
		GameTooltip:Show();
	end);
	
	bcSettingsFrame.modeDropDown:SetScript("OnLeave", function(self)
		GameTooltip:Hide();
	end);
	-- Synopsis: The above two code blocks are what show and hide the mode descriptions when a player hoves over the dropdown.

	bcSettingsFrame.CloseButton:SetScript("OnClick", function(self)
		addonTbl.OnClose();
	end);
	-- Synopsis: If the player clicks the red X in the upper right corner of the frame, then call the SettingsMenu_OnClose()
	-- function so the frame can be properly hidden.
	
	bcSettingsFrame:Show(); bcSettingsFrame:Show(); -- TODO: Test if the second Show() function call is necessary.
	PlaySound(SOUNDKIT.IG_QUEST_LOG_OPEN);
end