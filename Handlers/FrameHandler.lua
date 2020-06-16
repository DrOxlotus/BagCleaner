-- Namespace Variables
local addon, addonTbl = ...;

-- Local Variables
local L = addonTbl.L;

local bcSettingsFrame = CreateFrame("Frame", "BagCleanerSettingsFrame", UIParent, "BasicFrameTemplateWithInset");

local function OnClick(self, arg1)
	BagCleanerSettingsDB.mode = arg1; addonTbl.mode = arg1;
	UIDropDownMenu_SetText(bcSettingsFrame.modeDropDown, arg1);
end
-- Synopsis: Changes the value of the mode dropdown to whatever the player selects.

addonTbl.OnClose = function()
	bcSettingsFrame:Hide();
	addonTbl.isSettingsFrameShown = false;
	PlaySound(SOUNDKIT.IG_QUEST_LOG_CLOSE);
end
-- Synopsis: Hide the frame when the player closes it.

addonTbl.OnShow = function(frame)
	if bcSettingsFrame then
		bcSettingsFrame:SetMovable(true);
		bcSettingsFrame:EnableMouse(true);
		bcSettingsFrame:RegisterForDrag("LeftButton");
		bcSettingsFrame:SetScript("OnDragStart", bcSettingsFrame.StartMoving);
		bcSettingsFrame:SetScript("OnDragStop", bcSettingsFrame.StopMovingOrSizing);
		bcSettingsFrame:SetSize(300, 200);
		bcSettingsFrame:ClearAllPoints();
		bcSettingsFrame:SetPoint("CENTER", WorldFrame, "CENTER");
	end
	-- Synopsis: Builds the bcSettingsFrame itself and allows it to be draggable.
	if not bcSettingsFrame.title then
		bcSettingsFrame.title = bcSettingsFrame:CreateFontString(nil, "OVERLAY");
		bcSettingsFrame.title:SetFontObject("GameFontHighlight");
		bcSettingsFrame.title:SetPoint("CENTER", bcSettingsFrame.TitleBg, "CENTER", 5, 0);
		bcSettingsFrame.title:SetText(L["ADDON_NAME_SETTINGS"]);
	end
	-- Synopsis: Adds a title to the top of the bcSettingsFrame, consisting of the addon's name.
	if not bcSettingsFrame.modeDropDown then
		bcSettingsFrame.modeDropDown = CreateFrame("Frame", "BagCleanerModeDropDown", bcSettingsFrame, "UIDropDownMenuTemplate");
		bcSettingsFrame.modeDropDown:SetPoint("CENTER", bcSettingsFrame.title, "LEFT", -20, -40);
		bcSettingsFrame.modeDropDown:SetSize(175, 30);
		bcSettingsFrame.modeDropDown.initialize = function(self, level)
			modeList = UIDropDownMenu_CreateInfo();

			modeList.text = L["DEBUG_MODE"];
			modeList.func = OnClick;
			modeList.arg1 = L["DEBUG_MODE"];
			UIDropDownMenu_AddButton(modeList, level);

			modeList.text = L["QUIET_MODE"];
			modeList.func = OnClick;
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
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText("|cffffffff" .. L["DEBUG_MODE"] .. "|r: " .. L["DEBUG_MODE_DESC"] .. 
		"|cffffffff" .. L["QUIET_MODE"] .. "|r: " .. L["QUIET_MODE_DESC"], nil, nil, nil, nil, true);
		GameTooltip:Show();
	end);
	bcSettingsFrame.modeDropDown:SetScript("OnLeave", function(self)
		if GameTooltip:GetOwner() == self then
			GameTooltip:Hide();
		end
	end);
	-- Synopsis: The above two code blocks are what show and hide the mode descriptions when a player hoves over the dropdown.
	if not bcSettingsFrame.autoDeleteButton then
		bcSettingsFrame.autoDeleteButton = CreateFrame("CheckButton", "BagCleanerAutoDeleteButton", bcSettingsFrame, "UICheckButtonTemplate");
		bcSettingsFrame.autoDeleteButton:SetPoint("TOPLEFT", bcSettingsFrame.modeDropDown, "BOTTOMLEFT", 20, -10);
		bcSettingsFrame.autoDeleteButton.text:SetText(L["SETTINGS_AUTO_DELETE"]);
	end
	bcSettingsFrame.autoDeleteButton:SetScript("OnClick", function(self, event, arg1)
		if self:GetChecked() then
			addonTbl.autoDestroyItems = true;
			BagCleanerSettingsDB.autoDestroyItems = true;
		else
			addonTbl.autoDestroyItems = false;
			BagCleanerSettingsDB.autoDestroyItems = false;
		end
	end);
	-- Synopsis: Tells the addon whether or not it should auto delete items as they hit the player's inventory, but only if they're on the list.
	if BagCleanerSettingsDB.autoDestroyItems then
		bcSettingsFrame.autoDeleteButton:SetChecked(true);
		addonTbl.autoDestroyItems = true;
	else
		bcSettingsFrame.autoDeleteButton:SetChecked(false);
		addonTbl.autoDestroyItems = false;
	end
	-- Synopsis: Get the state of the 'autoDestroyItems' variable, if true, check the button, otherwise, keep the button unchecked.
	if not bcSettingsFrame.importButton then
		bcSettingsFrame.importButton = CreateFrame("Button", "BagCleanerImportButton", bcSettingsFrame, "GameMenuButtonTemplate");
		bcSettingsFrame.importButton:SetPoint("CENTER", bcSettingsFrame, "CENTER", 0, -60);
		bcSettingsFrame.importButton:SetSize(85, 25);
		bcSettingsFrame.importButton:SetText(L["BAGCLEANER_OPEN_IMPORT"]);
		bcSettingsFrame.importButton:SetNormalFontObject("GameFontNormal");
		bcSettingsFrame.importButton:SetHighlightFontObject("GameFontHighlight");
	end
	addonTbl.isSettingsFrameShown = true; -- Let's the addon known that the player is actively looking at the options menu.
	bcSettingsFrame.CloseButton:SetScript("OnClick", function(self)
		addonTbl.OnClose();
	end);
	bcSettingsFrame:Show(); bcSettingsFrame:Show(); -- TODO: Test if the second Show() function call is necessary.
	PlaySound(SOUNDKIT.IG_QUEST_LOG_OPEN);
end