#!/bin/bash

HOME=/home/kenichiro

cd $HOME/qmk_firmware

cp $HOME/.dotfiles/keyboards/ergodox_ez/keymaps/custom/keymap.c $HOME/qmk_firmware/keyboards/ergodox_ez/keymaps/default/keymap.c
cp $HOME/.dotfiles/keyboards/ergodox_ez/config.h $HOME/qmk_firmware/keyboards/ergodox_ez/config.h
cp $HOME/.dotfiles/keyboards/ergodox_ez/rules.mk $HOME/qmk_firmware/keyboards/ergodox_ez/rules.mk

./util/docker_build.sh ergodox_ez:default

