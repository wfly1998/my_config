" --------------------------------
"	My vimrc
"	@author: wfly1998
"	@change: 20210616
" --------------------------------
"  vim-plug config
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ycm-core/YouCompleteMe', {'do': 'python install.py --clangd-completer'}
call plug#end()
" --------------------------------
" Plugin settings
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_min_num_of_chars_for_completion = 1
let g:vim_markdown_folding_disabled = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" --------------------------------
" My config
set number
set smartindent
set tabstop=4
set shiftwidth=4
set hlsearch
set autoread
set nowrap
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
map <F5> <Esc>:w!<CR>:call RunCode()<CR>
map <F8> :TagbarToggle<CR>
autocmd FileType c,cpp,rust inoremap {<CR> {<CR>}<Esc>O
autocmd BufNewFile,BufRead *.vh setfiletype verilog
vmap <C-c> "+y
map <C-n>h :nohl<CR>
nmap <Space>t :tabnew<CR>
nmap <Space>h :tabp<CR>
nmap <Space>l :tabn<CR>
nmap <Space>j :bp<CR>
nmap <Space>k :bn<CR>
nmap <Space>c :tabclose<CR>
nmap <Space>q :q<CR>
nmap <Space>w :w<CR>
nmap <Space>n <C-w><C-w>
nmap <Space>x <C-w><C-x>
nmap <Space>s :sp<CR>
nmap <Space>v :vsp<CR>
tnoremap <C-e> <C-w>N

func RunCode()
	if has("nvim")
		if &filetype == 'c'
			exec "'vsplit term://bash -c 'gcc % && ./a.out'"
		elseif &filetype == 'cpp'
			exec "vsplit term://bash -c 'g++ % && ./a.out'"
		elseif &filetype == 'python'
			exec "vsplit term://python %"
		elseif &filetype == 'tex'
			exec "vsplit term://xelatex %"
		endif
	else
		if &filetype == 'c'
			exec 'terminal bash -c "gcc % && ./a.out"'
		elseif &filetype == 'cpp'
			exec 'terminal bash -c "g++ % && ./a.out"'
		elseif &filetype == 'python'
			exec 'terminal python %'
		elseif &filetype == 'tex'
			exec 'terminal xelatex %'
		endif
	endif
endfunc

" --------------------------------