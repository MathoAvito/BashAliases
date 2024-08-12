# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k Configuration
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Suppress Powerlevel10k warning
typeset -g POWERLEVEL10K_INSTANT_PROMPT=quiet

# Check and update Powerlevel10k if not up-to-date
if [ -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  cd "$ZSH_CUSTOM/themes/powerlevel10k"
  git pull
  cd -
fi

# Zsh Plugins Configuration
# Enable Zsh plugins
plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Enable ZSH completion
autoload -Uz compinit
compinit

# Enable syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autosuggestions
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User Aliases and Functions

# Git aliases
alias gitlog='git log --all --decorate --oneline --graph'
alias gitco='git checkout'
alias gits='git status'
alias gitcam='git commit -am'

# Docker aliases
alias docker-compose='docker compose'
alias dp='docker ps'
alias dil='docker image ls'
alias dl='docker logs'

# Kubernetes aliases
alias k='kubectl'
alias kga='kubectl get all'

# Terraform aliases
alias tf='terraform'

# System aliases
alias sm='gnome-system-monitor'

# Custom PATH and Environment Variables

# Node.js and npm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Node.js and npm to PATH
export PATH=$NVM_DIR/versions/node/$(nvm current)/bin:$PATH
nvm use 18 --silent

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$HOME/.nvm/versions/node/v18.20.4/bin/npm:$PATH"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Gradle
export PATH=/opt/gradle/gradle-8.6/bin:$PATH

# History Configuration
setopt appendhistory        # Save every command to the history file
setopt sharehistory         # Share history between all sessions
setopt inc_append_history   # Save multi-line commands as one command
HISTFILE=~/.zsh_history     # File to save history to
HISTSIZE=10000              # Number of lines kept in the history file
SAVEHIST=10000              # Number of history entries to save

# Remove duplicate commands from history
setopt hist_ignore_dups

# Ignore commands that start with a space
setopt hist_ignore_space

# Directory Navigation Enhancements
setopt autocd              # If the command is a directory, cd to it
setopt cdablevars          # Automatically correct directory typos
setopt extended_glob       # Enable extended globbing

# Directory Stack Navigation
setopt pushdignoredups     # Push the current directory onto the stack when changing directories
setopt pushdsilent         # Automatically remove duplicates from the directory stack
setopt pushdtohome         # Add directory stack to prompt

# Aliases for easy navigation of the directory stack
alias d='dirs -v | head -10'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# Prompt Customization and Other Enhancements
# Add Git branch info to prompt
function parse_git_branch() {
  git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'
}

# Enhanced colorful prompt
export PS1='%F{cyan}%n%f@%F{magenta}%m%f:%F{yellow}%~%f%F{red}$(parse_git_branch)%f> '

# Show command execution time for commands that take more than 2 seconds
export REPORTTIME=2

# Useful aliases and functions
alias docs='cd ~/Documents'
alias dls='cd ~/Downloads'
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Enhanced Zsh Options
setopt correct            # Correct command spelling errors
setopt verbose            # Enable verbose mode for debugging

# User configuration
alias zshconfig="vim ~/.zshrc"
