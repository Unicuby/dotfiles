local options = {
--	filetype = true, 
	-- convert tab to space
	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,

    --autoindent = true,
	--smart indentation
	--smartindent = true,

	-- display current mode
	showmode = true,
	-- display command
	showcmd = true,
	-- show status line but only on the bottom once and not for each instance
	laststatus = 3,

	--use terminal gui colors
	termguicolors = true,
	--display line numbers
	number = true,
	--draws line that limits column to 80 char
	colorcolumn = '80',
	--break on words when  line to long
	linebreak = true,
	--keep 5 lines displayed
	scrolloff = 5,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--opent netrw when - is pressed
--map("n", "-", ":sp<CR>:E<CR>", { silent = true })
--display cursorline
vim.o.cursorline = true


vim.cmd "colorscheme tokyonight"
vim.cmd "filetype plugin on"
vim.cmd "filetype plugin indent on"
vim.cmd "set list listchars=tab:»·,trail:·,eol:↩"
