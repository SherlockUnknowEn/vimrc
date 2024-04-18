set number
set tags=./.tags;,.tags
syntax on
syntax enable
set cursorline
set foldenable
set foldmethod=indent
set foldlevelstart=10
set listchars=space:·
set smartindent
set clipboard=unnamed
" set mouse=nv
" set list

" Set cursor shape and color
" INSERT mode
let &t_SI = "\<Esc>[5 q" . "\<Esc>]12;\x7"
" REPLACE mode
let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;\x7"
" NORMAL mode
let &t_EI = "\<Esc>[1 q" . "\<Esc>]12;\x7"

" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线

" coc.nvim config
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=no
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
hi Normal guibg=NONE ctermbg=NONE

"highlight CursorLine gui=underline cterm=underline
"highlight Normal guibg=Black

" enable gtags module
 let g:gutentags_modules = ['ctags', 'gtags_cscope']

 " config project root markers.
 let g:gutentags_project_root = ['.root']

 " generate datebases in my cache directory, prevent gtags files polluting my project
 let g:gutentags_cache_dir = expand('~/.cache/tags')

 " change focus to quickfix window after search (optional).
 let g:gutentags_plus_switch = 1

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


" 插件管理
call plug#begin("~/.vim_runtime/my_plugins")
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
" Plug 'vim-scripts/a.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/syntastic'
Plug 'derekwyatt/vim-fswitch'
Plug 'joshdick/onedark.vim'
Plug 'Exafunction/codeium.vim'
call plug#end()

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
nnoremap L g_
nnoremap dL dg_
vnoremap dL dg_
" ctags 映射
" nnoremap <C-]> g<C-]>
" vnoremap <C-/> gc
command! Q q
command! W w
