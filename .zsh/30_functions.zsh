cfg-zsh() {
  local files
  files=(~/.zsh/[0-9]*.(sh|zsh))
  files=(~/.zshrc "${files[@]}")
  printf '%s\n' $files | fzf -m --height 40% --reverse | xargs nvim
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}

bind-git-helper f b t r h
unset -f bind-git-helper

# Delete branch
fbrd() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
    git branch -D $(echo "$branch" | awk '{print$1}' | sed "s/.* //") && fbrd
}

# View PR
fpr() {
  hub pr list --color=always | fzf --ansi --height 40% --reverse | awk '{print substr($1, 2)}' | xargs hub pr show
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --height 100% "$@" --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

function fjr() {
  COLUMNS=200 jira pm1 |
  fzf --ansi --height 100% --no-sort --reverse --tiebreak=index \
      --bind "ctrl-m:execute:
                (grep -o 'PM-[0-9]*' |
                xargs -I % sh -c 'jira view % | mdless') << 'FZF-EOF'
                {}
FZF-EOF"
}

# pet
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select
