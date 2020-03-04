#!/bin/bash
# https://www.nicksays.co.uk/iterm-tool-versions-status-bar/

function iterm2_begin_osc {
  printf "\033]"
}

function iterm2_end_osc {
  printf "\007"
}

# Usage: iterm2_set_user_var key value
function iterm2_set_user_var() {
  iterm2_begin_osc
  printf "1337;SetUserVar=%s=%s" "$1" $(printf "%s" "$2" | base64 | tr -d '\n')
  iterm2_end_osc
}

function ruby_version() {
  hash rbenv 2>/dev/null || return
  local ruby_version="$(rbenv version-name)"

  echo "$ruby_version"
}

function tf_version() {
  hash tfenv 2>/dev/null || return
  local tf_version="$(tfenv version-name)"

  echo "$tf_version"
}

function aws_profile() {
 echo "${AWS_PROFILE:-$AWS_OKTA_PROFILE_NAME}"
}

function iterm2_print_user_vars() {
  iterm2_set_user_var terraformVersion "$(tf_version)"
  iterm2_set_user_var rubyVersion "$(ruby_version)"
  iterm2_set_user_var awsProfile "$(aws_profile)"
}

PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'iterm2_print_user_vars'

precmd() { eval "$PROMPT_COMMAND" }
