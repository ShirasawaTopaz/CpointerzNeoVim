"by Cpointerz

"set
set encoding=utf-8
set mouse=a
set runtimepath+={~/.config/nvim/autoload}
let mapleader="\<CR>"
set number
set tabstop=4
set shiftwidth=4
filetype plugin indent on

"update rust nightly
nnoremap r :silent exec "!rustup update nightly > CpointerzNeovim_log.txt"<CR>

"Install_plug
call dein#begin('~/.config/nvim/plug')

call dein#add('wsdjeg/dein-ui.vim')
call dein#add('preservim/nerdtree')
call dein#add('glepnir/dashboard-nvim')
call dein#add('liuchengxu/vim-clap')
call dein#add('preservim/tagbar')
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
call dein#add('vim-airline/vim-airline')
call dein#add('kaicataldo/material.vim')
call dein#end()

"==========key=========
"update
nmap u :!curl https://gitee.com/Cpointerz/CpointerzNeoVim/raw/master/init.vim > ~/.config/nvim/init.vim<CR>

"set Tagbar
nmap e :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_right = 1

"set themes
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material

"vim-clap
let g:clap_layout = { 'relative': 'editor' }
let g:clap_provider_alias = {'hist:': 'command_history'}
let g:clap_theme = 'material_design_dark'

" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"buffer number
nnoremap ba<LEADER> :b 1<CR>
nnoremap bs<LEADER> :b 2<CR>
nnoremap bd<LEADER> :b 3<CR>
nnoremap bf<LEADER> :b 4<CR>
nnoremap bg<LEADER> :b 5<CR>
nnoremap bh<LEADER> :b 6<CR>
nnoremap bj<LEADER> :b 7<CR>
nnoremap bk<LEADER> :b 8<CR>
nnoremap bl<LEADER> :b 9<CR>
nnoremap b;<LEADER> :b 0<CR>

"Install_plug function
nmap pi :call dein#install()<CR>

nmap ci :CocInstall coc-pyright coc-rust-analyzer coc-clangd<CR>

"update_plug function
nmap pu :DeinUpdate<CR>

nmap cu :CocUpdate<CR>

"set explorer
nmap t :NERDTree<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"new windows
nmap n :vnew<CR>

"ESC 
imap jk <ESC>

"write
nnoremap w :w<CR>
"close
nnoremap q :q<CR>

"tab
nnoremap tn  :tabnew<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tc  :tabclose<CR>

"set TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"==========set dashboard-nvim==========

let g:dashboard_custom_header = [
     \ '',
     \ '    .::                                   .::                            ',
     \ ' .::   .::                   .:           .::                            ',
     \ '.::       .: .::     .::       .:: .::  .:.: .:   .::    .: .::: ::::::::',
     \ '.::       .:  .::  .::  .:: .:: .::  .::  .::   .:   .::  .::        .:: ',
     \ '.::       .:   .::.::    .::.:: .::  .::  .::  .::::: .:: .::      .::   ',
     \ '.::   .:: :: .::   .::  .:: .:: .::  .::  .::  .:         .::     .::    ',
     \ '   .::::  .::        .::    .::.:::  .::   .::   .::::   .:::   .::::::::',
     \ '          .::                                                            ',
     \ '                                V3.1.3                                   ',
     \ '',
     \ ]

let g:dashboard_custom_shortcut={
      \ 'last_session' : 's l CR',
      \ 'find_history' : 'f h CR',
      \ 'find_file' : 'f f CR',
      \ 'new_file' : 'c n CR',
      \ 'change_colorscheme' : 't c CR',
      \ 'find_word' : 'f a CR',
      \ 'book_marks' : 'f b CR',
      \ }
     
nnoremap <silent> fh<Leader> :<C-u>Clap history<CR>
nnoremap <silent> ff<Leader> :<C-u>Clap files<cr>
nnoremap <silent> tc<Leader> :<C-u>Clap colors<CR>
nnoremap <silent> fa<Leader> :<C-u>Clap blines<CR>
nnoremap <silent> fb<Leader> :<C-u>Clap marks<CR>

let g:dashboard_default_executive ='clap'

nmap ss<Leader> :<C-u>SessionSave<CR>
nmap sl<Leader> :<C-u>SessionLoad<CR>
