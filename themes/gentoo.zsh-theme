function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "%"; fi
}

# PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n@%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%#%{$reset_color%} '
PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n) %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%$(prompt_char)%{$reset_color%} '
RPROMPT='%{$fg_no_bold[blue]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}●"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%}↪"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}!!!"

# added commits/behind directly in lib/git.zsh
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=" %{$fg[red]%} DIVERGED"
