function EPGPexport_OnLoad()
	SLASH_EPGPEXPORT1 = "/epgpexport" 
	SLASH_EPGPEXPORT2 = "/epgpex" 
	SlashCmdList["EPGPEXPORT"] = EPGPexport_exportData
end

function EPGPexport_exportData()
	EPGPexportData = {}	
	epgpextract = "^(%d+)/(%d+)"

	for i = 1, GetNumGuildMembers(true) do
		local name, _, _, _, class, _, _, officernote, _, _ = GetGuildRosterInfo(i)
		local _, _, ep, gp = string.find(officernote, epgpextract)
		ratio = ep / gp
		EPGPexportData[name] = "EP: " .. ep.. " - GP: " .. gp .. " - Ratio: " .. ratio
	end
	DEFAULT_CHAT_FRAME:AddMessage("EP GP exported to WTF\\Account\\ACCOUNTNAME\\SavedVariables\\EPGPexportData.lua", 1, 1, 0)
	DEFAULT_CHAT_FRAME:AddMessage("Reload UI or Logout to save the file", 1, 1, 0)
end
