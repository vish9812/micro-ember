-- WezTerm configuration used only for rendering the README screenshots.
--
-- It mirrors ~/.wezterm.lua's look — VictorMono Nerd Font at 18, no window
-- padding, a wallpaper layer dimmed to 10% — but pins the parts the real
-- config randomises or inherits, so re-rendering produces the same picture
-- rather than whichever wallpaper came up that time.
--
-- Used by demo/capture.sh; not meant for daily use.

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Xvfb provides no GLX, so the hardware front end cannot start there.
config.front_end = "Software"

config.font = wezterm.font("VictorMono Nerd Font")

-- ~/.wezterm.lua runs at 18, which gives a 1352x1190 capture — more pixels than
-- a README thumbnail can use, and a nearly square shot reads small in a grid.
-- 14 keeps every one of the sample's 35 rows at about half the pixel count.
config.font_size = 14.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Nothing here but the editor: no tab bar, no decorations, and a size that
-- fits the sample file plus micro's status line exactly.
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.initial_cols = 104
config.initial_rows = 35

-- The point of the exercise. ember's transparent schemes set no background of
-- their own, so this layer is what shows through the editor area, while the
-- chrome the scheme does paint stays solid on top of it.
config.text_background_opacity = 1.0
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/Pictures/terminal/samurai-silhouette-3840x2160-24349.png",
		},
		hsb = {
			brightness = 0.1,
		},
	},
}

return config
