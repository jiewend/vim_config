set nocompatible
" set hlsearch
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
"主题
Plugin 'tomasr/molokai'
"未知作用
Plugin 'vim-scripts/phd'
"状态栏
Plugin 'Lokaltog/vim-powerline'
"C++语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'
"缩进提示线
Plugin 'nathanaelkane/vim-indent-guides'
"接口与实现快速切换
"Plugin 'derekwyatt/vim-fswitch'
" 代码收藏
" Plugin 'kshenoy/vim-signature'
" 让书签行高亮
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"基于标签的标识符列表
"Plugin 'majutsushi/tagbar'
"下面三个都是周期性生成标签文件
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"全局搜索
Plugin 'dyng/ctrlsf.vim'
"替换功能
Plugin 'terryma/vim-multiple-cursors'
"快速开关注释
Plugin 'scrooloose/nerdcommenter'
"ACSII风格的注释
"Plugin 'vim-scripts/DrawIt'
"模板补全
Plugin 'SirVer/ultisnips'
"核武器，智能补全
Plugin 'Valloric/YouCompleteMe'
"快速生成代码框架
"Plugin 'derekwyatt/vim-protodef'
"工程管理
Plugin 'scrooloose/nerdtree'

"多文档操作
Plugin 'fholgado/minibufexpl.vim'
"快速编辑结对符
"Plugin 'gcmt/wildfire.vim'
"支持分支撤销
"Plugin 'sjl/gundo.vim'
"快速移动光标
Plugin 'Lokaltog/vim-easymotion'
" 中/英输入平滑切换
"Plugin 'lilydjwg/fcitx.vim'
Plugin 'kien/ctrlp.vim'
"快速打开文件
" Bundle 'EasyGrep'
"当前文件内搜索


": 插件列表结束
call vundle#end()
filetype plugin indent on



" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
"配色方案
set background=dark
" colorscheme solarized
colorscheme molokai
" colorscheme phd
"
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

" 高亮显示搜索结果
set hlsearch
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
"配合使用快速注释
let g:NERDSpaceDelims=1
"配合模板补全使用
let g:UltiSnipsSnippetDirectories=["mysnippets"] 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"配合工程管理
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
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
"配合多文档操作
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
"配合跨文件搜索
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
"重设替换快捷键
"
"精确替换函数开始
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'bufdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
"精确替换函数结束
"配合快速打开文件使用
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$',
  \ }
set sw=4
set ts=4

nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

