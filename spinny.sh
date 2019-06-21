#!/usr/bin/env bash 

declare __spinny__spinner_pid

declare __spinny__chars

declare __spinny__char_size=1

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
  spinny::_set_chars
  local length=${#__spinny__chars}
  ((length--))
  while :
  do
    for i in $(seq 0 "$length")
    do
      # TODO: Improve to truly support any custom character sequence
      # See https://gist.github.com/zulaica/9e971cc5b6dbd156abcd13745beff262
      printf "%s" "${__spinny__chars:$i:1}"
      for x in $(seq 1 "$__spinny__char_size"); do printf "\b"; done
      sleep "$delay"
    done
  done
}

spinny::_set_chars() {
shopt -s nocasematch
case "$SPINNY_STYLE" in
  CLOCK*)
    __spinny__chars="🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛"
    __spinny__char_size=${SPINNY_CUSTOM_SIZE:-1}
    ;;
  DOTS*)
    __spinny__chars="⠇⠋⠙⠸⠦"
    ;;
  CUSTOM*)
    __spinny__chars="${SPINNY_CUSTOM_CHARS:-/|\\-}"
    __spinny__char_size=${SPINNY_CUSTOM_SIZE:-1}
    ;;
  *)
    __spinny__chars="/|\\-"
    ;;
esac
shopt -u nocasematch
}

spinny::_finish(){
  # Make sure to remove the last character
  printf "\010"
  tput cnorm
}

trap spinny::_finish EXIT


