eval "$(/opt/homebrew/bin/brew shellenv)"

# aliases
alias gg='cd ~/git_tree'
alias ll='eza -l -a --git --git-repos-no-status --hyperlink --no-permissions'
alias llt='eza -l -a --git --git-repos-no-status --hyperlink --no-permissions --total-size'
alias whatever="git checkout -- . && git clean -df && git checkout main"
alias sz="source ~/.zprofile"
alias vi='nvim'
alias viconf='vi ~/.config/nvim/init.vim'
alias dprune='docker stop `docker ps -qa` && docker rm `docker ps -qa` && docker system prune -f && docker volume prune -f'
alias kssh="kubectl exec --stdin --tty $POD -- /bin/bash"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/Library/Python/3.10/bin:$PATH

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border --preview "bat --color=always {}"'
  export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  # Print tree structure in the preview window
  export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
fi

# FZF
source <(fzf --zsh)
