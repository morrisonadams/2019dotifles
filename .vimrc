syntax on
set t_Co=256
set relativenumber

"lag fixes
set re=1
set lazyredraw

set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>


set nocompatible              " be iMproved, required
set backspace=2
set backup
"set ruler
"set showcmd
"set incsearch
"set hlsearch
filetype off                  " required
"let g:sw_exe = '/cygdrive/c/Program Files/SQL Workbench/sqlwbconsole.exe'
"let g:sw_config_dir = '/cygdrive/c/Users/morri/.sqlworkbench/'
"let g:sw_plugin_path = '~/.vim/bundle/vim-sql-workbench/'
"let g:sw_tmp = '~/.vim/tmp/'
" set the runtime path to include Vundle and initialize






set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'scrooloose/syntastic'

"Plugin 'SQLComplete.vim'

Plugin 'myusuf3/numbers.vim'

Plugin 'scrooloose/nerdtree'

"Plugin 'bling/vim-airline'

"Plugin 'nathanaelkane/vim-indent-guides'

"Plugin 'bronson/vim-trailing-whitespace'

"Plugin 'kien/rainbow_parentheses.vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'itchyny/lightline.vim'

Plugin 'junegunn/vim-easy-align' 

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'morhetz/gruvbox'

Plugin 'shinchu/lightline-gruvbox.vim'

Plugin 'mhinz/vim-startify'

Plugin 'terryma/vim-expand-region'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
set hidden
set title
set smartcase
set laststatus=2

"style
colorscheme gruvbox
set background=dark    " Setting dark mode
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

"easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

map <C-n> :NERDTreeToggle<CR>

" expand/shrink region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" remappings
inoremap jk <ESC>

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" happy cat message
echo ">^.^<"

" display
"set relativenumber
set nowrap

"abbreviations
iabbrev adn and
iabbrev waht what
iabbrev @@ morrison.Adam.S@gmail.com

"leader remap
let mapleader = " "
let maplocalleader = "\""

"navigation
nnoremap H 0
nnoremap L $

"Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>es :vnew<cr>

"SQL QOL improvements
nnoremap <leader>wf :%y+ <cr>

"save and quit
nnoremap <leader>qq :wq <cr>

"document controls
"nnoremap <leader>wqq :wq <cr>
"nnoremap <leader>qq :q <cr> 
"line movement
nnoremap - ddp
nnoremap _ dd2kp

"surroundings
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a(<esc>hbi)<esc>lel
nnoremap <leader>) viw<esc>a(<esc>hbi)<esc>lel


vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

"replace word in caps
nnoremap <c-b> <esc>viwU

"unmappings
"inoremap <esc> <nop>
"inoremap <up> <nop> inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap <up> <esc><nop>i
"nnoremap <down> <esc><nop>i
"nnoremap <left> <esc><nop>i
"nnoremap <right> <esc><nop>i

" operator mappings
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
" comment autocmds
augroup comments
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType sql nnoremap <buffer> <localleader>c I--<esc>
augroup END

" snippets

"autocomplete
autocmd Filetype sql :nmap <leader>m yiwA AS <esc>pa,<esc>o
autocmd Filetype sql :nmap <leader>aa gaip*<c-x> AS<cr>  
autocmd Filetype sql :nmap <leader>== gaip=<cr>  
autocmd Filetype sql :nmap <leader>tt gaip*<c-x> [a-z][a-z] <cr>  

augroup sql_abbreves
    autocmd!
    autocmd FileType sql :iabbrev <buffer> vc VARCHAR(255)
    autocmd FileType sql :iabbrev <buffer> select SELECT
    autocmd FileType sql :iabbrev <buffer> from FROM
    autocmd FileType sql :iabbrev <buffer> where WHERE
    autocmd FileType sql :iabbrev <buffer> is IS
    autocmd FileType sql :iabbrev <buffer> not NOT
    autocmd FileType sql :iabbrev <buffer> null NULL
    autocmd FileType sql :iabbrev <buffer> drf dwh_resto.dim_resto dr
    autocmd FileType sql :iabbrev <buffer> dcf dwh_couriers.dim_couriers dc
    autocmd FileType sql :iabbrev <buffer> fof dwh_resto.fact_orders_resto fo
    autocmd FileType sql :iabbrev <buffer> dcuf dwh_custo.dim_custos dc
    autocmd FileType sql :iabbrev <buffer> fdf dwh_couriers.fact_deliveries fd
    autocmd FileType sql :iabbrev <buffer> dcof dwh_couriers.dim_couriers dc
    autocmd FileType sql :iabbrev <buffer> dzf dwh_couriers.dim_courier_delivery_zone_ids dz
    autocmd FileType sql :iabbrev <buffer> gcf dwh_resto.dim_resto_grouping_crp gc
    autocmd FileType sql :iabbrev <buffer> soid sys_order_id
    autocmd FileType sql :iabbrev <buffer> srid sys_resto_id
    autocmd FileType sql :iabbrev <buffer> scuid sys_custo_id
    autocmd FileType sql :iabbrev <buffer> scoid sys_courier_id
    autocmd FileType sql :iabbrev <buffer> src src_region_id
    autocmd FileType sql :iabbrev <buffer> ije is_just_eat
    autocmd FileType sql :iabbrev <buffer> osid order_status_id
    autocmd FileType sql :imap <buffer> ;and; <C-O>mzAND %%% = %%%<CR><C-O>'z;;
    autocmd FileType sql :imap <buffer> ;where; <C-O>mzWHERE %%% = %%%<CR><C-O>'z;;
    autocmd FileType sql :imap <buffer> ;lj; <C-O>mzLEFT JOIN %%% ON %%% = %%%<CR><C-O>'z;;
    autocmd FileType sql :imap <buffer> ;ij; <C-O>mzINNER JOIN %%% ON %%% = %%%<CR><C-O>'z;;
"single selects
    autocmd FileType sql :iabbrev <buffer> ;sf; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfw; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfwg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfwa; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfwag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfw2a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfw2ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfw3a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfw3ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
"Left joins
    autocmd FileType sql :iabbrev <buffer> ;sfl; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflw; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflwg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflwa; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflwag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflw2a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflw2ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflw3a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sflw3ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
"2 left joins
    autocmd FileType sql :iabbrev <buffer> ;sf2l; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lwg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lw; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lwa; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lwag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lw2a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lw2ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lw3a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2lw3ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR>  LEFT JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
"inner joins
    autocmd FileType sql :iabbrev <buffer> ;sfi; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfig; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiwg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiw; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiwa; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiwag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiw2a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiw2ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiw3a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sfiw3ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
"2 inner joins
    autocmd FileType sql :iabbrev <buffer> ;sf2i; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2ig; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iwg; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iw; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iwa; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iwag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iw2a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iw2ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iw3a; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;sf2iw3ag; <C-O>mzSELECT%%%<CR>  FROM %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR>  INNER JOIN %%% ON %%% = %%%<CR> WHERE %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>   AND %%% = %%%<CR>  GROUP BY %%%<CR> LIMIT 50;<C-O>'z;;
    autocmd FileType sql :iabbrev <buffer> ;w; <C-O>mzWITH%%% AS<CR>    (<CR> %%% <CR>)%%%<C-O>'z;;
augroup END


"Field selection
:imap ;; <C-O>/%%%<CR><C-O>c3l
:nmap ;; /%%%<CR>c3l
