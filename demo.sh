#! /usr/bin/env bash

set -e 

source spinny.sh

default_spinner() {
  printf "Spinny can be a classic spinner..."
  spinny::start
  sleep 4
  spinny::stop
  printf " \n"
}

dots_spinner() {
  SPINNY_FRAMES=(⠇ ⠋ ⠙ ⠸ ⠴ ⠦)
  printf "or a bunch of dots..."
  spinny::start
  sleep 4
  spinny::stop
  printf ".  \n"
}

clock_spinner() {
  SPINNY_FRAMES=(🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛)
  SPINNY_DELAY=0.1
  printf "It can show you the time..."
  spinny::start
  sleep 4
  spinny::stop
  printf "...\n"
}

shrink_spinner() {
  SPINNY_FRAMES=(. .. ... .... ..... " ...." "  ..." "   .." "    ." "      " )
  SPINNY_DELAY=0.1
  printf "animate different length inputs"
  spinny::start
  sleep 4
  spinny::stop
  printf "...  \n"
}

crazy_spinner() {
  SPINNY_FRAMES=("\e[31m=====" "\e[32m=====" "\e[33m=====" "\e[34m=====" "\e[36m=====" )
  SPINNY_DELAY=0.1
  printf "animate different length inputs"
  spinny::start
  sleep 4
  spinny::stop
  printf "...  \n"
}
# default_spinner 
# dots_spinner
# clock_spinner
# shrink_spinner
crazy_spinner


