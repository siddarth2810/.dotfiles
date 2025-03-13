-- ~/.config/nvim/after/plugin/git-worktree.lua

vim.g.git_worktree = {
    -- log_level = "DEBUG",
    change_directory_command = "cd",
    update_on_change = false,
    update_on_change_command = "",
    clearjumps_on_change = true,
    confirm_telescope_deletions = true,
    autopush = false,
}

require("telescope").load_extension("git_worktree")

local Hooks = require("git-worktree.hooks")
Hooks.register(Hooks.type.CREATE, function(path, branch, upstream)
    require("plenary.job")
        :new({
            command = "git",
            args = { "submodule", "update", "--recursive", "--init" },
            cwd = path,
        })
        :start()
end)

-- Optional: Uncomment this if you want to update the current buffer when switching worktrees
-- Note: This overrides the update_on_change = false setting
Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)

-- Automatically open Telescope git_worktree if starting Neovim in a bare Git repository with no arguments
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() > 0 then
            -- Skip if opening a specific file
            return
        end
        for _, arg in ipairs(vim.v.argv) do
            if arg == "+Man!" then
                -- Skip if opening as a manpage
                return
            end
        end
        local cmd = "git rev-parse --is-bare-repository"
        if vim.fn.system(cmd) == "true\n" then
            require("telescope").extensions.git_worktree.git_worktree()
        end
    end,
})
