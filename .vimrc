set nocompatible
"开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
syntax keyword cppSTLtype initializer_list
"set clipboard=unnamedplus

let mapleader="\\"
"set term=ansi
" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap  <Leader>y "+y
" " 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <leader>p "+p


"vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" 配色方案
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

"禁止光标闪烁
"set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

"总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set wrap

let g:Powerline_colorscheme='solarized256'

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" ycm 和 backspace 相兼容
set backspace=indent,eol,start
"**************************************************************
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <silent> <F10> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"*************************************************************
" 显示/隐藏 MiniBufExplorer 窗口
map <silent> <F11> :MBEToggle<CR>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
"************************************************************
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
"************************************************************
"大纲浏览 TagBar
"按F9即可打开tagbar界面
nmap <silent> <F9> :TagbarToggle<CR>
" "设置tagbar的宽度为30列，默认40
let g:tagbar_width = 30     
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1


" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5


"UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"] 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
