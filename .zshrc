# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

fzf-down() {
  fzf --height 50% "$@" --border
}

gbb() {
  branch=$(git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/origin/##') &&
  git checkout $branch
}

export BETTER_ERRORS_EDITOR="x-mine://open?file=%{file}&line=%{line}"
export TERM=xterm-kitty

#Path to your oh-my-zsh installation.
export ZSH=/Users/jiwoongyou/.oh-my-zsh

# Fix Zeus crashing with `read unix ->: EOF` error 
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

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

export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'

git_branch(){
  git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy
}
plugins=(
  git
  nulogy
  richard
)
# go
export PATH=$PATH:/usr/local/go/bin

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/jiwoongyou/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load all .zsh config files
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
  source "$f"
done
