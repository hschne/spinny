#! /usr/bin/env bash

set -e 

source spinny.sh

default_spinner() {
  printf "Default spinny... "
  spinny::start
  sleep 4
  spinny::stop
  printf "Done\n"
}

dots_spinner() {
  SPINNY_STYLE=DOTS
  SPINNY_DELAY=0.2
  printf "Dots style spinny... "
  spinny::start
  sleep 4
  spinny::stop
  printf "Done\n"
}

clock_spinner() {
  SPINNY_STYLE=CLOCK
  SPINNY_DELAY=0.2
  printf "Dots style spinny... "
  spinny::start
  sleep 4
  spinny::stop
  printf "\n"
}


default_spinner 
dots_spinner
clock_spinner

echo "blb"


