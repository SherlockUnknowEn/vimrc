set number
" set tags=./.tags;,.tags
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
" colorscheme onedark
" hi Normal guibg=NONE ctermbg=NONE


" set termguicolors
" colorscheme onedark
" colorscheme nord
" colorscheme gruvbox
colorscheme neodark

" enable true color enable
" if has("termguicolors")
"     " enable true color
"     set termguicolors
" endif
" if &term =~# '^screen'
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

"highlight CursorLine gui=underline cterm=underline
"highlight Normal guibg=Black


" enable gtags module
" let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
" let g:gutentags_project_root = ['.git', 'compile_command.json', '.hg', 'CMakeLists.txt', '.svn', 'Makefile', '.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1

" 禁用 gutentags 自动加载 gtags 数据库的行为
" let g:gutentags_auto_add_gtags_cscope = 0

" 缩进线
let g:indentLine_enabled = 1			" 使插件生效
let g:indentLine_char = '¦'				" 设置缩进线字符，也可以为 '|', '┆', '┊' 等
let g:indentLine_conceallevel = 3 		" 使插件正常运
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

nmap <F6> :NERDTreeToggle<CR>
" 文件树 Create default mappings
let g:NERDCreateDefaultMappings = 1
" 文件树位置
let g:NERDTreeWinPos = "left"
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


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git', 'CMakeLists.txt', 'Makefile']

let g:Lf_ShortcutF = '<C-P>'
noremap <leader>g : Leaderf gtags <CR>
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <C-B> :<C-U><C-R>=printf('Leaderf! rg --current-buffer -e %s ', expand('<cword>'))<CR>
" noremap <C-F> :<C-U><C-R>=printf('Leaderf! rg -e %s ', expand('<cword>'))<CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR>
"
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <F5> :LeaderfFunction!<cr>


" 插件管理
call plug#begin("~/.vim_runtime/my_plugins")
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'prabirshrestha/vim-lsp'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/syntastic' 
Plug 'derekwyatt/vim-fswitch'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'nordtheme/vim'
Plug 'morhetz/gruvbox'
Plug 'Exafunction/codeium.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }
call plug#end()

" 常用键映射
nnoremap ; :
noremap <C-\> zc
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

nnoremap H :<C-u>echo "H is disabled"<CR>
nnoremap J :<C-u>echo "J is disabled"<CR>
nnoremap K :<C-u>echo "K is disabled"<CR>
nnoremap L :<C-u>echo "L is disabled"<CR>
nnoremap U :<C-u>echo "U is disabled"<CR>
nnoremap P :<C-u>echo "P is disabled"<CR>
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

