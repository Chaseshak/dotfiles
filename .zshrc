### HOMEBREW ###

# NOTE: This must go at the top to ensure homebrew is in the path
# Tames the amount of auto installing homebrew does
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_AUTO_UPDATE_SECS=90000000
export PATH="/opt/homebrew/bin:$PATH"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom/"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

IN_CODESPACE=false
NOT_IN_CODESPACE=true
if [[ "$CODESPACES" == "true" ]]; then
  IN_CODESPACE=true
  NOT_IN_CODESPACE=false
fi

### TOOLS ###

# Auto-completion for terminal typos
if command -v thefuck &> /dev/null
then
  eval $(thefuck --alias)
fi

# For easy project navigation
projects_path="$HOME/Projects"
export projects_path

### FUNCTIONS ###

project() {
	cd "$projects_path/$1"
}

# Allows you to do a touch that creates any missing parent directories
touch_directory() { mkdir -p "$(dirname "$1")" && touch "$1" ; }

# (Mac Only atm) Sends a notification to the mac notification center
if [[ "$OSTYPE" == "darwin"* ]]; then
  function notify() {
    osascript -e "display notification \"$1\" with title \"$2\""
  }
fi

### PATHS ###
if command -v pyenv &> /dev/null
then
  export PATH="$(pyenv root)/shims:${PATH}"
  eval "$(pyenv init -)"
fi
export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:$PATH"
export PATH="$(brew --prefix libpq)/bin:$PATH"

# Rbenv
if [ "$NOT_IN_CODESPACE" = true ];
then
  eval "$(rbenv init -)"
fi

# Copilot CLI
if command -v github-copilot-cli &> /dev/null
then
  eval "$(github-copilot-cli alias -- "$0")"
fi

#Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export GPG_TTY=$(tty)
export GPG_TTY=$(tty)
export PGHOST=localhost

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# TODO: Fix GOROOT for non-brew installs
if command -v brew &> /dev/null
then
  export GOROOT="$(brew --prefix golang)/libexec"
fi

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Make forking work
# https://blog.phusion.nl/2017/10/13/why-ruby-app-servers-break-on-macos-high-sierra-and-what-can-be-done-about-it/
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# GCloud
export CLOUDSDK_PYTHON_SITEPACKAGES=1

### MISC ###

## NVM
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH="$HOME/bin:$PATH"

# Brew on Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/bin" ] ; then
      PATH="$HOME/bin:$PATH"
  fi

  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
  fi

  if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] ; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

# JRE
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
