-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- disable title bar
-- config.window_decorations = "RESIZE"

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'

-- Default dir is home
config.default_cwd = '/Users/naafiyan/home'

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14.0

config.keys = {
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'CMD | SHIFT',
    action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' }
},
  {
    key = '`',
    mods = 'CTRL',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'W',
    mods = 'SUPER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'D',
    mods = 'SUPER | SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
	},
 {
    key = 'L',
    mods = 'SUPER | SHIFT',
    action = act.ActivatePaneDirection 'Next',
  },
 {
    key = 'H',
    mods = 'SUPER | SHIFT',
    action = act.ActivatePaneDirection 'Prev',
  },
  {
    key = 'RightArrow',
    mods = 'SUPER | SHIFT',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'SUPER |SHIFT',
    action = act.ActivateTabRelative(-1),
  },
  {
	  key = 'T',
	  mods = 'SUPER | SHIFT',
	  action = act.SpawnCommandInNewTab {
		  cwd = "/Users/naafiyan/home"
	  },
  }
}

local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)


-- and finally, return the configuration to wezterm
return config

