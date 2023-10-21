let g:ale_disable_lsp = 1

call plug#begin('~/vim/plugged')
let g:polyglot_disabled = ['go']

""General Plugins
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'hexdigest/gounit-vim'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'vim-test/vim-test'
"Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
"Plug 'iamcco/markdown-preview.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
""PHP Plugings
"" Plug 'stephpy/vim-php-cs-fixer'
"" Plug 'phpactor/phpactor'
"" Plug 'adoy/vim-php-refactoring-toolbox'
"" Plug 'tobyS/vmustache' "requirement for pdv
"" Plug 'tobyS/pdv' "create phpdoc

""Javscript plugins
""""Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'ryanoasis/vim-devicons' "must be loaded last, because it enhances the other plugins

call plug#end()

"======================================================================  General
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set listchars=tab:▸\ ,eol:¬

syntax on
colo pablo

set nu
set visualbell

filetype plugin indent on
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype php setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set shiftwidth=4
set backspace=indent,eol,start

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent !chmod +x <afile> | endif

"---------------------------------------------------------------------- key maps
let mapleader=" "

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

inoremap <leader>s <esc>:w<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>q <esc>:wqa<cr>
nnoremap <leader>q :wqa<cr>

"======================================================================  Plugins

"----------------------------------------------------------------------- airline

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"------------------------------------------------------------------------- CtrlP
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

"-------------------------------------------------------------------- CtrlPFunky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"------------------------------------------------------------------------ vim-go
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>b <Plug>(go-test)
autocmd FileType go nnoremap <leader>t :GoAlternate<cr>
" maps your leader key + gt to generate tests for the function under your cursor
nnoremap <leader>gt :normal vaf<cr>:GoUnit<cr>

au filetype go inoremap <buffer> . .<C-x><C-o>

let g:go_fmt_command = 'gopls'
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_gopls_gofumpt = v:true

let g:go_imports_mode = 'gopls'
let g:go_imports_autosave = 1
"let g:go_gopls_local = 'mymod'

let g:go_code_completion_icase = 1
let g:go_fillstruct_mode = 'gopls'
let g:go_gopls_complete_unimported = v:true
let g:go_list_type = 'quickfix'

"--------------------------------------------------------------------------- fzf
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

"--------------------------------------------------------------------------- ale
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Only run linters named in ale_linters settings.
"
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='PSR2'
let g:ale_php_phan_use_client = 1
let g:ale_php_phan_executable = 'phan_client'

let g:ale_fixers = {
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'php':        ['phpcbf', 'php_cs_fixer'],
\}

let g:ale_linters = {
\   'php': ['intelephense', 'langserver', 'phan', 'php', 'phpcs', 'phpmd', 'phpstan', 'psalm', 'tlint'],
\   'go':  ['golangci-lint'],
\}


" let g:ale_linters_ignore = {
" \   'php': ['php', 'phpcs'],
" \}

"let g:ale_go_golangci_lint_options = '--enable-all --fast -D nlreturn -D wsl -D lll'

let g:ale_sign_column_always = 1
"
" Fix files automatically on save
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

"--------------------------------------------------------------------------- coc
nmap <leader>rn <Plug>(coc-rename)

let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --normal location

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ac <Plug>(coc-codeaction-line)
xmap <silent> ac <Plug>(coc-codeaction-selected)
nmap <silent> <leader>ac <Plug>(coc-codeaction-cursor)
nmap <silent> aC <Plug>(coc-codeaction)

"------------------------------------------------------------------------- vista
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
nnoremap <Leader>f :Vista finder coc<cr>

"======================================================================  Scripts

"--------------------------------------------------------------------- log files
function! Autodecrypt()
   if getline(1) =~ '^Encryption id:'
     silent %!mono  ~/Documents/bereitschaft/DecryptLogfile.exe
   endif
   call Colorlog()
endfunction

function! Colorlog()
        syn match Type " \(EMERG\|ALERT\|ERROR\|WARN\|INFO\|DEBUG\|TRACE\|TRAFF\|SQL\|FINAL\|RAMSES\|UNKN\) "
        syn match Error ".* \(EMERG\|ALERT\|ERROR\) .*"
        syn match Debug ".* \(WARN\) .*"
        syn match Number "\<[CS]\?\(HTTP\|St\|As\|Aal\)\(:[.0-9]\+\)\+"
        syn match Underlined "CbSeq<[^>]\+>"
        syn match Keyword "<[^>]\+>"
        syn match Special "thread<MCC[0-9]\+>"
        syn match Comment "\(^[^0-9 ].\{-}\($\| \{4}\)\|.*\(Waiting .\{-} s\.\)\+\|^ monitor\_.\{-}\(\n\|###\)>\)"
        syn match Todo "\[[A-Z]\+-[0-9]\+\]"
endfunction

function! HandleLog()
    call Autodecrypt()
    call Colorlog()
endfunction

au BufRead,BufNewFile *.log call Autodecrypt()

"------------------------------------------------------------------- vim-test
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
" let test#strategy = "asyncrun_background_term"
" let test#strategy = "makegreen"
" let test#strategy = "vimproc"
" let test#strategy = "kitty"


"------------------------------------------------------------------- AnsiEsc
" au BufWinEnter quickfix call OnFirstQfOpen()

" let g:quickOpened = 1
" function OnFirstQfOpen()
"     if g:quickOpened != 1
"         let g:quickOpened = 1
"         AnsiEsc
"     endif
" endfunction

"------------------------------------------------------------------- format xml

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
