--local term_opts = { silent = true }

-- Shorten function name
-- local map = vim.api.nvim_set_keymap
local map = function (mode,bind,action)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode,bind,action,opts)
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
map("n", "<leader>h", ":vert res -5<CR>")
map("n", "<leader>j", ":res +5<CR>")
map("n", "<leader>k", ":res -5<CR>")
map("n", "<leader>l", ":vert res +5<CR>")

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
map("n", "<leader>r", ':%s/\\<<C-r><C-w>\\>/')
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
-- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>")
-- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")

-- map("n", "<leader>", ":<c-u>LeaderGuide '<space>'<CR>")
-- let mapleader = '\<Space>'
-- nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
-- vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
