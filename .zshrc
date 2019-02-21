export TERM=xterm-kitty
export VISUAL=nvim
export EDITOR="$VISUAL"
export ZSH=/Users/jiwoongyou/.oh-my-zsh
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id" # ssh
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'export FZF_DEFAULT_COMMAND='ag'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

eval "$(hub alias -s)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/jiwoongyou/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load all .zsh config files
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
  source "$f"
done
