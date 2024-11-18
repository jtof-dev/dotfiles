#!/bin/bash

sudo sed -i \
  '0,/^Exec=brave/ s/^Exec=brave.*/Exec=brave --enable-features=TouchpadOverscrollHistoryNavigation %U/' \
  /usr/share/applications/brave-browser.desktop
