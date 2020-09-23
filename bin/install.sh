#!/bin/bash

set -e
DOT_DIRECTORY="${HOME}/.dotfiles"
cd ${DOT_DIRECTORY}

for f in .??*
do
	[[ "${f}" == ".git" ]] && continue
	[[ "${f}" == ".gitignore" ]] && continue

	echo "$f"
	ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. $(tput sgr0)
