override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom" # needed for reload optimization, should be unique
  GIT_PROMPT_END_USER="${White}${ResetColor} $ "
  GIT_PROMPT_END_ROOT="${White}${ResetColor} # "
}

# load the theme
reload_git_prompt_colors "Custom"
