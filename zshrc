# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="gentoo"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-flow cap gem lol zsh-syntax-highlighting bundler heroku vim go)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source /etc/profile
source $ZSH/oh-my-zsh.sh

unsetopt nomatch
unsetopt correctall

# Customize to your needs...
LS_COLORS='no=00;32:fi=00:di=00;34:ln=01;36:pi=04;33:so=01;35:bd=33;04:cd=33;04:or=31;01:ex=00;32:*.rtf=00;33:*.txt=00;33:*.html=00;33:*.doc=00;33:*.pdf=00;33:*.ps=00;33:*.sit=00;31:*.hqx=00;31:*.bin=00;31:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.deb=00;31:*.dmg=00;36:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.mpg=00;37:*.avi=00;37:*.gl=00;37:*.dl=00;37:*.mov=00;37:*.mp3=00;35:'
export LS_COLORS;
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
ZSH_HIGHLIGHT_STYLES+=(
  default                       'none'
  unknown-token                 'fg=red,bold'
  reserved-word                 'fg=yellow'
  alias                         'fg=none,bold'
  builtin                       'fg=none,bold'
  function                      'fg=none,bold'
  command                       'fg=none,bold'
  hashed-command                'fg=none,bold'
  path                          'fg=cyan'
  globbing                      'fg=cyan'
  history-expansion             'fg=blue'
  single-hyphen-option          'fg=magenta'
  double-hyphen-option          'fg=magenta'
  back-quoted-argument          'fg=magenta,bold'
  single-quoted-argument        'fg=green'
  double-quoted-argument        'fg=green'
  dollar-double-quoted-argument 'fg=cyan'
  back-double-quoted-argument   'fg=cyan'
  assign                        'none'
)

#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line

# bindkey "\e[1;5D" backward-word
# bindkey "\e[1;5C" forward-word
# bindkey "^[OD" backward-word
# bindkey "^[OC" forward-word
# bindkey "\e[1~" beginning-of-line
# bindkey "\e[4~" end-of-line
# bindkey "\e[5~" history-search-backward
# bindkey "\e[6~" history-search-forward

alias noh="unsetopt sharehistory"

compdef -d git

alias gitpretty="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias gg="git grep -n $@"

alias gr="grep -n -r --color $@"
alias ff="git ls-files | grep $@"

# Searches for a Scala or Java style import, finds the first match, copies it to
# the clipboard, and outputs it for previewing.
gi() {
  git grep -h import.*$1 | head -1 | pbcopy && pbpaste
}

rename() {
  git grep $1 | cut -f 1 -d : | uniq | xargs sed -E -i "" s/$1/$2/g
}

# Internally used by vopen. First argument is the search command. Subsequent
# arguments are passed directly to grep.
_vopen_internal() {
  FILES=`eval $1`
  FILES_RET=$?
  LINES=`echo "$FILES" | wc -l`

  if [ -z "$2" ]; then
    echo "Enter search term as argument."
    return 0
  elif [ $LINES -ne 1 ]; then
    echo "Multiple matches found."
    echo "$FILES"
    return 0
  elif [ $FILES_RET -ne 0 ]; then
    echo "No matches."
    return 1
  else
    vim $FILES
    return 0
  fi
}

# Open a file in a git directory in vim. Arguments are passed directly to grep.
# You can search for a file name or for text in the files.
vopen() {
  _vopen_internal 'git ls-files | grep ${@:2}' $@
  if [ $? -ne 0 ]; then
    _vopen_internal 'git grep -l ${@:2}' $@
  fi
}

# make `C-x e` go to edit mode
# http://stackoverflow.com/questions/890620/unable-to-have-bash-like-c-x-e-in-zsh
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

export EDITOR="vim"

function __tmux_list_stale() {
  tmux ls | grep -v '(attached)'
}

alias tmux-count-stale="__tmux_list_stale | wc -l"
alias tmux-kill-stale="__tmux_list_stale | cut -d ':' -f 1 | xargs -I{} tmux kill-session -t {}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
cd . # to rvm reload
