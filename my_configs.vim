set number
set tags=./.tags;,.tags
"set mouse=a
syntax on
syntax enable

set cursorline
set foldenable 
set foldmethod=indent
set foldlevelstart=10

" coc.nvim config
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=no
set smartindent

" 插件管理
call plug#begin("~/.vim_runtime/my_plugins")
" Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
" Plug 'vim-scripts/a.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'NLKNguyen/c-syntax.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/syntastic' 
Plug 'joshdick/onedark.vim'
call plug#end()

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 文档滚动
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" 格式化代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" onedark 主题
colorscheme onedark

" material 主题
" colorscheme material
"let g:material_terminal_italics = 1
" let g:material_theme_style = 'ocean'
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
"if (has('nvim'))
"  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
"endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
"if (has('termguicolors'))
"  set termguicolors
"endif

"highlight CursorLine gui=underline cterm=underline
"highlight Normal guibg=Black

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', '.cache']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 缩进线
let g:indentLine_enabled = 1			" 使插件生效
let g:indentLine_char = '¦'				" 设置缩进线字符，也可以为 '|', '┆', '┊' 等
let g:indentLine_conceallevel = 1 		" 使插件正常运
autocmd FileType json,markdown let g:indentLine_conceallevel = 0 "避免json中不显示双引号

"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s

" C++语法高亮
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Ack 搜索
let g:ackprg = 'ag --nogroup --nocolor --column'


"""""""""""" YouCompleteMe"""""""""""""""""""""""""""""""
" let g:ycm_enable_semantic_highlighting = 1                  " 语法高亮
" let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
" let g:syntastic_ignore_files=[".*\.py$"]
" let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
" let g:ycm_complete_in_comments = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
" let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
" let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
" let g:ycm_min_num_of_chars_for_completion = 2                 " 从第2个键入字符就开始罗列匹配项
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             " 回车即选中当前项


" 文件树 Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ctlp C-f 改为 C-p
let g:ctrlp_map = '<C-p>'

" 常用键映射
nmap <F4> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :VimShell<CR>
nnoremap ; :
nnoremap <C-\> zc
nnoremap ss <Plug>(easymotion-s2)
vnoremap ss <Plug>(easymotion-s2)
nnoremap <Space> <Plug>(easymotion-s2)
vnoremap <Space> <Plug>(easymotion-s2)
nmap <silent> <Leader>a :FSHere<cr>
" 代码快速上下移一行
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
" 可视模式连续调整缩进
xnoremap <  <gv
xnoremap >  >gv
" 选择当前行至结尾，排除换行符
vnoremap L g_
" vnoremap <C-/> gc
command! Q q
command! W w
