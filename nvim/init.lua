require("config.lazy")

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.showmode = false
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.modeline = true
vim.opt.modelines = 3
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.wrap = true
vim.opt.textwidth = 0
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes:2"
vim.opt.list = true
vim.opt.listchars = {
    tab = "»-",
    trail = "-",
    extends = "»",
    precedes = "«",
    nbsp = "%",
    eol = "↲",
}
vim.opt.mouse = "a"
vim.opt.clipboard:append { "unnamedplus" }

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.infercase = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false

vim.o.diffopt = "internal,filler,algorithm:histogram,indent-heuristic"
