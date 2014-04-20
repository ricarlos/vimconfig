" syntax on {{{"{{{"}}}
if has("syntax")
  syntax on
endif
" }}}

" 模式配置 {{{
set ignorecase          " 搜索模式忽略大小写
set smartcase           " 如果搜索模式里包含大小写，不使用ignorecase

set autowrite

set showmatch           " 设置匹配模式，显示匹配括号
set linebreak           " 设置整词换行
set mouse=a             " 使用鼠标
set number              " 显示行号
set history=50          " 历史记录50条
set showcmd             " 命令行显示输入的命令
set showmode            " 命令行显示vim当前模式

" Configuration file for vim
set modelines=1		" CVE-2007-2438 vim可以解析文档里的配置 如 vim:fdm=marker

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

set nocompatible	" be Improved, required
filetype off		" required
" }}}

" Plugin {{{
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

" alternatively, pass a path where Vundle should install plugins
" let path = '~/some/path/here'
" call vundle#rc(path)

" let Vundle manage Vundle, require 'gmarik/vundle'
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on
" scripts on Github repos
Plugin 'taglist.vim'
Plugin 'l9'
Plugin 'fuzzyfinder'
Plugin 'omnicppcomplete'
Plugin 'minibufexplorerpp'
Plugin 'winmanager'
Plugin 'SuperTab'
Plugin 'scrooloose/nerdtree'
Plugin 'echofunc.vim'

filetype plugin indent on	" required
" }}}

" 代码折叠 {{{
set foldmethod=syntax
set foldlevel=0
set foldcolumn=5
" }}}

" ctags setting {{{
" F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5><ESC> :!ctags -R -c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
" }}}

" 智能补全设置 {{{
set completeopt=menu,menuone   " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot=1   " autocomplete with .
let OmniCpp_MayCompleteArrow=1 " autocomplete ->
let OmniCpp_MayCompleteScope=1 " autocomplete ::
let OmniCpp_SelectFirstItem=2  " select first item, but don't insert
let OmniCpp_NamespaceSearch=2  " search namespace in this and included files
let OmniCpp_ShowPrototypeInAbbr=1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1   " enable the global scope search
let OmniCpp_DisplayMode=1      " class scope completion mode: always show all members
let OmniCpp_ShowScopeInAbbr=1  " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1
" }}}

" Taglist配置 {{{
let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=1   " 让窗口显示在右边， 0显示在左边
let Tlist_Show_One_File=0      " 让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1  " 非当前文件，函数列表折叠
let Tlist_Exit_OnlyWindow=1    " 当taglist是最后一个分割窗口是自动退出vim
let Tlist_Process_File_Always=1   " 实时更新tags 0表示不实时更新
let Tlist_Inc_Winwidth=0
" }}}

" WinManager setting {{{
let g:winManagerWindowLayout='FileExplorer|TagList' " 设置需要管理的插件
nmap wm :WMToggle<cr>
" }}}

" MiniBufferExplorer setting {{{
let g:miniBufExplMapWindowNavVim=1 " 按下ctrl+h/j/k/l 切换当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrow=1 " 按下ctrl+箭头 切换窗口
let g:miniBufExplMapCTabSwitchBufs=1 " ctrl+tab移动到下一个bufer并在当前窗口打开 ctrl+shift+tab移动到上一个
				     " buffer并在当前窗口打开
let g:miniBufExplModeSelTarget=1   " 不要在不可编辑内容的窗口打开选中buffer（比如taglist窗口）
"}}}

" vim:fdm=marker
