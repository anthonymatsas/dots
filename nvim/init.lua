-- ~/.config/nvim/init.lua

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars:append {
    tab = "|-",
    space = "-",
    trail = "~"
}
-- vim.opt.relativenumber = true
-- vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.cmdheight = 0

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")

-- Basic keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("i", "jj", "<Esc>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
    virtual_text = {
        enabled = true,
        source = "if_many",
        prefix = "x",
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    serverity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""
    }
})

-- Python-specific settings (use tabs instead of spaces)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.expandtab = false  -- Use tabs, not spaces
        vim.opt_local.tabstop = 4        -- Tab width is 4
        vim.opt_local.shiftwidth = 4     -- Indent width is 4
        vim.opt_local.softtabstop = 4    -- Backspace removes 4 spaces
    end,
})

-- Go-specific settings (use tabs per Go convention)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.expandtab = false  -- Use tabs, not spaces (Go standard)
        vim.opt_local.tabstop = 4        -- Tab width is 4
        vim.opt_local.shiftwidth = 4     -- Indent width is 4
        vim.opt_local.softtabstop = 4    -- Backspace removes 4 spaces
    end,
})

-- Format Go files on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
