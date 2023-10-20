#!/bin/sh

pushd ~/.dotfiles
home-manager switch -f ./users/deividas/home.nix
popd
