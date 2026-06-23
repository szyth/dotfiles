local appBindings = {
	["q"] = "alacritty",
	["a"] = "Notion",
	["z"] = "Firefox",
	["w"] = "claude",
	["s"] = "Todoist",
	["x"] = "Brave Browser",

	["j"] = "Yaak",
	["k"] = "Zoom.us",
	["l"] = "Slack",
}

for key, appName in pairs(appBindings) do
	hs.hotkey.bind({ "option" }, key, function()
		hs.application.launchOrFocus(appName)
	end)
end
