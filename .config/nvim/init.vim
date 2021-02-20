set number
set termguicolors

let g:python_host_prog =  $HOME . '.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '.pyenv/versions/neovim3/bin/python'
let g:ruby_host_prog = '/Users/ryohei/.rbenv/versions/2.6.3/neovim-ruby-host'
let g:node_host_prog = $HOME . '/.n/lib/node_modules/neovim/bin/cli.js'
let g:lightline = {'colorscheme': 'onedark'}

call plug#begin('~/.vim/plugged')
" ここにインストールしたいプラグインを記述"
  Plug 'joshdick/onedark.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme onedark
nmap <C-e> :NERDTreeToggle<CR>
