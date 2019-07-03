#! /usr/bin/env bash

set -e 

source spinny.sh

default_spinner() {
  printf "Spinny can be a classic spinner... "
  spinny::start
  sleep 3
  spinny::stop
  printf " \n"
}

dots_spinner() {
  SPINNY_FRAMES=(⠇ ⠋ ⠙ ⠸ ⠴ ⠦)
  SPINNY_DELAY=0.2
  printf "or a bunch of dots... "
  spinny::start
  sleep 3
  spinny::stop
  printf " \n"
}

clock_spinner() {
  SPINNY_FRAMES=("🕐 " "🕑" "🕒" "🕓" 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛)
  SPINNY_DELAY=0.1
  echo ""
  printf "It can show you the time... "
  spinny::start
  sleep 3
  spinny::stop
  printf " \n"
}

shrink_spinner() {
  SPINNY_FRAMES=(. .. ... .... ..... " ...." "  ..." "   .." "    ." "      " )
  SPINNY_DELAY=0.1
  printf "and animate different length inputs"
  spinny::start
  sleep 3
  spinny::stop
  printf ".     \n"
}

crazy_spinner() {
  SPINNY_FRAMES=("\e[31mcrazy!" "\e[32mcrazy!" "\e[33mcrazy!" "\e[34mcrazy!" "\e[36mcrazy!" )
  SPINNY_DELAY=0.1
  echo ""
  printf "Go "
  spinny::start
  sleep 3
  spinny::stop
  printf "\e[39mcrazy!\n"
}

default_spinner 
dots_spinner
clock_spinner
shrink_spinner
crazy_spinner

