# If you come from bash you might have to change your $PATH.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
# if [ "$EUID" -ne 0 ]
# 	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# 	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# fi


# Path to your oh-my-zsh installation.
  if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

  # export TERM="xterm-256color"
  export ZSH=/home/isma/.oh-my-zsh
  export VISUAL="nvim"
  export XDG_RUNTIME_DIR=/home/isma/.veyon
  export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
  export export GEM_HOME=$HOME/.gem
  export LD_LIBRARY_PATH=/usr/local/lib
  export EDITOR="nvim"
  export TR_AUTH="isma:1"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="mytheme"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  chucknorris
  # common-aliases
  history
  colored-man-pages
  sudo
  systemd
  tmux
  cp
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Compleat
autoload -Uz compinit bashcompinit
compinit
bashcompinit


# User configuration
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_VCS_GIT_GITHUB_ICON=' '
POWERLEVEL9K_HOME_ICON=' '
POWERLEVEL9K_HOME_SUB_ICON=' '


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias less='/usr/share/vim/vim80/macros/less.sh'
alias mkdir='mkdir -p -v'
alias nodejs='node'
alias vimconfig="vim ~/.vimrc"
alias vim='nvim'

export tNVM_DIR="$HOME/.nvm"
export ICON_HDD="$(echo -e "\uF0A0")"

# locales

export LANG=es_ES.UTF-8
export LC_CTYPE="es_ES.UTF-8"
export LC_NUMERIC="es_ES.UTF-8"
export LC_TIME="es_ES.UTF-8"
export LC_COLLATE="es_ES.UTF-8"
export LC_MONETARY="es_ES.UTF-8"
export LC_MESSAGES="es_ES.UTF-8"
export LC_PAPER="es_ES.UTF-8"
export LC_NAME="es_ES.UTF-8"
export LC_ADDRESS="es_ES.UTF-8"
export LC_TELEPHONE="es_ES.UTF-8"
export LC_MEASUREMENT="es_ES.UTF-8"
export LC_IDENTIFICATION="es_ES.UTF-8"
export LC_ALL=es_ES.UTF-8

# make50() {
# 	    echo "gcc -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1";
# 	        gcc -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1 ;
#
# }
#  
# check50() {
# 	    nodejs /opt/check50/bin/check50.js ${1} ${2};
#
# }
#  
# maker() {
# 	    echo "clang -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1";
# 	        clang -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1 ;
#
# }
# alias make50=make50
# alias maker=maker
# alias check50=check50

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

chuck_cow
