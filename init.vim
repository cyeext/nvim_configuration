" 退出terminal-mode
:tnoremap <Esc> <C-\><C-n>
" 半透明
hi Normal ctermfg=252 ctermbg=none
" Python3路径---------------------------
let g:python3_host_prog='/opt/homebrew/Cellar/python@3.9/3.9.13_4/bin/python3.9'
let g:formatter_yapf_style = 'pep8'

" ALE
let g:ale_disable_lsp = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline_theme = 'codedark'

" Leader key config------------------------
let mapleader=","

" floaterm-----------------------
"let g:floaterm_keymap_toggle = '<leader>t'

"map <leader>m :CocCommand markmap.create --enable-mathjax<CR>
" lazygit -----------------------
nnoremap <silent> <leader>lg :LazyGit<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" rainbow brackets
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" vim-plug-------------------------
call plug#begin('~/.config/nvim/plug')
Plug 'kevinhwang91/rnvimr'
"Plug 'jdkanani/vim-material-theme'
"Plug 'luochen1990/rainbow'
"Plug 'ap/vim-css-color'
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'tweekmonster/django-plus.vim'
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Plug 'jvanja/vim-bootstrap4-snippets'
"Plug 'honza/vim-snippets'
"Plug 'dunstontc/vim-vscode-theme'
"Plug 'tomasiser/vim-code-dark'
Plug 'tyru/caw.vim'
"Plug 'joshdick/onedark.vim'
"Plug 'haishanh/night-owl.vim'
"Plug 'flazz/vim-colorschemes'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dahu/VimRegexTutor'
Plug 'godlygeek/tabular'
"Plug 'godlygeek/tabular'
"Plug 'voldikss/vim-floaterm'
"Plug 'liuchengxu/vista.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'mhinz/vim-startify'
"Plug 'morhetz/gruvbox'
Plug 'tmhedberg/SimpylFold'
Plug 'jiangmiao/auto-pairs'
"Plug 'liuchengxu/space-vim-theme'
"Plug 'liuchengxu/space-vim-dark'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'altercation/vim-colors-solarized'
Plug 'preservim/nerdcommenter'
Plug 'honza/vim-snippets'
"Plug 'skywind3000/vim-terminal-help'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

" rnvimr
"tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
"nnoremap <silent> <leader>F :RnvimrToggle<CR>
"tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
"" Add a shadow window, value is equal to 100 will disable shadow
"let g:rnvimr_shadow_winblend = 100

" vim-markdown
let g:tex_conceal = ""
let g:vim_markdown_math = 1

filetype plugin on

" fzf设置-----------------------------------
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" python mode设置------------------
let g:pymode_lint = 0
let g:pymode_motion=1
let g:pymode_doc=0
let g:pymode_doc_bind='<leader>k'
let g:pymode_virutalenv=1
let g:pymode_folding=0
let g:pymode_run=1
let g:pymode_run_bind='<leader>R'
let g:pymode_breakpoint=1
let g:pymode_breakpoint_bind='<leader>b'
let g:pymode_breakpoint_cmd=''

" vim-terminal-help设置-----------------------
let g:terminal_cwd=0

" coc-snippets config --------------------------
inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" coc.nvim设置------------------------------
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" 设置emmet-vim ----------------------------------
let g:user_emmet_leader_key='<leader>'

" 设置中文帮助 -------------------------------------
set helplang=cn
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

" 设置外观 -------------------------------------
set number                      "显示行号
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条"
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set cursorline                  "突出显示当前行"
set cursorcolumn                "突出显示当前列"
set langmenu=zh_CN.UTF-8        "显示中文菜单
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set pumblend=10
set winblend=30
" 设置不同模式下光标形状--------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 编程辅助 -------------------------------------
syntax on                           "开启语法高亮
syntax enable
set nowrap                      "设置代码不折行"
set fileformat=unix             "设置以unix的格式保存文件"
set tabstop=4                   "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=4                "每一级缩进是多少个空格
"set softtabstop=4
"set autoindent
set backspace+=indent,eol,start "set backspace&可以对其重置
set showmatch                   "显示匹配的括号"
set scrolloff=5                 "距离顶部和底部5行"
set laststatus=2                "命令行为两行"

" 其他杂项 -------------------------------------
set selection=exclusive
set matchtime=5
set ignorecase                  "忽略大小写"
set incsearch
set hlsearch                    "高亮搜索项"
set wrapscan
highlight Search ctermbg=yellow ctermfg=black
highlight IncSearch ctermbg=black ctermfg=yellow
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
set noexpandtab                 "不允许扩展table"
set whichwrap+=<,>,h,l
set hidden
set smartcase
set wildmenu
set termguicolors
syntax on
set t_Co=256
set cursorline
"colorscheme onedark
let g:rehash256 = 1
"set relativenumber
set foldmethod=indent
set clipboard=unnamed
set mouse=a
"set suffixesadd=.py

" Packer插件管理
lua require('plugins')
lua require('plugin-config/bufferline')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/which-key')
lua require('plugin-config/pretty-fold')
lua require('plugin-config/lualine')
lua require('plugin-config/telescope')
lua require('plugin-config/gitsigns')
lua require('plugin-config/toggleterm')
lua require('plugin-config/autosave')
lua require('plugin-config/onedark')
lua require('plugin-config/nvim-ts-rainbow')
lua require('plugin-config/material')
lua require('plugin-config/indent_blankline')

" Find files using Telescope command-line sugar.
nnoremap <leader>gf <cmd>Telescope find_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>gb <cmd>Telescope buffers<cr>
nnoremap <leader>gh <cmd>Telescope help_tags<cr>
nnoremap <leader>gp <cmd>Telescope projects<cr>

nnoremap <leader>F :RangerWorkingDirectory<cr>-theme
nnoremap F :Format<cr>

" startify
nnoremap S :Startify<CR>

" material
"
"if (has('nvim'))
  "let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
"endif

"let g:material_terminal_italics = 1
"let g:material_theme_style = 'light'
colorscheme material

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
