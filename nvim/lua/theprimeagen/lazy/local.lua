local local_plugins = {
	--{
	--    "vim-guys",
	--    dir = "~/personal/vim-guys",
	--    config = function()
	--    end,
	--},
	--{
	--    "cockpit",
	--    dir = "~/personal/cockpit",
	--    config = function()
	--        require("cockpit")
	--        vim.keymap.set("n", "<leader>ct", "<cmd>CockpitTest<CR>")
	--        vim.keymap.set("n", "<leader>cr", "<cmd>CockpitRefresh<CR>")
	--    end,
	--},

	-- {
	-- 	"the-stru",
	-- 	dir = "~/personal/the-stru",
	-- },
	-- {
	-- 	"cursor_agent",
	-- 	dir = "~/personal/cursor_in_neovim/",
	-- 	dependencies = { "nvim-lua/plenary.nvim" }, -- optional, improves HTTP; falls back to curl if absent
	-- 	config = function()
	-- 		require("cursor_agent").setup({
	-- 			-- optional config
	-- 			ui = {
	-- 				width = 60, -- panel width in columns
	-- 				input_height = 3, -- input box height
	-- 				border = "rounded",
	-- 			},
	-- 			provider = {
	-- 				name = "openai", -- or "anthropic"
	-- 				openai = {
	-- 					model = "gpt-4o-mini",
	-- 				},
	-- 				anthropic = {
	-- 					model = "claude-3-5-sonnet-20240620",
	-- 					version = "2023-06-01",
	-- 					max_tokens = 1024,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"caleb",
		dir = "~/personal/caleb",
		config = function() end,
	},
	{
		"harpoon",
		dir = "~/.config/nvim/personal-harpoon",
		config = function()
			local harpoon = require("harpoon")
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			harpoon.setup({})

			vim.keymap.set("n", "<leader>a", function()
				mark.add_file()
			end)
			vim.keymap.set("n", "<C-e>", function()
				ui.toggle_quick_menu()
			end)

			vim.keymap.set("n", "<C-h>", function()
				ui.nav_file(1)
			end)
			vim.keymap.set("n", "<C-t>", function()
				ui.nav_file(2)
			end)
			vim.keymap.set("n", "<C-n>", function()
				ui.nav_file(3)
			end)
			vim.keymap.set("n", "<C-s>", function()
				ui.nav_file(4)
			end)
		end,
	},
	{
		"vim-with-me",
		dir = "~/personal/vim-with-me",
		config = function() end,
	},
}

return local_plugins
