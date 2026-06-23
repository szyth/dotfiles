local appBindings = {
	["q"] = "alacritty",
	["a"] = "VSCodium",
	["z"] = "Firefox",
	["w"] = "Zoom.us",
	["s"] = "Slack",
	["x"] = "Brave Browser",
	["e"] = "claude",
	["d"] = "Notion",
	["c"] = "Todoist",
	["f"] = "Calibre",
	["v"] = "UTM",
	["j"] = "Yaak",
	["k"] = "Al Quran",
}

for key, appName in pairs(appBindings) do
	hs.hotkey.bind({ "option" }, key, function()
		hs.application.launchOrFocus(appName)
	end)
end
