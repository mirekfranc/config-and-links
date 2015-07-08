set background=dark
set nofoldenable    " nofen
set autoindent      " ai
set showmatch       " sm
set pastetoggle=<F10>
set linebreak       " lbr
set ignorecase      " ic
set nohlsearch      " nohls

nmap <F8> :set invhlsearch<CR>
nmap <F9> :setlocal invspell spelllang=en<CR>

set expandtab       " et
set tabstop=8       " ts
set softtabstop=2   " sts
set shiftwidth=2    " sw
set shiftround      " sr
set nonumber        " nonu

set keywordprg=man  " kp

autocmd Filetype perl setlocal noet sts=8 ts=8 sw=8 nolbr nu kp=perldoc\ -f
autocmd Filetype make setlocal noet sts=8 ts=8 sw=8 nolbr nu
autocmd Filetype cmake setlocal noet sts=8 ts=8 sw=8 nolbr nu
autocmd Filetype config setlocal noet sts=8 ts=8 sw=8 nolbr nu
autocmd Filetype python setlocal et sts=4 ts=8 sw=4 nolbr nu kp=pydoc
autocmd Filetype sh setlocal et sts=2 ts=8 sw=2 nolbr nu
autocmd Filetype c setlocal et sts=2 ts=8 sw=2 nolbr nu
autocmd Filetype cpp setlocal et sts=2 ts=8 sw=2 nolbr nu
autocmd Filetype rb setlocal et sts=2 ts=8 sw=2 nolbr nu kp=ri
