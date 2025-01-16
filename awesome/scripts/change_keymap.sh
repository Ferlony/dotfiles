#!/bin/bash

if (ls /dev/ | grep hidraw*)
then
  # to swap
  setxkbmap -option altwin:swap_alt_win
fi

