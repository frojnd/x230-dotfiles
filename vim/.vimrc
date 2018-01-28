set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" RUBY ON RAILS CONFIGS
" ##########################
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive' " git managment
" Rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'
" Autogenerate pairs for "{[( )
Plugin 'jiangmiao/auto-pairs'
" Tab completions
Plugin 'ervandew/supertab'
" omnicompletion for rails
Plugin 'vim-ruby/vim-ruby'
" gist vim
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'
Plugin 'dkprice/vim-easygrep'
Plugin 'elixir-lang/vim-elixir'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-endwise'
Plugin 'valloric/MatchTagAlways'
Plugin 'wakatime/vim-wakatime'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-surround'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'rhysd/vim-crystal'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
syntax on
colorscheme bubblegum
autocmd VimEnter * NERDTree

" omnicompletion for rails
if has("autocmd")
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

set smartindent
set tabstop=2
set sw=2
set expandtab
set t_Co=256
set number
set background=dark
let mapleader=' '
set cc=80,120
set hlsearch
set incsearch
set updatetime=250 "vimgutter delay time
" white spaces
set listchars=tab:>-,trail:.,extends:>
set list
set spell
hi SpecialKey guifg=#808080

" Try to use fastest ag possilbe
set grepprg=ag\ --nogroup\ --nocolor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" Set the type for the file type and override if file type
" " already has detected
au BufRead,BufNewFile *.pdf.erb set filetype=html
