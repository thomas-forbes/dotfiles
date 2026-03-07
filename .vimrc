call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Plug 'tomasr/molokai'
"Plug 'morhetz/gruvbox'
"Plug 'jacoborus/tender.vim'
"Plug 'dracula/vim', { 'name': 'dracula' }
"Plug 'ghifarit53/tokyonight-vim'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

" Themes
if (has("termguicolors"))
 set termguicolors
endif

syntax on

set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1

" Light lime
set laststatus=2
let g:lightline = { 
  \ 'colorscheme': 'palenight',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
  \             [ 'time' ] ],
  \ 'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'time': 'GetTime',
  \ },
  \ }

let s:time = strftime('%H:%M:%S')

function! GetTime()
  return s:time
endfunction
function! UpdateTime(arg)
  let s:time = strftime('%H:%M:%S')
  call lightline#update()
endfunction

call timer_start(1000, 'UpdateTime', #{repeat: -1})

hi Normal guibg=NONE ctermbg=NONE

" Advanced settings

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


" Nerd tree
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']


" select all
nmap <C-a> ggVG
" half page up / down
nmap <C-d> Lzz
nmap <C-u> Hzz

" General settings
set timeout timeoutlen=1000 ttimeoutlen=0 " sets esc timeout
set clipboard=unnamed
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set number
set smartcase
set splitbelow
set splitright
set hlsearch " highlight search results
set ignorecase
set showmatch " show matching bracket
"set cursorline " highlight current line
set scrolloff=3 " keeps x lines under the cursor when moving down a page
set noswapfile
set linebreak
set fdm=indent
set foldcolumn=1
set nocompatible
set nofoldenable
set noshowmode
"set spell spelllang=en_us
let mapleader = " "

" cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END

function! ToggleComment()
  let sel = getline(line("'<"), line("'>"))
  let commented = 1
  for line in sel
    if line =~ '^' . escape(b:comment_leader, '/\')
      let commented = 0
      break
    endif
  endfor
  if commented
    execute ":'<,'>s/^/".escape(b:comment_leader,'\/')."/"
  else
    execute ":'<,'>s/^\\V".escape(b:comment_leader,'\/')."//"
  endif
endfunction


vmap <silent> <leader>/ :<C-u>call ToggleComment()<CR>

set re=0


