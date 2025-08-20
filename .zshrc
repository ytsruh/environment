# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# My CUSTOM CONFIG

# Cowsay startup message
cowsay "Welcome back, Chris!"
echo "\n"

# Uninstalled Node warning
alias npm='echo "⚠️  You'\''ve uninstalled Node & NPM. Use Bun. ⚠️"'
alias nvm='echo "⚠️  You'\''ve uninstalled NVM. Use Bun. ⚠️"'

# Add zsh completions to search path
if [[ ":$FPATH:" != *":/Users/chrishurst/.zsh/completions:"* ]]; then export FPATH="/Users/chrishurst/.zsh/completions:$FPATH"; fi

# Add Docker Desktop for Mac (docker)
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# bun
[ -s "/Users/chrishurst/.bun/_bun" ] && source "/Users/chrishurst/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
alias air='$(go env GOPATH)/bin/air'
autoload -U compinit
compinit -i
