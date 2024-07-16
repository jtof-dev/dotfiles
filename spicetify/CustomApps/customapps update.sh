#!/bin/bash

# betterLibrary

if [ -d "betterLibrary" ]; then
    sudo rm -r betterLibrary
fi

git clone https://github.com/Sowgro/betterLibrary.git

# history-in-sidebar

wget https://github.com/Bergbok/Spicetify-Creations/archive/refs/heads/dist/history-in-sidebar.zip

unzip -od history-in-sidebar history-in-sidebar.zip

sudo rm history-in-sidebar.zip

# marketplace

wget https://github.com/spicetify/spicetify-marketplace/releases/latest/download/spicetify-marketplace.zip

unzip -od marketplace spicetify-marketplace.zip

sudo rm spicetify-marketplace.zip

# stats

wget $(curl -s https://github.com/harbassan/spicetify-apps/releases | grep -oP 'stats-v\d+\.\d+\.\d+' | head -n1 | sed 's/^/https:\/\/github.com\/harbassan\/spicetify-apps\/releases\/download\//;s/$/\/spicetify-stats.release.zip/')

unzip -od stats spicetify-stats.release.zip

sudo rm spicetify-stats.release.zip

# apply changes

spicetify restore backup apply
