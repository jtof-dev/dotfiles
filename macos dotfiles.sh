#!/bin/bash

cp ~/.zshrc ./".zshrc macos"

cp ~/.config/ncspot/config.toml ./

# save my explicitly installed packages

(brew leaves && brew list --cask | awk '{ print }') > "brew explicitly installed packages.txt"
