if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.cache/dein")
	call dein#begin("~/.cache/dein")

	"Git
	call dein#add("airblade/vim-gitgutter")
	call dein#add("tpope/vim-fugitive")

	"Scala
"	call dein#add("ensime/ensime-vim")
	call dein#add("derekwyatt/vim-scala")

	"Typescript
	call dein#add("Shougo/deoplete.nvim")
	let g:deoplete#enable_at_startup = 1

	call dein#add('HerringtonDarkholme/yats.vim')
	call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

	"Javascript
	call dein#add("pangloss/vim-javascript")

	"Java
	call dein#add("JalaiAmitahl/maven-compiler.vim")
	call dein#add("artur-shaik/vim-javacomplete2")

	"Robot Framework
	call dein#add("mfukar/robotframework-vim")

	"Misc
	call dein#add("tpope/vim-abolish")

	call dein#add("dpelle/vim-LanguageTool")
	let g:languagetool_jar = '/nix/store/a69hgadgx1l4z2aga6nkk43pqf6y5hjm-LanguageTool-4.2/share/languagetool-commandline.jar'

	call dein#add("editorconfig/editorconfig-vim")

	call dein#add("scrooloose/syntastic")
	let g:syntastic_javascript_checkers = ['eslint']
	let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
	let g:syntastic_solidity_checkers = ['solium']
	let g:syntastic_typescript_tsc_fname = ''
	let g:syntastic_java_checkers=[]
	let g:syntastic_java_javac_config_file_enabled = 1

	call dein#add("Shougo/vimproc.vim", { 'build': 'make' })


	call dein#add("wincent/terminus")
	call dein#add("TroyFletcher/vim-colors-synthwave")

	call dein#add("vim-airline/vim-airline")
	let g:airline_powerline_fonts = 1

	call dein#add("rbgrouleff/bclose.vim")
	call dein#add("francoiscabrol/ranger.vim")

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

"Code style
set shiftwidth=4
set tabstop=4
set noexpandtab
set softtabstop=4
set encoding=utf-8
set smarttab

command Todo grep TODO -A1 -r . 

"Keyboard shortcuts
tnoremap <Esc> <C-\><C-n>
map <leader>rr :RangerEdit<cr>
map <leader>rv :RangerVSplit<cr>
map <leader>rs :RangerSplit<cr>
map <leader>rt :RangerTab<cr>
map <leader>ri :RangerInsert<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
map <leader>rR :set operatorfunc=RangerBrowseEdit<cr>g@
map <leader>rT :set operatorfunc=RangerBrowseTab<cr>g@
map <leader>rS :set operatorfunc=RangerBrowseSplit<cr>g@
map <leader>rV :set operatorfunc=RangerBrowseVSplit<cr>g@

"Look'n'feel
filetype plugin indent on
syntax enable
set list
set listchars=tab:»\ ,trail:.
set background=dark
colorscheme synthwave
hi! Normal ctermfg=223 ctermbg=none guifg=#ebdbb2 guibg=none
let &t_Co=256
set t_ut=
set hlsearch
set colorcolumn=120
set mouse=a
set backspace=indent,eol,start
set number

set guioptions-=T
set guioptions-=m

"Load local config files
silent! so .vimrc
silent! so ../.vimrc

"Switch to presentation mode

function Presentation()
	set background=light
	hi! Normal ctermbg=white guibg=white
endfunction
