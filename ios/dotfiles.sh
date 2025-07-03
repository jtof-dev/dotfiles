#!/bin/bash

echo -e ".zshrc copied\n"
cp /root/.zshrc ./

echo -e "package list saved to packages.txt"
apk list --installed >>"packages.txt"
