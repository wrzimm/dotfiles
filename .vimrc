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

" filetype
filetype plugin on


" cursor for different modes
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" 
" git-gutter: 
" ===============================================================================
" line numbers are black w/no highlighting
highlight LineNr term=bold cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=black guibg=NONE
highlight SignColumn ctermbg=NONE guifg=NONE
" update on stop typing
let g:gitgutter_realtime = 0
" update on switch buffer
let g:gitgutter_eager = 1
" ignore whitespace      
let g:gitgutter_diff_args = '-w'    
" ===============================================================================

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

" Mini Muf Explorer
nnoremap <C-l> :MBEbn<CR>
nnoremap <C-h> :MBEbp<CR>
hi link MBENormal Comment
hi link MBEChanged Special
hi link MBEVisibleNormal SpecialKey
hi link MBEVisibleChanged Title
hi link MBEVisibleActiveNormal StatusLine
hi link MBEVisibleActiveChanged Error

" gundo
nnoremap <F6> :GundoToggle<CR>

" tagbar
nnoremap <silent> <F7> :TagbarToggle<CR>
let g:tagbar_left = 1

" NERDTree
nnoremap <silent> <F8> :NERDTreeToggle<CR>

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
" c++ 11 standard
let g:syntastic_cpp_compiler_options = '-std=c++11'
" latex
let g:syntastic_tex_checkers = []
" ===============================================================================

" modelines
set modeline
set modelines=1

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



" vim: set undofile:
