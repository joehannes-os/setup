call plug#begin()
Plug 'roxma/nvim-yarp'
Plug 'honza/vim-snippets'
Plug 'brooth/far.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }
Plug 'scrooloose/nerdcommenter'
Plug 'philip-karlsson/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'arakashic/chromatica.nvim'
Plug 'cyansprite/Extract'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'kassio/neoterm'
Plug 'fmoralesc/nlanguagetool.nvim'
Plug 'https://gitlab.com/Lenovsky/nuake.git'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'filipekiss/ncm2-look.vim'
Plug 'ncm2/ncm2-syntax'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'HerringtonDarkholme/deoplete-typescript'
" For async completion
Plug 'Shougo/deoplete.nvim'
 " For Denite features
Plug 'Shougo/denite.nvim'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'autozimu/LanguageClient-neovim'
Plug 'ncm2/ncm2-match-highlight'
Plug 'Vigemus/nvimux'
Plug 'jalvesaq/vimcmdline'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'm00qek/nvim-contabs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'Chun-Yang/vim-action-ag'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'edkolev/promptline.vim'
Plug 'joshdick/onedark.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'ashisha/image.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-obsession'
Plug 'felipec/notmuch-vim'
call plug#end()

nnoremap <F12> :Nuake<CR>
inoremap <F12> <C-\><C-n>:Nuake<CR>
tnoremap <F12> <C-\><C-n>:Nuake<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-space> :NERDTreeToggle<CR>

autocmd vimenter * Minimap

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|gz|tar)$',
  \ }

syntax on
colorscheme onedark
let g:airline_theme='onedark'

"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='molokai'

let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \
\}
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"


let b:ale_fixers = {
\	 '*': ['remove_trailing_lines', 'trim_whitespace'],
\	'javascript': ['prettier', 'eslint'],
\}
let b:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

setlocal indentkeys+=0

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'css',
    \ 'priority': 9,
    \ 'subscope_enable': 1,
    \ 'scope': ['css','scss'],
    \ 'mark': 'css',
    \ 'word_pattern': '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    \ })

" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= \"<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

au TextChangedI * call ncm2#auto_trigger()

inoremap <c-c> <ESC>

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Plug 'ncm2/ncm2-bufword'

"Plug 'autozimu/LanguageClient-neovim'
let g:LanguageClient_serverCommands = {
\ 'go': ['go-langserver'],
\ 'rust': ['rls'],
\ }
let g:LanguageClient_loggingFile = '/tmp/lc.log'
let g:LanguageClient_loggingLevel = 'DEBUG'

" a json file with settings for go-langser
" {
" 	"initializationOptions": {
" 		"gocodeCompletionEnabled": true,
" 		"funcSnippetEnabled": true
" 	}
" }
let g:LanguageClient_settingsPath = $WORKSPACE_DIR . '/.vim/settings.json'

"Plug 'ncm2/ncm2-ultisnips'
"Plug 'SirVer/ultisnips'

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
imap <c-u> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

"Plug 'ncm2/ncm2-match-highlight'

let g:ncm2#match_highlight = 'bold'
let g:ncm2#match_highlight = 'sans-serif'
let g:ncm2#match_highlight = 'sans-serif-bold'
let g:ncm2#match_highlight = 'mono-space'

" default
let g:ncm2#match_highlight = 'double-struck'


let g:contabs#project#locations = [{ 'path': '~/', 'depth': 2, 'git_only': 1 }]

let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

set directory=/tmp
set nobackup
set noswapfile
set number
