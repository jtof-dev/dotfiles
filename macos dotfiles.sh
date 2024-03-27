#!/bin/bash

cp ~/.zshrc ./".zshrc macos"

(brew leaves && brew list --cask | awk '{ print }') > "brew explicitly installed packages.txt"
