set nocompatible
set number 
set ic
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set autoindent
set smartindent
set scrolloff=2
set showmatch
set shiftwidth=4
set tabstop=4
set showmatch
set cursorline
set autoread
set mouse=a

set tags=./.tags;,.tags

filetype off                 
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
" 设定补全区域颜色
highlight PMenu ctermfg=242 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=1 ctermbg=8 guifg=darkgrey guibg=black
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
" 仅在以下文件中作分析
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
		    \ "sh":1,
		    \ "zsh":1,
		    \ "zimbu":1,
		    \ }
Plug 'https://github.com/scrooloose/nerdtree'
nnoremap <F3> :NERDTreeToggle<CR>                          # 按F3显示或隐藏目录
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'Chiel92/vim-autoformat'
nnoremap <F6> :Autoformat<CR>   # 按F6自动格式化
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
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
Plug 'skywind3000/asyncrun.vim'
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<CR>
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <CR>
Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linters = {'c': ['gcc'], 'cpp': ['g++']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
" 需要手动指定编译器路径
let g:ale_c_gcc_executable = '/usr/bin/gcc'
let g:ale_cpp_gcc_executable = '/usr/bin/g++'
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
Plug 'Shougo/echodoc.vim'
set noshowmode
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = "echo"
Plug 'itchyny/lightline.vim'
let g:lightline = {
       \ 'colorscheme': 'one',
       \ }
set laststatus=2
call plug#end()            
filetype plugin indent on    
