if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

export TERM=xterm-kitty

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id" # ssh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

eval "$(hub alias -s)"
eval "$(jira --completion-script-bash)"
##############################################
############### ZSH CUSTOM ###################
##############################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
		find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
    --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all
	  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
		--color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
		--color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
'

source /Users/jiwoongyou/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# load all .zsh config files
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
  source "$f"
done
