#!/bin/bash

cp ~/.zshrc ./

(brew leaves && brew list --cask | awk '{ print }') > "brew explicitly installed packages.txt"
