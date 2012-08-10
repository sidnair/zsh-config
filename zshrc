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
plugins=(git github git-flow cap gem lol zsh-syntax-highlighting bundler heroku vim)

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

unsetopt auto_name_dirs # rvm_rvmrc_cwd fix
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
unset RUBYOPT
cd . # to rvm reload

if [[ -x `which hitch` ]]; then
	hitch() {
		command hitch "$@"
		if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
	}
	alias unhitch='hitch -u'
	hitch
fi

compdef -d git

alias vim='mvim -v'

alias npm_bin="PATH=`pwd`/node_modules/.bin:$PATH; rehash"

PATH=~/bin/:~/node_modules/.bin/:$PATH
PATH=/usr/texbin:$PATH
PATH=~/repo/build/phab/arcanist/bin/:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export CSCOPE_DB=/Users/sid/code/work/foursquare.web/cscope.out

alias gitpretty="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias lint="git diff --cached --name-only | xargs jshint --config /Users/sid/repo/scripts/jshint/config.json"
alias test-js='/Users/sid/repo/scripts/test/javascript/test-js'

alias mongo_test="mkdir /tmp/mongo-testdb; ~/repo/dependencies/mongodb/bin/mongod --dbpath /tmp/mongo-testdb --maxConns 1500"

alias sbt="./sbt --supermem --  -Dassets.cachedir=build/"
alias sbt-jetty="./sbt -r --  -Dassets.cachedir=build/ jetty-run 2>&1 | tee /tmp/sbt-jetty.log"
alias sbt-test="./sbt -t 2>&1 | tee /tmp/sbt-test.log"

alias pants-j="./jetty-run -r 2>&1 | tee /tmp/pants.log"
