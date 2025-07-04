vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In vim we would have nnoremap("key", "function")
-- In lua we have vim.keymap.set("n", "key", "function")

-- Makes you able to move highlighted text up and down
-- after having highlighted it.
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Keeps the cursor in the middle while doing half-page jumps.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete the highlighted word into the void registry and then paste
-- so that we don't loose the already copied content.
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Note that we also could have used "v" mode here.

-- Copy to clipboard registry
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Make control-v paste and then start inserting at the end of the paste.
vim.keymap.set("i", "<C-v>", [[<ESC>"+gpa]])
vim.keymap.set("n", "<C-v>", [["+gp]])

-- Disable legacy Ex mode, which you can only exit from by typing visual<CR>
vim.keymap.set("n", "Q", "<nop>")

-- Command to replace the current word under the cursor with whatever
-- in the entire file.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Command to make the current file executable.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Keep visual block selected while indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Buffer commands
vim.keymap.set("n", "<leader>bs", ":buffers<CR>:b")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
vim.keymap.set("n", "<leader>bo", ":bnext<CR>")
vim.keymap.set("n", "<leader>bi", ":bprev<CR>")

vim.keymap.set("n", "<leader><leader>", ":w<CR>")

-- Uses RE2-like regex syntax instead of all the \-es
vim.keymap.set("c", "s/", "s/\\v")
-- Turns on the same "very magic" syntax as above for normal search
vim.keymap.set("n", "/", "/\\v")

-- Mark all text for copying
vim.keymap.set("n", "<C-A>", "ggVG")

-- Make Control backspace remove a word in insert mode
vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-H>", "<C-W>")
