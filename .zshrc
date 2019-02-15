export TERM=xterm-kitty
export ZSH=/Users/jiwoongyou/.oh-my-zsh
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH=$PATH:/usr/local/go/bin # go
export SSH_KEY_PATH="~/.ssh/rsa_id" # ssh
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(hub alias -s)"

_fzf_complete_git() {
    ARGS="$@"
    local branches
    branches=$(git branch -vv --all)
    if [[ $ARGS == 'git checkout'* ]]; then
        _fzf_complete "--reverse --multi" "$@" < <(
            echo $branches
        )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_git_post() {
    awk '{print $1}'
}

git_branch(){
  git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy
}

plugins=(
  git
  nulogy
)



source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/jiwoongyou/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load all .zsh config files
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
  source "$f"
done
