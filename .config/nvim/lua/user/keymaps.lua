--local term_opts = { silent = true }

-- Shorten function name
-- local map = vim.api.nvim_set_keymap
local map = function(mode, bind, action)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, bind, action, opts)
end

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "<Left>", ":vert res -5<CR>")
map("n", "<Down>", ":res +5<CR>")
map("n", "<Up>", ":res -5<CR>")
map("n", "<Right>", ":vert res +5<CR>")

-- map("n", "<leader>e", ":Lex 30<cr>")
-- Nvimtree
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- map("n", "<leader>b", "gcc")

-- Navigate buffers
map("n", "J", ":BufferPrevious<CR>")
map("n", "K", ":BufferNext<CR>")

map("n", "Y", "y$")

map("n", "<leader>cd", ":cd %:p:h<CR>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- map("n", "J", "mzJ`z")

-- Space q to quit
-- map("n", "<leader>q", ":q <CR>")
map("n", "<leader>q", ":Bdelete<CR>")
map("n", "<leader>/", "gcc")
-- Replace all occurrences of a word
map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/")
-- map("n", "U", '/<C-r><C-w><CR>')

-- Close current buffer
map("n", "Q", ":Bdelete<CR>")

map("n", "<ESC>", ":noh<CR><ESC>")

map("n", "p", "p==")
map("n", "<C-s>", ":w<CR>")

-- Insert --
-- Press jk fast to enter
-- map("i", "jk", "<ESC>")

map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "[", "[<C-g>u")
map("i", "{", "{<C-g>u")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "J", ":m .+1<CR>==")
map("v", "K", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv=gv")
map("x", "K", ":move '<-2<CR>gv=gv")

map("n", "<leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<c-t>", "<cmd>Telescope live_grep<cr>")

-- map("n", "<leader>t", ":TroubleToggle<CR>")
-- map("n", "<leader>t", ":ToggleTerm<CR>")
map("n", "<leader>t", ':silent !bspc rule -a St state=floating -o && st -e zsh -is eval "cd $(pwd)" & <CR>')

-- Set up `f` as general hop hotkey to hint character
map("n", "s", ":HopWord<CR>")
map("n", "z", ":HopChar1<CR>")
-- map("n", "t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>")
-- map("n", "T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>")
map("n", "S", ":HopLine<CR>")
-- Set up actions in normal mode
local actions = { "d", "c", "<", ">", "y" }
for _, a in ipairs(actions) do
  map("n", a .. "s", a .. ":HopWord<CR>")
  map("n", a .. "z", a .. ":HopChar1<CR>")
  map("n", a .. "S", a .. ":HopLine<CR>")
  -- map("n", a .. "L", a .. "<cmd>lua require'hop'.hint_char1()<cr>")
end
