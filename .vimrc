call plug#begin('~/.vim/plugged')
"主题插件
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
"文件树
Plug 'preservim/nerdtree'
"状态栏airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"代码自动注释
Plug 'preservim/nerdcommenter'
"C++高亮插件
"Plug 'octol/vim-cpp-enhanced-highlight'
"fzf模糊查找工具
Plug 'junegunn/fzf'
"LeaderF文件快速查找
"if has('win32')
"    Plug 'yggdroot/leaderf', { 'do': '.\install.bat' }
"elseif has('unix')
"    Plug 'yggdroot/leaderf', { 'do': './install.sh' }
"endif
"COC自动补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
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
"ALE lint
"Plug 'dense-analysis/ale'
"多行编辑插件
Plug 'mg979/vim-visual-multi'

call plug#end()
"设置配色
colorscheme onedark
"映射配置文件的快捷键
if has('win32')
    map rc <ESC>:e $HOME\_vimrc<CR>
elseif has('unix')
    map rc <ESC>:e $HOME/.vimrc<CR>
endif
"设置编码
set encoding=utf-8
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
"set "nohlsearch"
"set incsearch
"set ignorecase
"set smartcase
"NERDTree快捷方式
map ff <ESC>:FZF<CR>
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


