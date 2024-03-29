require("obsidian").setup({
	-- workspaces = {
	-- 	{
	-- 		name = "main",
	-- 		path ="~/home/Vault/"
	-- 	}
	-- },
	detect_cwd = true,
	completion = {
		-- Set to false to disable completion.
		nvim_cmp = true,

		-- Trigger completion at 2 chars.
		min_chars = 2,

		-- Where to put new notes created from completion. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",

		-- Control how wiki links are completed with these (mutually exclusive) options:
		--
		-- 1. Whether to add the note ID during completion.
		-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
		-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
		prepend_note_id = false,
		-- 2. Whether to add the note path during completion.
		-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
		-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
		prepend_note_path = true,
		-- 3. Whether to only use paths during completion.
		-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
		-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
		use_path_only = false,
	  },
	   -- Optional, customize how names/IDs for new notes are created.
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,
})

vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })

vim.keymap.set("n", "<localleader>p", "<cmd>ObsidianPasteImg<CR>")
