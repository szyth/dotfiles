local appBindings = {
	["q"] = "alacritty",
	["a"] = "obsidian",
	["z"] = "Firefox",
	["w"] = "claude",
	["s"] = "Todoist",
	["x"] = "Brave Browser",
	["e"] = "KeePassXC",

	["d"] = "Notion",

	["j"] = "Yaak",
	["k"] = "Zoom.us",
	["l"] = "Slack",
}

for key, appName in pairs(appBindings) do
	hs.hotkey.bind({ "option" }, key, function()
		hs.application.launchOrFocus(appName)
	end)
end

-- Window management (Rectangle-style), Ctrl+Alt shortcuts
-- fn receives (currentFrame, screenFrame) and returns the new frame to apply
local function windowAction(fn)
	return function()
		local win = hs.window.focusedWindow()
		if not win then return end
		win:setFrame(fn(win:frame(), win:screen():frame()))
	end
end

local layouts = {
	-- halves: arrow keys
	leftHalf    = { { "ctrl", "alt" }, "left",   function(_, s) return { x = s.x, y = s.y, w = s.w / 2, h = s.h } end },
	rightHalf   = { { "ctrl", "alt" }, "right",  function(_, s) return { x = s.x + s.w / 2, y = s.y, w = s.w / 2, h = s.h } end },
	topHalf     = { { "ctrl", "alt" }, "up",     function(_, s) return { x = s.x, y = s.y, w = s.w, h = s.h / 2 } end },
	bottomHalf  = { { "ctrl", "alt" }, "down",   function(_, s) return { x = s.x, y = s.y + s.h / 2, w = s.w, h = s.h / 2 } end },

	-- quarters: U/I/J/K
	topLeft     = { { "ctrl", "alt" }, "u",      function(_, s) return { x = s.x, y = s.y, w = s.w / 2, h = s.h / 2 } end },
	topRight    = { { "ctrl", "alt" }, "i",      function(_, s) return { x = s.x + s.w / 2, y = s.y, w = s.w / 2, h = s.h / 2 } end },
	bottomLeft  = { { "ctrl", "alt" }, "j",      function(_, s) return { x = s.x, y = s.y + s.h / 2, w = s.w / 2, h = s.h / 2 } end },
	bottomRight = { { "ctrl", "alt" }, "k",      function(_, s) return { x = s.x + s.w / 2, y = s.y + s.h / 2, w = s.w / 2, h = s.h / 2 } end },

	-- fill screen: Return
	maximize    = { { "ctrl", "alt" }, "return", function(_, s) return { x = s.x, y = s.y, w = s.w, h = s.h } end },
}

for _, layout in pairs(layouts) do
	local mods, key, fn = layout[1], layout[2], layout[3]
	hs.hotkey.bind(mods, key, windowAction(fn))
end
