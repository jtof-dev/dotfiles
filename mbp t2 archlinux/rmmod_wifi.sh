#!/usr/bin/env bash
if [ "${1}" = "pre" ]; then
        modprobe -r brcmfmac_wcc brcmfmac
elif [ "${1}" = "post" ]; then
        modprobe brcmfmac
fi
