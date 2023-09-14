#!/bin/bash

set -e

# check a file for the given string if it exists do nothing. If it doesn't exist, add the string to the file.
checkFileForString() {
    if ! grep -q "$1" "$2"; then
        echo "$1" >> "$2"
    fi
}

case $(basename $SHELL) in
    bash)
        checkFileForString "source /usr/local/share/atuin/bash-preexec.sh" ~/.bashrc
        checkFileForString 'eval "$(atuin init bash)"' ~/.bashrc
        ;;
    zsh)
        checkFileForString 'eval "$(atuin init zsh)"' ~/.zshrc

        ;;
    fish)
        checkFileForString "atuin init fish | source" ~/.config/fish/config.fish
        ;;
esac
