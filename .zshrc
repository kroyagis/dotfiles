export EDITOR="nvim"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=$HISTSIZE
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id" # ssh

eval "$(hub alias -s)"
##############################################
############### ZSH CUSTOM ###################
##############################################

# Vi mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  #"
  ## Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "
}
_gen_fzf_default_opts
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

source $HOME/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

source /usr/local/share/chruby/chruby.sh 
source /usr/local/share/chruby/auto.sh

# fnm
eval "$(fnm env --multi)"

# load all .zsh config files
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
  source "$f"
done

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin zsh-users/zsh-completions
zplugin light zdharma/fast-syntax-highlighting
