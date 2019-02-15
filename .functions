# Checkout branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Delete branch
fbrd() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
    git branch -D $(echo "$branch" | awk '{print$1}' | sed "s/.* //") && fbrd
}

# View PR
fpr() {
  local pull_requests pull_request
  pull_requests=$(git prlu) &&
  pull_request=$(echo "$pull_requests" | fzf +m --ansi) &&
  open $(echo "$pull_request" | sed -E 's/.*(https.*)/\1/')
}

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
