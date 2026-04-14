# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="simple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nivm=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# kw

export PATH=/usr/local/node/bin:$PATH


# Ensure PKG_CONFIG_PATH is set correctly
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH


# Go environment setup (example)
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

#  zsh auto suggestions
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Aliases
alias nivm='nvim'
alias n='nvim'
alias t='tmux'
alias te='tmux kill-server'
alias ta='tmux attach'
alias clera='clear'
clear() {
  printf '\033[H\033[2J'
}
alias zen='sudo shutdown now'
alias crun='./run_cpp.sh main.cpp'
alias his='nvim ~/.zsh_history'
alias check='/home/sid/work/smatch/smatch_scripts/kchecker'
alias build_smatch='/home/sid/work/smatch/smatch_scripts/build_kernel_data.sh'

export PATH="$PATH:$HOME/shunit2"

bindkey -s ^f "/home/sid/tmux-sessionizer\n"

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ALACRITTY_CONFIG_FILE=~/.config/alacritty/config.toml
export PATH=~/Downloads/llvm-20.1.4-x86_64/bin:$PATH


# opam configuration
[[ ! -r /home/sid/.opam/opam-init/init.zsh ]] || source /home/sid/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Created by `pipx` on 2025-05-23 07:58:39
export PATH="$PATH:/home/sid/.local/bin"


# bun completions
[ -s "/home/sid/.bun/_bun" ] && source "/home/sid/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Fuzzy search through shell history with Ctrl-r
fzf_history_widget() {
  local selected
  selected=$(fc -l 1 | fzf --height 40% --reverse --tac | sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//')
  if [[ -n $selected ]]; then
    LBUFFER=$selected
    zle redisplay
  fi
}
zle -N fzf_history_widget
bindkey '^r' fzf_history_widget


alias git-personal='ln -sf ~/.gitconfig-personal ~/.gitconfig-current && echo "Switched to PERSONAL profile"'
alias git-work='ln -sf ~/.gitconfig-work ~/.gitconfig-current && echo "Switched to WORK profile"'
alias git-who='git config user.name && git config user.email'

alias vpn='~/tower_vpn.sh'


export EDITOR="nvim"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

git() {
  if [[ "$1" == "commit" ]]; then
    local name email
    name=$(command git config user.name)
    email=$(command git config user.email)

    echo ""
    echo "Git identity:"
    echo "  $name <$email>"
    echo ""

    read "?Proceed with this identity? (y/N) " ans
    if [[ "$ans" != "y" && "$ans" != "Y" ]]; then
      echo "Commit aborted."
      return 1
    fi
  fi

  command git "$@"
}



alias kube-tower='ln -sf ~/.kube/config-tower ~/.kube/config && echo "Switched to tower cluster"'
alias kube-billing='ln -sf ~/.kube/config-billing ~/.kube/config && echo "Switched to billing cluster"'

decode () {
  kubectl get secret "$1" -o json \
  | jq -r '.data | to_entries[] | "\(.key)=\(.value | @base64d)"'
}

# pnpm
export PNPM_HOME="/home/sid/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opencode
export PATH=/home/sid/.opencode/bin:$PATH


fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
