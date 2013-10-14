"~/.vimrc (configuration file for vim only)
"vim 插件使用bundle + git 进行管理
"安装插件:
" :BundleInstall
"更新插件:
" :BundleInstall!
"卸载不在列表中的插件:
" :BundleClean

filetype off

" Man.vim
source $VIMRUNTIME/ftplugin/man.vim

set rtp+=~/.vim/bundle/vundle/

" Add for go language filetype detect
set runtimepath+=$GOROOT/misc/vim
" set runtimepath+=~/.vim/bundle/gocode/vim
call vundle#rc()

" Vim plugin vundle manage {{{
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundle 'nsf/gocode', {'rtp': 'vim'}
" go 语言自动完成插件
Bundle 'nsf/gocode'
Bundle 'STL-improved'
Bundle 'majutsushi/tagbar'
Bundle 'tag_in_new_tab'
Bundle 'CmdlineComplete'

" 查找文件的插件
Bundle 'ctrlp.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ack.vim'
Bundle 'bash-support.vim'
Bundle 'slimv.vim'
Bundle 'adah1972/tellenc.git'
Bundle 'translate.vim'
Bundle 'bufexplorer.zip'
Bundle 'Conque-Shell'

" 快速导航文件
Bundle 'autopreview'
Bundle 'mbbill/echofunc.git'
Bundle 'grep.vim'
"Bundle 'vim-scripts/SrcExpl.git'
Bundle 'wesleyche/Trinity.git'
Bundle 'wesleyche/SrcExpl.git'
Bundle 'minibufexpl.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'

" 自动识别文件编码
Bundle 'FencView.vim'
Bundle 'CCTree'

" 必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails.git'
Bundle 'LargeFile'

"under linux need exec 'dos2unix ~/.vim/bundle/QFixToggle/plugin/qfixtoggle.vim'
Bundle 'QFixToggle'
Bundle 'Color-Sampler-Pack'
Bundle 'altercation/vim-colors-solarized'
Bundle 'txt.vim'
Bundle 'mru.vim'
Bundle 'YankRing.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'DoxygenToolkit.vim'
Bundle 'headerGatesAdd.vim'
Bundle 'ShowMarks'
Bundle 'Lokaltog/vim-powerline'

" 编程插件 {{{
" 代码段补全

" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'

Bundle 'autoload_cscope.vim'

" 代码注释
Bundle 'The-NERD-Commenter'

" 神级插件，ZenCoding可以让你以一种神奇而无比爽快的感觉写HTML、CSS
Bundle 'mattn/zencoding-vim.git'
" JS代码格式化插件
Bundle '_jsbeautify'

" 用全新的方式在文档中高效的移动光标，革命性的突破
Bundle 'Lokaltog/vim-easymotion'

" 显示行末的空格；
Bundle 'ShowTrailingWhitespace'

" 在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'
Bundle 'a.vim'

Bundle 'genutils'
" 文件查找
Bundle 'lookupfile'
Bundle 'OmniTags'
" Bundle 'neocomplcache'
" Bundle 'osyo-manga/neocomplcache-clang_complete'
" Bundle 'xptemplate'
" Bundle 'snipMate'
" Bundle 'Rip-Rip/clang_complete'

" 解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码。比xptemplate,snipMate
" 更优秀
Bundle 'SirVer/ultisnips.git'

" 如今最好的自动VIM自动补全插件
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

""}}}

" 智能打开文件的插件
Bundle 'shemerey/vim-peepopen.git'

" write HTML code faster
Bundle 'rstacruz/sparkup.git'
Bundle 'vim-surround.git'

" 多重色彩括号
Bundle 'vim-scripts/Rainbow-Parenthesis.git'
Bundle 'Townk/vim-autoclose'
"Bundle 'ColorSamplerPack'
Bundle 'ScrollColors'

filetype plugin indent on     " required!
"vundle end
""}}}

" 自定义快捷键 {{{
let mapleader=","   " 映射快捷键开始命令,缺省为'/'
let g:mapleader=","

nmap <leader>w :w!<cr>  " 快速保存
map <leader>q :q<cr>    " 快速退出
map <leader>wq :wq<cr>  " 快速保存并退出
nmap <silent> <leader><cr> :noh<cr> " Fast remove highlight search

" 快速打开 ipython
" map <leader>py :ConqueTermSplit ipython<CR>
" 快速打开 bash
" map <leader>sh :ConqueTermSplit bash<CR>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
autocmd! BufWritePost .vimrc source $HOME/.vimrc    " .vimrc编辑后重载
" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cdr :exe 'cd ' . OpenDir<cr>:pwd<cr>
nmap <silent> <leader>cdf :cd %:h<cr>:pwd<cr>

set pastetoggle=<F2>
" set the time(ms) break to refresh the preview window, I recommend 500ms~1000ms with good experience
set updatetime=500

" ack 快速查找，类似grep,但可以
" ubuntu install: sudo apt-get install ack-grep
let g:ackprg="/usr/bin/ack-grep -H --nogroup --column"

"/<C-R><C-W> : 把单个<cword>单词放入搜索或者命令行
nnoremap <silent> <F3> :Grep<CR>
" nnoremap <silent> <F4> :Rgrep<CR>
nmap  <F4> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
" make you could press F6 key to enable or disable the preview window, you can also set to other favorite hotkey here
nnoremap <F6> :AutoPreviewToggle<CR>
inoremap <F6> <ESC>:AutoPreviewToggle<CR>i

"map <F7> :!ctags -R --c++-kinds=+px --fields=+ilaS --extra=+q <cr>
"map <F9> :!find `pwd` \( -name .repo -o -name .git -o -name .svn -o -name cts -o -name out \) -prune -o -type f -iregex '.*\.\(c\|s\|cpp\|java\|h\)' >cscope.files <CR>
nmap <F7> :call RunShell("Generate tags", "ctags -R --c++-kinds=+px --fields=+ilaS --extra=+q `pwd`")<cr>
nmap <F9> :call RunShell("Generate cscope files and lookup tags", "~/.vim/shell/gencscope.sh && ~/.vim/shell/genfiletags.sh")<cr>
nmap <F12> :!cscope -bqk -i cscope.files <cr>

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=8<cr>

" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" use Meta key(Windows:Alt) to move cursor in insert mode.
" Note: if system install "Lingoes Translator",
"   you will need change/disabled hot key.
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon 'done'
endfunction

"}}}

" => Moving around, tabs and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry
" }}}

" fencview.vim 对打开的文件的编码自动识别 {{{
let g:fencview_autodetect = 1
" }}}

" Colors, encode and Fonts {{{
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

set encoding=utf8
try
    lang zh_CN
catch
endtry
set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""
hi Normal ctermbg=NONE  "开启背景透明
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
"colorscheme peaksea
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Gui选项{{{

 if has("gui_running")

     set guioptions-=m " 关闭菜单栏

     set guioptions-=T " 关闭工具栏

     set guioptions-=l " 关闭左边滚动条

     set guioptions-=L " 关闭垂直分隔窗口左边滚动条

     set guioptions-=r " 关闭右边滚动条

     set guioptions-=R " 关闭垂直分隔窗口右边滚动条

     set guifont=Monospace:12 "在Linux下设置字体的命令是：

     set guicursor=a:blinkon0 "停止光标闪烁

     set shell=/bin/bash

 endif

 "}}}

" }}}

" Basic setting {{{
"""""""""""""""""""""""""""""""""""""
" termencoding: Vim 所工作 的终端
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
let &termencoding=&encoding

set ambiwidth=double        " ambiwidth 默认值为 single。在其值为 single 时，
                            " 若 encoding 为 utf-8，gvim 显示全角符号时就会
                            " 出问题，会当作半角显示。
set backspace=indent,eol,start
                            " 不设定的话在插入状态无法用退格键和 Delete
                            " 键删除回车符
set backupcopy=yes          " 设置备份时的行为为覆盖

set confirm                 " 用确认对话框（对于 gvim）或命令行选项（对于
                            " vim）来代替有未保存内容时的警告信息
set display=lastline        " 长行不能完全显示时显示当前屏幕能显示的部分。
                            " 默认值为空，长行不能完全显示时显示 @。
set formatoptions=tcqro     " 使得注释换行时自动加上前导的空格和星号
set hidden                  " 允许在有未保存的修改时切换缓冲区，
                            " 此时的修改由切换由 vim 负责保存
set history=500             " 设置冒号命令和搜索命令的命令历史列表的长度为 100
"set mouse=a                " 设定在任何模式下鼠标都可用
set nobackup                " 覆盖文件时不备份
set nocompatible            " 设定 gvim 运行在增强模式下
set noignorecase            " 默认区分大小写
set nolinebreak             " 在单词中间断行
set number                  " 显示行号
set whichwrap=b,s,<,>,[,]   " 设定退格键、空格键以及左右方向键在行首行尾时的
                            " 行为，不影响 h 和 l 键
set wrap                    " 自动换行显示
"set autochdir              " 自动切换当前目录为当前文件所在的目录
set autoread                " 文件被其他程序修改时自动载入
syntax on                   " 自动语法高亮
"set noswapfile             " 不使用swap文件
set swapfile
set noerrorbells            " 关闭遇到错误时的声音提示
set writebackup             " 写备份但关闭vim后自动删除
set novisualbell            " 不要闪烁
set scrolljump =1           " 当光标达到上端或下端时 翻滚的行数
set sidescroll =5           " 当光标达到水平极端时 移动的列数
set scrolloff =5            " 当光标距离极端(上,下,左,右)多少时发生窗口滚
"set scrollbind             " 当使用vimdiff比较文件,相比较的比较文件同步滚动,但是splite分割窗口,
                            " 两个窗口也同步, 有时候挺有用的．
"set noscrollbind

if v:version >= 700
    set completeopt=menu,longest,preview
                            " 自动补全(ctrl-p)时的一些选项：
                            " 多于一项时显示菜单，最长选择，
                            " 显示当前选择的额外信息
endif

" 与Windows共享剪贴板
 set clipboard+=unnamed
" }}}

 "改变注释代码的颜色{{{

 hi Comment ctermfg=6

 "改.c文件的c风格/* ... */注释为会灰白色

 "hi cComment ctermfg=LightBlue "DarkGray "DarkMagenta " guifg=Grey

 ""改.c文件的c++风格// ... 注释为彩色终端下为暗蓝灰色、GUI下为浅蓝色

 hi cCommentL ctermfg=DarkGray "LightBlue " guifg=LightBlue

 "以上可参看/usr/share/vim/vim72/syntax/c.vim中对cComment和cCommentL的定义

 ""}}}

" 设置命令行和状态栏 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ruler                  " 打开状态栏标尺
"set cmdheight=1            " 设定命令行的行数为 1
"set laststatus=2           " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ]
                            " 设置在状态行显示的信息如下：
                            " %F    当前文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}5=
                            "       当前文件编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数

" vim-powerline statubar related
set laststatus=2 " always have status-line'
let g:Powerline_symbols = 'fancy'
set statusline=%F%m%r%h%w\ %{&ff}\ %Y\ [ascii:%b\ hex:0x\%02.2B]\ [%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %=%l/%L,%v\ %p%%
set showcmd                 " 在状态栏显示目前所执行的指令，未完成的指令片段亦
                            " 会显示出来
                            " }}}

" 自定义命令 {{{
"""""""""""""""""""""""""""""""""""""
" Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
" set expandtab               " 使用空格来替换tab
" auto expand tab to blanks
autocmd FileType c,cpp set expandtab
"set list
"set listchars=tab:\|\ ,   " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:▸\ ,eol:¬

" Indent related
" http://vimcdoc.sourceforge.net/doc/indent.html
" g0 类的public顶格写
" :0 将 case 标号放在 switch() 缩进位置之后的 N 个字符处
" N-s namespace 下顶格
" (0  条件语句多个条件在不同行时下一行与上一行对齐
set cinoptions=g0,:0,N-s,(0
set autoindent      " always set autoindenting on
set smartindent

" C-style indentdenting
set cindent "usage: select codes, press '=' key, the codes whichwrapill autoindenting

set mps+=<:>        " 让<>可以使用%跳转
set hid             " allow to change buffer without saving
set shortmess=atI   " shortens messages to avoid 'press a key' prompt
set lazyredraw      " do not redraw while executing macros (much faster)
" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=
" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

" Search related
"set ignorecase " Set search/replace pattern to ignore case
set smartcase   " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set hlsearch    " highlight search
set magic       " Enable magic matching
set showmatch   " show matching paren
set wildmenu    " 增强模式中的命令行自动完成操作

" showmarks setting
let showmarks_enable = 0 " disable showmarks when vim startup
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let showmarks_ignore_type = "hqm" " help, Quickfix, non-modifiable

" Tagbar options
let g:tagbar_width = 30

let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="longfeey"
let g:DoxygenToolkit_versionString="0.1.00"
let g:DoxygenToolkit_briefTag_funcName="yes"
"autocmd BufNewFile *.{h,hpp,c,cpp} DoxAuthor
" }}}

" {{{ lookupfile插件默认会使用ctags产生的tag来查找，效率很低,使用下面脚本生成filenametags

"  script to generate filenametags
"  #!/bin/sh
"  # generate tag file for lookupfile plugin, use absolute path
"  echo "!_TAG_FILE_SORTED\t2\t/2=foldcase/" >filenametags
"  find `pwd` \( -name .repo -o -name .git -o -name .svn -o -name .gitignore \) -prune -o -not -iregex '.*\.\(jar\|gif\|jpg\|png\|class\|exe\|dll\|pdd\|sw[op]\|xls\|doc\|pdf\|zip\|tar\|ico\|ear\|war\|dat\).*' -type f -printf "%f\t%p\t0\n" | sort -f >> ./filenametags

let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr ='"./filenametags"'
endif
let g:LookupFile_FileFilter ='/.class$/|/.o$/|/.obj$/|/.exe$/|/.jar$/|/.zip$/|/.war$/|/.ear$'

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction

let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"映射LookupFile为,lk
map <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
map <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
map <silent> <leader>lw :LUWalk<cr>
" }}}

"ctrlp
let g:ctrlp_user_command = 'find %s -type f'

set tags=tags;

" 源码阅读插件 : Cscope_map.vim {{{

let g:autocscope_menus=0
"是否使用 quickfix 窗口来显示 cscope 结果
" set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

"'csto' 被设为 0，cscope 数据库先 被搜索，搜索失败的情况下在搜索标签文件
"设定了 'cscopetag'，这样所有的 :tag 命令就会实际上调用 :cstag。这包括 :tag、Ctrl-] 及 vim -t。
"结果是一般的 tag 命令不仅搜索由 ctags 产生的标签文 件，同时也搜索 cscope 数据库,但是好像有bug,二者共存时有的无法搜索
if has("cscope")
    set csprg=/usr/bin/cscope
    " Use both cscope and ctag
    set cscopetag
    " Use cscope for definition search first
    set cscopetagorder=0
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    " Show msg when cscope db added
    set cscopeverbose
endif

"------- 下面是对cscope_map.vim文件的部分翻译

""0 或 s 查找本 C 符号(可以跳过注释)

""1 或 g 查找本定义

""2 或 d 查找本函数调用的函数 --可以到函数的定义处

""3 或 c 查找调用本函数的函数 --该函数被谁调用

""4 或 t 查找本字符串

""6 或 e 查找本 egrep 模式

""7 或 f 查找本文件

""8 或 i 查找包含本文件的文件

""ctrl + o 可以返回

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"" cscope使用方法
""下面是shell脚本，放到源码目录下运行
""#!/bin/sh
""find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
""cscope -bkq -i cscope.files
""ctags -R

""下面是对cscope -Rbkq 的解释

""-R: 在生成索引文件时，搜索子目录树中的代码

""-b: 只生成索引文件，不进入cscope的界面

""-k: 在生成索引文件时，不搜索/usr/include目录

""-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度


""1.生成一个 cscope 的数据库

""cscope -Rbq

""  :cs add /usr/src/linux/cscope.out /usr/src/linux/

"":cs reset : 重新初始化所有连接. 用法 : cs reset
"测试（1）:cscope find g 函数名 （2） :cscope find c 函数名
":cw 显示多个结果

" 解决cscope与tag共存时ctrl+]有时不正常的bug
nmap <C-]> :tj <C-R>=expand("<cword>")<CR><CR>

" VimTip 329: A map for swapping words
" http://vim.sourceforge.net/tip_view.php?tip_id=
" Then when you put the cursor on or in a word, press "\sw", and
" the word will be swapped with the next word.  The words may
" even be separated by punctuation (such as "abc = def").
" nnoremap <unique> <silent><leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

"neocomplcache.vba 插件替代autocomplpop(acp.vim) omnicppcomplete.vim {{{
"-----------------------------------------------------------------

" plugin - NeoComplCache.vim 自动补全插件

" 1、使用缓存，自动补全时效率高；

" 2、生成的关键词列表准确；

" 3、支持下划线分割的关键词，如apple_boy_cat，就可以只输入a_b_c，然后补全；

" 4、支持驼峰格式匹配关键词，如AppleBoyCat，就可以只输入ABC，然后补全；

" 5、既可以像AutoComplPop那样在Vim中输入的同时自动弹出补全列表，又可以自定义快捷键手动触发；

" 6、支持从文件名和目录名中匹配补全条件；

" 7、对于程序源文件，支持从语言API中匹配补全条件；

"-----------------------------------------------------------------


" Disable AutoComplPop.

"set completeopt=menu,longest

" let g:acp_enableAtStartup = 0
" 
" " Use neocomplcache.
" 
" let g:neocomplcache_enable_at_startup = 1
" 
" " Use smartcase.
" 
" let g:neocomplcache_enable_smart_case = 1
" 
" " Use camel case completion.
" 
" let g:neocomplcache_enable_camel_case_completion = 1 "支持驼峰格式匹配关键词
" 
" " Use underbar completion.
" 
" let g:neocomplcache_enable_underbar_completion = 1 "支持下划线分割的关键词
" 
" " Set minimum syntax keyword length.
" 
" let g:neocomplcache_min_syntax_length = 3
" 
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 
" let g:neocomplcache_enable_auto_delimiter = 1
" 
" let g:neocomplcache_disable_auto_complete = 1 "设置NeoComplCache不自动弹出补全列表
" 
" let g:neocomplcache_enable_wildcard = 1
" 
" " Define dictionary.
" 
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions',
"     \ 'css' : $VIMFILES.'/dict/css.dic',
"     \ 'php' : $VIMFILES.'/dict/php.dic',
"     \ 'javascript' : $VIMFILES.'/dict/javascript.dic'
"     \ }
" 
" " Define keyword.
" 
" if !exists('g:neocomplcache_keyword_patterns')
" 
" let g:neocomplcache_keyword_patterns = {}
" 
" endif
" 
" let g:neocomplcache_keyword_patterns['default'] = '/h/w*'
" 
" "let g:neocomplcache_enable_auto_select = 1
" 
" let g:neocomplcache_enable_caching_message=1 "显示启动进度
" 
" 
" " Enable omni completion.
" 
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" 
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" 
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" 
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" 
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" 
" autocmd filetype cpp setlocal omnifunc=omni#cpp#complete#main
" 
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" autocmd FileType c setlocal omnifunc=ccomplete#Complete
" 
" "Enable heavy omni completion.
" 
" if !exists('g:neocomplcache_omni_patterns')
" 
" let g:neocomplcache_omni_patterns = {}
" 
" endif
" 
" let g:neocomplcache_omni_patterns.ruby = '[^. */t]/./w*/|/h/w*::'
" 
" 
" let g:neocomplcache_omni_patterns.php = '[^. /t]->/h/w*/|/h/w*::'
" 
" let g:neocomplcache_omni_patterns.c = '/%(/./|->/)/h/w*'
" 
" let g:neocomplcache_omni_patterns.cpp = '/h/w*/%(/./|->/)/h/w*/|/h/w*::'
" 
" 
" "映射:
" 
" "inoremap neocomplcache#manual_filename_complete()
" 
" "inoremap neocomplcache#manual_filename_complete()
" 
" "inoremap pumvisible() ? "/" : neocomplcache#manual_keyword_complete()
" 
" "inoremap neocomplcache#close_popup()
" 
" "inoremap neocomplcache#cancel_popup()
" 
" "inoremap neocomplcache#undo_completion()
" 
" "inoremap neocomplcache#complete_common_string()
" 
" " 函数说明
" " pumvisible（） 如果弹出菜单可见，返回非零，不然返回零。
" 
" " neocomplcache#undo_completion  这个看名字就知道，做一次undo，取消补全。
" 
" " neocomplcache#close_popup() 这个是用候选字补全后关闭弹出框
" 
" " neocomplcache#cancel_popup()  这个是什么也不做，直接关闭弹出框
" 
" " 方法1
" " let g:neocomplcache_enable_quick_match = 1 “For input-saving, this variable
" " controls whether you can  choose a candidate with a alphabet or number
" " displayed beside a candidate after '-'.  When you input 'ho-a',
" " neocomplcache will select candidate 'a'.
" 
" " 方法2
" " CTRL-N,CTRL-P：
" " 这两个组合键可以替代TAB的功能，向上或者向下选择你的候选字
" "
" " 方法3
" " 使用SPACE:
" " inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() .
" " "\<SPACE>" : "\<SPACE>"
" "
" " 用SPACE自动旋转当前的候选字，并附加一个空格。这个才是真正无阻碍的输入方式。在SPACE面前什么<TAB>,<ENTER>都是浮云。neocomplcache
" " 的作者居然都没想到这点 。给出的推荐配置中还在纠结于 <TAB>,<ENTER>。这也是
" " VISUAL ASSIST X推荐的方式。
" 
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
" "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"       "取消 <TAB> 的相关映射*******************
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" "inoremap <expr><Enter>  pumvisible() ? neocomplcache#close_popup()."\<C-n>" : "\<Enter>"
" inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"    "赋予 <Enter> <C-Y> 的功能。 <C-Y> 的功能是选择选项之后关闭弹出"                          "框。这么配置之后，同时也把回车键的换行效果取消了，免得选择之后光标却在下一行********************
" "" 类似于AutoComplPop用法 .
" let g:neocomplcache_enable_auto_select = 1
" 
" " use neocomplcache & clang_complete
" " neocomplcache option
" let g:neocomplcache_force_overwrite_completefunc=1
" " clang_complete option
" let g:clang_complete_auto=1
" 
" ""}}}

" " YouCompleteMe 代码补全杀手锏{{{
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"set YouCompleteMe trigger key
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.hs,*.vim 2match Underlined /.\%81v/
" 超过80个的字符高亮
"au BufWinEnter * let w:m1=matchadd('Search', '\%<88v.\%>81v', -1)
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"高亮显示txt 需要txt.vim
au BufRead,BufNewFile * setfiletype txt

" Restore the last quit position when open file.
 autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \     exe "normal g'\"" |
     \ endif

" 自动更新最后修改时间
function! AutoUpdateTheLastUpdateInfo()
    let s:original_pos = getpos(".")
    let s:regexp = "^\\s*\\([#\\\"\\*]\\|\\/\\/\\)\\s\\?[lL]ast \\([uU]pdate\\|[cC]hange\\):"
    let s:lu = search(s:regexp)
    if s:lu != 0
        let s:update_str = matchstr(getline(s:lu), s:regexp)
        call setline(s:lu, s:update_str . strftime("%Y-%m-%d %H:%M:%S", localtime()))
        call setpos(".", s:original_pos)
    endif
endfunction
"autocmd BufWritePost *.{h,hpp,c,cpp} call AutoUpdateTheLastUpdateInfo()
"autocmd BufNewFile *.{h,hpp,c,cpp} exec 'call append(0, "\/\/ Last Update:" . strftime("%Y-%m-%d %H:%M:%S", localtime()))'

"NERD_commenter.vim " 注释插件，可以使用cvim.zip, 但是这个觉到习惯一些 {{{

let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格

let NERDCompactSexyComs=1 " 多行注释时样子更好看

let NERD_c_alt_style=1

"Default mapping:

"[count],cc " 以行为单位进行注释.

" ,c " comment , <--> , uncomment. ( 常用 )

" ,cm " 一段为单位进行注释. ( 常用 )

" ,cs " 简洁美观式注释. ( 常用 , 可以嵌套注释,用,cu取消注释 )

" ,cy " Same as ,cc except that the commented line(s) are yanked first.

" ,c$ " 注释当前光标到行末的内容.

" ,cA " 在行末进行手动输入注释内容.

" ,ca " 切换注释方式(/**/ <--> //). ( 常用 )

" ,cl " Same cc, 左对齐.

" ,cb " Same cc, 两端对其.

" ,cu " Uncomments the selected line(s). ( 常用 )

"}}}

"F8单独切换打开NERD_tree ( F8 ) {{{
"-----------------------------------------------------------------

" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录

" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree

" o 打开关闭文件或者目录 t 在标签页中打开

" T 在后台标签页中打开 ! 执行此文件

" p 到上层目录 P 到根目录

" K 到第一个节点 J 到最后一个节点

" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）

" r 递归刷新当前目录 R 递归刷新当前根目录

"-----------------------------------------------------------------

let g:NERDChristmasTree = 1 "色彩显示

let g:NERDTreNERDShowHidden = 1 "显示隐藏文件

let g:NERDTreeWinPos = 'left' "窗口显示位置

let g:NERDTreeHighlightCursorline = 0 "高亮当前行

let g:NERDTreeWinSize = 25 "设置显示宽度

"nmap :NERDTreeToggle.

" o.......打开所选文件或目录 ( 常用 )

" enter..............相当于o

" go......类似o, 但光标仍然停留在NERD_tree ( 常用 )

" t.......在新标签中打开所选文件

" T.......类似t, 但光标仍然停留在NERD_tree

" i.......在一个水平分割窗口中打开文件

" gi......类似i, 但光标仍然停留在NERD_tree

" s.......在一个垂直分割窗口中打开文件........|NERDTree-s|

" gs......类似s, 但光标仍然停留在NERD_tree

" O.......递归打开所选目录

" 鼠标双击.......相当于o, 没错支持鼠标的~!


function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nmap <F8> :call ToggleNERDTreeAndTagbar()<CR>
""}}}

"vim折叠功能 {{{

"折叠方式,可用选项 'foldmethod' 来设定折叠方式：set fdm=***

"有 6 种方法来选定折叠：

"manual 手工定义折叠

"indent 更多的缩进表示更高级别的折叠

"expr 用表达式来定义折叠

"syntax 用语法高亮来定义折叠

"diff 对没有更改的文本进行折叠

"marker 对文中的标志折叠

"常用的折叠快捷键

"zf 创建折叠 (marker 有效)

"zo 打开折叠

"zO 对所在范围内所有嵌套的折叠点展开

"zc 关闭当前折叠

"zC 对所在范围内所有嵌套的折叠点进行折叠

"[z 到当前打开的折叠的开始处。

"]z 到当前打开的折叠的末尾处。

"zM 关闭所有折叠 (我喜欢)

"zr 打开所有折叠

"zR 循环地打开所有折叠 (我喜欢)

"zE 删除所有折叠

"zd 删除当前折叠

"zD 循环删除 (Delete) 光标下的折叠，即嵌套删除折叠

"za 若当前打开则关闭，若当前关闭则打开 ( 这个就足够了)

"zA 循环地打开/关闭当前折叠

"zj 到下一折叠的开始处 ( 我喜欢 )

"zk 到上一折叠的末尾 ( 我喜欢 )

"set fdm=marker

"set foldmethod=indent

"要想在{ } 代码块中折叠，按空格键

"syntax 与 c.vim 中的 /cc 注释功能冲突

set fdm=marker

"关掉映射,经常带来麻烦

"nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') "使用空格打开或关闭折叠

"}}}

"文件比较 {{{

":vertical diffsplit FILE_RIGHT "与已打开的文件进行比较

"设置不同之处显示上下三行

set diffopt=context:3

"命令模式（ESC键进入）：

"[c 跳转到下一个差异点

"]c 跳到上一个差异点

"dp 左边文件差异复制到右边文件(直接在键盘上行按下dp)

"do 右边文件差异复制到左边文件(直接在键盘上行按下do)

"zo 隐藏相同行

"zc 展开向同行

"u 撤销

"Ctrl+w 文件切换

"

":qa! 退出不保存

":wa 保存

":wqa 保存退出

":diffupdate 重新比较

""}}}

"bufexplorer插件
"{{{

"map :BufExplorer

",be 打开选择窗口 ','是前面mapleader设置的

"r可以进行反向排序.

"d/D可以用来关闭文件.

"p可以用来显示/关闭绝对路径模式

"}}}

"echofunc.vim 在命令行中显示函数信息
""{{{
"直接下载解压即可( tags 插件已包含相似功能, 没必要装此插件 )

"这个插件的功能需要 tags 文件的支持, 并且在创建 tags 文件的时候要加选项"--fields=+lS" : ctags -R --fields=+lS

let g:EchoFuncKeyPrev=''

let g:EchoFuncKeyNext=''

let g:EchoFuncLangsUsed = ["c","java","cpp"]

""}}}

"scrollcolor.vim 和 color_sample_pack.vim
"{{{

"1. 下载scrollcolor http://www.vim.org/scripts/script.php?script_id=1488

"2. 下载color sample pack http://www.vim.org/scripts/script.php?script_id=625

"3. 该网页是上面插件的主题样式参考图片 http://www.vi-improved.org/color_sampler_pack/

"4. 将插件放到正确的位置后打开一个文件命令模式:COLORSCROLL 上下键选择喜爱的主题

"}}}

"CCtree.Vim C Call-Tree Explorer 源码浏览工具 关系树 (赞)

""{{{

"1. 除了cscope ctags 程序的安装,还需安装强力胶 ccglue(ctags-cscope glue): http://sourceforge.net/projects/ccglue/files/src/

" (1) ./configure && make && make install

" (2) $ccglue -S cscope.out -o cctree.out 或 $ccglue -S cscope1.out cscope2.out -o cctree.out

" (3) :CCTreeLoadXRefDBFromDisk cctree.out

"2. 映射快捷键(上面F1) 其中$CCTREE_DB是环境变量,写在~/.bashrc中

" map :CCTreeLoadXRefDBFromDisk $CCTREE_DB

" eg.

" export CSCOPE_DB=/home/tags/cscope.out

" export CCTREE_DB=/home/tags/cctree.out

" export MYTAGS_DB=/home/tags/tags



 " "注: 如果没有装ccglue ( 麻烦且快捷键不好设置,都用完了 )

 " (1) map xxx :CCTreeLoadDB $CSCOPE_DB "这样加载有点慢, cscope.out cctree.out存放的格式不同

 " (2) map xxx :CCTreeAppendDB $CSCOPE_DB2 "最将另一个库

 " (3) map xxx :CCTreSaveXRefDB $CSCOPE_DB "格式转化xref格式

 " (4) map xxx :CCTreeLoadXRefDB $CSCOPE_DB "加载xref格式的库 (或者如下)

 map xxx :CCTreeLoadXRefDBFromDisk $CSCOPE_DB "加载xref格式的库

 " (5) map xxx :CCTreeUnLoadDB "卸载所有的数据库

 "3. 设置

 let g:CCTreeDisplayMode = 3 " 当设置为垂直显示时, 模式为3最合适. (1-minimum width, 2-little space, 3-witde)

 let g:CCTreeWindowVertical = 0 " 水平分割,垂直显示

 let g:CCTreeWindowMinWidth = 40 " 最小窗口

 let g:CCTreeUseUTF8Symbols = 1 "为了在终端模式下显示符号

 ""}}}

"cvim.zip插件--编码必备
""{{{

"下载地址: http://www.vim.org/scripts/script.php?script_id=213
"
"let g:C_MapLeader = ',' "默认的是'/'

"Ctrl+j 的使用:eg. 当你使用/if添加一个函数时,会多出一些类似<+xxx+>的东西(需要重新填写), ctrl+j可以帮你忙,试一下很强.
"
" 功能说明

"1.添加文件头注释（自动完成）

"2.添加c函数（标准模式执行/if, 再输入函数名）

"3.添加main函数（标准模式执行/im）

"4.添加函数注释 （标准模式执行/cfu）

"5.添加注释框架 （标准模式执行/cfr）

"6.添加头文件 （标准模式执行/p<包含头文件 或 /p"包含头文件）

"7.添加宏定义 （标准模式执行/pd)

"8.添加代码片段

"（标准模式执行/nr,需在~/.vim/c-support/codesnippets/中加入存放代码的文件)

" -- Help ---------------------------------------------------------------

" /hm show manual for word under the cursor (n,i)

" /hp show plugin help (n,i)

""}}}

"a.vim实现源文件与头文件切换
"{{{

let alternateSearchPath = 'sfr:.,sfr:./include,sfr:../include,sfr:../inc' "设置include(.h)文件存在何处.

let alternateNoDefaultAlternate = 1 "当没有找到相应的.h文件时,不自动创建

"   使用方法
":A 切换当前文件的头文件,在当前窗口打开(或者反过来) "先打开.h .c 文件存于buff中

":AS 功能同:A,但是切换到水平分割窗口的打开

":AV 功能同:A,但是切换到竖直分割的窗口打开

":AT 功能同:A,但是切换到标签页打开

"}}}
" plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
"{{{
" %              正向匹配

" g%            反向匹配

" [%            定位块首

" ]%             定位块尾

" }}}

"vim 自带Marks的使用, 如果不习惯可以使用插件ShowMarks(下面有介绍), 使能showmarks_enable = 1
"{{{

"这个功能是VIM自带的功能, 习惯就好, 一切从简．可以查看帮助文档, 下面是简单介绍.

"(1) 设置标记 --> norm模式下, m + [a-z]. ( m - mark, [a-z] 也可以是[A-Z], 推荐只使用小写字母. )

"(2) 删除标记 --> 多种方法如下:

" 1. 删除标记所在的行．

" 　 2. 在其他行作相同的标记(eg. ma ).

" 3. 命令模式下 :delmarks a ( 简写 :delm a )

" 4. 命令模式下 :delmarks! ( 删除所有小写字母标记 )

" 5. 删除多个标记 :delmarks abcd (a,b,c,d都被删除, 也¯以 :delmarks a-d)

"(3) 使用标记 -->

" 1. 定位到标记位置(以a为例) --> `a or 'a ( 区别在于 `a到目标行的最左端,'a到目标行的第一个非空字符之前)

" 2. 对当前行到标记位置的操作--> d`a , y`a , c`a 分别表示对该区域的删除, 复制, 更改

" 3. 显示设置的标记信息 --> :marks (显示所有) :marks a (只显示a标记的信息)

"(4) 有用特殊标记(系统设置好的)

" 1. '' 或者 `` 从当前行跳回到最近一次跳到改行的位置去.

" 2. `. 从当前行跳回到最后一次修改的行的位置去.

"}}}

"vim 自带Marks的使用, 如果不习惯可以使用插件ShowMarks(下面有介绍), 使能showmarks_enable = 1



"ShowMarks高亮功能显示出标记的位置( 先使用vim提供的sign功能进行标记位置 )

"{{{

" ================= (第一个) http://www.vim.org/scripts/script.php?script_id=152 对vim7.x是有一小点问题的. =============

let showmarks_enable = 1 "使能showmarks插件

"Show which marks:全部的大写标记和小写 ( 推荐只使用小写, 大写可能有bug )

let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCEFGHIJKLMNOPQRSTUVWXYZ" "我把D去掉了,因为DoxygenToolkit.vim中修改了点东西

" Ignore help, quickfix, non-modifiable buffers:对文件类型为help, quickfix, 和不可修改的缓冲区，不显示标记的位置

let showmarks_ignore_type = "hqm"

" Hilight lower & upper marks

let showmarks_hlline_lower = 1

let showmarks_hlline_upper = 1

hi ShowMarksHLl ctermbg=Black ctermfg=White "guibg=#FFDB72 guifg=Black "Magenta

hi ShowMarksHLu ctermbg=Yellow ctermfg=Black "guibg=#FFB3FF guifg=Black

"ShowMarks插件中已经定义了一些快捷键：

",mt - 打开/关闭ShowMarks插件 ( 常用 )

",mo - 强制打开ShowMarks插件

",mh - 清除当前行的标记 ( 常用 )

",ma - 清除当前缓冲区中所有的标记 ( 常用 )

",mm - 在当前行打一个标记，使用下一个可用的标记名 ( 常用 )



" ================= (第二个) http://www.vim.org/scripts/script.php?script_id=2142 =============

"解压到vim家目录即可, 使用默

"设置可用来作标记的字母

"let g:showmarks_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "使用默认

"}}}


"mark.vim 当你在文件中想多个不同的关键词,且用不同的颜色显示, 那么该插件可你帮助你
"{{{

"下载地址: http://www.vim.org/scripts/script.php?script_id=1238

"1. map keys 触发键 默认是'/', 可以设置为',' let g:mapleader=",". 本vimrc已设置为','

"2. ,m : "高亮"显示光标下的单词或取消当前光标下的单词高亮显示

"3. ,r : 手工输入需要高亮显示的单词

"4. ,n : 当光标下有"高亮"显示的单词时,则取消. 如光标下没有"高亮"的单词时,则取消所有"高亮"的单词.

"5. * : 下一个与光标下颜色相同的高亮单词.

"6. # : 上一个与光标下颜色相同的高亮单词.

"7. ,/ : 下一个高亮单词(不一定是相同颜色).

"8. ,? : 上一个高亮单词(不一定是相同颜色).

"9. 重新定义需要高亮单词的颜色:

hi MarkWord1 ctermbg=Yellow ctermfg=White guibg=#FFDB72 guifg=Black

hi MarkWord2 ctermbg=Blue ctermfg=White guibg=#9999FF guifg=Black

hi MarkWord3 ctermbg=Red ctermfg=White guibg=#FF7272 guifg=Black

hi MarkWord4 ctermbg=Cyan ctermfg=White guibg=#8CCBEA guifg=Black

hi MarkWord5 ctermbg=Brown ctermfg=White guibg=#FF7272 guifg=Black

hi MarkWord6 ctermbg=Magenta ctermfg=White guibg=#FFB3FF guifg=Black

hi MarkWord7 ctermbg=Green ctermfg=White guibg=#A4E57E guifg=Black

"}}}

"srcexpl.vim just like source insight
" {{{
" // The switch of the Source Explorer                                         "
" nmap <F8> :SrcExplToggle<CR>
"                                                                              "
" // Set the height of Source Explorer window                                  "
" let g:SrcExpl_winHeight = 8
"                                                                              "
" // Set 100 ms for refreshing the Source Explorer                             "
" let g:SrcExpl_refreshTime = 100
"                                                                              "
" // Set "Enter" key to jump into the exact definition context                 "
" let g:SrcExpl_jumpKey = "<ENTER>"
"                                                                              "
" // Set "Space" key for back from the definition context                      "
" let g:SrcExpl_gobackKey = "<SPACE>"
"                                                                              "
" // In order to Avoid conflicts, the Source Explorer should know what plugins "
" // are using buffers. And you need add their buffer names into below list    "
" // according to the command ":buffers!"                                      "
" let g:SrcExpl_pluginList = [
"         \ "__Tag_List__",
"         \ "_NERD_tree_",
"         \ "Source_Explorer"
"     \ ]
"                                                                              "
" // Enable/Disable the local definition searching, and note that this is not  "
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. "
" // It only searches for a match with the keyword according to command 'gd'   "
" let g:SrcExpl_searchLocalDef = 1
"                                                                              "
" // Do not let the Source Explorer update the tags file when opening          "
" let g:SrcExpl_isUpdateTags = 0
"                                                                              "
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to "
" //  create/update a tags file                                                "
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"                                                                              "
" // Set "<F12>" key for updating the tags file artificially                   "
" let g:SrcExpl_updateTagsKey = "<F12>"
" let loaded_srcexpl = 0

" // The switch of the Source Explorer

"nmap :SrcExplToggle



" // Set the height of Source Explorer window

"let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer

"let g:SrcExpl_refreshTime = 100



" // Set "Enter" key to jump into the exact definition context

" let g:SrcExpl_jumpKey = ""



" // Set "Space" key for back from the definition context

"let g:SrcExpl_gobackKey = ""



" // In order to Avoid conflicts, the Source Explorer should know what plugins

" // are using buffers. And you need add their bufname into the list below

" // according to the command ":buffers!"

"let g:SrcExpl_pluginList = [

" / "__Tag_List__",

" / "_NERD_tree_",

" / "Source_Explorer"

" / ]

" // Enable/Disable the local definition searching, and note that this is not

" // guaranteed to work, the Source Explorer doesn't check the syntax for now.

" // It only searches for a match with the keyword according to command 'gd'

"let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening

"let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to

" // create/update a tags file

"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."



" // Set "" key for updating the tags file artificially

"let g:SrcExpl_updateTagsKey = ""

"}}}

"vim master
""{{{

"Verdancy --- New Commer

""{{{

" f --- find; practic : (before)"aabbbccdd" --> ex: dfc --> (after)"cdd"

"寄存器
"""{{{

" q[a-z] --- 记录命令, 已q结束, @[a-z]引用 --- 很强大,需要习惯使用
"
" " "[a-z]p --- 可以将寄存器[a-z]中的命令以文本的方式输出,并进行修改
"
" " "[a-z]y$ --- 将寄存器修改后的内容存回到对应寄存器
"
" ""}}}

"Visual 选中模式

""{{{

" shift + v : 配合jk,上下键,整行选择

" ctrl + v : 配合hjkl,上下左右键,灵活选择区域

" o : 在选中的区域中对角线移动

" O : 在选中的区域中行左右移动

" gv : 重新选中原来的选中的区域

" : : 在选中区域后,shift+:到命令模式, : eg. '<,'>s/pattern/newstring/g --
" 在选中的区域中查找patte && replace

" ctrl + v 选中一列后, 按I插入字符,Esc退出 :
" 每一行都添加这个字符,很好的一个注释方法

""}}}

"Command Mode

""{{{

" :g/pattern/d --- delete line contained of string "pattern"

""}}}

"窗口

""{{{

"ctrl + 0 : 恢复窗口大小

"ctrl + = : 窗口等大

"ctrl + w + _ : 窗口最大化

"nctrl + w + _ : 改变窗口的大小

"ctrl + w + ctrl + c : 关闭窗口

"ctrl + w + ctrl + ] : 以函数所在文件分割窗口

"ctrl + w + shift + [hjkl] : 窗口位置放置

"

"shift + z + z : close vim edit. You need set auto write.

"

"vim t1.c t2.c t3.c -o2 : open thress files using two windows. if -o(no
"number), using three windows here.

""}}}

"杂项

""{{{

" !!date --- 插入日期

" read !date -R --- 插入日期 ( -R 显示日期的格式而已 man date )

"

" ctr + w ctrl + c --- 关闭当前窗口

"

" %s//s/+$// --- 删除多余的空格

"

" ctrl + K --- 插入特殊字符

" digraph --- 显示特殊字符,字符组合

"

" set ic --- 忽略大小写

"

" . --- 重复前次操作

"

" ctrl + a --- repeat record.

"

" ctrl + r --- 反撤消, 当u撤消后,又想恢复,可以使用

"

" daw && caw && cis --- delete a word && change a word && 修改一个句子

"

" cc && dd --- change one line reserving indent && delete one line

"

" CTRL+U ---- CTRL+D ---> half page move

" CTRL+E ---- CTRL+Y ---> one line move

" CTRL+F ---- CTRL+B ---> one page move

"

" CTRL + O --- 返回刚才位置,每按一次都会退回到之前的位置

" CTRL + I --- 与CTRL+O相反,每按一次退回来


" [i --- (将光标移到变量上)显示第一个局部变量定义处

" [I --- (将光标移到变量上)显示所有该变量的定义处

" '' --- 回到刚才停留处

" // ---- 精确查找


" 16进制编辑,码农必备,lol

" :%!xxd 16进制编辑
" :%!xxd -r 文本编辑

""}}}

""}}}

"Shell

""{{{

"巧妙去除Linux下代码行中的^M符号和windows下代码编辑引起的警告错

":%s /^M//g ，其中^M的写法是按住ctrl不放，再按v，然后按M，再放ctrl

""{{{

" #wash_error.sh

" #!/bin/sh

" ls *.h *.c | awk '{print $1}' > dealfile

" cat dealfile | while read file

" do

" echo " " >> $file

" done

" #dos2unix *.c *.h

""}}}

"巧妙去除Linux下代码行中的^M符号和windows下代码编辑引起的警告错

""}}}

"个人工程shell
"{{{

"1. 创建cscope库 cs.sh

" #!/bin/sh

" #rm -f cscope.* tags

" find /root/Trunk/EC2108_C27/ /root/Trunk/Hippo/ -name "*.h" -o -name "*.c"
" -o -name "*.cc" -o -name "*.cpp" > cscope.files

" cscope -bkq -i cscope.files

" ccglue -S cscope.out -o cctree.out

"

"2. 创建文件查找库 filename.sh

" echo -e "!_TAG_FILE_SORTED/t2/t/2=foldcase/" > filenametags

" find /root/Trunk/EC2108_C27 -not -regex
" '.*/./(png/|gif/|db/|bak/|swp/|doc/|html/|htm/|jsp/|js/)' ! -path "*svn*"
" -type f -printf "%f/t%p/t1/n" | sort -f >> filenametags

" find /root/Trunk/Hippo/ -not -regex
" '.*/./(png/|gif/|db/|bak/|swp/|doc/|html/|htm/|jsp/|js/)' ! -path "*svn*"
" -type f -printf "%f/t%p/t1/n" | sort -f >> filenametags

"

"3. 创建tags库 tags.sh

" ctags -R --c++-kinds=+p --fields=+ialS --extra=+q /root/Trunk/EC2108_C27
" /root/Trunk/Hippo/

"

"4. 设置环境变量(写到~/.bashrc)

" export CSCOPE_DB=/home/tags/cscope.out

" export CCTREE_DB=/home/tags/cctree.out

" export MYTAGS_DB=/home/tags/tags

"}}}
