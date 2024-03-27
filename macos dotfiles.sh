#!/bin/bash

cp ~/.zshrc ./macos/".zshrc macos"

(brew leaves && brew list --cask | awk '{ print }') > ./macos/"brew explicitly installed packages.txt"
