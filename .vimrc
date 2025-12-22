vim9script

language en_US.utf-8
set nocompatible
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=number

# Plugins
plug#begin('~/.vim/plugged')

# Plug 'neoclide/coc.nvim', {'branch': 'release'}

# Plug 'vim-denops/denops.vim'
# Plug 'Shougo/ddc.vim'

Plug 'yegappan/lsp'
  var lspOpts = {
    autoComplete: false,
    showSignature: false,
    aleSupport: true,
    ultisnipsSupport: true,
  }
  autocmd User LspSetup call LspOptionsSet(lspOpts)
  var lspServers = [
    {
      name: 'clang',
      filetype: ['c', 'cpp'],
      path: 'clangd',
      args: ['--background-index']
    },
    {
      name: 'tinymist',
      filetype: ['typst'],
      path: 'tinymist',
      args: ['lsp'],
      initializationOptions: {
        exportPdf: "onSave"
      }
    },
    {
      name: 'texlab',
      filetype: ['tex'],
      path: 'texlab',
      args: [],
    },
  ]
  autocmd User LspSetup call LspAddServer(lspServers)
  nnoremap <silent> K :LspHover<CR>
Plug 'girishji/vimcomplete'
Plug 'girishji/ngram-complete.vim'
  g:vimcomplete_cr_enable = 0
  var vcOptions = {
    completor: {
      triggerWordLen: 2,
      setCompleteOpt: false,
      noNewlineInCompletionEver: true,
    },
    lsp: {
      enable: true,
      priority: 20,
    },
    ngram: {
      enable: true,
      priority: 10,
      bigram: false,
      filetypes: ['text', 'tex', 'typst'],
      filetypesComments: ['*'],
    },
    dictionary: {
      enable: true,
      priority: 10,
      filetypes: ['text', 'tex', 'typst'],
    },
  }
  autocmd VimEnter * call VimCompleteOptionsSet(vcOptions)
  set completeopt=menuone,noinsert

Plug 'dense-analysis/ale'
  g:ale_disable_lsp = 1
  g:ale_linters = { 'tex': ['chktex', 'texlab'] }

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
  g:UltiSnipsExpandTrigger = '<tab>'
  g:UltiSnipsJumpForwardTrigger = '<tab>'
  g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  # g:UltiSnipsJumpForwardTrigger = '<c-k>'
  # g:UltiSnipsJumpBackwardTrigger = '<esc>k'
  g:UltiSnipsEnableSnipMate = 0

Plug 'lervag/vimtex'
  g:vimtex_compiler_progname = v:progname
  g:tex_flavor = 'latex'
  g:vimtex_view_general_viewer = 'zathura'
  g:vimtex_view_method = 'zathura'
  g:vimtex_quickfix_mode = 0
  g:vimtex_include_search_enabled = 0
  g:vimtex_indent_ignored_envs = ['document', 'center', 'figure']
  g:vimtex_indent_on_ampersands = 0
  g:vimtex_matchparen_enabled = 0
  g:vimtex_imaps_leader = ';'
  g:vimtex_syntax_custom_cmds = [
    {'name': 'colon', 'mathmode': 1, 'concealchar': ':'},
    {'name': 'card', 'mathmode': 1, 'concealchar': '#'},
    {'name': 'dif', 'mathmode': 1, 'concealchar': 'd'},
    {'name': 'eps', 'mathmode': 1, 'concealchar': 'ε'},
    {'name': 'vthe', 'mathmode': 1, 'concealchar': 'ϑ'},
    {'name': 'vphi', 'mathmode': 1, 'concealchar': 'φ'},
    {'name': 'lap', 'mathmode': 1, 'concealchar': 'Δ'},
    {'name': 'into', 'mathmode': 1, 'concealchar': '↪'},
    {'name': 'lrr', 'mathmode': 1, 'concealchar': '→'},
    {'name': 'lmt', 'mathmode': 1, 'concealchar': '↦'},
    {'name': 'dd', 'mathmode': 1, 'concealchar': 'd'}
  ]
  g:vimtex_indent_delims = {
    'open': ['{'],
    'close': ['}'],
    'close_indented': 1,
    'include_modified_math': 1,
  }

Plug 'kaarmu/typst.vim'
  g:typst_pdf_viewer = 'zathura'
  g:typst_conceal_math = 0
  g:typst_auto_open_quickfix = 0

Plug 'LunarWatcher/auto-pairs'
  g:AutoPairsPrefix = '<c-t>'
  g:AutoPairsShortcutJump = '<c-k>'
  g:AutoPairsShortcutFastWrap = '<c-q>'
  g:AutoPairsMapBS = 1
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
  g:matchup_override_vimtex = 1

Plug 'easymotion/vim-easymotion'
  nnoremap ; <Plug>(easymotion-prefix)
  vnoremap ; <Plug>(easymotion-prefix)
Plug 'rhysd/clever-f.vim'
# Plug 'girishji/vimsuggest'
#   var vim_suggest = {}
#   vim_suggest.cmd = {
#     'popupattrs': {
#       'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
#       'borderhighlight': ['Normal'],
#       'highlight': 'Normal',
#       'border': [1, 1, 1, 1],
#       'maxheight': 12,
#     },
#     'alwayson': false,
#     'ctrl_np': true,
#     'reverse': false,
#   }
#   autocmd VimEnter * call g:VimSuggestSetOptions(vim_suggest)
Plug 'girishji/vimbits'
  g:vimbits_highlightonyank = 1
  g:vimbits_easyjump = 0
  g:vimbits_fFtT = 0
  g:vimbits_vim9cmdline = 0
# Plug 'justinmk/vim-sneak'

Plug 'preservim/nerdcommenter'
  g:NERDDefaultAlign = 'left'
  g:NERDSpaceDelims = 1
  g:NERDCompactSexyComs = 1
  g:NERDCommentEmptyLines = 1
  g:NERDToggleCheckAllLines = 1
  map <leader>cc <plug>NERDCommenterToggle
  map <leader>c<space> <plug>NERDCommenterComment
  map <c-_> <plug>NERDCommenterToggle
  # for ctrl + /

Plug 'vim-autoformat/vim-autoformat'

Plug 'mbbill/undotree'

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
  g:asyncrun_open = 6

Plug 'airblade/vim-gitgutter'
  g:gitgutter_set_sign_backgrounds = 1
  g:gitgutter_sign_added = '++'
  g:gitgutter_sign_modified = '~~'
  g:gitgutter_sign_removed = '__'
  g:gitgutter_sign_removed_first_line = '^^'
  g:gitgutter_sign_removed_above_and_below = '<>'
  g:gitgutter_sign_modified_removed = '~_'
Plug 'tpope/vim-fugitive'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'neovimhaskell/haskell-vim'
Plug 'edwinb/idris2-vim'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  g:Lf_ShortcutF = '<c-p>'
  g:Lf_WindowPosition = 'popup'
  g:Lf_ShowDevIcons = 1
  # let g:Lf_CommandMap = {'<c-k>': ['<c-p>'], '<c-j>': ['<c-n>']}
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'
Plug 'lambdalisue/vim-fern'

Plug 'puremourning/vimspector'
  g:vimspector_enable_mappings = 'HUMAN'
  g:vimspector_install_gadgets = [ 'CodeLLDB' ]
  g:vimspector_base_dir = expand('$HOME/.vim/vimspector')

Plug 'sheerun/vim-polyglot'

Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
  g:gruvbox_italics = 0
  g:gruvbox_italicize_strings = 0
  g:gruvbox_plugin_hi_groups = 1
  g:gruvbox_filetype_hi_groups = 1
Plug 'sainnhe/gruvbox-material'

Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  g:airline_section_z = "\uE0A1%l/%L \uE0A3%v"
  g:airline_theme = 'gruvbox'
  g:airline_powerline_fonts = 1
  g:airline#extensions#tabline#enabled = 1
  g:airline#extensions#ale#enabled = 1
  g:airline#extensions#vimtex#enabled = 1
  g:airline#extensions#whitespace#symbol = '!'
  # g:airline#extensions#coc#enabled = 1

plug#end()

### Coc Settings
def CocSetup()
  # Make <CR> to accept selected completion item or notify coc.nvim to format
  # <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

  # Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-@> coc#refresh()

  # Use `[g` and `]g` to navigate diagnostics
  # Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  # GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  # Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  def g:ShowDocumentation()
    if g:CocAction('hasProvider', 'hover')
      g:CocActionAsync('doHover')
    else
      feedkeys('K', 'in')
    endif
  enddef

  # Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  # Symbol renaming.
  nmap <leader>r <Plug>(coc-rename)

  # Formatting code.
  nmap <leader>F <Plug>(coc-format)
  xmap <leader>f <Plug>(coc-format-selected)
  nmap <leader>f <Plug>(coc-format-selected)

  augroup coc#augroup
    autocmd!
    # Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    # Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  # Applying codeAction to the selected region.
  # Example: `<leader>aap` for current paragraph
  xmap <leader>a <Plug>(coc-codeaction-selected)
  nmap <leader>a <Plug>(coc-codeaction-selected)

  # Remap keys for applying code actions at the cursor position
  nmap <leader>ac <Plug>(coc-codeaction-cursor)
  # Remap keys for apply code actions affect whole buffer
  nmap <leader>as <Plug>(coc-codeaction-source)
  # Apply the most preferred quickfix action to fix diagnostic on the current line
  nmap <leader>qf <Plug>(coc-fix-current)

  # Remap keys for applying refactor code actions
  nmap <silent> <leader>R <Plug>(coc-codeaction-refactor)
  xmap <silent> <leader>R <Plug>(coc-codeaction-refactor-selected)

  # Run the Code Lens action on the current line
  nmap <leader>cl <Plug>(coc-codelens-action)

  # Map def and class text objects
  # NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  # Remap <C-u> and <C-d> for scroll float windows/popups.
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-u>"
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-d>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-u>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-d>"

  # Add `:Format` command to format current buffer.
  command! -nargs=0 CocFormat :call CocActionAsync('format')
  # Add `:Fold` command to fold current buffer.
  command! -nargs=? CocFold   :call CocAction('fold', <f-args>)
  # Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 CocOR     :call CocActionAsync('runCommand', 'editor.action.organizeImport')

  # Mappings for CoCList
  # Show all diagnostics.
  # nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  # Manage extensions.
  # nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  # Show commands.
  # nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  # Find symbol of current document.
  # nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  # Search workspace symbols.
  # nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  # Do default action for next item.
  # nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  # Do default action for previous item.
  # nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  # Resume latest coc list.
  # nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
enddef

# CocSetup()
### End Coc

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
set autoread
set wildmenu
set bsdir=buffer
set conceallevel=2
set laststatus=2
set pumheight=15
filetype plugin indent on

# Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,big5

# Spell
set nospell
set dictionary=spell,~/.vim/spell/en.utf-8.add,/usr/share/dict/words
set complete+=k
set spelllang=en_us

# UI Settings
set cursorline
set cursorcolumn
if has("gui_running")
  set go=
  set guifont=Fira\ Code\ 11,等距更纱黑体\ SC\ 11
  set guifontwide=等距更纱黑体\ SC\ 11
  set lines=32
  set columns=100
endif

# Normal mode mapping
nnoremap <silent> <c-n> :nohl<CR>
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
nnoremap <c-j> J"_x
nnoremap <c-s> :w<CR>
nnoremap , "_
nnoremap <RightMouse> "+p

# Insert mode mapping
inoremap jj <Esc>
inoremap <c-s> <Esc>:w<CR>a
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <c-h> <c-k>
       # see `:h digraph`
inoremap <silent> <c-k> <Esc>:call autopairs#AutoPairsJump()<CR>a
inoremap <c-j> <Esc>%a
inoremap <RightMouse> "+p
inoremap <silent><expr> <CR> pumvisible() ? "<Plug>(vimcomplete-skip)<c-y>" : "<CR>"

# Visual mode mapping
vnoremap > >gv
vnoremap < <gv
vnoremap H ^
vnoremap L $
vnoremap , "_
vnoremap <RightMouse> "+y

# Autocmd
def SetTextFile()
  setlocal spell
  setlocal nocursorcolumn
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal omnifunc=text_omnicomplete#Complete
  silent! call airline#extensions#whitespace#disable()
enddef
autocmd FileType tex {
  SetTextFile()
  b:AutoPairs = {'(': ')', '[': ']', '{': '}', "`": "'", "``": "''"}
}
autocmd FileType typst {
  SetTextFile()
  setlocal iskeyword-=-
  setlocal iskeyword-=_
  # nnoremap <leader>ll :TypstWatch<CR>
  nnoremap <leader>ll :call job_start(['tinymist', 'preview', expand('%:p'), '--partial-rendering=true'])<CR>
  nnoremap <leader>lv :call job_start(['zathura', expand('%:p:r') . '.pdf'])<CR>
  b:AutoPairs = {'`': '`', '```': '```', '"': '"', '(': ')', '[': ']', '{': '}', "$": "$"}
}
autocmd FileType vim {
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
}

# Colorscheme
set termguicolors
set bg=dark
syntax on
colorscheme gruvbox8
hi SignColumn guibg=#282828
