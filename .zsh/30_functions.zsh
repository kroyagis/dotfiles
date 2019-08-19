zshconfig() {
  local files
  files=(~/.zsh/[0-9]*.(sh|zsh))
  files=(~/.zshrc "${files[@]}")
  printf '%s\n' $files | fzf -m --height 40% --reverse | xargs nvim
}

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

# buildkite
function buildkite() {
  BRANCH_NAME=`git symbolic-ref --short -q HEAD`

  if [[ "$PWD" =~ "packmanager" ]]; then
    if [[ "${RAILS_NEXT:-false}" =~ "true" ]]; then
      PIPELINE_NAME="packmanager-rails-next"
    else
      PIPELINE_NAME="packmanager"
    fi
  fi

  open -a "Google Chrome" "https://buildkite.com/nulogy-corp/$PIPELINE_NAME/builds?branch=$BRANCH_NAME"
}

