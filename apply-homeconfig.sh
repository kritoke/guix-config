#!/bin/sh
pushd ~/.dotfiles/home
guix home reconfigure ./home-configuration.scm
popd

