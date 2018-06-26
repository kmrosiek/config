set rtp+=~/.vim/bundle/Vundle.vim
syntax on
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=C:\Users\Chris\.vim\bundle\Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'    " Taskbar and tabs
Plugin 'mhinz/vim-signify'          " Git differ
Plugin 'skywind3000/asyncrun.vim'   " Async shell commands
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'tpope/vim-fugitive'
"Plugin 'ap/vim-buftabline'
"Plugin 'vim-syntastic/syntastic.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Set colorscheme
colorscheme molokai
set encoding=utf-8              "Required by YouCompeleMe

if has("gui_win32")
    set guifont=Consolas:h11:cANSI  "Change font for gvim
    set guioptions-=m               "remove menu bar
    set guioptions-=T               "remove toolbar
endif

set relativenumber
set number
set hlsearch
set nowrap
set hidden "Allows buffer to be hidden.
set tabstop=4
set shiftwidth=4
set expandtab
set tags=./tags;/,tags;/
set nocp

"Switching between windows"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Tell vim to remember undo even after closing vim."
set undofile
" set a directory to store the undo history
set undodir=/home/chris/.vim/undofiles

"Moving line"
    "With arrows"
nnoremap <S-Up> :m -2<CR>
nnoremap <S-Down> :m +1<CR>
inoremap <S-Up> <Esc>:m -2<CR><A>
inoremap <S-Down> <Esc>:m +1<CR><A>
    "With J and K in a normal mode"
nnoremap <S-j> :m +1<CR>
nnoremap <S-k> :m -2<CR>

"Disable arrows"
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Insert new line in a normal mode"
nmap <CR>  o<Esc>

"Remove comments in a current line"
nnoremap <C-S-c> :s/\/\/<CR>:noh<CR>

"Copy and replace word. Copy with ctrl+x and replace word with ctrl+v
nnoremap <C-x> "hyiw
nnoremap <C-v> diwh"hp


"Buffers"
    "Create a new buffer"
nnoremap <C-n> :enew<CR>\t
    "Moving around"
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
    "Close Buffer"
nnoremap <S-x> :bd<CR>

"VIMRC handling
nnoremap <F12> :e $MYVIMRC<CR>
nnoremap <C-F12> :so $MYVIMRC<CR>
" ctags
nnoremap <F4> :!ctags -R .<CR>

let compiler_tty = "/dev/tty2"
"Compile and run
"nnoremap <F9> :AsyncRun make -j -C ~/projects/cpp/tarzan/build &> /dev/tty2<CR>
nnoremap <F9> :AsyncRun make -j -C ~/Programming/new_ai_crossword/build &> /dev/pts/1<CR>
"nnoremap <F9> :AsyncRun make -C ../build &> /dev/tty2 && ./build/alpha_server &> /dev/tty2<CR>
"nnoremap <F9> :AsyncRun make -C build &> /dev/tty2<CR>
"nnoremap <F8> :make -C build &> compiler_tty<CR>
"nnoremap <F8> :execute 'make -C build &>' compiler_tty<CR>

function! AsyncBuild()
    :execute 'make -C build &>' g:compiler_tty
endfunction

function! AsyncRun()
    :execute 'build/alpha_server &>' g:compiler_tty
endfunction


nnoremap <F7> :call AsyncBuild()<CR>
nnoremap <F8> :call AsyncRun()<CR>


"Draw a line
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

"Map the leader key to the space.
let mapleader=" "


"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%*

"CommandT settings
let g:commandTMatchWindowAtTop = 1

"YouCompleteMe settings
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"Vim-airline settings
let g:airline#extensions#tabline#enabled = 1

"vim-signify settings
let g:signify_vcs_list = [ 'git' ]
let g:signify_line_highlight = 0
let g:signify_sign_show_count = 1

" highlight +-=
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

if &diff
        colorscheme evening
    endif

execute "set <M-1>=\e1"
execute "set <M-2>=\e2"
execute "set <M-3>=\e3"
execute "set <M-4>=\e4"
execute "set <M-5>=\e5"
execute "set <M-6>=\e6"
execute "set <M-7>=\e7"
execute "set <M-8>=\e8"
execute "set <M-9>=\e9"
nnoremap <M-1> :buffer 1<CR>
nnoremap <M-2> :buffer 2<CR>
nnoremap <M-3> :buffer 3<CR>
nnoremap <M-4> :buffer 4<CR>
nnoremap <M-5> :buffer 5<CR>
nnoremap <M-6> :buffer 6<CR>
nnoremap <M-7> :buffer 7<CR>
nnoremap <M-8> :buffer 8<CR>
nnoremap <M-9> :buffer 9<CR>

"Add uint32_t to Define group - will be colored as int, void etc.
"match Define /uint32_t/
syn keyword Define uint32_t
"Color whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
