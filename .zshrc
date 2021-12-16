# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/env.zsh

export ZSH="$HOME/.oh-my-zsh"
plugins=(extract python pip colored-man-pages colorize ag fd)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wuli/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wuli/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wuli/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wuli/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

# Completions
zinit light esc/conda-zsh-completion
zinit light zsh-users/zsh-completions

# OMZ
source $ZSH/oh-my-zsh.sh
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

source $HOME/alias.zsh

# Vim mode
VIM_MODE_VICMD_KEY="jj"
zinit light softmoth/zsh-vim-mode
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey -a "^P" history-beginning-search-backward
bindkey -a "^N" history-beginning-search-forward

# FZF initialize
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Theme
zinit light romkatv/powerlevel10k
ZLE_RPROMPT_INDENT=0

zinit light zsh-users/zsh-autosuggestions
# zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Autojump
FZ_HISTORY_CD_CMD="_zlua"
zinit light changyuheng/fz
zinit light skywind3000/z.lua

# Filetypes
zstyle ':completion:*:*:vim:*' file-patterns '^*.(o|out|aux|bbl|blg|bcf|run.xml|xdv|fls|nav|snm|tuc|fdb_latexmk|gz|div|pdf|log):source-files' '*:all-files'
