set number
set tags=./.tags;,.tags
syntax on

set foldenable 
set foldmethod=indent

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

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

let g:indentLine_enabled = 1			" 使插件生效
let g:indentLine_char = '¦'				" 设置缩进线字符，也可以为 '|', '┆', '┊' 等
let g:indentLine_conceallevel = 1 		" 使插件正常运
autocmd FileType json,markdown let g:indentLine_conceallevel = 0 "避免json中不显示双引号

let g:ackprg = 'ag --nogroup --nocolor --column'

"""""""""""" YouCompleteMe"""""""""""""""""""""""""""""""
let g:ycm_enable_semantic_highlighting = 1                  " 语法高亮
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
" let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_min_num_of_chars_for_completion = 2                 " 从第2个键入字符就开始罗列匹配项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项

"let g:deoplete#enable_at_startup = 1

" Create default mappings
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

call plug#begin("~/.vim_runtime/my_plugins")
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/a.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
call plug#end()


nmap <F4> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :VimShell<CR>
nnoremap <C-\> zc
nmap ss <Plug>(easymotion-s2)
command! Q q
command! W w
