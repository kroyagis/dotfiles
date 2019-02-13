# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --height 100% --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fpr() {
  local pull_requests pull_request
  pull_requests=$(git prlu) &&
  pull_request=$(echo "$pull_requests" | fzf +m --ansi) &&
  open $(echo "$pull_request" | sed -E 's/.*(https.*)/\1/')
}

# fbrd - Fuzzy Branch Delete
fbrd() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
    git branch -D $(echo "$branch" | awk '{print$1}' | sed "s/.* //") && fbrd
}

fadd() {
  local out q n addfiles
  while out=$(
      git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf-tmux --multi --exit-0 --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    n=$[$(wc -l <<< "$out") - 1]
    addfiles=(`echo $(tail "-$n" <<< "$out")`)
    [[ -z "$addfiles" ]] && continue
    if [ "$q" = ctrl-d ]; then
      git diff --color=always $addfiles | less -R
    else
      git add $addfiles
    fi
  done
}

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
