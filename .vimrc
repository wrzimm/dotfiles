au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview
au BufRead,BufNewFile *.go set filetype=go

" syntax highlighting on
syntax on

" folding options: {{{ and }}} define folds
set foldmethod=marker
highlight Folded ctermfg=green ctermbg=none

" use mouse for naviagation
set mouse=n

" highlight search term
set hlsearch

set wrap linebreak nolist
set number
set numberwidth=3
set cpoptions+=n

" auto indent
set autoindent


" cursor for different modes
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" options for git-gutter: line numbers are black w/no highlighting
highlight LineNr term=bold cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=black guibg=NONE
highlight SignColumn ctermbg=NONE guifg=NONE
" don't update so much:
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" wild menu for better tab completion
set wildmode=longest:full
set wildmenu

" conqueterm options
let g:ConqueTerm_Color = 2
let g:ConqueTerm_SessionSupport = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_ReadUnfocused = 1

" enable pathogen for installing bundles
call pathogen#infect()
call pathogen#helptags()

let g:ScreenShellGnuScreenVerticalSupport = 'native'


" tab navigation Ctrl-n for next, Ctrl-p for previous
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
        set undodir=~/.vim/undo
endif

"
" syntastic options
" ===============================================================================
" check header files
let g:syntastic_cpp_check_header = 1
" re-check includes at file write
let g:syntastic_cpp_auto_refresh_includes = 1
" include files directories
let g:syntastic_cpp_include_dirs = [ 'include', '/usr/local/include/root' ]
" ===============================================================================


" typing this gives current date
iab <expr> DATE strftime("%b %d, %Y")

" intro for c or c++ files
iab cintro /**********************************************************
\<CR>*    B. Zimmerman                                         *
\<CR>*                                                         *
\<CR>*                                                         *
\<CR>*                                                         *
\<CR>*                                                         *
\<CR>**********************************************************/

" intro for latex files
iab texintro %=========================================================%
\<CR>%    B. Zimmerman                                         %
\<CR>%                                                         %
\<CR>%                                                         %
\<CR>%                                                         %
\<CR>%                                                         %
\<CR>%=========================================================%


