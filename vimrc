"~/.vimrc (configuration file for vim only)

" Encoding related
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

"vundle begin
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'STL-improved'
Bundle 'majutsushi/tagbar'
Bundle 'tag_in_new_tab'
Bundle 'autoload_cscope.vim'
Bundle 'CmdlineComplete'
Bundle 'xptemplate'
Bundle 'neocomplcache'
Bundle 'Rip-Rip/clang_complete'
Bundle 'osyo-manga/neocomplcache-clang_complete'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'kien/ctrlp.vim'
Bundle 'ack.vim'
Bundle 'bash-support.vim'
Bundle 'slimv.vim'
Bundle 'CRefVim'
Bundle 'c.vim'

" 快速导航文件
Bundle 'wincent/Command-T'
Bundle 'autopreview'
Bundle 'echofunc.vim'
Bundle 'grep.vim'
Bundle 'a.vim'

" 代码注释
Bundle 'The-NERD-Commenter'

" 智能文件管理
Bundle 'The-NERD-tree'
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

" for my plugin
" 代码段补全
Bundle 'snipMate'
Bundle 'Lokaltog/vim-easymotion'

" 智能打开文件的插件
Bundle 'shemerey/vim-peepopen.git'

" write HTML code faster
Bundle 'rstacruz/sparkup.git'
Bundle 'vim-surround.git'

" 多重色彩括号
Bundle 'vim-scripts/Rainbow-Parenthesis.git'

" non github repos
" autocomplete.match.pair.vim,这个安装完必须在.vim/bundle/449512/目录下创建plugin目录并在其下创建软链接指向autocomplete.match.pair.vim,否则不工作,另外不知为何(号不会自动完成配对
Bundle 'git://gist.github.com/449512.git'
" ...
filetype plugin indent on     " required! 
"vundle end

"""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""
hi Normal ctermbg=NONE  "开启背景透明
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
"colorscheme peaksea
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

"""""""""""""""""""""""""""""""""""""
" Basic setting
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
set history=100              " 设置冒号命令和搜索命令的命令历史列表的长度为 100
"set mouse=a                 " 设定在任何模式下鼠标都可用
set nobackup                " 覆盖文件时不备份
set nocompatible            " 设定 gvim 运行在增强模式下
set noignorecase            " 默认区分大小写
set nolinebreak             " 在单词中间断行
set number                  " 显示行号
set scrolloff=5             " 设定光标离窗口上下边界 5 行时窗口自动滚动
set whichwrap=b,s,<,>,[,]   " 设定退格键、空格键以及左右方向键在行首行尾时的
                            " 行为，不影响 h 和 l 键
set wrap                    " 自动换行显示
set autochdir          " 自动切换当前目录为当前文件所在的目录
set autoread           " 文件被其他程序修改时自动载入
syntax on                   " 自动语法高亮

if v:version >= 700
    set completeopt=menu,longest,preview
                            " 自动补全(ctrl-p)时的一些选项：
                            " 多于一项时显示菜单，最长选择，
                            " 显示当前选择的额外信息
endif

" 与Windows共享剪贴板
 set clipboard+=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置命令行和状态栏
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ruler                  " 打开状态栏标尺
"set cmdheight=1             " 设定命令行的行数为 1
"set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
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

"自定义命令
"""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost .vimrc source $HOME/.vimrc    " .vimrc编辑后重载

" Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set list
"set listchars=tab:\|\ ,   " 显示Tab符，使用一高亮竖线代替
set listchars=tab:▸\ ,eol:¬

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

" NERDTree options
" Auto change the root directory
let NERDTreeChDirMode=2
let g:NERDTreeWinSize = 23

" Tagbar options
let g:tagbar_width = 30

let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="longfeey@msn.com"
let g:DoxygenToolkit_versionString="0.1.00"
let g:DoxygenToolkit_briefTag_funcName="yes"
"autocmd BufNewFile *.{h,hpp,c,cpp} DoxAuthor

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

set pastetoggle=<F2>
"/<C-R><C-W> : 把单个<cword>单词放入搜索或者命令行
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>
nnoremap <F6> :AutoPreviewToggle<CR>
inoremap <F6> <ESC>:AutoPreviewToggle<CR>i 

" --lookupfile--
"  script to generate filenametags
"  #!/bin/sh
"  # generate tag file for lookupfile plugin, use absolute path
"  echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
"  find `pwd` -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
"      sort -f >> filenametags 
"      
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找 
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串 
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史 
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目 
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件 
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr ='"./filenametags"'
endif

"ctrlp
let g:ctrlp_user_command = 'find %s -type f'

set tags=tags;

" -- cscope --
let g:autocscope_menus=0
" Use quickfix window to show cscope results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

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

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" 解决cscope与tag共存时ctrl+]有时不正常的bug
nmap <C-]> :tj <C-R>=expand("<cword>")<CR><CR>

" VimTip 329: A map for swapping words 
" http://vim.sourceforge.net/tip_view.php?tip_id= 
" Then when you put the cursor on or in a word, press "\sw", and 
" the word will be swapped with the next word.  The words may 
" even be separated by punctuation (such as "abc = def"). 
" nnoremap <unique> <silent><leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_ignore_case = 0

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" use neocomplcache & clang_complete
" neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1
" clang_complete option
let g:clang_complete_auto=1

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

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
