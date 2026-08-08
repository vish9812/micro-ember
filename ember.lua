VERSION = "1.0.0"

local config = import("micro/config")

function init()
	-- Registers every .micro file in colorschemes/ as a runtime colorscheme,
	-- so they show up in `set colorscheme` completion exactly like the ones
	-- built into micro.
	config.AddRuntimeFilesFromDirectory("ember", config.RTColorscheme, "colorschemes", "*.micro")
	config.AddRuntimeFile("ember", config.RTHelp, "help/ember.md")
end
