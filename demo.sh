#! /usr/bin/env bash

set -e 

source spinny.sh

default_spinner() {
  printf "Spinny can be a normal spinner... "
  spinny::start
  sleep 4
  spinny::stop
  printf " \n"
}

dots_spinner() {
  SPINNY_STYLE=DOTS
  SPINNY_DELAY=0.2
  printf "or something more fancy... "
  spinny::start
  sleep 4
  spinny::stop
  printf " \n"
}

clock_spinner() {
  SPINNY_STYLE=CLOCK
  SPINNY_DELAY=0.1
  printf "It can show you the time... "
  spinny::start
  sleep 4
  spinny::stop
  printf " \n"
}

custom_spinner() {
  SPINNY_STYLE=CUSTOM
  SPINNY_CUSTOM_CHARS="🌎🌍🌏"
  SPINNY_CUSTOM_SIZE=2
  SPINNY_DELAY=0.3
  printf "or show anything you like... "
  spinny::start
  sleep 4
  spinny::stop
  printf " \n"
}


default_spinner 
dots_spinner
clock_spinner
custom_spinner 
