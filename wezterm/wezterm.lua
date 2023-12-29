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
config.window_decorations = "RESIZE"

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'

-- Default dir is home
config.default_cwd = '/Users/naafiyan/home'

-- Font
config.font = wezterm.font("FiraCode Nerd Font",{weight="Regular", stretch="Normal", style="Normal"})

config.font_size = 13.0

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'CMD | SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 30 },
    },
  },
  {
    key = '`',
    mods = 'CTRL',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'w',
    mods = 'CMD | SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
	},
 {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  }
}

local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{
	domain = { DomainName = 'local' }
  }
  window:gui_window():maximize()
end)


-- and finally, return the configuration to wezterm
return config

