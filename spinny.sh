#!/usr/bin/env bash 

declare __spinny__spinner_pid

declare -a __spinny__frames=()

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
}

spinny::_spinner() {
  local delay=${SPINNY_DELAY:-0.3}
  spinny::_set_chars
  local length=${#__spinny__frames[@]}
  ((length--))
  while :
  do
    for i in $(seq 0 "$length")
    do
      local frame="${__spinny__frames[$i]}"
      printf "%s" "$frame"
      for x in $(seq 0 "${#frame}"); do printf "\b"; done
      sleep "$delay"
    done
  done
}

spinny::_fill_frames() {
  local length=${#__spinny__frames[@]}
  ((length--))
  for i in $(seq 0 "$length")
  do
    local frame="${__spinny__frames[$i]}"
    printf "%s" "$frame"
    for x in $(seq 0 "${#frame}"); do printf "\b"; done
    sleep "$delay"
  done
}

spinny::_set_chars() {
  __spinny__frames=("${SPINNY_FRAMES[@]}")

# case "$SPINNY_STYLE" in CLOCK*)
#     __spinny__chars="🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛"
#     __spinny__char_size=${SPINNY_CUSTOM_SIZE:-1}
#     ;;
#   DOTS*)
#     __spinny__chars="⠇⠋⠙⠸⠦"
#     ;;
#   CUSTOM*)
#     __spinny__chars="${SPINNY_CUSTOM_CHARS:-/|\\-}"
#     __spinny__char_size=${SPINNY_CUSTOM_SIZE:-1}
#     ;;
#   *)
#     __spinny__chars="/|\\-"
#     ;;
# esac
# shopt -u nocasematch
}

spinny::_finish(){
  unset __spinny__spinner_pid
  unset __spinny__frames
  tput cnorm
}

trap spinny::_finish EXIT


