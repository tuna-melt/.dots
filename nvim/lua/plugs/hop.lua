Plug("phaazon/hop.nvim")

vim.after.start_hop = function()
	require("hop").setup()

    -- keyboard shortcuts
	keymap("n", "<leader>ee", "<cmd> HopWord<cr>", {})
	keymap("v", "<leader>ee", "<cmd> HopWord<cr>", {})
	keymap("n", "<leader>ew", "<cmd> HopLine<cr>", {})
	keymap("v", "<leader>ew", "<cmd> HopLine<cr>", {})

    -- keymap for word end jump
    local lua_require = "<cmd> lua require'hop'.hint_words"
	local props = "({ hint_position = require'hop.hint'.HintPosition.END })"
	keymap("n", "<leader>es", lua_require .. props .. "<cr>", {})
	props = "({ hint_position = require'hop.hint'.HintPosition.END })"
	keymap("v", "<leader>es", lua_require .. props .. "<cr>", {})

    -- color overrides
	nvim_cmd("hi default link HopUnmatched Comment")
	nvim_cmd("hi HopNextKey gui=bold guifg=" .. vim.g.terminal_color_1)
	nvim_cmd("hi HopNextKey1 gui=bold guifg=" .. vim.g.terminal_color_3)
	nvim_cmd("hi HopNextKey2 guifg=" .. vim.g.terminal_color_3)
end
