#!/bin/bash

cp ~/.zshrc ./

echo -e "\ncp ~/.zshrc ./\n"

(brew leaves && brew list --cask | awk '{ print }') >"brew explicitly installed packages.txt"

echo "saved all brew packages to 'brew explicitly installed packages.txt'"
