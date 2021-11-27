#!/bin/bash

# dotfiles is a list of dotfiles to be maintained by this script
# TODO: $(ls dotfilespath) ?
dotfiles=(.gitconfig .tmux.conf .vim .vimrc nvim .zplugrc .zshrc)

destination=$1
dotfilesdir=$(dirname $(readlink -f $0))
cleanup=$2

# sanity check
if [ ! -d $destination ]; then
    printf "Setup path  %s is not a directory\n" $destination
    exit -1
fi

printf "Dotfiles setup path: %s\n" $destination

# dotwalk iterates over dot files and calls argument $0 function
# passing target and link files as described in @ln
function dotwalk() {
    for item in ${dotfiles[*]}
    do
    	target="$dotfilesdir/$item"
	link="$destination/$item"

	($1 "$target" "$link")
    done
    echo "Total: ${#dotfiles[*]}"
}

# install links orginal dotfile LINK to its destination TARGET
# parameters:
#
# $1 - LINK
# $2 - TARGET
function install() {
    target="$1"
    link="$2"

    if [ ! -f $target ] && [ ! -d $target ]; then
        printf  "target does not exist %s\n" $target
	return
    fi

    if [ -L $link ]; then
	printf 'link %s already exists\n' $link
	return
    fi

    if ln -s "$target" "$link" > /dev/null 2>&1; then
    	printf "successfully created link: %s -> %s\n" $target $link
    else
    	printf  "failed to create link: %s -> %s\n" $target $link
    fi
}

# uninstall removes dotfile based on given TARGET
# if given TARGET is not a symbolic link it will be skipped
#
# parameters:
#
# $1 - LINK
# $2 - TARGET
function uninstall() { 
    target=$2
    if [ -L "$target" ]; then
	if unlink "$target" > /dev/null 2>&1; then
	    printf "successfully removed link: %s\n" $target
	else
	    printf "failed to remove link: %s\n" $target
	fi
    else
	printf "target is not a symbolic link or does not exist: %s\n" $target
    fi
}

if [ "$cleanup" = "--uninstall" ]; then
    dotwalk uninstall
else
    dotwalk install
fi

