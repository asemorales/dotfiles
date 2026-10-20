-- Neovim settings. Colours: colors/bierstadt.lua

local opt = vim.opt

opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 4
opt.undofile = true
opt.wrap = true
opt.linebreak = true
opt.fillchars = { eob = " ", vert = "│" }
opt.laststatus = 3
opt.showmode = false

-- Quiet status line: file name on the left, position on the right.
opt.statusline = "  %f %m%r%=%{&filetype}   %l:%c  "

-- Match the room bierstadt-mode last chose (dark or light).
local function bierstadt_room()
  local f = io.open(vim.fn.expand("~/.local/state/bierstadt/mode"))
  local mode = f and f:read("*l") or "dark"
  if f then f:close() end
  return mode == "light" and "light" or "dark"
end

local function apply_room()
  local bg = bierstadt_room()
  if vim.o.background ~= bg or vim.g.colors_name ~= "bierstadt" then
    vim.o.background = bg
    vim.cmd("colorscheme bierstadt")
  end
end

opt.termguicolors = true
apply_room()

-- Pick up a `bierstadt-mode toggle` when you come back to the window.
vim.api.nvim_create_autocmd("FocusGained", { callback = apply_room })

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
