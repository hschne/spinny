#!/usr/bin/env bash 

declare __spinny__spinner_pid

declare __spinny__chars

spinny::start() {
  tput civis
  spinny::_spinner &
  __spinny__spinner_pid=$!
}

spinny::stop() {
  [[ -z "$__spinny__spinner_pid" ]] && return 0

  kill -9 "$__spinny__spinner_pid" 
  # Use conditional to avoid exiting the program immediatly
  wait "$__spinny__spinner_pid" 2>/dev/null || true
  unset __spinny__spinner_pid
}

spinny::_spinner() {
  local delay=${SPINNY_DELAY:-0.3}
  local chars=$(spinny::_get_chars)
  local length=${#chars}
  ((length--))
  while :
  do
    for i in $(seq 0 "$length")
    do
      printf "%s" "${chars:$i:1}"
      local char_length=${#i}
      ((char_length--))
      for _ in $(seq 0 "$char_length"); do
        printf "\010"
      done
      sleep "$delay"
    done
  done
}

spinny::_get_chars() {
shopt -s nocasematch
local result
case "$SPINNY_STYLE" in
  CLOCK*)
    result="🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛"
    ;;
  DOTS*)
    result="⠇⠋⠙⠸⠦"
    ;;
  *)
    result="/|\\-"
    ;;
esac
shopt -u nocasematch
echo "$result"
}

spinny::_finish(){
  printf "\010"
  tput cnorm
}

trap spinny::_finish EXIT


