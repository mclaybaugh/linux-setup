# https://gist.github.com/fabienduhamel/df178911bddea12098b2aa06752bbf2a

# Better zsh git prompt with zsh-git-prompt
# Add it to your .zshrc after the plugins(... zsh-git-prompt ...) line
# First, it rewrites git prompt style
# Then overrides git_super_status()
# And overrides build_prompt() from agnoster (depends of what you want)

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR="  "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[black]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[black]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[black]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[black]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"

git_super_status() {
  precmd_update_git_vars
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
    STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH"
    if [ "$GIT_BEHIND" -ne "0" ] || [ "$GIT_AHEAD" -ne "0" ]; then
      STATUS="$STATUS "
    fi
    if [ "$GIT_BEHIND" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND"
    fi
    if [ "$GIT_AHEAD" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD"
    fi
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
    if [ "$GIT_STAGED" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED"
    fi
    if [ "$GIT_CONFLICTS" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS"
    fi
    if [ "$GIT_CHANGED" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED"
    fi
    if [ "$GIT_UNTRACKED" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX%{${reset_color}%}%{$bg[yellow]%}"
    echo "$STATUS"
  fi
}

# Override agnoster theme
prompt_time () {
    prompt_segment black grey "%*"
}

prompt_ret_status () {
    local RET_STATUS=$?
    local RET_CHAR='\xE2\x97\x8F'
    [[ $RET_STATUS -eq 0 ]] && prompt_segment black green "$RET_CHAR" || prompt_segment black red "$RET_CHAR"
}

prompt_git_super_status () {
    [ -z "$__CURRENT_GIT_STATUS" ] || prompt_segment yellow black " `git_super_status`"
}

build_prompt() {
  prompt_ret_status
  prompt_virtualenv
  prompt_time
  prompt_dir
  prompt_git_super_status
  prompt_bzr
  prompt_hg
  prompt_end
}
