local appBindings = {
	["q"] = "alacritty",
	["a"] = "VSCodium",
	["z"] = "Firefox",
	["w"] = "Zoom.us",
	["s"] = "Slack",
	["x"] = "Brave Browser",
	["e"] = "Al Quran",
	["d"] = "Notion",
	["c"] = "Todoist",
	["v"] = "UTM",
	["f"] = "Calibre",
	["j"] = "Yaak",
}

for key, appName in pairs(appBindings) do
	hs.hotkey.bind({ "option" }, key, function()
		hs.application.launchOrFocus(appName)
	end)
end
