#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -d|--directory)
      DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -f|--files)
      FILES="$2"
      shift # past argument
      shift # past value
      ;;
    --uninstall)
      uninstall=YES
      shift # past argument
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
done


# dotfiles is a list of dotfiles to be maintained by this script
# TODO: $(ls dotfilespath) ?
dotfiles=(.gitconfig .tmux.conf locale.conf nvim i3 .Xmodmap X11 zsh)

destination=$DIR
dotfilesdir=$(dirname $(readlink -f $0))
cleanup=$2

# Initialize zsh
ln -sf "$dotfilesdir/zsh/.zshenv" "$HOME/.zshenv"

# sanity check
if [ ! -d $destination ] || [ -z $DIR ]; then
	printf "Setup path ( %s ) is not provided or is not a directory\n" $destination
    exit -1
fi

printf "dotfiles setup path: %s\n" $destination

# dotwalk iterates over dot files and calls argument $0 function
# passing target and link files as described in @ln
function dotwalk() {
	if [ -n "$FILES" ]; then
		printf "files list %s\n" $FILES

		for file in ${FILES//,/ }
		do
			for dotfile in "${dotfiles[@]}"
			do
				if [ "$dotfile" == "$file" ] ; then
					target="$dotfilesdir/$dotfile"
					link="$destination/$dotfile"

					($1 "$target" "$link")
				fi
			done
		done

		return
	fi

    for dotfile in ${dotfiles[*]}
    do
    	target="$dotfilesdir/$dotfile"
		link="$destination/$dotfile"

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

    if [ ! -f "$target" ] && [ ! -d "$target" ]; then
        printf  "target does not exist %s\n" $target
	return
    fi

    if [ -L "$link" ] || [ -f "$link" ]; then
	printf 'link %s or destination file already exists\n' $link
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

