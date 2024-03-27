#!/bin/bash

sudo modprobe -r brcmfmac_wcc
sudo modprobe -r brcmfmac
sudo modprobe -r apple-touchbar
sleep .5
sudo modprobe brcmfmac
sudo modprobe apple-touchbar
# sudo systemctl restart wpa_supplicant
# sudo systemctl restart NetworkManager
