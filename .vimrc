set nocompatible
language en_US.utf-8

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
      " \ coc#pum#visible() ? coc#pum#next(1):
      " \ CheckBackspace() ? "\<Tab>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
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

" Remap <C-u> and <C-d> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-u>"
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-d>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-u>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-d>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call  CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold   :call  CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR     :call  CocActionAsync('runCommand', 'editor.action.organizeImport')

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

Plug 'dense-analysis/ale'
  let g:ale_disable_lsp = 1
  let g:ale_linters = { 'tex': ['chktex', 'texlab'] }

" Plug 'vim-denops/denops.vim'
" Plug 'Shougo/ddc.vim'

" Plug 'yegappan/lsp'
"   let lspOpts = #{
"     \ aleSupport: v:true,
"     \ autoHighlightDiags: v:true
"     \ }
"   autocmd User LspSetup call LspOptionsSet(lspOpts)
" 
"   let lspServers = [#{
"     \	name: 'clang',
"     \	filetype: ['c', 'cpp'],
"     \	path: '/usr/bin/clangd',
"     \	args: ['--background-index']
"     \ }, #{
"     \	name: 'typst',
"     \	filetype: ['typst'],
"     \	path: '/usr/bin/tinymist',
"     \	args: ['lsp']
"     \ }]
"   autocmd User LspSetup call LspAddServer(lspServers)

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsEnableSnipMate = 0

Plug 'lervag/vimtex'
  let g:vimtex_compiler_progname=v:progname
  let g:tex_flavor='latex'
  let g:vimtex_view_general_viewer = 'zathura'
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_quickfix_mode=0
  let g:vimtex_include_search_enabled = 0
  let g:vimtex_indent_ignored_envs = ['document', 'center', 'figure']
  let g:vimtex_indent_on_ampersands = 0
  let g:vimtex_matchparen_enabled = 0
  let g:vimtex_imaps_leader = ';'
  let g:vimtex_syntax_custom_cmds = [
    \{'name': 'colon', 'mathmode': 1, 'concealchar': ':'},
    \{'name': 'card', 'mathmode': 1, 'concealchar': '#'},
    \{'name': 'dif', 'mathmode': 1, 'concealchar': 'd'},
    \{'name': 'eps', 'mathmode': 1, 'concealchar': 'ε'},
    \{'name': 'vthe', 'mathmode': 1, 'concealchar': 'ϑ'},
    \{'name': 'vphi', 'mathmode': 1, 'concealchar': 'φ'},
    \{'name': 'lap', 'mathmode': 1, 'concealchar': 'Δ'},
    \{'name': 'into', 'mathmode': 1, 'concealchar': '↪'},
    \{'name': 'lrr', 'mathmode': 1, 'concealchar': '→'},
    \{'name': 'lmt', 'mathmode': 1, 'concealchar': '↦'},
    \{'name': 'dd', 'mathmode': 1, 'concealchar': 'd'}
    \]
  let g:vimtex_indent_delims = {
    \ 'open' : ['{'],
    \ 'close' : ['}'],
    \ 'close_indented' : 1,
    \ 'include_modified_math' : 1,
    \}

Plug 'kaarmu/typst.vim'
  let g:typst_pdf_viewer = 'zathura'
  let g:typst_conceal_math = 0

Plug 'andymass/vim-matchup'
  let g:matchup_override_vimtex = 1

Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'


if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

Plug 'preservim/nerdcommenter'
  let g:NERDDefaultAlign = 'left'
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDCommentEmptyLines = 1
  let g:NERDToggleCheckAllLines = 1
  map <leader>cc <plug>NERDCommenterToggle
  map <leader>c<space> <plug>NERDCommenterComment
  " for ctrl + /
  map <c-_> <plug>NERDCommenterToggle
  let g:NERDCustomDelimiters = {
    \ 'julia': { 'left': '#', 'leftAlt': '#=', 'rightAlt': '=#' }
    \ }

" Plug 'jiangmiao/auto-pairs'
Plug 'LunarWatcher/auto-pairs'
  let g:AutoPairsShortcutFastWrap = '<C-q>'
  let g:AutoPairsMapBS = 1

Plug 'tpope/vim-surround'

Plug 'Chiel92/vim-autoformat'

Plug 'mbbill/undotree'

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
  let g:asyncrun_open = 6

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'
  vnoremap <localleader>jf :<C-u>call JuliaFormatter#Format(1)<CR>
  nnoremap <localleader>jf :<C-u>call JuliaFormatter#Format(0)<CR>

Plug 'neovimhaskell/haskell-vim'
Plug 'edwinb/idris2-vim'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'junegunn/fzf.vim'

Plug 'puremourning/vimspector'
  let g:vimspector_enable_mappings = 'HUMAN'
  let g:vimspector_install_gadgets = [ 'vscode-cpptools', 'CodeLLDB' ]
  let g:vimspector_base_dir = expand('$HOME/.vim/vimspector')

Plug 'https://codeberg.org/cwfoo/vim-text-omnicomplete', { 'do': 'make' }

Plug 'sheerun/vim-polyglot'

Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
  let g:gruvbox_italics = 0
  let g:gruvbox_italicize_strings = 0
  let g:gruvbox_plugin_hi_groups = 1
  let g:gruvbox_filetype_hi_groups = 1
Plug 'sainnhe/gruvbox-material'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme = 'gruvbox'
  let g:airline_powerline_fonts = 1
  set laststatus=2
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#ale#enabled = 1

call plug#end()

" Defx settings
call defx#custom#option('_', {
  \ 'columns': 'indent:git:icons:filename',
  \ 'winwidth': 30,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'buffer_name': '',
  \ 'toggle': 1,
  \ 'resume': 1
  \ })

  nmap <silent> <Leader>e :Defx -search=`expand('%:p')` <cr>
  autocmd FileType defx call s:defx_mappings()

  function! s:defx_mappings() abort
    nnoremap <silent><buffer><expr> c      defx#do_action('copy')
    nnoremap <silent><buffer><expr> m      defx#do_action('move')
    nnoremap <silent><buffer><expr> p      defx#do_action('paste')
    nnoremap <silent><buffer><expr> K      defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N      defx#do_action('new_file')
    nnoremap <silent><buffer><expr> S      defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d      defx#do_action('remove')
    nnoremap <silent><buffer><expr> r      defx#do_action('rename')
    nnoremap <silent><buffer><expr> !      defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> yy     defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> ~      defx#do_action('cd')
    nnoremap <silent><buffer><expr> q      defx#do_action('quit')
    nnoremap <silent><buffer><expr> s      defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j      line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k      line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> i      <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> l      <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> h      defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> .      defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <c-l>  defx#do_action('redraw')
  endfunction
  
  function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
      return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
  endfunction


set hidden
set number
set relativenumber
set history=8192
set visualbell
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set magic
set mouse=a
" set autochdir
set autoread
set wildmenu
set bsdir=buffer
set conceallevel=2
set pumheight=15
filetype plugin indent on

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,big5

set nospell
set dictionary=spell,~/.vim/spell/en.utf-8.add,/usr/share/dict/words
set complete+=k
set spelllang=en_us

" UI Settings
set cursorline
set cursorcolumn
if has("gui_running")
  set go=
  set guifont=Fira\ Code\ 11,等距更纱黑体\ SC\ 11
  set guifontwide=等距更纱黑体\ SC\ 11
  set lines=32
  set columns=100
endif

" normal mode mapping
nnoremap <c-n> :nohl<CR>
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
nnoremap <c-j> J"_x
nnoremap <c-s> :w<CR>
nnoremap ; "_
nnoremap <silent> ;; :call autopairs#AutoPairsJump()<CR>
" insert mode mapping
inoremap jj <Esc>
" inoremap <silent> ;; <Esc>:call autopairs#Keybinds#IgnoreInsertEnterCmd(":call autopairs#AutoPairsJump()")<CR>a
inoremap <silent> <c-k> <Esc>:call autopairs#AutoPairsJump()<CR>a
inoremap <c-s> <Esc>:w<CR>a
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" visual mode mapping
vnoremap > >gv
vnoremap < <gv
vnoremap H ^
vnoremap L $

" autocmd
autocmd FileType markdown setlocal spell
autocmd FileType tex
  \ setlocal spell |
  \ setlocal nocursorcolumn |
  \ setlocal tabstop=2 |
  \ setlocal shiftwidth=2 |
  \ setlocal softtabstop=2 |
  \ setlocal omnifunc=text_omnicomplete#Complete |
  \ let b:AutoPairs = {'(':')', '[':']', '{':'}', "`":"'", "``":"''"}
autocmd FileType typst
  \ setlocal spell |
  \ setlocal nocursorcolumn |
  \ setlocal tabstop=2 |
  \ setlocal shiftwidth=2 |
  \ setlocal softtabstop=2 |
  \ setlocal omnifunc=text_omnicomplete#Complete |
  \ let b:AutoPairs = {'`':'`', '```':'```', '"':'"', '(':')', '[':']', '{':'}', "$":"$"} |
  \ nnoremap <leader>ll :TypstWatch<CR>
autocmd FileType vim
  \ setlocal tabstop=2 |
  \ setlocal shiftwidth=2 |
  \ setlocal softtabstop=2
autocmd FileType defx setlocal norelativenumber
autocmd FileType defx setlocal nonumber

set termguicolors
set bg=dark
syntax on
colorscheme gruvbox8
