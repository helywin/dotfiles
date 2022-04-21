call plug#begin('~/.config/nvim/plugged')
"主题插件
"Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
"文件树
Plug 'preservim/nerdtree'
"状态栏airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"代码自动注释
Plug 'preservim/nerdcommenter'
"fzf模糊查找工具
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
"LeaderF文件快速查找
"if has('win32')
"    Plug 'yggdroot/leaderf', { 'do': '.\install.bat' }
"elseif has('unix')
"    Plug 'yggdroot/leaderf', { 'do': './install.sh' }
"endif
"COC自动补全插件
"Plug 'neoclide/coc.nvim'
"根据clangd高亮代码插件
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Git集成插件
Plug 'tpope/vim-fugitive'
"Git行列标记插件
Plug 'airblade/vim-gitgutter'
"Python自动补全
"Plug 'davidhalter/jedi-vim'
"Doxygen插件
Plug 'babaybus/doxygentoolkit.vim'
"YouCompleteMe插件
"Plug 'ycm-core/youcompleteme'
"驼峰拼写检查
"Plug 'kamykn/spelunker.vim'
"Plug 'dense-analysis/ale'
"多行编辑插件
"Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-multiple-cursors'
"格式化代码工具
Plug 'chiel92/vim-autoformat'

"Plug 'ajh17/vimcompletesme'

"快速修改两边的括号或者引号
"Plug 'tpope/vim-surround'

"模板配置
Plug 'tibabit/vim-templates'
"括号自动对齐补全
Plug 'LunarWatcher/auto-pairs', {'branch': 'develop-4.0.0'}

"大纲插件
Plug 'preservim/tagbar'

"工作空间管理
"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'mhinz/vim-startify'

"telescope插件
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


"LSP
Plug 'neovim/nvim-lspconfig'

"LSP补全
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

" LSP异步查找
"Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" kitty配置语法
Plug 'fladson/vim-kitty'
Plug 'editorconfig/editorconfig-vim'

"Plug 'voldikss/vim-floaterm'

"icons
Plug 'ryanoasis/vim-devicons'

"
Plug 'Pocco81/AutoSave.nvim'
"markdown预览插件
Plug 'iamcco/markdown-preview.nvim'
"Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'
call plug#end()

" nvim lsp配置,包括跳转和语法补全等
"set completeopt=menu,menuone,noselect

"require'lspconfig'.clangd.setup{}
lua << EOF
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'ccls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    init_options = {
        highlight = {
        lsRanges = true;
      }
    },
    capabilities = capabilities,
  }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- 弹出补全菜单时的键盘映射
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require('telescope').setup{
   defaults = {
       vimgrep_arguments = {
           'rg',
           '--with-filename',
           '--line-number',
           '--column',
           '--smart-case',
           '--ignore-file',
           '.gitignore'
       }
   }
}
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF

"256色设置
set t_Co=256
"设置配色
set background=dark
colorscheme onedark

set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h14,\ Noto\ Sans\ Mono\ CJK\ SC:h14
"set guifontwide=Noto\ Sans\ Mono:h15
"onedark设置
let g:onedark_termcolors=256
"映射配置文件的快捷键
if has('win32')
    :command RC e $HOME/_vimrc
elseif has('unix')
    :command RC e $HOME/.config/nvim/init.vim
endif
"设置编码
lang message zh_CN.UTF-8
set encoding=utf-8
set hidden
"代码高亮
syntax on
"语言
"language C
"向下兼容vi
set nocompatible
filetype on
filetype indent on
filetype plugin on
"设置缩进为空格
let &t_ut=''
set expandtab
"配置缩进宽度
set tabstop=4
set shiftwidth=4
set softtabstop=4
"行末显示$
set list
"开启退格跨行
set backspace=indent,eol,start
"自动缩进
set autoindent
"设置字体
"set guifont=consolas:h12:cANSI:qDRAFT
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决console输出乱码
"language message zh_CN.utf-8
"设置相对行号
set number
set relativenumber
"设置突出显示光标所在行列
set cursorline
"set cursorcolumn
"自动换行
set wrap
"设置显示输入命令
set showcmd
"设置输入命令时候Tab显示提示
set wildmenu
"查找选项和高亮
set hlsearch
"set nohlsearch
"set incsearch
"set ignorecase
"set smartcase
"NERDTree快捷方式
"查找git跟踪的文件
map ff <ESC>:Telescope git_files<CR>
"查找所有文件
map fF <ESC>:Telescope find_files<CR>
"设置空格选中单个词语
nmap <space> viw
"设置行号宽度为6, 防止clangd报错时页面会左右整体移动, 结果证明不管用
"set nuw=6
"设置状态栏显示分支名称
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
"设置拼写检查
set nospell
set spelllang=en_us,cjk
"设置一行最多100个字符
set tw=100
"YouCompleteMe设置
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_collect_identifiers_from_comments_and_strings=1
"let g:ycm_seed_identifiers_with_syntax=1
"Spelunker设置
"let g:enable_spelunker_vim=1
"关闭工具栏和菜单栏
set guioptions-=m
set guioptions-=T
" 编辑模式移动光标
"nmap <C-h> :w<CR><C-w>h
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> bnext<CR>
nmap <C-k> bprev<CR>
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

function! MoveLeft()
    call feedkeys(":w\<CR>")
    call feedkeys("\<C-w>h")
endfunction
" cnoremap <c-h> <left>
" cnoremap <c-j> <down>
" cnoremap <c-k> <up>
" cnoremap <c-l> <right>
"inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

"Don't pass message to |ins-completion-menu|.
set shortmess+=c
set updatetime=300
set cmdheight=2
"解决clangd报错页面整体移动的问题
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

set ts=4
set expandtab
"airline配置
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty= '*'

" 大括号自动分行, C/C++下的自动命令, 添加到 .vimrc
"autocmd BufWritePre,BufRead *.c :inoremap <Enter> <c-r>=BracketsEnter('}')<CR>
"autocmd BufWritePre,BufRead *.cpp :inoremap <Enter> <c-r>=BracketsEnter('}')<CR>

"function BracketsEnter(char)
"    if getline('.')[col('.')-1] == a:char
"        return "\<Enter>\<Tab>\<Esc>mpa\<Enter>\<Esc>`pa" 
"    else
"        return "\<Enter>"
"    endif
"endf
"设置自动保存
set autowriteall
"ctrlspace插件快捷方式
nmap <C-SPACE> :CtrlSpace<CR>
"let g:CtrlSpaceDefaultMappingKey = "<C-Space>"
"
" c++ 语法高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"模板设置
let g:tmpl_author_email = 'jiang770882022@hotmail.com'
let g:tmpl_author_name = 'helywin'

"neovide
"let g:neovide_fullscreen=v:true

autocmd InsertLeave * :silent !fcitx5-remote -c " 退出插入模式时禁用输入法
autocmd BufCreate *  :silent !fcitx5-remote -c " 创建 Buf 时禁用输入法
autocmd BufEnter *  :silent !fcitx5-remote -c " 进入 Buf 时禁用输入法
autocmd BufLeave *  :silent !fcitx5-remote -c " 离开 Buf 时禁用输入法


let g:AutoPairsCompatibleMaps = 0
"let g:AutoPairsMapBS = 1
"let AutoPairsMultilineBackspace = 1
inoremap <C-w> <C-w><DEL>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
