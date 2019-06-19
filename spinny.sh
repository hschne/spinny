#!/usr/bin/env bash 

declare spinner_pid

spinner::run() {
  local message=$1
  shift 

  console::info "$message"
  # When debugging is enabled command output is printed to tty
  # and no progress thing is required, as that is visible anyway
  if [[ $DEBUG -eq 0 ]]; then 
    spinner::start
    "$@"
    result=$?
    spinner:stop
    if [[ $result -eq 0 ]]; then console::print " done\n" "green"; else  console::print " error\n" red; fi
  else 
    console::break
    "$@"
  fi
}

spinner::_spinner() {
  local spinner="/|\\-/|\\-"
  while :
  do
    for i in $(seq 0 7)
    do
      printf "%s" "${spinner:$i:1}"
      printf "\010"
      sleep .3
    done
  done
}

spinner::start() {
  spinner::_spinner &
  spinner_pid=$!
}

spinner:stop() {
  [[ -z "$spinner_pid" ]] && return 0

  kill -9 "$spinner_pid" 
  # Use conditional to avoid exiting the program immediatly
  wait "$spinner_pid" 2>/dev/null || true
  unset spinner_pid
}

