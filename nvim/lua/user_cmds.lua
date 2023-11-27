vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})
local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
